from pickle import FALSE
import networkx as nx
import hypernetx as hnx
import json
import sys

def hypergraph_to_graph(H: hnx.Hypergraph):
    G = nx.Graph()
    for node in H.nodes:
        G.add_node(node, hyperedge=False, **H.nodes[node])
    for edge in H.edges:
        if len(H.incidences[edge].nodes) == 2:
            s, e = H.incidences[edge].nodes
            G.add_edge(s,e, **H.edges[edge], hyperedge=False)
        else:
            G.add_node(edge, hyperedge=True, **H.edges[edge])
            for node in H.incidences[edge].nodes:
                G.add_edge(node, edge, hyperedge=True, **H.incidences[edge][node])
    return G

def read_yosys_json_hyper(input_file, top):
    H = hnx.Hypergraph()

    with open(input_file) as f:
        y = json.load(f)

    m = y["modules"][top]
    for io, detail in m["ports"].items():
        H.add_node(io, kind="port", direction=detail["direction"])
        for i in detail["bits"]:
            H.add_incidence(str(i), io)

    for cell, detail in m["cells"].items():
        H.add_node(cell, weight=1, kind=detail["type"],
                   parameters=detail["parameters"], attributes=detail["attributes"])
        print("cell", cell, H.nodes[cell]["kind"])

        for port, bits in detail["connections"].items():
            if "port_directions" in detail:
                direction = detail["port_directions"][port]
            else:
                direction = "unknown"
            for bit in bits:
                H.add_incidence(cell, bit, port=port, direction=direction)
    # print(*(h for h in H.edges), sep="\n")
    # print("***")
    # print(*(h for h in H.nodes), sep="\n")
    for net, details in m["netnames"].items():
        for index, bit in enumerate(details["bits"]):
            if "hide_name" in details:
                H.edges[bit]["hide_name"] = details["hide_name"]
            H.edges[bit]["netname"] = net
            H.edges[bit]["index"] = index
            H.edges[bit]["attributes"] = details["attributes"]
    return H
