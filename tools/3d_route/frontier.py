import json
from math import sqrt, acos, atan2, pi, ceil
from collections import deque
import networkx as nx
import pyscipopt as scip
import uuid
from networkx_helpers import hypergraph_to_graph, read_yosys_json, read_yosys_json_hyper
import time
import solid2
import logging
log = logging.getLogger(__name__)

logging.basicConfig(filename='3d_route.log', level=logging.INFO)

def find_center_pipo(G):
    frontier = deque(node for node in G.nodes if G.degree(node) == 1)
    return find_center(G, frontier, set())
def find_center_pi(G):
    frontier = deque(node for node in G.nodes if G.nodes[node]["isPI"])
    end = set(node for node in G.nodes if G.nodes[node]["isPO"])
    return find_center(G, frontier, end)

def find_center_fluid(G):
    frontier = deque(node for node in G.nodes if G.nodes[node]["type"] == "port" and G.nodes[node][""])
    orphaned = deque(node for node in G.nodes if G.degree(node) == 0)
    for orphan in orphaned:
        log.warning("Orphan node %s", orphan)
        G.remove_node(orphan)
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

def find_center(G, frontier, end):
    orphaned = deque(node for node in G.nodes if G.degree(node) == 0)
    for orphan in orphaned:
        log.warning("Orphan node %s", orphan)
        G.remove_node(orphan)
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

def setup(G, start=None):
    shells, roots = find_center_pipo(G)
    # Setup root node at center
    start_shell = start if start else ceil(len(roots)**(1/3))//2
    log.info("Starting at shell %d", start_shell)
    for node in G:
        # Reverse the order of the shells from inside to out
        if "shell" not in G.nodes[node]:
            log.error("Missing %s", node)
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
                   ("z", -depth, depth)]]
    G.nodes[node]["coordinate_vars"] = (x, y, z)

def in_vertical(G, M, node, width, height, depth, shell, relax):
    x, y, z = G.nodes[node]["coordinate_vars"]
    M.addCons(z == shell)

def in_horizontal(G, M, node, width, height, depth, shell, relax):
    x, y, z = G.nodes[node]["coordinate_vars"]
    M.addCons(x == shell)

def in_column(G, M, node, width, height, depth, shell, relax):
    x, y, z = G.nodes[node]["coordinate_vars"]
    M.addCons(abs(x) == shell)
    M.addCons(abs(y) == shell)

def in_shell(G, M, node, w, h, d, shell, relax):
    x, y, z = G.nodes[node]["coordinate_vars"]
    i = M.addVar(f"shell_i_{node}", vtype="B")
    j = M.addVar(f"shell_j_{node}", vtype="B")
    k = M.addVar(f"shell_k_{node}", vtype="B")
    # Should be implicit with the variable bounds previously set
    # M.addCons(x <= w)
    # M.addCons(x >= -w)
    # M.addCons(y <= h)
    # M.addCons(y >= -h)
    # M.addCons(z <= d)
    # M.addCons(z >= -d)
    M.addCons(i*(abs(x) - w) == 0, name=f"shell_nx_{node}")
    M.addCons(j*(abs(y) - h) == 0, name=f"shell_ny_{node}")
    M.addCons(k*(abs(z) - d) == 0, name=f"shell_nz_{node}")
    M.addCons(i + j + k >= 1, name=f"shell_{node}")
    # M.addCons(z == shell)i
    return [i, j, k]

def solve_shell(G, proximate, distance, inside, attach, frontier, shell, width, height, depth, start, relax = 0):
    M = scip.Model()
    M.setParam("limits/time", 120)
    # M.setParam("limits/solutions", 1)
    nexts = set()
    log.info("********************************")
    if relax:
        log.info(f"Relaxing distance constraints by {relax}")
    log.info("Solving shell %d, %d nodes", shell, len(frontier))
    minim = []
    for node in frontier:
        add_position(G, M, node, width, height, depth)
        inside(G, M, node, width, height, depth, shell, relax)
        G.nodes[node]["visited"] = False
    for first in frontier:
        for second in frontier:
            if first < second:
                not_overlap(G, M, first, second, shell, relax)
                minim += distance(G, M, first, second, shell, relax)
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
                minim += attach(G, M, neighbor, node, shell, relax)
        G.nodes[node]["visited"] = True
    # solve and extract position values
    if minim:
        M.setObjective(scip.quicksum(minim), sense="minimize")
    log.info("Presolving with %d variables and %d constraints", M.getNVars(), M.getNConss())
    M.presolve()
    log.info("Starting optimizations with %d variables and %d constraints", M.getNVars(), M.getNConss())
    M.optimize()
    log.info("Finished optimizing, %d solutions found", M.getNSols())

    # log.debug("Minim vars: %s", [M.getVal(i) for i in minim])
    if M.getNSols() >= 1:
        for node in frontier:
            G.nodes[node]["coordinates"] = [M.getVal(i) for i in G.nodes[node]["coordinate_vars"]]
            log.debug("Final coordinates: %s %s", node, G.nodes[node]["coordinates"])
        return relax, nexts
    else:
        log.warning("Unable to find solution")
        return solve_shell(G, proximate, distance, inside, attach, frontier, shell, width, height, depth, start, relax+1)

def within_distance(G, M, a, b, d, relax):
    X = 0 if not relax else M.addVar(vtype="I", lb=0, ub=relax)
    M.addCons(abs(a - b) <= d + X)
    if relax:
        return [X]
    else:
        return []

def proximate_layer(G, M, s, e, shell, relax):
    a = G.nodes[s]["coordinate_vars"]
    b = G.nodes[e]["coordinate_vars"]
    return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, 1, relax)]

def distance_shell(G, M, s, e, shell, relax):
    a = G.nodes[s]["coordinate_vars"]
    a_rel = G.nodes[s]["relations"]
    b = G.nodes[e]["coordinate_vars"]
    b_rel = G.nodes[e]["relations"]
    dist = a_rel.intersection(b_rel)
    # if no relationship constraint, bail
    if len(dist) == 0:
        return []
    else:
        # Find worst case distance requirement
        bound = min(d for _, _, d in dist) + 1
        log.debug("Cousins\t%s\t%s\t%d", s, e, bound)
        return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, bound, relax)]

def not_overlap(G, M, first, second, shell, relax):
    a = G.nodes[first]["coordinate_vars"]
    b = G.nodes[second]["coordinate_vars"]
    return [M.addCons(scip.quicksum(abs(x - y) for x, y in zip(a, b)) >= 1)]

def attach_to_side(G, M, side, node, shell, relax = False):
    a = G.nodes[side]["coordinates"]
    b = G.nodes[node]["coordinate_vars"]
    # Within +/- 1
    log.debug("Attaching %s to %s at %s", node, side, a)
    return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, 1, relax)]

def run_by_hemicube(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G, outfile, proximate_layer, distance_shell, in_shell, attach_to_side,width,height,depth)

def run_by_horizontal(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G, outfile, proximate_layer, distance_shell, in_horizontal, attach_to_side,width,height,depth)

def run_by_cube(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G, outfile, proximate_layer, distance_shell, in_shell, attach_to_side,width,height,depth)

def run_by_pillar(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G, outfile, proximate_layer, distance_shell, in_shell, attach_to_side,width,height,depth)

def run_by_flat(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G, outfile, proximate_layer, distance_shell, in_shell, attach_to_side,width,height,depth)

def run_by_vertical(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G, outfile, proximate_layer, distance_shell, in_shell, attach_to_side,width,height,depth)

def run_by_shell(G, outfile, proximate, distance, inside, attach, width = 40, height = 25, depth = 25):
    w, d, h = [(i-1)//2 for i in [width,height,depth]]
    shell, roots = setup(G)
    frontier = deque(roots)
    start_shell = shell
    relax = 0
    while frontier:
        relax, frontier = solve_shell(G, proximate, distance, inside, attach,
                                      frontier, shell, width, height, depth, start_shell, relax)
        render_scad(G, outfile)
        write_cache(G)
        shell += 1
    return G

def draw_channel(a, b, d):
    v = [i - j for i, j in zip(a, b)]
    length = sqrt(sum((i-j)**2 for i, j in zip(a, b)))
    bounds = d[0], d[1], length
    if length == 0.0:
        length += 0.000001
    angle = [0,180*acos(v[2]/length)/pi, 180*atan2(v[1], v[0])/pi]
    return solid2.translate(b)(solid2.rotate(angle)(solid2.cube(bounds)))

def write_cache(G):
    dump = {}
    for node in G:
        if "coordinates" in G.nodes[node] and all(i == 0 for i in G.nodes[node]["coordinates"]):
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
        if "coordinates" not in G.nodes[node]:
#            log.warning("Missing coordinates for node %s", node)
            continue

        dimensions = G.nodes[node].get("dimensions", [1, 1, 1])
        position = G.nodes[node]["coordinates"]
        s = solid2.translate(position)(solid2.cube(dimensions))
        if G.nodes[node].get("dummy", False):
            yield solid2.color("lightblue", alpha=0.1)(s)
        elif G.nodes[node].get("hyperedge", False):
            yield solid2.color("lightgreen", alpha=0.1)(s)
        else:
            yield s

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

def render_scad(G,outfile):
    edges = solid2.background()(solid2.cube([0,0,0]))
    for edge in scad_render_edges(G):
        edges += edge
    nodes = solid2.background()(solid2.cube([0,0,0]))
    for node in scad_render_nodes(G):
        nodes += node
    scad = solid2.translate([-0.5, -0.5, 0])(solid2.background()(solid2.union()(nodes)) + \
                                             solid2.union()(edges))
    scad.save_as_scad(outfile)

if __name__ == "__main__":
    log.info("**************** Starting ****************")
    import sys
    input_file, style, outfile = sys.argv[1:]
    # g = hypergraph_to_graph(read_yosys_json_hyper(input_file, "thing"))
    g = read_yosys_json(input_file,"thing")
    log.info("Loaded %s", g)
    # load_cache(G)
    # 1600/64 = 25, 2560/64 = 40
    width = 40
    height = 25
    depth = 25
    if style == "cube":
        g = run_by_cube(g, outfile, width=width, height=height, depth=depth)
    elif style == "vertical":
        g = run_by_vertical(g, outfile, width=width, height=height, depth=depth)
    elif style == "horizontal":
        g = run_by_horizontal(g, outfile, width=width, height=height, depth=depth)
    elif style == "hemicube":
        g = run_by_hemicube(g, outfile, width=width, height=height, depth=depth)
    elif style == "pillar":
        g = run_by_pillar(g, outfile, width=width, height=height, depth=depth)
    else:
        raise
    for x in g.nodes:
        log.debug("Final solution %s %s", x, g.nodes[x].get("coordinates", "none"))
    render_scad(g, outfile)
    write_cache(g)
    log.info("Done")
