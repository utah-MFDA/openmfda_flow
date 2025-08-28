import networkx as nx
import re
import xgi

#  Lines starting with % are comments and ignored
#  The first non-comment line lists
#  the number of vertices V, edges, and the value of FMT.
#
#  FMT has the following meanings:
#    0  the graph has no weights (in this case, you can omit FMT);
#    1  the graph has edge weights;
#   10  the graph has vertex weights;
#   11  the graph has both edge and vertex weights.
#  Vertex weights must be integer that are 0 or greater.
#  Edge weights must be integers strictly greater than 0.
#
#  The remaining V lines contain the data for the each vertex.
#  Data is whitespace separated. Vertex are identified by position index.
#  Index starts at 1
#
# If there are no weights (FMT == "0"), each item in the line is a neighbor
# If there are edge weights (FMT == "1"), the line consists of neighbor weight pairs
# If there are vertex weights (FMT == "10"), the first item in the line is the vertex
#   weight and the remaining are neighbors.
# If there are both edge and vertex weights (FMT == "11"), the first item in the line
#   is the vertex weight and the remaining are neighbor weight pairs.

def parse_lines(lines):
    for line in lines:
        if "%" in line:
            continue
        else:
            numbers = [int(j) for j in re.split(r"\W+", line.strip())]
            yield numbers

def extract_metis(raw):
    G = nx.Graph()
    lines = parse_lines(raw)
    header = next(lines)
    if len(header) == 3:
        nodes, edges, fmt = header
    else:
        nodes, edges = header
        fmt = 0
    for i, line in enumerate(lines):
        # Edges are indexed at 1
        n = i + 1
        if fmt == 11: # both edge and node weights
            weight = line[0]
            G.add_node(n, weight=weight)
            for e, w in zip(line[1::2], line[2::2]):
                if e < n:
                    continue
                G.add_edge(n, e, weight=w)
        elif fmt == 1: # edge weights only
            for e, w in zip(line[0::2], line[1::2]):
                if e < n:
                    continue
                G.add_edge(n, e, weight=w)
        elif fmt == 10: # node weights only
            weight = line[0]
            G.add_node(n, weight=weight)
            for e in line[1:]:
                if e < n:
                    continue
                G.add_edge(n, e)
        elif fmt == 0: # no weights
            for e in line:
                if e < n:
                    continue
                G.add_edge(n, e)
        else:
            raise
    assert(len(G.nodes) == nodes)
    assert(len(G.edges) == edges)
    return G

def read_metis(filename):
    with open(filename) as g:
        return extract_metis(g.readlines())

def read_meta(meta_file):
    with open(meta_file) as meta:
        for i, line in enumerate(meta.readlines()):
            yield i+1, line.strip()


def read_kahypar(part_file):
    with open(part_file) as parts:
        for i, p in enumerate(parts.readlines()):
            yield i+1, int(p.strip()) + 1

def read_hmetis(filename):
    with open(filename) as f:
        lines = parse_lines(f.readlines())
        header = next(lines)
        if len(header) == 3:
            edges, nodes, fmt = header
        else:
            edges, nodes = header
            fmt = 0
        l = list(lines)
        print(nodes, edges, len(l))
        if fmt == 0:
            return xgi.Hypergraph(l)
        elif fmt == 10:
            h = xgi.Hypergraph(l[:edges])
            h.set_node_attributes({i+1: w[0] for i, w in enumerate(l[edges:])}, "weight")
            return h
        else:
            raise
