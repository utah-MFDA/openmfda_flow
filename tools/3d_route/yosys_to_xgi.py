import xgi
import hypernetx as hnx
import json
import sys

input_file = sys.argv[1]
base_file = input_file[:-5]

weights = {
    "valve_40px_1": 14400,
    "serpentine_150px_0": 57600,
    "pinhole_320px_0": 38400,
    "flush_hole_0": 3200,
    "ctrl_hole_0": 8100
    }
with open(input_file) as f:
    y = json.load(f)

m = y["modules"]["thing"]

H = xgi.Hypergraph()

edges = {}
for io, detail in m["ports"].items():
    for i in detail["bits"]:
        if i not in edges:
            edges[i] = []
        edges[i].append(io)

for cell, detail in m["cells"].items():
    H.add_node(cell, weight=weights[detail["type"]])
    for port, bits in detail["connections"].items():
        for bit in bits:
            H.add_node_to_edge(bit, cell)

with open(f"{base_file}.hmetis.nodes", "w") as nf:
    for n in H.nodes:
        print(n, file=nf)

# assuming that node iteration is stable if unmodified
node = {n:i+1 for i, n in enumerate([n for n in H.nodes])}

with open(f"{base_file}.hmetis.edges", "w") as ef:
    for edge in H.edges:
        print(edge, file=ef)

with open(f"{base_file}.hmetis", "w") as ef:
    print(len(H.edges), len(H.nodes), "10", file=ef)

    for edge in H.edges:
        print(*[node[n] for n in H.edges.members(edge)], file=ef)
    for cell, weight in H.nodes.attrs("weight"):
        print(weight, file=ef)
