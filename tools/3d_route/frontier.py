import json
from math import sqrt, acos, atan2, pi, ceil
from collections import deque
import networkx as nx
from pyscipopt import Model, quicksum
import uuid
from networkx_helpers import read_yosys_json
import time
import solid2
import logging
log = logging.getLogger(__name__)

logging.basicConfig(filename='3d_route.log', level=logging.DEBUG)

def vector(a, b):
    # return (a[0] - b[0], a[1] - b[1], a[2] - b[2])
    return (i - j for i, j in zip(a, b))

def magnitude(a):
    # x, y, z = a
    # return sqrt(x**2 + y**2 + z**2)
    return sqrt(sum(i**2 for i in a))

def cross(a, b):
    s0 = a[1]*b[2] - a[2]*b[1]
    s1 = a[2]*b[0] - a[0]*b[2]
    s2 = a[0]*b[1] - a[1]*b[0]
    return (s0, s1, s2)

def dot(a, b):
    # return a[0]*b[0] + a[1]*b[1] + a[2]*b[2]
    return [i * j for i, j in zip(a, b)]

def add(a, b):
    # return (a[0]+b[0], a[1]+b[1], a[2]+b[2]
    return [i + j for i, j in zip(a, b)]

def sub(a, b):
    # return (a[0]+b[0], a[1]+b[1], a[2]+b[2]
    return [i - j for i, j in zip(a, b)]

def squared_magnitude(a):
    # return a[0]**2 + a[1]**2 + a[2]**2
    return quicksum(i**2 for i in a)

def scale(s, a):
    return [s*i for i in a]

def find_center(G):
    frontier = deque(node for node in G.nodes if G.degree(node) == 1)
    nexts = deque()
    shell = 0
    for node in G.nodes:
        G.nodes[node]["relations"] = set()
        G.nodes[node]["setup"] = False
    for leaf in frontier:
        G.nodes[leaf]["shell"] = shell

    while frontier:
        log.info("Found shell of size %d", len(frontier))
        for leaf in frontier:
            if G.nodes[leaf]["setup"]:
                continue
            children = deque()
            for neighbor in G.adj[leaf]:
                if "shell" in G.nodes[neighbor]:
                    # Direct relation in current shell
                    if G.nodes[neighbor]["shell"] == shell:
                        # Create a relation
                        first = min(leaf,neighbor)
                        second = max(leaf, neighbor)
                        G.nodes[leaf]["relations"].add((first, second, 0))
                        continue
                    # Parent, nothing to do
                    elif G.nodes[neighbor]["shell"] < shell:
                        continue
                    # Child already visited by others
                    else:
                        children.append(neighbor)
                # Child unvisited
                else:
                    G.nodes[neighbor]["shell"] = shell + 1
                    children.append(neighbor)
                    nexts.append(neighbor)
            # Childless, create a dummy child for traversal later
            if len(children) == 0:
                dummy = leaf + "_"
                G.add_node(dummy, shell=shell+1, dummy=True, setup=False, relations=set())
                G.add_edge(leaf, dummy)
                children.append(dummy)
                nexts.append(dummy)
            # Pass your relations to your children
            for child in children:
                for first, second, distance in G.nodes[leaf]["relations"]:
                    G.nodes[child]["relations"].add((first, second, distance + 1))
            # Add a special relation for sibling children
            if len(children) > 1:
                for child in children:
                    # Siblings descend from their parent
                    G.nodes[child]["relations"].add((leaf, leaf, 1))
            # More than one child, create a sibling relationship
            G.nodes[leaf]["setup"] = True
        shell += 1
        # If there happens to be only one node, it is the root
        if len(nexts) == 1:
            return shell, nexts[0]
        # If all of the nodes are dummies, create a dummy root node
        elif all(G.nodes[node].get("dummy", False) for node in nexts):
            log.info("Found terminal shell")
            # root = str(uuid.uuid4())
            # G.add_node(root, shell=shell, dummy=True, relations=set())

            # for dummy in nexts:
            #     for adj in G.adj[dummy]:
            #         G.add_edge(adj, root)
            #     G.remove_node(dummy)
            return shell, nexts
        else:
            frontier = nexts
            nexts = deque()
    raise

def setup(G):
    shells, roots = find_center(G)
    # Setup root node at center
    start_shell = 5 # ceil(len(roots)**(1/3))//2
    log.info("Starting at shell %d", start_shell)
    for node in G:
        # Reverse the order of the shells from inside to out
        G.nodes[node]["shell"] = shells + start_shell - G.nodes[node]["shell"]
        G.nodes[node]["visited"] = False
    log.info("Finished generating spanning tree")
    for node in G.nodes:
        log.debug("Generated %s %s %s", node, G.nodes[node], G.adj[node])
    return start_shell, roots

def add_position(G, M, node, width, height, depth):
    if "coordinates" in G.nodes[node]:
        G.nodes[node]["coordinate_vars"] = G.nodes[node]["coordinates"]
        return True
    else:
        x, y, z = [M.addVar(f"{node}_{i}", vtype="INTEGER", lb=lb, ub=ub)
                   for i, lb, ub
                   in [("x", -width, width),
                       ("y", -height, height),
                       ("z", -depth, depth)]]
        G.nodes[node]["coordinate_vars"] = (x, y, z)
        return False


def solve_shell(G, frontier, shell, width, height, depth, start, relax = False):
    M = Model()
    nexts = set()
    log.info("Solving shell %d, %d nodes", shell, len(frontier))
    minim = []
    cache = 0
    for node in frontier:
        cached =  add_position(G, M, node, shell, shell, shell)
        if cached:
            cache += 1
        assert(G.nodes[node]["shell"] == shell)
        in_shell(G, M, node, shell)
    log.debug("Loaded cache %d/%d", cache, len(frontier))
    if not relax:
        for first in frontier:
            for second in frontier:
                if first < second:
                    not_overlap(G, M, first, second, shell)
    for node in frontier:
        for neighbor in G.adj[node]:
            n_shell = G.nodes[neighbor]["shell"]
            # next shell, add to next frontier
            if n_shell > shell:
                nexts.add(neighbor)
            elif shell == n_shell:
                if G.nodes[neighbor]["visited"]:
                    # relationships are symmetric. is already setup
                    continue
                else:
                    # Same shell, setup proximity from constraints
                    minim += distance_shell(G, M, node, neighbor, shell, False, relax)
            else:
                # Previous shell, setup direct proximity from position
                minim += attach_to_side(G, M, neighbor, node, shell, relax)
    # solve and extract position values
    if minim:
        M.setObjective(quicksum(minim), sense="minimize")
    log.info("Starting optimizations with %d variables and %d constraints", M.getNVars(), M.getNConss())
    M.optimize()
    log.info("Finished optimizing, %d solutions found", M.getNSols())

    log.debug("Minim vars:", *(M.getVal(i) for i in minim))
    if M.getNSols() >= 1:
        for node in frontier:
            G.nodes[node]["coordinates"] = [M.getVal(i) for i in G.nodes[node]["coordinate_vars"]]
            log.debug("Final coordinates: %s %s", node, G.nodes[node]["coordinates"])
        return nexts
    else:
        assert(relax)
        log.warn("Unable to find solution, relaxing distance constraint")
        return solve_shell(G, frontier, shell, width, height, depth, start, True)
def distance_shell(G, M, s, e, shell, startup, relax):
    x, y, z = G.nodes[s]["coordinate_vars"]
    a_rel = G.nodes[s]["relations"]
    nx, ny, nz = G.nodes[e]["coordinate_vars"]
    b_rel = G.nodes[e]["relations"]
    dist = a_rel.intersection(b_rel)
    # if no relationship constraint, bail
    if not len(dist):
        if startup:
            # Maximimize distance
            X = M.addVar(vtype="I", lb=0)
            Y = M.addVar(vtype="I", lb=0)
            Z = M.addVar(vtype="I", lb=0)
            M.addCons(X*(x - nx) >= 0)
            M.addCons(Y*(y - ny) >= 0)
            M.addCons(Z*(z - nz) >= 0)
            return X, Y, Z
    else:
        # Find worst case distance requirement
        bound = min(d for _, _, d in dist)
        if relax:
            X = M.addVar(vtype="I", lb=0)
            Y = M.addVar(vtype="I", lb=0)
            Z = M.addVar(vtype="I", lb=0)
        else:
            X = 0
            Y = 0
            Z = 0
        log.debug("Distance constraint %d  %s to %s", bound, s, e)
        M.addCons(x - nx <= bound + X, name=f"distance_x0_{s}_{e}")
        M.addCons(nx - x <= bound + X, name=f"distance_x1_{s}_{e}")
        M.addCons(y - ny <= bound + Y, name=f"distance_y0_{s}_{e}")
        M.addCons(ny - y <= bound + Y, name=f"distance_y1_{s}_{e}")
        M.addCons(z - nz <= bound + Z, name=f"distance_z0_{s}_{e}")
        M.addCons(nz - z <= bound + Z, name=f"distance_z1_{s}_{e}")
        if relax:
            return X, Y, Z
        else:
            return []
    return []

def is_equal(M, a, b, x, shell):
    i = M.addVar(f"overlap_i{x}_{a}_{b}", vtype="B")
    j = M.addVar(f"overlap_j{x}_{a}_{b}", vtype="B")
    k = M.addVar(f"overlap_k{x}_{a}_{b}", vtype="B")
    M.addCons(-shell*i + b*j + (b+1)*k <= a)
    M.addCons(a <= (b-1)*i + b*j + shell*k)
    M.addCons(j + i + k == 1)
    return j

def not_overlap(G, M, first, second, shell):
    x, y, z = G.nodes[first]["coordinate_vars"]
    a, b, c = G.nodes[second]["coordinate_vars"]
    i = is_equal(M, x, a, "x", shell)
    j = is_equal(M, y, b, "y", shell)
    k = is_equal(M, z, c, "z", shell)
    M.addCons(i * j * k == 0, name=f"overlap_{first}_{second}")

def in_shell(G, M, node, shell):
    w, h, d = shell, shell, shell
    x, y, z = G.nodes[node]["coordinate_vars"]
    i = M.addVar(f"shell_i_{node}", vtype="B")
    j = M.addVar(f"shell_j_{node}", vtype="B")
    k = M.addVar(f"shell_k_{node}", vtype="B")
    l = M.addVar(f"shell_l_{node}", vtype="B")
    m = M.addVar(f"shell_m_{node}", vtype="B")
    n = M.addVar(f"shell_n_{node}", vtype="B")
    M.addCons(x <= w)
    M.addCons(x >= -w)
    M.addCons(y <= h)
    M.addCons(y >= -h)
    M.addCons(z <= d)
    M.addCons(z >= -d)
    M.addCons(i*(x - w) == 0, name=f"shell_nx_{node}")
    M.addCons(j*(x + w) == 0, name=f"shell_px_{node}")
    M.addCons(k*(y - h) == 0, name=f"shell_ny_{node}")
    M.addCons(l*(y + h) == 0, name=f"shell_py_{node}")
    M.addCons(m*(z - d) == 0, name=f"shell_nz_{node}")
    M.addCons(n*(z + d) == 0, name=f"shell_pz_{node}")
    M.addCons(i + j + k + l + m + n >= 1, name=f"shell_{node}")

def attach_to_side(G, M, side, node, shell, relax = False):
    x, y, z = G.nodes[side]["coordinates"]
    a, b, c = G.nodes[node]["coordinate_vars"]
    # Within +/- 1
    if relax:
        X = M.addVar(vtype="I", lb=0)
        Y = M.addVar(vtype="I", lb=0)
        Z = M.addVar(vtype="I", lb=0)
    else:
        X = 0
        Y = 0
        Z = 0
    M.addCons(a - x <= 1 + X, name=f"attach_px_{side}_{node}")
    M.addCons(1 + X >= x - a, name=f"attach_nz_{side}_{node}")
    M.addCons(b - y <= 1 + Y, name=f"attach_py_{side}_{node}")
    M.addCons(1 + Y >= y - b, name=f"attach_ny_{side}_{node}")
    M.addCons(c - z <= 1 + Z, name=f"attach_pz_{side}_{node}")
    M.addCons(1 + Z >= z - c, name=f"attach_nz_{side}_{node}")
    if relax:
        return X, Y, Z
    else:
        return []

def run_by_shell(G, width = 2560, height = 1600, depth = 1000):
    shell, roots = setup(G)
    if len(roots) == 1:
        root = roots[0]
        G.nodes[roots[0]]["coordinates"] = (0, 0, 0)
        shell = 1
        frontier = deque(G.adj[root])
    else:
        frontier = deque(roots)
    start_shell = shell
    while frontier:

        frontier = solve_shell(G, frontier, shell, width, height, depth, start_shell)
        scad = solid2.background()(solid2.cube([1,1,1]))
        for i in scad_render(G):
            scad += i
        scad.save_as_scad()
        write_cache(G)
        shell += 1
    return G

def draw_channel(a, b, d):
    v = sub(a, b)
    length = magnitude(v)
    bounds = d[0], d[1], length
    if length == 0.0:
        length += 0.000001
    angle = [0,180*acos(v[2]/length)/pi, 180*atan2(v[1], v[0])/pi]
    return solid2.translate(b)(solid2.rotate(angle)(solid2.cube(bounds)))

def write_cache(G):
    dump = {}
    for node in G:
        if "coordinates" in G.nodes[node] and "coordinates" != (0, 0, 0):
            dump[node] = G.nodes[node]["coordinates"]
    with open("cache.json", "w") as f:
        json.dump(dump, f)

def load_cache(G):
    with open("cache.json") as f:
        cache = json.load(f)
        for node, coord in cache.items():
            if node in G:
                G.nodes[node]["coordinates"] = coord

def scad_render(G):
    for node in G.nodes:
        dimensions = G.nodes[node].get("dimensions", (100,100,100))
        position = G.nodes[node].get("coordinates", (0, 0, 0))
        adj = scale(110, position)
        shell = G.nodes[node].get("shell", 0)
        if position == (0, 0, 0) and shell != 0:
            continue
        yield solid2.translate(adj)(solid2.cube(dimensions))
    for edge in G.edges:
        start, end = edge
        orig_e = G.nodes[end].get("coordinates", (0,0,0))
        orig_s = G.nodes[start].get("coordinates", (0,0,0))
        dimensions = G.edges[edge].get("dimensions", (5,5,5))
        start_pin = G.edges[edge].get("start_pin", (0, 0, 0))
        end_pin = G.edges[edge].get("end_pin", (0, 0, 0))
        start = scale(110, orig_s)
        end = scale(110, orig_e)
        front = add(start, start_pin)
        back = add(end, end_pin)
        if orig_e == (0, 0, 0)  or orig_s == (0, 0, 0):
            continue
        yield draw_channel(front, back, dimensions)

if __name__ == "__main__":
    log.info("**************** Starting ****************")
    import sys
    input_file = sys.argv[1]
    G = read_yosys_json(input_file, "thing")

    # G = nx.Graph()
    # for i in range(0, 10):
    #     G.add_node(f"n_{i}")
    # for i, j in zip(range(0, 10), range(1,10)):
    #     G.add_edge(f"n_{i}", f"n_{j}")
    log.info("Loaded %s", G)
    load_cache(G)
    try:
        G = run_by_shell(G, width = 256, height=160, depth=100)
    except AssertionError:
        log.error("Failed")
    # for x in G.nodes:
    #     log.info("Final solution %s %s", x, G.nodes[x].get("coordinates", (0, 0, 0)))
    scad = solid2.background()(solid2.cube([1,1,1]))
    for i in scad_render(G):
        scad += i
    scad.save_as_scad()
    write_cache(G)
    log.info("Done")
