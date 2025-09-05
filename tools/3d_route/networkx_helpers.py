import networkx as nx
import json
import sys

add_buffers = False
buffers = 4

weights = {
    "valve_40px_1": 14400,
    "serpentine_150px_0": 57600,
    "pinhole_320px_0": 38400,
    "flush_hole_0": 3200,
    "ctrl_hole_0": 8100
    }

def read_yosys_json(input_file, top):
    G = nx.Graph()
    with open(input_file) as f:
        y = json.load(f)

    m = y["modules"][top]
    for io, detail in m["ports"].items():
        G.add_node(io, weight =0, hyperedge=False)
        for i in detail["bits"]:
            if i not in G.nodes:
                G.add_node(i, weight=0, hyperedge=True)
            G.add_edge(io, i, hyperedge=True)

    for cell, detail in m["cells"].items():
        G.add_node(cell, weight=weights[detail["type"]], hyperedge=False)
        for i, bits in detail["connections"].items():
            for bit in bits:
                bit = str(bit)
                if bit not in G.nodes:
                    G.add_node(bit, weight=0, hyperedge=True)
                if not add_buffers:
                    G.add_edge(cell, bit, hyperedge=True)
                else:
                    G.add_node(f"{cell}_{i}_{bit}_0", weight=0, hyperedge=False)
                    G.add_edge(cell, f"{cell}_{i}_{bit}_0", hyperedge=True)
                    for c in range(1, buffers):
                        G.add_node(f"{cell}_{i}_{bit}_{c}", weight=0, hyperedge=False)
                        G.add_edge(f"{cell}_{i}_{bit}_{c-1}", f"{cell}_{i}_{bit}_{c}", hyperedge=True)
                    G.add_node(f"{cell}_{i}_{bit}_{buffers-1}", weight=0, hyperedge=False)
                    G.add_edge(f"{cell}_{i}_{bit}_{buffers-1}", bit, hyperedge=True)

    return G
