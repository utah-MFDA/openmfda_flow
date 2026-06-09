import itertools
import math
from kiutils.schematic import Schematic
import networkx as nx


class EeschemaToVerilog:
    def normalize(self, x):
        # I was getting floating point errors when comparing positions.
        # Increasing orders of magnitude and rounding to integer fixed it.
        
        # 04/14/26 this still has small issues
        return round(x*100)

    def normal_position(self, pos):
        x = self.normalize(pos.X)
        y = self.normalize(pos.Y)
        return (x, y)
    
    def rotate_sym(self, pos, angle):
        x = pos[0]
        y = pos[1]
        x_o = x*math.cos(angle*3.14159/180) - y*math.sin(angle*3.14159/180)
        y_o = x*math.sin(angle*3.14159/180) + y*math.cos(angle*3.14159/180)
        return (
                round(x_o), 
                round(y_o)
            )

    def pin_position(self, pin, sym):
        angle = sym.position.angle
        mirror = sym.mirror
        assert angle in [0, 90, 180, 270]
        ox, oy = self.normal_position(pin.position)
        px, py = self.rotate_sym(
                self.normal_position(pin.position),
                angle
            )
        sx, sy = self.normal_position(sym.position)
        print(pin.name, (ox, oy), (px, py))
        x = px + sx
        y = - py + sy # drawings are down is positive
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
        for label in self.sch.globalLabels:
            name = label.text
            direct = label.shape
            self.io.append((direct, name))
        for label in self.sch.hierarchicalLabels:
            name = label.text
            direct = label.shape
            self.io.append((direct, name))

    def _extract_nets(self, err=3):
        # Add nodes for each segment junction
        for junction in self.sch.junctions:
            self.graph.add_node(self.normal_position(junction.position))

        # TODO no-connects in sch.noConnects?

        # Add edges for each segment
        for conn in self.sch.graphicalItems:
            if conn.type == "wire":
                start, end = conn.points
                self.graph.add_edge(self.normal_position(
                    start), self.normal_position(end))
            else:
                raise NotImplementedError(
                    f"Not handling connection type {conn.type}")

        def add_symbol_pins(sym, libsym):
            #assert sym.position.angle is None or sym.position.angle == 0
            assert sym.unit is None or sym.unit == 1
            for pin in libsym.pins:
                x, y = self.pin_position(pin, sym)
                self.graph.add_node((x, y), symbol=sym.entryName, pin=pin.name)

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
                self.graph.add_node(
                    (x, y), symbol=sheet.sheetName, pin=pin.name)

        # Create graph nodes for labels
        for label in self.sch.labels:
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
                        print("Label found: ", label.text)
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
                    # TODO this trips up on labels without connections
                    if label != None:
                        print(label, d["label"])
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
        grouped = {label: [] for label in self.known_labels}
        for node, label in nx.get_node_attributes(self.graph, "label").items():
            grouped[label].append(node)
        self.nets = {label: self.graph.subgraph(
            nodes) for label, nodes in grouped.items()}

    def find_property(self, item, key):
        found = [prop for prop in item.properties if prop.key == key]
        if len(found) == 0:
            raise KeyError("not found")
        elif len(found) != 1:
            raise KeyError("duplicate found")
        else:
            return found[0]

    def _extract_components(self, ignore_interface=False):
        # Generate the list of components, must run after nets extracted
        for sym in self.sch.schematicSymbols:
            if not sym.onBoard:
                continue
            libsym = self.find_lib(sym)

            name = self.find_property(sym, "Reference").value
            module = self.find_property(sym, "Footprint").value
            connections = []
            
            def check_nodes(graph, key, err=10):
                for nd in graph.nodes:
                    if abs(nd[0] - key[0]) < err and abs(nd[1] - key[1]) < err:
                        # found!
                        return nd
                return None
            
            def add_connection(pin, sym):
                x, y = self.pin_position(pin, sym)
                if pin.name != '':
                    pin_name = pin.name
                else:
                    pin_name = sym.entryName + "_" + pin.number

                nd = check_nodes(self.graph, (x, y)) 
                
                if nd is not None:
                    try:
                        net = self.graph.nodes[nd]["label"]
                        #net = self.graph.nodes[(x, y)]["label"]
                        # net = sym.properties[0].value # Properties object is the first list item
                    except KeyError:
                        print(f"No net for pin '{pin.number}' for '{sym.properties[0].value}' sym '{sym.entryName}';")
                        return
                else: 
                    print(f"No net for pin '{pin.number}' for '{sym.properties[0].value}' sym '{sym.entryName}';")
                    connections.append({
                        "pin_name":pin_name,
                        "net":None,
                        "pos":(x, y)})
                    return

                connections.append({
                    "pin_name":pin_name,
                    "net":net,
                    "pos":(x, y)
                    })
                 
            def add_io(pin, sym):
                x, y = self.pin_position(pin, sym)
                if pin.name != '':
                    pin_name = pin.name
                else:
                    pin_name = sym.entryName + "_" + pin.number
                try:
                    net = self.graph.nodes[(x, y)]["label"]
                    # net = sym.properties[0].value # Properties object is the first list item
                except KeyError:
                    print(f"No net for pin '{pin.number}' for '{sym.properties[0].value}' sym '{sym.entryName}';")
                    return

                if isinstance(net, str):
                    self.io.append(("inout", net))

            # This uses the flushing interface as the placeholder for the
            #   module ports. Future implementations should connect to the
            #   interface as a component. The io_interface can then be connected
            #   to the io_constraints.
            if ignore_interface and sym.entryName == 'flushing_interface_04x08':
                # TODO implement interace blocks for io_wrapper 
                for pin in libsym.pins:
                    add_io(pin, sym)
                for unit in libsym.units:
                    for pin in unit.pins:
                        add_io(pin, sym)
                
            else:
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
            connections = []
            for pin in sheet.pins:
                x, y = self.normal_position(pin.position)
                pin_name = pin.name
                net = self.graph.nodes[(x, y)]["label"]
                connections.append({"pin_name":pin_name, "net":net})
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
        print(f"module {self.design} (")
        print(*[f"\t{direct} {name}" for direct, name in self.io], sep=",\n")
        print(f");")
        for net in self.known_labels:
            print(f"\twire {net};")
        for comp in self.components:
            module = comp["module"].split(':')[-1]
            name = comp["name"]
            print(f"\t{module} {name} (")
            print(*[f"\t\t.{c['pin_name']}({c["net"]})" 
                for c in comp["connections"] if c["net"] is not None], sep=",\n")
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
