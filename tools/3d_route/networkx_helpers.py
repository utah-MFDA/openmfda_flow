import networkx as nx
import json

def read_yosys_json(input_file, top):
    G = nx.Graph()
    with open(input_file) as f:
        y = json.load(f)

    m = y["modules"][top]
    for io, detail in m["ports"].items():
        G.add_node(io, weight=1, hyperedge=False, direction=detail["direction"], kind="port")
        for bit in detail["bits"]:
            bit = f"$_{bit}"
            if bit not in G.nodes:
                G.add_node(bit, weight=0, hyperedge=True)
            G.add_edge(io, bit, hyperedge=True)

    for cell, detail in m["cells"].items():
        if detail["type"] == "$scopeinfo":
            continue
        G.add_node(cell, hyperedge=False, kind=detail["type"],
                   parameters=detail["parameters"], attributes=detail["attributes"])
        for port, bits in detail["connections"].items():
            if "port_directions" in detail:
                direction = detail["port_directions"][port]
            else:
                direction = "unknown"
            for bit in bits:
                bit = f"$_{bit}"
                if bit not in G.nodes:
                    G.add_node(bit, weight=0, hyperedge=True)
                G.add_edge(cell, bit, hyperedge=True, port=port, direction=direction)
    for net, details in m["netnames"].items():
        for index, bit in enumerate(details["bits"]):
            bit = f"$_{bit}"
            if bit not in G.nodes:
                G.add_node(bit, weight=0, hyperedge=True)
            if "hide_name" in details:
                G.nodes[bit]["hide_name"] = details["hide_name"]
            G.nodes[bit]["netname"] = net
            G.nodes[bit]["index"] = index
            G.nodes[bit]["attributes"] = details["attributes"]
    return G

def collapse_edges(G: nx.Graph):
    rm = []
    for node in G.nodes:
        if G.nodes[node]["hyperedge"] and G.degree(node) == 2:
            f, s = G.adj[node]
            G.add_edge(f, s, hyperedge=False)
            rm.append(node)
    for node in rm:
        G.remove_node(node)
    return G
