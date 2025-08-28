import networkx as nx
import sys

def extract(infile):
    dot = nx.nx_agraph.read_dot(infile)
    g = nx.Graph()
    for n in dot.nodes():
        if "label" in dot.nodes[n]:
            w = int(dot.nodes[n]["label"])
        else:
            w = 1
            g.add_node(n, weight=w)

    for t, f in dot.edges():
        connections = int(dot.edges[t, f, 0]["label"])
        # weight = 16 * (8 - connections)         # inverse of capacity, make lower capacity bigger.
        weight = 16 * connections
        g.add_edge(t, f, weight=weight)
    return g

if __name__ == "__main__":
    infile, outfile = sys.argv[1:]
    g = extract(infile)
    index = {n: i+1 for i, n in enumerate(g.nodes)}
    with open(outfile, "w") as output:
        with open(outfile + ".nodes", "w") as order:
            print(len(g.nodes), len(g.edges), "11", sep=" ", file=output)
            for node in g.nodes():
                print(node, file=order)
                edges = [str(index[neighbor]) + " " + str(g.edges[node, neighbor]["weight"]) for neighbor in g.neighbors(node)]
                print(g.nodes[node]["weight"], *edges, sep=" ", file=output)
