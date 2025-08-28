import networkx as nx
import hypernetx as hnx
import json
import sys

input_file = sys.argv[1]
H = hnx.Hypergraph()

with open(input_file) as f:
    y = json.load(f)

m = y["modules"]["top"]

for io, detail in m["ports"].items():
    H.add_node(io)
    for i in detail["bits"]:
        H.add_incidence(i, io)

for cell, detail in m["cells"].items():
    H.add_node(cell, weight=1)
    for i, bits in detail["connections"].items():
        for bit in bits:
            H.add_edge(cell, bit)

node = {n:i+1 for i, n in enumerate([n for n in G.nodes])}
print(len(H.edges), len(H.nodes), "0")
for edge in H.edges:
