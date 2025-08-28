import networkx as nx
import json
import sys

input_file = sys.argv[1]
G = nx.Graph()
with open(input_file) as f:
    y = json.load(f)

m = y["modules"]["top"]
for io, detail in m["ports"].items():
    G.add_node(io, weight = 1, hyperedge=False)
    for i in detail["bits"]:
        if i not in G.nodes:
            G.add_node(i, hyperedge=True)
        G.add_edge(io, i, hyperedge=True)

for cell, detail in m["cells"].items():
    G.add_node(cell, weight=1, hyperedge=False)
    for i, bits in detail["connections"].items():
        for bit in bits:
            if bit not in G.nodes:
                G.add_node(bit, weight=0, hyperedge=True)
            G.add_edge(cell, bit, hyperedge=True)

H = nx.Graph()
maxi = 0
for n in G.nodes:
    if G.nodes[n]["hyperedge"]:
        if maxi < n:
            maxi = n
output = [[] for i in range(0,maxi-1)]
node = {n:i+1 for i, n in enumerate([n for n in G.nodes if not G.nodes[n]["hyperedge"]])}

i = -1
for n in G.nodes:
    if G.nodes[n]["hyperedge"]:
        i += 1
        for s in G.neighbors(n):
            if not G.nodes[s]["hyperedge"]:
                output[i].append(node[s])
print(maxi, len(node), "0")
for o in output:
    print(*o)
