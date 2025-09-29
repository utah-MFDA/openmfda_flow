import json
from math import sqrt, acos, atan2, pi, ceil
from collections import deque
import networkx as nx
import pyscipopt as scip
from networkx_helpers import *
import solid2
import logging
log = logging.getLogger(__name__)

logging.basicConfig(filename='3d_route.log', level=logging.DEBUG)

def is_dummy(G, node):
    return G.nodes[node]["cell"] == "$_dummy"

def is_flow(G, node):
    return is_net(G, node) and G.nodes[node]["type"] == "flow"

def is_control(G, node):
    return is_net(G, node) and G.nodes[node]["type"] == "ctrl"

def is_flush(G, node):
    return is_net(G, node) and G.nodes[node]["type"] == "flush"

def is_unknown(G, node):
    return is_net(G, node) and G.nodes[node]["type"] == "unknown"

def is_control_cell(G, n):
    return G.nodes[n]["cell"] == "ctrl_hole_0"

def is_flush_cell(G, n):
    return G.nodes[n]["cell"] == "flush_hole_0"

def is_pinhole(G, n):
    return G.nodes[n]["cell"] == "pinhole_320px_0"

def add_shell(G, starts):
    for start in starts:
        G.nodes[start]["shell"] = 0
    frontier = starts
    shell = 0
    while frontier:
        nexts = deque()
        log.info("Traversing %d nodes in shell %d", len(frontier), shell)
        for leaf in frontier:
            children = deque()
            for neighbor in G.adj[leaf]:
                if "shell" in G.nodes[neighbor]:
                    continue
                else:
                    G.nodes[neighbor]["shell"] = shell + 1
                    nexts.append(neighbor)
        frontier = nexts
        shell += 1
    # for node in G.nodes:
    #     G.nodes[node]["shell"] = shell - G.nodes[node]["shell"]
    #     log.debug("Node %d %s", G.nodes[node]["shell"], node)
    return shell

def add_buffers_output(G, depth):
    targets = [node for node in G.nodes
                if is_output_port(G, node) and is_flow(G, node)]
    for target in targets:
        shell = G.nodes[target]["shell"]
        if shell+1 == depth:
            continue
        for i in range(shell+1, depth):
            G.add_node(f"{target}__{i}", cell="$_dummy", shell=i)
        G.add_edge(target, f"{target}__{shell+1}", dummy=True)
        for i in range(shell+2, depth):
            G.add_edge(f"{target}__{i-1}", f"{target}__{i}", dummy=True)

def report_stats(G):
    num_port = sum(1 for i in G.nodes if is_port(G, i))
    num_input = sum(1 for i in G.nodes if is_input_port(G, i))
    num_output = sum(1 for i in G.nodes if is_output_port(G, i))
    num_inout = sum(1 for i in G.nodes if is_inout_port(G, i))
    num_wire = sum(1 for i in G.nodes if is_net(G, i))
    num_cells = len(G.nodes) - num_wire
    log.info("Starting with %d ports (%d input %d output %d inout) %d nets and %d cells", num_port, num_input, num_output, num_inout, num_wire, num_cells)

def find_center(G):
    report_stats(G)
    start = [n for n in G.nodes if is_input_port(G, n) and is_flow(G, n)]
    assert(len(start) > 0)
    # remove = [n for n in G if is_control(G, n) or is_flush(G, n) or is_flush_cell(G,n) or is_control_cell(G,n)]
    # G.remove_nodes_from(remove)
    shell = add_shell(G, start)
    render_dot(G, "shell.dot")
    add_buffers_output(G, shell)
    render_dot(G, "buffer.dot")

    unreachable = [_ for _, p in G.nodes.items() if "shell" not in p]
    if unreachable:
        for u in unreachable:
            log.error(u)
        log.error("Total %d Unreachable %d", len(G.nodes), len(unreachable))
        assert(len(unreachable) == 0)
    precalc_dist(G)
    return shell

def add_buffers(G, start, depth):
    shell = 0
    frontier = set(start)
    # frontier = [n for n in G.nodes if G.nodes[n]["shell"] == 0]
    while True:
        assert(shell <= depth+1)
        log.info("Shell buffer insertion %d for %d nodes", shell, len(frontier))
        if all(G.nodes[n]["cell"] == "$_dummy" for n in frontier):
            actual = set()
            for dummy in frontier:
                for adj in G.adj[dummy]:
                    # should always be size one
                    actual.add(adj)
            for dummy in frontier:
                G.remove_node(dummy)
            return shell - 1, actual
        nexts = set()
        for node in frontier:
            props = G.nodes[node]
            assert(shell == props["shell"])
            children = 0
            for adj in G.adj[node]:
                aprops = G.nodes[adj]
                if aprops["shell"] <= shell:
                    continue
                else:
                    nexts.add(adj)
                    children += 1
            if children == 0:
                dummy = f"{node}_"
                G.add_node(dummy, shell=shell+1, cell="$_dummy")
                G.add_edge(node, dummy, dummy=True)
                nexts.add(dummy)
        frontier = nexts
        shell += 1

def gather_children(G, n):
    props = G.nodes[n]
    # skip non fluid
    if "descendents" not in props:
        props["descendents"] = set()
        shell = props["shell"]
        children = 0
        for adj in G.adj[n]:
            adj_shell = G.nodes[adj]["shell"]
            if shell == adj_shell:
                raise
            elif shell < adj_shell and not is_control(G, adj) or is_flush(G, adj):
                children += 1
                props["descendents"] |= gather_children(G, adj)
            else:
                continue
        props["diverges"] = children > 1
    return props["descendents"] | set([n])

def precalc_dist(G):
    for node in G.nodes:
        gather_children(G, node)
    # This could probably be smaller by limiting to only diverging cases.
    # for node, props in G.nodes.items():
        # if not props["diverges"]:
            # del props["descendents"]

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

def in_cylinder(G, M, node, width, height, depth, shell, relax):
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
    # M.addCons(z == shell)
    return [i, j, k]

def bounded_descendent_horizontal(G, M, ancestor, frontier, shell, relax):
    if G.nodes[ancestor]["diverges"]:
        dist = abs(shell - G.nodes[ancestor]["shell"]) + 1
        group = G.nodes[ancestor]["descendents"].intersection(frontier)
        if len(group) > 1:
            log.debug("Adding bounds for %s at distance %d to %d children on layer %d", ancestor, dist, len(group), shell)
            Uz = M.addVar(f"{ancestor}_bound_z", vtype="I")
            Lz = M.addVar(f"{ancestor}_bound_z", vtype="I")
            M.addCons(Uz - Lz <= dist)
            Uy = M.addVar(f"{ancestor}_bound_y", vtype="I")
            Ly = M.addVar(f"{ancestor}_bound_y", vtype="I")
            M.addCons(Uy - Ly <= dist)
            for node in group:
                x, y, z = G.nodes[node]["coordinate_vars"]
                M.addCons(z <= Uz - 1)
                M.addCons(z >= Lz)
                M.addCons(y <= Uy - 1)
                M.addCons(y >= Ly)
    return []

def solve_shell(G, proximate, distance, inside, attach, frontier, shell, width, height, depth, start, relax = 0):
    M = scip.Model()
    M.setParam("limits/time", 120)
    # M.setParam("limits/solutions", 1)
    if relax:
        log.warning("Relaxing distance constraints by %d", relax)
    log.info("Solving shell %d, %d nodes", shell, len(frontier))
    minim = []

    for node in frontier:
        assert(shell == G.nodes[node]["shell"])
        add_position(G, M, node, width, height, depth)
        inside(G, M, node, width, height, depth, shell, relax)
        G.nodes[node]["visited"] = False
    for first in frontier:
        for second in frontier:
            if first < second:
                not_overlap(G, M, first, second, shell, relax)
                # minim += distance(G, M, first, second, shell, relax)
    fset = set(frontier)
    for ancestor in G.nodes:
        if G.nodes[ancestor]["shell"] <= shell:
            minim += distance(G, M, ancestor, fset, shell, relax)
    for node in frontier:
        for neighbor in G.adj[node]:
            n_shell = G.nodes[neighbor]["shell"]
            # next shell, add to next frontier
            if n_shell < shell:
                assert(n_shell == shell-1)
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
            props = G.nodes[node]
            props["coordinates"] = [M.getVal(i) for i in props["coordinate_vars"]]
            log.debug("Final coordinates: %s %s", node, props["coordinates"])
        return relax
    else:
        log.warning(f"Unable to find solution at {shell}")
        assert(relax < 1)
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

def proximate_layer_non_ctrl(G, M, s, e, shell, relax):
    # if G.nodes[s]["cell"] in {"$_ctrl_port", "$_flush_port"} or G.nodes[e]["cell"] in {"$_ctrl_port", "$_flush_port"}:
    #     return []
    # else:
    #     return proximate_layer(G, M, s, e, shell, relax)
    return []

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
        return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, bound, relax)]

def distance_shell_non_ctrl(G, M, s, e, shell, relax):
    if G.nodes[s]["cell"] in {"$_ctrl_port", "$_flush_port"} or G.nodes[e]["cell"] in {"$_ctrl_port", "$_flush_port"}:
        return []
    else:
        return distance_shell(G, M,s, e, shell, relax)

def not_overlap(G, M, first, second, shell, relax):
    a = G.nodes[first]["coordinate_vars"]
    b = G.nodes[second]["coordinate_vars"]
    return [M.addCons(scip.quicksum(abs(x - y) for x, y in zip(a, b)) >= 1)]

def attach_to_side(G, M, side, node, shell, relax = False):
    log.debug("Attaching %s to %s", node, side)
    a = G.nodes[side]["coordinates"]
    b = G.nodes[node]["coordinate_vars"]
    log.debug("Starting at %s", a)
    if is_control(G, node) or is_flush(G, node) or is_control(G, side) or is_flush(G, side):
        return []
    # Within +/- 1
    return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, 1, relax)]

def attach_to_side_non_ctrl(G, M, side, node, shell, relax = False):
    if G.nodes[node]["cell"] in {"$_ctrl_port", "$_flush_port"}:
        M.addCons(G.nodes[node]["coordinate_vars"][2] == 0)
        return []
    else:
        return attach_to_side(G, M, side, node, shell, relax)

def run_by_hemicube(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G, outfile, proximate_layer, distance_shell, in_shell, attach_to_side,width,height,depth)

def noop(G, M, neighbor, node, shell, relax):
    return []
def run_by_horizontal(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G,
                            outfile,
                            noop,
                            bounded_descendent_horizontal,
                            in_horizontal,
                            attach_to_side,
                            width,
                            height,
                            depth)

def run_by_cube(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G, outfile, proximate_layer, distance_shell, in_shell, attach_to_side,width,height,depth)

def run_by_cylinder(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G, outfile, proximate_layer, distance_shell, in_shell, attach_to_side,width,height,depth)

def run_by_flat(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G, outfile, proximate_layer, distance_shell, in_shell, attach_to_side,width,height,depth)

def run_by_vertical(G, outfile, width = 40, height = 25, depth = 25):
        return run_by_shell(G, outfile, proximate_layer, distance_shell, in_shell, attach_to_side,width,height,depth)

def run_by_shell(G, outfile, proximate, distance, inside, attach, width = 40, height = 25, depth = 25, start=None):
    shells = find_center(G)
    render_dot(G, "test.dot")
    # start_shell = start if start else ceil(len(roots)**(1/3))//2
    relax = 0
    for shell in range(shells-1, -1, -1):
        current = [node for node, d in G.nodes.items() if d["shell"] == shell]
        relax = solve_shell(G, proximate, distance, inside, attach,
                            current, shell, width, height, depth, shells, relax)
        render_scad(G, outfile)
        write_cache(G)
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

def scad_render_nodes(G,final):
    for node in G.nodes:
        if "coordinates" not in G.nodes[node]:
            if final:
               log.warning("Missing coordinates for node %s", node)
            continue

        dimensions = G.nodes[node].get("dimensions", [1, 1, 1])
        position = G.nodes[node]["coordinates"]
        s = solid2.translate(position)(solid2.cube(dimensions))
        if G.nodes[node]["cell"] == "$_dummy":
            yield solid2.color("lightblue", alpha=0.1)(s)
        elif G.nodes[node]["cell"] == "$_wire":
            yield solid2.color("lightgreen", alpha=0.1)(s)
        else:
            yield s

def scad_render_edges(G, final):
    for edge in G.edges:
        start, end = edge
        if "coordinates" not in G.nodes[end] or "coordinates" not in G.nodes[start]:
            if final:
                log.warning("Missing coordinates for edge from %s to %s", start, end)
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

def to_directed(G):
    H = nx.DiGraph()
    for node in G.nodes:
        H.add_node(node)
        if "shell" not in G.nodes[node]:
            log.warning("Missing shell %s", node)
            continue
        for edge in G.adj[node]:
            if "shell" not in G.nodes[edge]:
                log.warning("Missing shell %s", edge)
                continue
            if G.nodes[node]["shell"] < G.nodes[edge]["shell"]:
                H.add_edge(node, edge)
    return H
def render_dot(G, outfile):
    nx.nx_pydot.write_dot(to_directed(G), outfile)

def render_scad(G,outfile, final=False):
    edges = solid2.background()(solid2.cube([0,0,0]))
    for edge in scad_render_edges(G, final):
        edges += edge
    nodes = solid2.background()(solid2.cube([0,0,0]))
    for node in scad_render_nodes(G, final):
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
    elif style == "cylinder":
        g = run_by_cylinder(g, outfile, width=width, height=height, depth=depth)
    else:
        raise
    for x in g.nodes:
        log.debug("Final solution %s %s", x, g.nodes[x].get("coordinates", "none"))
    render_scad(g, outfile, final=True)
    write_cache(g)
    log.info("Done")
