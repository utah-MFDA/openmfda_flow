import itertools
import math
from kiutils.schematic import Schematic
import networkx as nx

class EeschemaToVerilog:
    def normalize(self, x):
        # I was getting floating point errors when comparing positions.
        # Increasing orders of magnitude and rounding to integer fixed it.
        return round(x*100)

    def normal_position(self, pos):
        x = self.normalize(pos.X)
        y = self.normalize(pos.Y)
        return (x, y)

    def pin_position(self, pin, sym):
        angle = sym.position.angle
        mirror = sym.mirror
        assert angle in [90, 180, 270]
        px, py = self.normal_position(pin.position)
        sx, sy = self.normal_position(sym.position)
        x = px + sx
        y = py + sy
        return (x, y)

    def __init__(self, sch, design):
        self.design = design
        self.sch = sch
        self.io = []
        self.graph = nx.Graph()
        # todo probably incomplete name scheme
        self.lib_dict = {lib.entryName: lib for lib in sch.libSymbols}
        self.net_id_gen = -1
        self.component_id_gen = -1
        self.components = []
        self.modules = []

    def gen_net_id(self):
        self.net_id_gen += 1
        name = f"net{self.net_id_gen}"
        while name in self.known_labels:
            self.net_id_gen += 1
            name = f"net{self.net_id_gen}"
        self.known_labels.append(name)
        return name

    def gen_component_id(self):
        self.component_id_gen += 1
        name = f"component{self.component_id_gen}"
        while name in self.known_labels:
            self.component_id_gen += 1
            name = f"component{self.component_id_gen}"
        return name

    def find_lib(self, sym):
        return self.lib_dict[sym.entryName]

    def extract(self):
        self._extract_io()
        self._extract_nets()
        self._extract_components()
        self._extract_hierarchical()

    def _extract_io(self):
        for label in sch.globalLabels:
            name = label.text
            direct = label.shape
            self.io.append(f"{direct} {name}")
        for label in sch.hierarchicalLabels:
            name = label.text
            direct = label.shape
            self.io.append(f"{direct} {name}")

    def _extract_nets(self):
        # Add nodes for each segment junction
        for junction in self.sch.junctions:
            self.graph.add_node(self.normal_position(junction.position))

        # TODO no-connects in sch.noConnects?

        # Add edges for each segment
        for conn in self.sch.graphicalItems:
            if conn.type == "wire":
                start, end = conn.points
                self.graph.add_edge(self.normal_position(start), self.normal_position(end))
            else:
                raise NotImplementedError(f"Not handling connection type {conn.type}")

        def add_symbol_pins(sym, libsym):
            assert sym.position.angle is None or sym.position.angle == 0
            assert sym.unit is None or sym.unit == 1
            for pin in libsym.pins:
                x,y = self.pin_position(pin, sym)
                self.graph.add_node((x,y), symbol=sym.entryName, pin=pin.name)

        # Create graph nodes for symbol pins
        for sym in self.sch.schematicSymbols:
            if not sym.onBoard:
                continue

            libsym = self.find_lib(sym)
            add_symbol_pins(sym, libsym)
            for unit in libsym.units:
                if not unit.onBoard:
                    continue
                # Units are distinct sub-symbols, e.g. one op-amp in a dual package
                add_symbol_pins(sym, unit)

        # Create graph nodes for hierarchical pins
        for sheet in self.sch.sheets:
            for pin in sheet.pins:
                x, y = self.normal_position(pin.position)
                self.graph.add_node((x,y), symbol=sheet.sheetName, pin=pin.name)

        # Create graph nodes for labels
        for label in sch.labels:
            center = self.normal_position(label.position)
            x, y = center
            if center in self.graph.nodes:
                # This is the case where the node terminates the net.
                self.graph.nodes[center]["label"] = label.text
            else:
                # This case is if the label lies along a segment.
                # Experimentally, if the segment is non-orthogonal to axes,
                # KiCAD splits a segment at the label point and you will get
                # an explicit point
                for (sx, sy), (ex, ey) in self.graph.edges:
                    if x == sx and x == ex or y == sy and y == ey:
                        left = (min(sx, ex), min(sy, ey))
                        right = (max(sx, ex), max(sy, ey))
                        self.graph.add_node(center, label=label.text)
                        self.graph.add_edge(left, center)
                        self.graph.add_edge(center, right)
                        break

        # Apply labels to each connected node
        self.known_labels = []
        for node in self.graph.nodes:
            if "label" in self.graph.nodes[node]:
                self.known_labels.append(self.graph.nodes[node]["label"])

        def find_label(graph):
            label = None
            for node in graph.nodes:
                d = graph.nodes[node]
                if "label" in d:
                    # More than one label on a net is an ambiguity error
                    assert label == None
                    label = d["label"]
            return label

        for connected in nx.connected_components(self.graph):
            disjoint = self.graph.subgraph(connected)
            label = find_label(disjoint)
            if label is None:
                label = self.gen_net_id()
            for node in disjoint.nodes:
                disjoint.nodes[node]["label"] = label

        # Create subgraphs by label. Disjoint subgraphs that share a label are connected.
        grouped = {label:[] for label in self.known_labels}
        for node, label in nx.get_node_attributes(self.graph, "label").items():
            grouped[label].append(node)
        self.nets = {label:self.graph.subgraph(nodes) for label, nodes in grouped.items()}
    def find_property(self, item, key):
        found = [prop for prop in item.properties if prop.key == key]
        if len(found) == 0:
            raise KeyError("not found")
        elif len(found) != 1:
            raise KeyError("duplicate found")
        else:
            return found[0]

    def _extract_components(self):
        # Generate the list of components, must run after nets extracted
        for sym in self.sch.schematicSymbols:
            if not sym.onBoard:
                continue
            libsym = self.find_lib(sym)

            name = self.find_property(sym, "Reference").value
            module = self.find_property(sym, "Footprint").value
            connections = []
            def add_connection(pin, sym):
                x, y = self.pin_position(pin, sym)
                pin_name = pin.name
                net = self.graph.nodes[(x,y)]["label"]
                connections.append((pin_name, net))

            for pin in libsym.pins:
                add_connection(pin, sym)
            for unit in libsym.units:
                for pin in unit.pins:
                    add_connection(pin, sym)

            self.components.append({
                "name": name,
                "module": module,
                "connections": connections
            })

    def _extract_hierarchical(self):
        for sheet in self.sch.sheets:
            connections =[]
            for pin in sheet.pins:
                x, y = self.normal_position(pin.position)
                pin_name = pin.name
                net = self.graph.nodes[(x,y)]["label"]
                connections.append((pin_name, net))
            name = sheet.sheetName.value
            module = sheet.fileName.value.replace(".", "_")
            self.components.append({
                "name": name,
                "module": module,
                "connections": connections
            })

        files = {sheet.fileName.value for sheet in self.sch.sheets}
        for filename in files:
            sch = Schematic().from_file(fileName)
            design = filename.replace(".", "_")
            ext = Extractor(sch, design)
            ext.extract()
            self.modules.append(ext)

    def print_verilog(self):
        print(f"module {design} (")
        print(*[f"\t{direct} {name}" for direct, name in self.io], sep=",\n")
        print(f");")
        for net in self.known_labels:
            print(f"\twire {net};")
        for comp in self.components:
            module = comp["module"]
            name = comp["name"]
            print(f"\t{module} {name} (")
            print(*[f"\t\t.{pin}({net})" for pin, net in comp["connections"]], sep=",\n")
            print(");")
        print("endmodule")
        for mod in self.modules:
            mod.print_verilog()

if __name__ == "__main__":
    import sys
    sch = Schematic().from_file(sys.argv[2])
    design = sys.argv[1]
    ext = EeschemaToVerilog(sch, design)
    ext.extract()
    ext.print_verilog()
