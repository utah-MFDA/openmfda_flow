import networkx as nx
from networkx_helpers import *
import pandas as pd

def find_least_impactful(adj: pd.DataFrame) -> tuple[pd.DataFrame, pd.Index]:
    dim = adj.copy() # just need same rows
    # for column in adj.columns:
    #     dim[column] = adj.drop(column, axis=1).duplicated()
    best = dim.sum().idxmin()
    return dim, best

def squash(adj: pd.DataFrame, impacts: pd.DataFrame, dropped: pd.Index) -> pd.DataFrame:
    # calculates the impact of just
    dim = adj.drop(dropped, axis=1)
    series = adj[dropped]
    possible = dim.copy()
    possible += series
    # possible_dupes = (possible.drop(column, axis=1).duplicated() for column in dim.columns)
    # errors = pd.concat(possible_dupes, keys=dim.columns, axis=1)
    # target = errors.sum().idxmin()
    target = possible.sum().idxmin()

    dupes = dim.duplicated()
    dim[target] = dim[target] + adj[dropped]
    return dim

def reduce_dimension(adj: pd.DataFrame) -> pd.DataFrame:
    nexts = adj
    while nexts.shape[1] > 3:
        impacts, best = find_least_impactful(nexts)
        print(best, nexts.shape[1], nexts.duplicated().sum())
        nexts = squash(nexts, impacts, best)
        nexts.to_csv(f"benchmarks/kinase_1.dimension_{nexts.shape[1]}.csv")
    return nexts

from render import *
G = read_yosys_json("benchmarks/kinase_1.json", top="thing")
G = collapse_edges(G)
labels = {node: f"{i:03}" for i, node in enumerate(G.nodes)}
nx.relabel_nodes(G, labels, copy=False)
p = nx.to_pandas_adjacency(G, dtype=int)

from sklearn.decomposition import PCA
pca = PCA(n_components=3)
pca.fit(p)
import numpy as np
# r = reduce_dimension(p)
# r.to_csv("kinase_1.dimension.csv")
cmp = pca.components_
d = pd.DataFrame({"x":cmp[0], "y":cmp[1], "z":cmp[2]}, index=p.index)
d /= d.abs().min()
print(d.abs().min())
print(d)
for node, coord in d.iterrows():
    G.nodes[node]["coordinates"] = coord.array
s = render_flat(G)
s.save_as_scad("benchmarks/kinase_1.dimension.scad")
