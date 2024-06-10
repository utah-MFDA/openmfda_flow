import math
from kiutils.schematic import Schematic
import networkx as nx
sch = Schematic().from_file("basic.kicad_sch")
design = "basic"

io = []
for label in sch.hierarchicalLabels:
    name = label.text
    direct = label.shape
    io.append(f"{direct} {name}")
# io = ", ".join(io)

# print(f"module {design} ({io});")

graph = nx.Graph()
wires = []

def normalize(x):
    return round(x*100)

for junction in sch.junctions:
    print("junction")
    graph.add_node((normalize(junction.position.X), normalize(junction.position.Y)))

for conn in sch.graphicalItems:
    assert conn.type == "wire"
    start, end = conn.points
    graph.add_edge((normalize(start.X), normalize(start.Y)), (normalize(end.X), normalize(end.Y)))

def find_lib(sym):
    for lib in sch.libSymbols:
        # todo probably incomplete
        if lib.entryName == sym.entryName:
            return lib
    raise

for sym in sch.schematicSymbols:
    if not sym.onBoard:
        continue
    assert sym.position.angle is None or sym.position.angle == 0
    assert sym.unit is None or sym.unit == 1

    mirror = sym.mirror
    libsym = find_lib(sym)
    for pin in libsym.pins:
        x = normalize(pin.position.X) + normalize(sym.position.X)
        y = normalize(pin.position.Y) + normalize(sym.position.Y)
        print("pin", x, y, pin.name)
        graph.add_node((x,y), symbol=sym.entryName, pin=pin.name)
    for unit in libsym.units:
        for pin in unit.pins:
            x = normalize(pin.position.X) + normalize(sym.position.X)
            y = normalize(pin.position.Y) + normalize(sym.position.Y)
            print("unit pin", x, y, pin.name)
            graph.add_node((x,y), symbol=sym.entryName, pin=pin.name)

for label in sch.labels:
    print("label", label, label.text)
    x, y = (normalize(label.position.X), normalize(label.position.Y))
    center = (x, y)
    if center in graph.nodes:
        graph.nodes[center]["label"] = label.text
    else:
        for (sx, sy), (ex, ey) in graph.edges:
            if x == sx and x == ex or y == sy and y == ey:
                print ("intersect", label.text)
                left = (min(sx, ex), min(sy, ey))
                right = (max(sx, ex), max(sy, ey))
                graph.add_node(center, label=label.text)
                graph.add_edge(left, center)
                graph.add_edge(center, right)
                break

def find_label(graph):
    label = None
    for node in graph.nodes:
        d = graph.nodes[node]
        if "label" in d:
            assert label == None
            label = d["label"]
    return label
nets = [graph.subgraph(net) for net in nx.connected_components(graph)]
for net in nets:
    print(find_label(net), net, net.nodes)
# print(f"	wire {wires};")
# for sym in sch.symbolInstances:
#     name = sym.reference
#     module = sym.footprint
#     connections = ???
#     print(f"	{module} {name}({connections});"
# print(f"endmodule")

# for sheet in .hierarchicalSheetInstances:
