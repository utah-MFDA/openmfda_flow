import json
from math import ceil, sqrt, acos, atan2, pi
from collections import deque
import networkx as nx
import pyscipopt as scip
from networkx_helpers import *
import solid2
import logging
log = logging.getLogger(__name__)

logging.basicConfig(filename='3d_route.log', level=logging.INFO)

def get_shell(G, node):
    return G.nodes[node]["shell"]

def set_shell(G, node, shell):
    G.nodes[node]["shell"] = shell

def is_peer(G, node, other):
    return get_shell(G, node) == get_shell(G, other)

# node is descendent of other
def is_descendent(G, node, other):
    return get_shell(G, other) > get_shell(G, node)

# node is ancestor of other
def is_ancestor(G, node, other):
    return get_shell(G, other) < get_shell(G, node)

def is_older(G, n, shell):
    return G.nodes[n]["shell"] > shell

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
    assert(len(starts) > 0)
    for start in starts:
        log.debug("Starting %s", start)

        G.nodes[start]["shell"] = 0
    frontier = starts
    shell = 0
    while frontier:
        nexts = deque()
        log.info("Traversing %d nodes in shell %d", len(frontier), shell)
        for leaf in frontier:
            for neighbor in G.adj[leaf]:
                if "shell" in G.nodes[neighbor]:
                    continue
                else:
                    log.debug("Found %s", neighbor)
                    G.nodes[neighbor]["shell"] = shell + 1
                    nexts.append(neighbor)
        frontier = nexts
        shell += 1
    for node in G.nodes:
        if "shell" not in G.nodes[node]:
            log.error("Shell missing %s", node)
    for node in G.nodes:
        assert("shell" in G.nodes[node])
        G.nodes[node]["shell"] = shell - G.nodes[node]["shell"] - 1
        log.debug("Node %d %s", G.nodes[node]["shell"], node)
    return shell

def add_buffers_output(G, depth, targets):
    for target in targets:
        shell = G.nodes[target]["shell"]
        if shell == 0:
            continue
        for i in range(0, shell):
            G.add_node(f"{target}__{i}", cell="$_dummy", shell=i)
        G.add_edge(target, f"{target}__{shell-1}", dummy=True)
        for i in range(0, shell-1):
            G.add_edge(f"{target}__{i}", f"{target}__{i+1}", dummy=True)

def report_stats(G):
    num_port = sum(1 for i in G.nodes if is_port(G, i))
    num_input = sum(1 for i in G.nodes if is_input_port(G, i))
    num_output = sum(1 for i in G.nodes if is_output_port(G, i))
    num_inout = sum(1 for i in G.nodes if is_inout_port(G, i))
    num_wire = sum(1 for i in G.nodes if is_net(G, i))
    num_cells = len(G.nodes) - num_wire
    log.info("Starting with %d ports (%d input %d output %d inout) %d nets and %d cells", num_port, num_input, num_output, num_inout, num_wire, num_cells)

def find_center(G, start):
    report_stats(G)
    assert(len(start) > 0)
    # remove = [n for n in G if is_control(G, n) or is_flush(G, n) or is_flush_cell(G,n) or is_control_cell(G,n)]
    # G.remove_nodes_from(remove)
    shell = add_shell(G, start)
    render_dot(G, "shell.dot")
    # add_buffers(G, start, shell)
    # targets = [node for node in G.nodes
    #         if not any(is_descendent(G, adj, node) for adj in G.adj[node])]
    #              # if is_output_port(G, node) and is_flow(G, node)]
    # add_buffers_output(G, shell, targets)
    # render_dot(G, "buffer.dot")

    unreachable = [_ for _, p in G.nodes.items() if "shell" not in p]
    if unreachable:
        for u in unreachable:
            log.error(u)
        log.error("Total %d Unreachable %d", len(G.nodes), len(unreachable))
        assert(len(unreachable) == 0)
    precalc_dist(G)
    return shell

def add_buffers(G, frontier, depth):
    shell = 0
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
                if is_descendent(G, adj, node):
                    nexts.add(adj)
                    children += 1
                else:
                    continue
            if children == 0:
                dummy = f"{node}_"
                G.add_node(dummy, shell=shell-1, cell="$_dummy")
                G.add_edge(node, dummy, dummy=True)
                nexts.add(dummy)
        frontier = nexts
        shell += 1

def gather_children(G, n):
    props = G.nodes[n]
    # skip non fluid
    if "descendents" not in props:
        desc = set()
        children = 0
        for adj in G.adj[n]:
            if is_peer(G, n, adj):
                raise
            elif is_descendent(G, adj, n):
                children += 1
                desc |= gather_children(G, adj)
            else:
                continue
        props["diverges"] = children > 1
        props["descendents"] = desc
        log.debug("Descendents %s: %s", n, ", ".join(desc))
    return props["descendents"] | set([n])

def gather_ancestors(G, n):
    props = G.nodes[n]
    # skip non fluid
    if "ancestors" not in props:
        desc = set()
        children = 0
        for adj in G.adj[n]:
            if is_peer(G, n, adj):
                raise
            elif is_ancestor(G, adj, n):
                children += 1
                desc |= gather_ancestors(G, adj)
            else:
                continue
        props["diverges_ancestor"] = children > 1
        props["ancestors"] = desc
        log.debug("ancestors %s: %s", n, ", ".join(desc))
    return props["ancestors"] | set([n])

def precalc_dist(G):
    for node in G.nodes:
        gather_children(G, node)
        gather_ancestors(G, node)
    # This could probably be smaller by limiting to only diverging cases.
    # for node, props in G.nodes.items():
        # if not props["diverges"]:
            # del props["descendents"]

def add_position(G, M, node, width, height, depth):
    x, y, z = [M.addVar(f"{node}_{i}", vtype="INTEGER", lb=lb, ub=ub)
               for i, (lb, ub)
               in [("x", width),
                   ("y", height),
                   ("z", depth)]]
    G.nodes[node]["coordinate_vars"] = (x, y, z)
    return x, y, z

def in_vertical(G, M, node, width, height, depth, shell, offset, relax):
    layer = shell+offset
    add_position(G, M, node,
                 (-width, width),
                 (-height, height),
                 (layer, layer))
def in_hemicube(G, M, node, width, height, depth, shell, offset, relax):
    layer = shell+offset
    add_position(G, M, node,
                 (-layer, layer),
                 (-layer, layer),
                 (0, shell))

def in_horizontal(G, M, node, width, height, depth, shell, offset, relax):
    y, z = [M.addVar(f"{node}_{i}", vtype="INTEGER", lb=lb, ub=ub)
               for i, (lb, ub)
               in [("y", (-height, height)),
                   ("z", (-depth, depth))]]
    G.nodes[node]["coordinate_vars"] = (y, z)

def in_cylinder(G, M, node, width, height, depth, shell, offset, relax):
    layer = shell+offset
    x, y, z = add_position(G, M, node,
                           (-layer, layer),
                           (-layer, layer),
                           (-depth, depth))
    i = M.addVar(f"shell_i_{node}", vtype="B")
    j = M.addVar(f"shell_j_{node}", vtype="B")
    M.addCons(i*(abs(x) - layer) == 0, name=f"shell_nx_{node}")
    M.addCons(j*(abs(y) - layer) == 0, name=f"shell_ny_{node}")
    M.addCons(i + j >= 1, name=f"shell_{node}")
    return []

def in_shell(G, M, node, width, height, depth, shell, offset, relax):
    layer = shell+offset
    x, y, z = add_position(G, M, node,
                           (-layer, layer),
                           (-layer, layer),
                           (-layer, layer))
    i = M.addVar(f"shell_i_{node}", vtype="B")
    j = M.addVar(f"shell_j_{node}", vtype="B")
    k = M.addVar(f"shell_k_{node}", vtype="B")
    M.addCons(i*(abs(x) - layer) == 0, name=f"shell_nx_{node}")
    M.addCons(j*(abs(y) - layer) == 0, name=f"shell_ny_{node}")
    M.addCons(k*(abs(z) - layer) == 0, name=f"shell_nz_{node}")
    M.addCons(i + j + k >= 1, name=f"shell_{node}")
    return []

def bounded_descendent_horizontal(G, M, ancestor, frontier, shell, offset, relax):
    # if G.nodes[ancestor]["diverges"]:
    ashell =  G.nodes[ancestor]["shell"]
    if ashell > shell:
        descendents = G.nodes[ancestor]["descendents"]
        dist = 2*abs(ashell - shell) + relax
        group = descendents.intersection(frontier)
        if dist <= 0:
            return []
        if len(group) == 1:
            log.info("Adding bounds for %s at distance %d to %d children on layer %d", ancestor, dist, len(group), shell)
            for node in group:
                ay, az = G.nodes[ancestor]["coordinate_vars"]
                y, z = G.nodes[node]["coordinate_vars"]
                M.addCons(abs(ay - y) <= dist)
                M.addCons(abs(az - z) <= dist)
        elif len(group) > 1:
            log.info("Adding bounds for %s at distance %d to %d children on layer %d", ancestor, dist, len(group), shell)
            Uz = M.addVar(f"{ancestor}_ubound_z", vtype="I")
            Lz = M.addVar(f"{ancestor}_lbound_z", vtype="I")
            M.addCons(Uz - Lz <= dist)
            Uy = M.addVar(f"{ancestor}_ubound_y", vtype="I")
            Ly = M.addVar(f"{ancestor}_lbound_y", vtype="I")
            M.addCons(Uy - Ly <= dist)
            for node in group:
                y, z = G.nodes[node]["coordinate_vars"]
                M.addCons(z <= Uz - 1)
                M.addCons(z >= Lz)
                M.addCons(y <= Uy - 1)
                M.addCons(y >= Ly)
    return []

def bounded_ancestor_horizontal(G, M, descendent, frontier, shell, offset, relax):
    ashell =  G.nodes[descendent]["shell"]
    # if G.nodes[descendent]["diverges_ancestor"]:
    if ashell < shell:
        dist = 2*abs(ashell - shell) + relax
        ancestors = G.nodes[descendent]["ancestors"]
        group = ancestors.intersection(frontier)
        if dist <= 0:
            return []
        if len(group) == 1:
            log.info("Adding bounds for %s at distance %d to %d children on layer %d", descendent, dist, len(group), shell)
            for node in group:
                ay, az = G.nodes[descendent]["coordinate_vars"]
                y, z = G.nodes[node]["coordinate_vars"]
                M.addCons(abs(ay - y) <= dist)
                M.addCons(abs(az - z) <= dist)
        elif len(group) > 1:
            log.info("Adding bounds for %s at distance %d to %d children on layer %d", descendent, dist, len(group), shell)
            Uz = M.addVar(f"{descendent}_anc_ubound_z", vtype="I")
            Lz = M.addVar(f"{descendent}_anc_lbound_z", vtype="I")
            M.addCons(Uz - Lz <= dist)
            Uy = M.addVar(f"{descendent}_anc_ubound_y", vtype="I")
            Ly = M.addVar(f"{descendent}_anc_lbound_y", vtype="I")
            M.addCons(Uy - Ly <= dist)
            for node in group:
                y, z = G.nodes[node]["coordinate_vars"]
                M.addCons(z <= Uz - 1)
                M.addCons(z >= Lz)
                M.addCons(y <= Uy - 1)
                M.addCons(y >= Ly)
    return []

def bounded_descendent(G, M, ancestor, frontier, shell, offset, relax):
    if G.nodes[ancestor]["diverges"]:
        dist = 2*abs(G.nodes[ancestor]["shell"] - shell) + relax
        assert(dist > 0)
        group = G.nodes[ancestor]["descendents"].intersection(frontier)
        if len(group) > 1:
            log.debug("Adding bounds for %s at distance %d to %d children on layer %d", ancestor, dist, len(group), shell)

            Uz = M.addVar(f"{ancestor}_ubound_z", vtype="I")
            Lz = M.addVar(f"{ancestor}_lbound_z", vtype="I")
            M.addCons(Uz - Lz <= dist)
            Ux = M.addVar(f"{ancestor}_ubound_x", vtype="I")
            Lx = M.addVar(f"{ancestor}_lbound_x", vtype="I")
            M.addCons(Ux - Lx <= dist)
            Uy = M.addVar(f"{ancestor}_ubound_y", vtype="I")
            Ly = M.addVar(f"{ancestor}_lbound_y", vtype="I")
            M.addCons(Uy - Ly <= dist)
            for node in group:
                x, y, z = G.nodes[node]["coordinate_vars"]
                M.addCons(z <= Uz - 1)
                M.addCons(z >= Lz)
                M.addCons(x <= Ux - 1)
                M.addCons(x >= Lx)
                M.addCons(y <= Uy - 1)
                M.addCons(y >= Ly)
    return []

def solve_everything(G, width, height, depth, relax):
    if relax:
        log.warning("Relaxing distance constraints by %d", relax)
    start = [n for n in G.nodes if (is_input_port(G, n) or is_output_port(G, n)) and is_flow(G, n)]
    shells = find_center(G, start)
    M = scip.Model()
    # M.setParam("limits/time", 60)
    M.setParam("limits/solutions", 1)
    for node, details in G.nodes.items():
        in_horizontal(G, M, node, width, height, depth, details["shell"], 0, 0)
    minim = []
    nodeset = [{n for n,d in G.nodes.items() if d["shell"] == i} for i in range(0, shells)]
    for first in G.nodes:
        fshell = G.nodes[first]["shell"]
        for second in G.nodes:
            sshell = G.nodes[second]["shell"]
            if first < second and fshell == sshell:
                minim += not_overlap(G, M, first, second, fshell, offset, relax)
        for shell in range(0, shells):
            minim += bounded_descendent_horizontal(G, M, first, nodeset[shell], shell, 0, relax)
            minim += bounded_ancestor_horizontal(G, M, first, nodeset[shell], shell, 0, relax)

    if minim:
        log.info("Running with minimization")
        M.setObjective(scip.quicksum(minim), sense="minimize")
    log.info("Presolving with %d variables and %d constraints", M.getNVars(), M.getNConss())
    M.presolve()
    log.info("Starting optimizations with %d variables and %d constraints", M.getNVars(), M.getNConss())
    M.optimize()
    log.info("Finished optimizing, %d solutions found", M.getNSols())

    # log.debug("Minim vars: %s", [M.getVal(i) for i in minim])
    if M.getNSols() == 0:
        raise
    for node, props in G.nodes.items():
        props["coordinates"] = [props["shell"]]+[M.getVal(i) for i in props["coordinate_vars"]]
        # log.debug("Final coordinates: %s %s", node, props["coordinates"])
    return G

def solve_shell(G, proximate, distance, inside, attach, ahead, frontier,
                shell, width, height, depth, offset, max_shell, relax = 0, limit=4):
    M = scip.Model()
    # M.setParam("limits/tim wwe", 60)
    M.setParam("limits/solutions", 1)
    if relax:
        log.warning("Relaxing distance constraints by %d", relax)
    log.info("Solving shell %d, %d nodes", shell, len(frontier))
    minim = []

    for node in frontier:
        assert(shell == G.nodes[node]["shell"])
        inside(G, M, node, width, height, depth, shell, offset, relax)
    for first in frontier:
        for second in frontier:
            if first < second:
                not_overlap(G, M, first, second, shell, offset, relax)
    for ancestor in G.nodes:
        if is_older(G, ancestor, shell):
            minim += distance(G, M, ancestor, frontier, shell, offset, relax)
    for node in frontier:
        for neighbor in G.adj[node]:
            # next shell, add to next frontier
            if is_ancestor(G, neighbor, node):
                # assert(n_shell == shell-1)
                minim += ahead(G, M, neighbor, node, shell, offset, relax)
            elif is_peer(G, neighbor, node):
                minim += proximate(G, M, neighbor, node, shell, offset, relax)
            elif is_descendent(G, neighbor, node):
                # Previous shell, setup direct proximity from position
                minim += attach(G, M, neighbor, node, shell, offset, relax)
            else:
                raise
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
        assert(relax < 2*(shell+offset))
        return solve_shell(G, proximate, distance, inside, attach, ahead, frontier,
                            shell, width, height, depth, offset, max_shell, relax+1)

def within_distance(G, M, a, b, d, relax):
    # X = 0 if not relax else M.addVar(vtype="I", lb=0, ub=relax)
    X = relax
    M.addCons(abs(a - b) <= d + X)
    # if relax:
        # return [X]
    # else:
    return []

def proximate_layer(G, M, s, e, shell, offset, relax):
    a = G.nodes[s]["coordinate_vars"]
    b = G.nodes[e]["coordinate_vars"]
    return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, 1, relax)]

def distance_shell(G, M, s, e, shell, offset, relax):
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

def not_overlap(G, M, first, second, shell, offset, relax):
    a = G.nodes[first]["coordinate_vars"]
    b = G.nodes[second]["coordinate_vars"]
    M.addCons(scip.quicksum(abs(x - y) for x, y in zip(a, b)) >= 1)
    return []

def attach_to_side(G, M, side, node, shell, offset, relax):
    log.debug("Attaching %s to %s", node, side)
    a = G.nodes[side]["coordinates"]
    b = G.nodes[node]["coordinate_vars"]
    log.debug("Starting at %s", a)
    # if is_control(G, node) or is_flush(G, node):# or is_control(G, side) or is_flush(G, side):
        # M.addCons(a[2] == 0)
        # return []
    # Within +/- 1
    return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, 1, relax)]

def noop(G, M, neighbor, node, shell, offset, relax):
    return []

def run_by_hemicube(G, outfile, width = 40, height = 25, depth = 25, offset = None):
    return run_by_shell(G, outfile,
                        noop,
                        bounded_descendent,
                        in_hemicube,
                        attach_to_side,
                        noop,
                        width,
                        height,
                        depth, offset)

def run_by_horizontal(G, outfile, width = 40, height = 25, depth = 25, offset = None):
    # return run_by_shell(G, outfile,
    #                     noop,
    #                     bounded_descendent_horizontal,
    #                     in_horizontal,
    #                     attach_to_side,
    #                     noop,
    #                     width,
    #                     height,
    #                     depth, offset)
    relax = 0
    while relax < height:
        try:
            return solve_everything(G, width, height, depth, relax)
        except:
            relax += 1
            log.warning("Relaxing %s", relax)
    raise

def run_by_cube(G, outfile, width = 40, height = 25, depth = 25, offset = None):
    return run_by_shell(G, outfile,
                        noop,
                        bounded_descendent,
                        in_shell,
                        attach_to_side,
                        noop,
                        width,
                        height,
                        depth, offset)

def run_by_cylinder(G, outfile, width = 40, height = 25, depth = 25, offset = None):
    return run_by_shell(G, outfile,
                        noop,
                        bounded_descendent,
                        in_cylinder,
                        attach_to_side,
                        noop,
                        width,
                        height,
                        depth, offset)

def run_by_vertical(G, outfile, width = 40, height = 25, depth = 25, offset = None):
    return run_by_shell(G, outfile,
                        noop,
                        bounded_descendent_horizontal,
                        in_vertical,
                        attach_to_side,
                        noop,
                        width,
                        height,
                        depth, offset)

def run_by_shell(G, outfile, proximate, distance, inside, attach, ahead, width = 40, height = 25, depth = 25, offset=None):
    render_dot_undir(G, "raw.dot")
    start = [n for n in G.nodes if (is_input_port(G, n) or is_output_port(G, n)) and is_flow(G, n)]
    shells = find_center(G, start)
    render_dot(G, "test.dot")
    if offset is None:
        offset = ceil(len(start)**(1/3))//2
    relax = 0
    for shell in range(0, shells):
        current = {node for node, d in G.nodes.items() if d["shell"] == shell}
        relax = solve_shell(G, proximate, distance, inside, attach, ahead, current,
                            shell, width, height, depth, offset, shells, relax)
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
            if is_descendent(G, edge, node):
                H.add_edge(node, edge)
    return H
def render_dot(G, outfile):
    nx.nx_pydot.write_dot(to_directed(G), outfile)
def render_dot_undir(G, outfile):
    nx.nx_pydot.write_dot(G, outfile)
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
    input_file, style, outfile, offset = sys.argv[1:]
    # g = hypergraph_to_graph(read_yosys_json_hyper(input_file, "thing"))
    g = read_yosys_json(input_file,"thing")
    log.info("Loaded %s", g)
    # load_cache(G)
    # 1600/64 = 25, 2560/64 = 40
    width = 40
    height = 25
    depth = 25
    offset = int(offset)
    if style == "cube":
        g = run_by_cube(g, outfile, width=width, height=height, depth=depth, offset=offset)
    elif style == "vertical":
        g = run_by_vertical(g, outfile, width=width, height=height, depth=depth, offset=offset)
    elif style == "horizontal":
        g = run_by_horizontal(g, outfile, width=width, height=height, depth=depth, offset=offset)
    elif style == "hemicube":
        g = run_by_hemicube(g, outfile, width=width, height=height, depth=depth, offset=offset)
    elif style == "cylinder":
        g = run_by_cylinder(g, outfile, width=width, height=height, depth=depth, offset=offset)
    else:
        raise
    for x in g.nodes:
        log.debug("Final solution %s %s", x, g.nodes[x].get("coordinates", "none"))
    render_scad(g, outfile, final=True)
    write_cache(g)
    log.info("Done")
