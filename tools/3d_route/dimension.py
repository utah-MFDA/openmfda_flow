import networkx as nx
from networkx_helpers import *
import pandas as pd

def distance_graph(G):
    N = nx.Graph()
    for start in G.nodes:
        for end in G.nodes:
            if start < end:
                length = nx.shortest_path_length(G, start, end)
                N.add_edge(start, end, weight=length)
    return N

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
import numpy as np

def pca_reduce(name, p):
    from sklearn.decomposition import PCA
    pca = PCA(n_components=3)
    pca.fit(p)
    cmp = pca.components_
    d = pd.DataFrame({"x":cmp[0], "y":cmp[1], "z":cmp[2]}, index=p.index)
    d /= d.abs().min()
    print(d.abs().min())
    print(d)
    for node, coord in d.iterrows():
        G.nodes[node]["coordinates"] = coord.array
    s = render_flat(G)
    s.save_as_scad(f"{name}.pca.scad")

def increment_pca_reduce(name, p):
    from sklearn.decomposition import IncrementalPCA
    pca = IncrementalPCA(n_components=3)
    pca.fit(p)
    cmp = pca.components_
    d = pd.DataFrame({"x":cmp[0], "y":cmp[1], "z":cmp[2]}, index=p.index)
    d /= d.abs().min()
    print(d.abs().min())
    print(d)
    for node, coord in d.iterrows():
        G.nodes[node]["coordinates"] = coord.array
    s = render_flat(G)
    s.save_as_scad(f"{name}.incremental.scad")

def mds_reduce(name, p):
    from sklearn.manifold import MDS
    mds = MDS(n_components=3, dissimilarity="precomputed")
    mds.fit(p)
    cmp = mds.embedding_.T
    d = pd.DataFrame({"x":cmp[0], "y":cmp[1], "z":cmp[2]}, index=p.index)
    d /= d.abs().min()
    print(d.abs().min())
    print(d)
    for node, coord in d.iterrows():
        G.nodes[node]["coordinates"] = coord.array
        G.nodes[node]["dimensions"] = [20, 20, 20]
    for edge in G.edges:

        G.edges[edge]["dimensions"] = [1, 1, 1]
    s = render_flat(G)
    s.save_as_scad(f"{name}.mds.scad")

def smacof_reduce(name, p):
    from sklearn.manifold import smacof
    cmp, stress = smacof(n_components=3, dissimilarities=p)
    cmp = cmp.T
    d = pd.DataFrame({"x":cmp[0], "y":cmp[1], "z":cmp[2]}, index=p.index)
    d /= d.abs().min()
    print(d.abs().min())
    print(d)
    for node, coord in d.iterrows():
        G.nodes[node]["coordinates"] = coord.array
        G.nodes[node]["dimensions"] = [20, 20, 20]
    for edge in G.edges:

        G.edges[edge]["dimensions"] = [5, 5, 5]
    s = render_flat(G)
    s.save_as_scad(f"{name}.smacof.scad")


def spectral_reduce(name, N):
    from sklearn.manifold import SpectralEmbedding
    spectral = SpectralEmbedding(n_components=3, affinity="precomputed")
    q = nx.to_pandas_adjacency(N, dtype=int)
    spectral.fit(q)
    cmp = spectral.embedding_.T
    d = pd.DataFrame({"x":cmp[0], "y":cmp[1], "z":cmp[2]}, index=q.index)
    d /= d.abs().min()
    print(d.abs().min())
    print(d)
    for node, coord in d.iterrows():
        G.nodes[node]["coordinates"] = coord.array
        G.nodes[node]["dimensions"] = [20, 20, 20]
    for edge in G.edges:

        G.edges[edge]["dimensions"] = [5, 5, 5]
    s = solid2.scale((1,0.05,1))(render_flat(G))
    s.save_as_scad(f"{name}.spectral.scad")

def isomap_reduce(name, q):
    from sklearn.manifold import Isomap
    spectral = Isomap(n_components=3)
    spectral.fit(q)
    cmp = spectral.embedding_.T
    print(cmp)
    d = pd.DataFrame({"x":cmp[0], "y":cmp[1], "z":cmp[2]}, index=q.index)
    d /= d.abs().min()
    print(d.abs().min())
    print(d)
    for node, coord in d.iterrows():
        G.nodes[node]["coordinates"] = coord.array
        G.nodes[node]["dimensions"] = [100, 100, 100]
    for edge in G.edges:

        G.edges[edge]["dimensions"] = [10, 10, 10]
    s = render_flat(G)
    s.save_as_scad(f"{name}.isomap.scad")

def smacof_reduce(name, p):
    from sklearn.manifold import smacof
    cmp, stress = smacof(n_components=3, dissimilarities=p)
    cmp = cmp.T
    d = pd.DataFrame({"x":cmp[0], "y":cmp[1], "z":cmp[2]}, index=p.index)
    d /= d.abs().min()
    print(d.abs().min())
    print(d)
    for node, coord in d.iterrows():
        G.nodes[node]["coordinates"] = coord.array
        G.nodes[node]["dimensions"] = [100, 100, 100]
    for edge in G.edges:

        G.edges[edge]["dimensions"] = [5, 5, 5]
    s = render_flat(G)
    s.save_as_scad(f"{name}.smacof.scad")

def grp_reduce(name, p):
    from sklearn.random_projection import GaussianRandomProjection
    grp = GaussianRandomProjection(n_components=3)
    grp.fit(p)
    cmp = grp.components_
    d = pd.DataFrame({"x":cmp[0], "y":cmp[1], "z":cmp[2]}, index=p.index)
    d /= d.abs().min()
    print(d.abs().min())
    print(d)
    for node, coord in d.iterrows():
        G.nodes[node]["coordinates"] = coord.array
        G.nodes[node]["dimensions"] = [100, 100, 100]
    for edge in G.edges:

        G.edges[edge]["dimensions"] = [5, 5, 5]
    s = render_flat(G)
    s.save_as_scad(f"{name}.grp.scad")

def ica_reduce(name, p):
    from sklearn.decomposition import FastICA
    ica = FastICA(n_components=3)
    ica.fit(p)
    cmp = ica.components_
    d = pd.DataFrame({"x":cmp[0], "y":cmp[1], "z":cmp[2]}, index=p.index)
    d /= d.abs().min()
    print(d.abs().min())
    print(d)
    for node, coord in d.iterrows():
        G.nodes[node]["coordinates"] = coord.array
        G.nodes[node]["dimensions"] = [10, 10, 10]
    for edge in G.edges:

        G.edges[edge]["dimensions"] = [1, 1, 1]
    s = render_flat(G)
    s.save_as_scad(f"{name}.ica.scad")

import sys
name = sys.argv[1]

G = read_yosys_json(f"{name}.json", top="thing")
print("Read file")
G = collapse_edges(G)
# labels = {node: f"{i:03}" for i, node in enumerate(G.nodes)}
# nx.relabel_nodes(G, labels, copy=False)
print("Graph cleaned")
N = distance_graph(G)
print("Distances calculated")
p = nx.to_pandas_adjacency(N, dtype=int, weight="weight")
p.to_csv(f"{name}.csv")
print("Adjacency generated")
pca_reduce(name, p)
print("Next 0")
increment_pca_reduce(name, p)
print("Nexti 1")
mds_reduce(name, p)
print("Next 2")
smacof_reduce(name, p)
print("Next 3")
# spectral_reduce(name, q)
# print("Next 4")
isomap_reduce(name, p)
print("Next 5")
grp_reduce(name, p)
print("Next 6")
ica_reduce(name, p)
print("Next 7")
