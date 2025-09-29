from pickle import FALSE
import networkx as nx
import hypernetx as hnx
import json
import sys

# def hypergraph_to_graph(H: hnx.Hypergraph):
#     G = nx.Graph()
#     for node in H.nodes:
#         G.add_node(node, hyperedge=False, **H.nodes[node])
#     for edge in H.edges:
#         if len(H.incidences[edge].nodes) == 2:
#             s, e = H.incidences[edge].nodes
#             G.add_edge(s,e, **H.edges[edge], hyperedge=False)
#         else:
#             G.add_node(edge, hyperedge=True, **H.edges[edge])
#             for node in H.incidences[edge].nodes:
#                 G.add_edge(node, edge, hyperedge=True, **H.incidences[edge][node])
#     return G

def read_yosys_json_hyper(input_file, top):
    G = hnx.Hypergraph()
    with open(input_file) as f:
        y = json.load(f)

    m = y["modules"][top]

    for cell, detail in m["cells"].items():
        if detail["type"] == "$scopeinfo":
            continue
        G.add_node(cell, cell=detail["type"],
                   parameters=detail["parameters"], attributes=detail["attributes"])
        for port, bits in detail["connections"].items():
            if "port_directions" in detail:
                direction = detail["port_directions"][port]
            else:
                direction = "unknown"
            for bit in bits:
                bit = f"$_{bit}"
                G.add_node(bit, weight=0, cell="$_wire", netnames=set())
                G.add_incidence( bit,cell, port=port, direction=direction)
    for net, details in m["netnames"].items():
        # Multiple named nets will be attached to the same bit, last one wins.
        for index, bit in enumerate(details["bits"]):
            bit = f"$_{bit}"
            if not details.get("hide_name", 0):
                G.get_properties(bit, 1)["netnames"].add((net, details.get("index", 0)))
                # there is a possible offset, ignoring
            G.get_properties(bit, 1)["attributes"] = details["attributes"]
            G.get_properties(bit, 1)["test"] = index
            if "type" in details["attributes"]:
                G.get_properties(bit, 1)["type"] = details["attributes"]["type"]
            # If the wire type is input/output/inout, mark here
            if net in m["ports"]:
                direction = m["ports"][net]["direction"]
                G.get_properties(bit, 1)["cell"] = f"$_{direction}"
    return G
