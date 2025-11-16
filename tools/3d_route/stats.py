from pandas._libs.tslibs import delta_to_nanoseconds
from frontier import *
import math
import json
from math import ceil, sqrt, acos, atan2, pi
from collections import deque
import networkx as nx
from numpy.testing._private.utils import break_cycles
import pyscipopt as scip
from networkx_helpers import *
from render import *
import logging
import pandas as pd

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--cache")
    parser.add_argument("--graph")
    parser.add_argument("--top", default="thing")
    args = parser.parse_args()

    g = read_yosys_json(args.graph,args.top)
    data = pd.read_csv(args.cache, index_col="node")
    for node, props in data.iterrows():
        if node in g.nodes:
            g.nodes[node]["coordinates"] = (int(props["x"]), int(props["y"]), int(props["z"]))
            g.nodes[node]["shell"] = int(props["shell"])
        else:
            log.warning("missing node %s", node)
    for node in g.nodes:
        if "coordinates" not in g.nodes[node]:
            log.warning("No coordinates for %s", node)
    data = extract_stats(g)
    data.to_csv(f"{args.cache[:-4]}.dist.csv")
