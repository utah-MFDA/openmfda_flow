from collections import Counter
import matplotlib.pyplot as plt
import networkx as nx
import nx_metis
import xgi
import sys

graph_file, edge_file, node_file, parts_file, target_file, order_file, simple_file = sys.argv[1:]

target = nx_metis.read_metis(target_file)
graph = nx_metis.read_hmetis(graph_file)

for node, part in nx_metis.read_kahypar(parts_file):
    graph.nodes[node]["partition"] = part

for edge, name in nx_metis.read_meta(edge_file):
    if edge not in graph.edges:
        print("missing edge", edge)
        continue
    graph.edges[edge]["name"] = name

for node, name in nx_metis.read_meta(node_file):
    graph.nodes[node]["name"] = name

partition = xgi.Hypergraph()
for node in target.nodes:
    partition.add_node(node)
    partition.nodes[node]["weight"] = 0

for i, n in nx_metis.read_meta(order_file):
    partition.nodes[i]["name"] = n

for node in graph.nodes:
    part = graph.nodes[node]["partition"]
    partition.nodes[part]["weight"] += graph.nodes[node].get("weight", 1)

for edge in graph.edges:
    parts = {graph.nodes[member]["partition"] for member in graph.edges.members(edge)}
    if len(parts) > 1:
        partition.add_edge(parts, id=edge)
ax = xgi.draw(partition)
plt.savefig(parts_file +".pdf")

for i in Counter([",".join([str(i) for i in partition.edges.members(e)]) for e in partition.edges]).items():
    pass
    # print(i)

d = nx.Graph()
for node in partition.nodes:
    d.add_node(node, name=partition.nodes[node]["name"], weight=partition.nodes[node]["weight"], hyper=False)

for edge in partition.edges:
    members = list(partition.edges.members(edge))
    if len(members) == 2:
        s, e = members
        if (s,e) not in d.edges:
            d.add_edge(s, e, weight=0, hyper=False)
        d.edges[(s,e)]["weight"] += 1
    else:
        e = f"h{edge}"
        d.add_node(e, weight=0, hyper=True, name=e)
        # brute force simplification, add an edge between each hyperedge member.
        for s in members:
            if (s, e) not in d.edges:
                d.add_edge(s, e, weight=0, hyper=True)
            d.edges[(s, e)]["weight"] += 1

for edge in d.edges:
    d.edges[edge]["bad"] = edge not in target.edges

with open(simple_file, "w") as f:
    print("strict graph G {", file=f)
    for node in d.nodes:
        weight = d.nodes[node]["weight"] / (2560 * 1280)
        name = d.nodes[node]["name"]
        shape = "square" if d.nodes[node]["hyper"] else "circle"
        print(f"""n{node} [label="n{node} {name}\n{weight:0.2}", shape="{shape}"];""", file=f)
    for edge in d.edges:
        weight = d.edges[edge]["weight"]
        color = "red" if d.edges[edge]["bad"] else "black"
        hyper = "blue" if d.edges[edge]["hyper"] else "black"
        start, end = edge
        print(f"""n{start} -- n{end} [label="{weight}", color="{color}", fontcolor="{hyper}"];""", file=f)
    print("}", file=f)
