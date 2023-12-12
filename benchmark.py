import networkx as nx
import random
import sys
import argparse
import os
from openmfda_flow import *

parser = argparse.ArgumentParser(prog="benchmark")
parser.add_argument("name", default="benchmark")
parser.add_argument("--platform", default="mfda_30px")
parser.add_argument("--size", default=40, type=int)
parser.add_argument("--min_in", default=3, type=int)
parser.add_argument("--max_in", default=6, type=int)
parser.add_argument("--min_out", default=3, type=int)
parser.add_argument("--max_out", default=6, type=int)

args = parser.parse_args()
design_name = args.name
platform = args.platform
size = args.size
min_inputs = args.min_in
max_inputs = args.max_in
min_outputs = args.min_out
max_outputs = args.max_out
layer = "met9"
max_io = 32
verilog_filename = f"design_name.v"
scad_dimm_filename = f"scad_flow/designs/{platform}/{design_name}/dimm.csv"

cells = [
    ("serpentine_50px_0", 1, 1, 2),
    ("serpentine_100px_0", 1, 1, 2),
    ("serpentine_150px_0", 1, 1, 2),
    ("serpentine_200px_0", 1, 1, 2),
    ("serpentine_200px_3", 1, 1, 2),
    ("serpentine_300px_0", 1, 1, 2),
    ("serpentine_300px_1", 1, 1, 2),
    ("serpentine_300px_2", 1, 1, 2),
    ("serpentine_300px_3", 1, 1, 2),
    ("diffmix_25px_p", 2, 1, 5),
    ("valve_20px_1", 1, 1, 15),
]

inputs = ("in", 0, 1, 20)
outputs = ("out", 1, 0, 20)

################ Generate graph ################
weights = [c[3] for c in cells]
io_nodes = list([inputs for i in range(0, random.randint(min_inputs, max_inputs))])
io_nodes += list([outputs  for i in range(0, random.randint(max_outputs, max_outputs))])

i=0
while True:
    nodes = io_nodes + random.choices(cells, weights=weights, k=size)
    # print(*[node[0] for node in nodes], sep = ", ")
    in_deg = [n[1] for n in nodes]
    fanout_deg = random.choices([1, 2, 3], weights=[75, 20, 5], k=len(nodes))
    out_deg = [split * n[2] for split, n in zip(fanout_deg, nodes)]
    i += 1
    if i % 10 == 0:
        print(f"iteration {i}")
    try:
        graph = nx.directed_havel_hakimi_graph(in_deg, out_deg)
    except:
        if i > 100000:
            raise
        continue
    break

for i, n in enumerate(nodes):
    graph.nodes[i]["module"] = n[0]
    graph.nodes[i]["in_deg"] = n[1]
    graph.nodes[i]["out_deg"] = n[2]

pin_name = [[None for j in range(0, 8)] for i in range(0, 4)]
locations = random.sample([(i, j) for j in range(0, 8) for i in range(0, 4)], k=len(io_nodes))

for (i,j), node in zip(locations, graph.nodes):
    if graph.nodes[node]["module"] == "in":
        pin_name[i][j] = f"in_{node}"
    elif graph.nodes[node]["module"] == "out":
        pin_name[i][j] = f"out_{node}"


################ Generate verilog ################
with open(verilog_filename, "w") as f:
    for node in graph.nodes:
        neighbors = list(graph.neighbors(node))
        for i, neighbor in enumerate(list(random.sample(neighbors, k=len(neighbors)))):
            if graph.nodes[node]["module"] == "in":
                wire = f"in_{node}"
            elif graph.nodes[neighbor]["module"] == "out":
                wire = f"out_{neighbor}"
            else:
                w_num = i % graph.nodes[node]["out_deg"]
                wire = f"wire_{node}_{w_num}"
            graph.edges[node, neighbor]["wire"] = wire
    print(f"module {design_name} (", file=f)
    input_wires = [f"input in_{node}" for node in graph.nodes if graph.nodes[node]["module"] == "in"]
    output_wires = [f"output out_{node}" for node in graph.nodes if graph.nodes[node]["module"] == "out"]
    print(*input_wires, *output_wires, sep=",\n", file=f)
    print(");", file=f)
    for in_edge, out_edge in graph.edges:
        if graph.nodes[in_edge]["module"] == "in" and graph.nodes[out_edge]["module"] == "out":
            print(f"assign in_{in_edge} = out_{out_edge};", file=f)
        elif not graph.nodes[in_edge]["module"] == "in" and not graph.nodes[out_edge]["module"] == "out":
            print("wire", graph.edges[in_edge, out_edge]["wire"], ";", file=f)

    for node in graph.nodes:
        module = graph.nodes[node]["module"]
        if module in ["in", "out"]:
            continue
        print("\n", module, f"{module}_{node}", "(", file=f)

        fanin = [graph.edges[pred, node]["wire"] for pred in graph.predecessors(node)]
        fanout = [graph.edges[node, succ]["wire"] for succ in graph.successors(node)]
        print(*fanin, *fanout, sep=",\n", file=f)
        print(");", file=f)

    print("endmodule", file=f)

################ dimm csv file ################
with open(scad_dimm_filename, "w") as f:
    for e in graph.edges:
        print(graph.edges[e]["wire"],",20,20,15", sep="", file=f)

verilog_file = "demo.v"
design_name = "demo"
platform = "mfda_30px"

pins = [[None for i in range(0,8)] for j in range(0,4)]
pins[0][1] = "soln1"
pins[0][2] = "soln2"
pins[0][3] = "soln3"
pins[3][7] = "output"
generate_config(verilog_filename, design_name, pin_names=pins, platform=platform)
run_flow(design_name, platform=platform
# connect1,12,12,9
# connect2,20,20,15
# connect3,20,20,13
# connect4,20,20,13
# connect5,20,20,13
# soln1,20,20,15
# soln1,20
# soln2,12,12,9
# soln2,12
# soln3,20,20,13
# soln3,20q
