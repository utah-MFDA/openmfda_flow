from statistics import mean
import networkx as nx
import nx_metis
import sys

graph_file, parts_file, target_file, order_file, output_file, stats_file, result_file, final_file = sys.argv[1:]

# This is so brittle... but getting it done
_, target_name, source_name, _ = final_file.split("/")

# Original target graph
target = nx_metis.read_metis(target_file)
#
source = nx_metis.read_metis(graph_file)

for node, part in nx_metis.read_kahypar(parts_file):
    source.nodes[node]["partition"] = part

# Track the total usage
usage = nx.Graph()
# Using a multigraph to make tracking passthrough edges easier
result = nx.MultiGraph()

# All three graphs have same nodes
for node in target.nodes:
    usage.add_node(node, weight=0)
    result.add_node(node, weight=0)

# Add back in names from target graph
with open(order_file) as o:
    for i, n in enumerate(o.readlines()):
        name = n.strip()
        target.nodes[i+1]["name"] = name
        usage.nodes[i+1]["name"] = name
        result.nodes[i+1]["name"] = name

# Set area weight in result and usage
for node in source.nodes:
    part = source.nodes[node]["partition"]
    weight = source.nodes[node].get("weight", 0)
    usage.nodes[part]["weight"] += weight
    result.nodes[part]["weight"] += weight

# Set capacity of the usage
for start, end in target.edges:
    usage.add_edge(start, end, weight=0, capacity=target.edges[start, end]["weight"], stuck=0)

# Add in edges.
for edge in source.edges:
    start, end = edge
    start_part = source.nodes[start]["partition"]
    end_part = source.nodes[end]["partition"]
    part_edge = start_part, end_part
    if start_part == end_part:
        # Ignore internal connections
        continue

    # For result, add a distinct edge.
    weight = source.edges[edge].get("weight", 1)
    # Bad if not a valid path or over capacity
    good = part_edge in usage.edges \
        and (usage.edges[part_edge]["weight"] + weight) < usage.edges[part_edge]["capacity"]
    if good:
        usage.edges[part_edge]["weight"] += weight
    result.add_edge(start_part, end_part, weight=weight, bad=(not good), stuck=False, bridged=False, moved=False)

def percent_capacity(start, end, attrs):
    return attrs["weight"] / attrs["capacity"]
    # return attrs["weight"]

def average_capacity(graph, path, needed):
    total = 0
    for edge in zip(path, path[1:]):
        used = graph.edges[edge]["weight"]
        available = graph.edges[edge]["capacity"]
        if (used + needed) > available:
            print("cap", used, needed, available)
            raise
        total += used / available
    return total

def smallest_average_capacity():
    smallest_avg = 2**64 - 1
    smallest = None
    print("********************************")
    for edge in result.edges(keys=True):
        if not result.edges[edge]["bad"] or result.edges[edge]["stuck"] or result.edges[edge]["moved"]:
            continue
        needed = result.edges[edge]["weight"]
        start, end, key = edge
        # find the shortest paths by length.
        # Create a copy and remove any edges which can't handle the weight
        copy = usage.copy()
        for e in copy.edges:
            weight = copy.edges[e]["weight"]
            capacity = copy.edges[e]["capacity"]
            if (weight + needed) > capacity:
                s, t = e
                copy.remove_edge(s, t)
        found = False
        try:
            paths = list(nx.all_shortest_paths(copy, source=start, target=end))
            print("Bad", edge, paths)
            for path in paths:
                try:
                    avg = average_capacity(copy, path, needed)
                    if avg < smallest_avg:
                        smallest_avg = avg
                        smallest = (edge, path)
                    found = found or True
                except:
                    # Raises if path can't handle the needed capacity
                    print("incapacity", path)
        except:
            print("not reachable")
        if not found:
            print("stuck", edge)
        result.edges[edge]["stuck"] = not found
    print(smallest)
    return smallest

# Do the fixing
broken = smallest_average_capacity()
while broken:
    edge, path = broken
    start, end, key = edge
    weight = result.edges[edge]["weight"]
    # remove violating edge from final graph
    # result.remove_edge(start, end, key=key)
    result.edges[edge]["moved"] = True
    # Iterate through adjacent pairs of nodes on the path
    for i, j in zip(path, path[1:]):
        # adjust capacity
        usage.edges[i, j]["weight"] += weight
        # add buffered path to final graph
        sn = result.nodes[start]["name"]
        en = result.nodes[end]["name"]
        result.add_edge(i, j, weight=weight, stuck=False, bridged=True, moved=False, bad=False, name=f"{sn}-{en} {len(path)-1}")
    broken = smallest_average_capacity()

with open(output_file, "w") as f:
    print("graph G {", file=f)
    for node in usage.nodes:
        weight = usage.nodes[node]["weight"]
        name = usage.nodes[node]["name"]
        print(f"""n{node} [label="n{node} {name} - {weight}"];""", file=f)
    for edge in usage.edges:
        weight = usage.edges[edge]["weight"]
        color = "red" if usage.edges[edge].get("bad", False) else "black"
        start, end = edge
        print(f"""n{start} -- n{end} [label="{weight}", color="{color}"];""", file=f)
    print("}", file=f)

with open(result_file, "w") as f:
    print("graph G {", file=f)
    for node in result.nodes:
        weight = result.nodes[node]["weight"]
        name = result.nodes[node]["name"]
        print(f"""n{node} [label="n{node} {name} - {weight}"];""", file=f)
    for edge in result.edges(keys=True):
        label = result.edges[edge]["weight"]
        color = "black"
        if result.edges[edge].get("bridged", False):
            color = "green"
            name = result.edges[edge].get("name", "unknown")
            label = f"{label} ({name})"
        elif result.edges[edge].get("stuck", False):
            color = "purple"
        elif result.edges[edge].get("bad", False):
            color = "red"
        start, end, _ = edge
        print(f"""n{start} -- n{end} [label="{label}", color="{color}"];""", file=f)
    print("}", file=f)

# Add any stuck edges into the usage graph for rendering
for start, end, key, stuck in result.edges(keys=True, data="stuck"):
    if stuck:
        weight = result.edges[start, end, key]["weight"]
        if (start, end) not in usage.edges:
            usage.add_edge(start, end, stuck=weight, weight=0, capacity=0)
        else:
            usage.edges[start, end]["stuck"] += weight

def usage_stats(graph):
    total_area = sum(graph.nodes[node]["weight"] for node in graph.nodes)
    avg_area = mean(graph.nodes[node]["weight"] for node in graph.nodes)
    stuck = sum(graph.edges[edge]["stuck"] for edge in graph.edges)
    good = sum(graph.edges[edge]["weight"] for edge in graph.edges)
    capacity = sum(graph.edges[edge]["capacity"] for edge in graph.edges)
    all_area = 2560*1280*len(graph.nodes)
    percent_area = total_area / all_area
    return nx.density(graph), all_area, total_area, avg_area, percent_area, len(graph.nodes), stuck, good, capacity

def result_stats(graph):
    stuck = sum(graph.edges[edge]["weight"] for edge in graph.edges if graph.edges[edge]["stuck"])
    good = sum(graph.edges[edge]["weight"] for edge in graph.edges if not graph.edges[edge]["bad"] and not graph.edges[edge]["bridged"])
    bridged = sum(graph.edges[edge]["weight"] for edge in graph.edges if graph.edges[edge]["bridged"])
    moved = sum(graph.edges[edge]["weight"] for edge in graph.edges if graph.edges[edge]["moved"])
    return nx.density(graph), stuck, good, bridged, moved

with open(stats_file, "w+") as f:
    print(target_name, source_name, *usage_stats(usage), *result_stats(result), len(source.edges), len(source.nodes), sep=",", file=f)

with open(final_file, "w") as f:
    print("graph G {", file=f)
    for node in target.nodes:
        weight = usage.nodes[node]["weight"] / (2560*1280)
        name = usage.nodes[node]["name"]
        print(f"""n{node} [label="n{node} {name} - {weight:.0%}"];""", file=f)
    for edge in usage.edges:
        cap = usage.edges[edge]["capacity"]
        used = usage.edges[edge]["weight"]
        stuck = usage.edges[edge].get("stuck", 0)
        color = "black"
        label = f"{used}/{cap}"
        if stuck > 0:
            if cap > 0:
                label = f"{used}+{stuck}/{cap}"
            else:
                label = f"{stuck}"
            color = "red"
        start, end = edge
        print(f"""n{start} -- n{end} [color="{color}", label="{label}"];""", file=f)
    print("}", file=f)
