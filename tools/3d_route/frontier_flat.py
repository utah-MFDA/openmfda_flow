import json
from math import sqrt, acos, atan2, pi, ceil
from collections import deque
import networkx as nx
import pyscipopt as scip
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
    return scip.quicksum(i**2 for i in a)

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
    start_shell = 0 #ceil(len(roots)**(1/3))//2
    log.info("Starting at shell %d", start_shell)
    for node in G:
        # Reverse the order of the shells from inside to out
        G.nodes[node]["shell"] = shells + start_shell - G.nodes[node]["shell"]
    log.info("Finished generating spanning tree")
    for node in G.nodes:
        log.debug("Generated %s %s %s", node, G.nodes[node], G.adj[node])
    return start_shell, roots

def add_position(G, M, node, width, height, depth):
    x, y, z = [M.addVar(f"{node}_{i}", vtype="INTEGER", lb=lb, ub=ub)
               for i, lb, ub
               in [("x", -width, width),
                   ("y", -height, height),
                   ("z", 0, depth)]]
    G.nodes[node]["coordinate_vars"] = (x, y, z)

def in_shell(G, M, node, width, height, depth, shell, relax):
    x, y, z = G.nodes[node]["coordinate_vars"]
    M.addCons(z == shell)

def solve_shell(G, frontier, shell, width, height, depth, start, relax = False):
    M = scip.Model()
    M.setParam("limits/time", 120)
    M.setParam("limits/solutions", 1)
    nexts = set()
    log.info("********************************")
    if relax:
        log.info("Relaxing distance constraints")
    log.info("Solving shell %d, %d nodes", shell, len(frontier))
    minim = []
    cache = 0
    for node in frontier:
        add_position(G, M, node, 5, 5, 5)
        in_shell(G, M, node, width, height, depth, shell, relax)
        G.nodes[node]["visited"] = False
    for first in frontier:
        for second in frontier:
            if first < second:
                not_overlap(G, M, first, second, shell, relax)
                minim += distance_shell(G, M, first, second, shell, relax)
    for node in frontier:
        for neighbor in G.adj[node]:
            n_shell = G.nodes[neighbor]["shell"]
            # next shell, add to next frontier
            if n_shell > shell:
                assert(n_shell == shell+1)
                nexts.add(neighbor)
            elif shell == n_shell:
                minim += proximate(G, M, neighbor, node, shell, relax)
            else:
                # Previous shell, setup direct proximity from position
                minim += attach_to_side(G, M, neighbor, node, shell, relax)
        G.nodes[node]["visited"] = True
    # solve and extract position values
    if minim:
        M.setObjective(scip.quicksum(minim), sense="minimize")
    log.info("Presolving with %d variables and %d constraints", M.getNVars(), M.getNConss())
    M.presolve()
    log.info("Starting optimizations with %d variables and %d constraints", M.getNVars(), M.getNConss())
    M.optimize()
    log.info("Finished optimizing, %d solutions found", M.getNSols())

    log.debug("Minim vars: %s", [M.getVal(i) for i in minim])
    if M.getNSols() >= 1:
        for node in frontier:
            G.nodes[node]["coordinates"] = [M.getVal(i) for i in G.nodes[node]["coordinate_vars"]]
            log.debug("Final coordinates: %s %s", node, G.nodes[node]["coordinates"])
        return nexts
    else:
        log.warning("Unable to find solution")
        assert(not relax)
        return solve_shell(G, frontier, shell, width, height, depth, start, True)

def within_distance(G, M, a, b, d, relax):
    X = 0 if not relax else M.addVar(vtype="I", lb=0)
    M.addCons(abs(a - b) <= d + X)
    if relax:
        return [X]
    else:
        return []

def proximate_shell(G, M, s, e, shell, relax):
    x, y, z = G.nodes[s]["coordinate_vars"]
    nx, ny, nz = G.nodes[e]["coordinate_vars"]
    a = within_distance(G, M, x, nx, 1, relax)
    b = within_distance(G, M, y, ny, 1, relax)
    log.debug("Sibling\t%s\t%s\t1", s, e)
    return a + b

def distance_shell(G, M, s, e, shell, relax):
    x, y, z = G.nodes[s]["coordinate_vars"]
    a_rel = G.nodes[s]["relations"]
    nx, ny, nz = G.nodes[e]["coordinate_vars"]
    b_rel = G.nodes[e]["relations"]
    dist = a_rel.intersection(b_rel)
    # if no relationship constraint, bail
    if len(dist) == 0:
        return []
    else:
        # Find worst case distance requirement
        bound = min(d for _, _, d in dist) + 1
        a = within_distance(G, M, x, nx, bound, relax)
        b = within_distance(G, M, y, ny, bound, relax)
        log.debug("Cousins\t%s\t%s\t%d", s, e, bound)
        return a + b

def not_overlap(G, M, first, second, shell, relax):
    x, y, z = G.nodes[first]["coordinate_vars"]
    a, b, c = G.nodes[second]["coordinate_vars"]
    M.addCons(abs(x - a) + abs(y - b) + abs(z - c) >= 1)

def attach_to_side(G, M, side, node, shell, relax = False):
    assert(G.nodes[side]["shell"] == shell - 1)
    x, y, z = G.nodes[side]["coordinates"]
    a, b, c = G.nodes[node]["coordinate_vars"]
    # Within +/- 1
    a = within_distance(G, M, x, a, 2, relax)
    b = within_distance(G, M, y, b, 2, relax)
    log.debug("Child\t%s\t%s\t1", node, str((x, y, z)))
    return a + b

def run_by_shell(G, width = 2560, height = 1600, depth = 1000):
    shell, roots = setup(G)
    frontier = deque(roots)
    start_shell = shell
    while frontier:
        frontier = solve_shell(G, frontier, shell, width, height, depth, start_shell)
        render_scad(G)
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
        if "coordinates" in G.nodes[node] and G.nodes[node]["coordinates"] != [0, 0, 0]:
            dump[node] = G.nodes[node]["coordinates"]
    with open("cache.json", "w") as f:
        json.dump(dump, f)

def load_cache(G):
    with open("cache.json") as f:
        cache = json.load(f)
        for node, coord in cache.items():
            if node in G:
                G.nodes[node]["coordinates"] = coord

def scad_render_nodes(G):
    for node in G.nodes:
        if "coordinates" not in G.nodes[node] or G.nodes[node].get("dummy", False):
#            log.warning("Missing coordinates for node %s", node)
            continue
        dimensions = G.nodes[node].get("dimensions", [1, 1, 1])
        position = G.nodes[node]["coordinates"]
        yield solid2.translate(position)(solid2.cube(dimensions))

def scad_render_edges(G):
    for edge in G.edges:
        start, end = edge
        if "coordinates" not in G.nodes[end] or "coordinates" not in G.nodes[start]:
#            log.warning("Missing coordinates for edge from %s to %s", start, end)
            continue
        end_orig = G.nodes[end]["coordinates"]
        end_dim = G.nodes[end].get("dimensions", [1,1,1])
        start_orig = G.nodes[start]["coordinates"]
        start_dim = G.nodes[start].get("dimensions", [1,1,1])
        channel_dim = G.edges[edge].get("dimensions", (0.125,0.125, 0.125))
        start_pin = G.edges[edge].get("start_pin", (0.5, 0.5, 0.5))
        end_pin = G.edges[edge].get("end_pin", (0.5, 0.5, 0.5))
#        log.debug("edge from %s %s to %s %s", start, start_orig, end, end_orig)
        front = [i + j for i, j in zip(start_orig, start_pin)]
        back = [i + j for i, j in zip(end_orig, end_pin)]
        yield draw_channel(front, back, channel_dim)

def render_scad(G):
    edges = solid2.background()(solid2.cube([0,0,0]))
    for edge in scad_render_edges(G):
        edges += edge
    nodes = solid2.background()(solid2.cube([0,0,0]))
    for node in scad_render_nodes(G):
        nodes += node
    scad = solid2.background()(solid2.union()(nodes)) + \
        solid2.union()(edges)
    scad.save_as_scad()

if __name__ == "__main__":
    log.info("**************** Starting ****************")
    import sys
    input_file = sys.argv[1]
    G = read_yosys_json(input_file, "thing")
    log.info("Loaded %s", G)
    # load_cache(G)
    G = run_by_shell(G, width = 256, height=160, depth=100)
    for x in G.nodes:
        log.debug("Final solution %s %s", x, G.nodes[x].get("coordinates", "none"))
    render_scad(G)
    write_cache(G)
    log.info("Done")
