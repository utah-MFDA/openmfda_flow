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

log = logging.getLogger(__name__)

################ Node type helpers ################
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

##################### Setup #####################
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
        G.add_edge(target, f"{target}__{shell-1}", dummy=True, hyperedge=False, bit=-1)
        for i in range(0, shell-1):
            G.add_edge(f"{target}__{i}", f"{target}__{i+1}", dummy=True, hyperedge=False, bit=-1)

def report_stats(G):
    num_port = sum(1 for i in G.nodes if is_port(G, i))
    num_input = sum(1 for i in G.nodes if is_input_port(G, i))
    num_output = sum(1 for i in G.nodes if is_output_port(G, i))
    num_inout = sum(1 for i in G.nodes if is_inout_port(G, i))
    num_wire = sum(1 for i in G.nodes if is_net(G, i))
    num_cells = len(G.nodes) - num_wire
    log.info("Starting with %d ports (%d input %d output %d inout) %d nets and %d cells", num_port, num_input, num_output, num_inout, num_wire, num_cells)

def find_center(G, start_condition, buffer_condition):
    report_stats(G)
    # remove = [n for n in G if is_control(G, n) or is_flush(G, n) or is_flush_cell(G,n) or is_control_cell(G,n)]
    # G.remove_nodes_from(remove)
    start = {node for node in G.nodes if start_condition(G, node)}
    assert(len(start) > 0)
    shell = add_shell(G, start)
    render_dot(G, "shell.dot")
    targets = {node for node in G.nodes if buffer_condition(G, node)}
    add_buffers_output(G, shell, targets)
    render_dot(G, "buffer.dot")

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
            if is_descendent(G, adj, n):
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
            if is_ancestor(G, adj, n):
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

################# Constraints ##################
def add_position(G, M, node, width, height, depth):
    coord = [M.addVar(f"{node}_{i}", vtype="INTEGER", lb=lb, ub=ub)
               for i, (lb, ub)
               in [("x", width),
                   ("y", height),
                   ("z", depth)]]
    G.nodes[node]["coordinates"] = coord
    return coord

def hemicube_bound(width, height, depth, shell, offset):
    layer = shell+offset
    return [(-layer, layer), (-layer, layer), (0, shell)]

def in_hemicube(G, M, node, width, height, depth, shell, offset, relax, minimize):
    layer = shell+offset
    add_position(G, M, node,
                 (-layer, layer),
                 (-layer, layer),
                 (0, layer))
    return []

def horizontal_bound(width, height, depth, shell, offset):
    return [(-height, height), (-depth, depth)]

def in_horizontal(G, M, node, width, height, depth, shell, offset, relax, minimize):
    coord = [M.addVar(f"{node}_{i}", vtype="INTEGER", lb=lb, ub=ub)
             for i, (lb, ub)
             in [("y", (-height, height)),
                  ("z", (-depth, depth))]]
    G.nodes[node]["coordinates"] = coord
    return []

def cylinder_bound(width, height, depth, shell, offset):
    layer = shell+offset
    return [ (-layer, layer),
               (-layer, layer),
               (-depth, depth)]

def in_cylinder(G, M, node, width, height, depth, shell, offset, relax, minimize):
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

def in_hex(G, M, coord):
    return all(i % 2 == 0 for i in coord) or all(i % 2 == 1 for i in coord)

def hex_neighbor_z(G, M, node, neighbor, shell, offset, relax, minimize):
    ax, ay, az = G.nodes[node]["coordinates"]
    bx, by, bz = G.nodes[neighbor]["coordinates"]

    i = M.addVar(f"hex_i_{node}", vtype="B")
    j = M.addVar(f"hex_j_{node}", vtype="B")
    k = M.addVar(f"hex_k_{node}", vtype="B")
    dx = bz - ax
    dy = bx - ay
    dz = by - az
    M.addCons(i*dx == 0)
    M.addCons(j*(dx-1) + j*(dz) + j*(dy - 1)*(dy + 1) == 0)
    M.addCons(k*(dx+1) + k*(dy) + j*(dz - 1)*(dz + 1) == 0)
    M.addCons(i + j  + k >= 1, name=f"shell_{node}")
    return []


def hex_neighbor_x2(G, M, node, neighbor, shell, offset, relax, minimize):
    ax, ay, az = G.nodes[node]["coordinates"]
    bx, by, bz = G.nodes[neighbor]["coordinates"]

    i = M.addVar(f"hex_i_{node}", vtype="B")
    j = M.addVar(f"hex_j_{node}", vtype="B")
    k = M.addVar(f"hex_k_{node}", vtype="B")
    l = M.addVar(f"hex_l_{node}", vtype="B")
    dx = by - az
    dy = bz - ax
    dz = bx - ay
    M.addCons(i*(dx+1) + i*(abs(dy)-1) == 0)
    M.addCons(j*dx + j*(dy-1) == 0)
    M.addCons(k*(dx - 1) + j*(abs(dz)-1) == 0)
    M.addCons(l*(dx + 1) + j*dz == 0)
    M.addCons(i+j+k+l == 0)
    return []

def hex_neighbor_x(G, M, node, neighbor, shell, offset, relax, minimize):
    if relax:
        return attach_to_side(G, M, node, neighbor, shell, offset, relax, minimize)
    ax, ay, az = G.nodes[node]["coordinates"]
    bx, by, bz = G.nodes[neighbor]["coordinates"]

    i = M.addVar(f"hex_i_{node}", vtype="B")
    j = M.addVar(f"hex_j_{node}", vtype="B")
    k = M.addVar(f"hex_k_{node}", vtype="B")
    dx = bz - ax
    dy = bx - ay
    dz = by - az
    M.addCons(i*dz == 0)
    M.addCons(j*dy + j*dx + j*(dz-1) == 0)
    M.addCons(abs(dx) + abs(dy) >= 0)
    M.addCons(i + j >= 1)
    return []

def shell_bound(width, height, depth, shell, offset):
    layer = shell+offset
    return [ (-layer, layer),
               (-layer, layer),
               (-layer, layer)]
def in_shell(G, M, node, width, height, depth, shell, offset, relax, minimize):
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

def bounded_dimension(G, M, direction, orientation, relative, frontier, bounding, shell, offset, relax, minimize):
    ashell =  G.nodes[relative]["shell"]
    if direction(ashell, shell) and abs(ashell - shell) > 1:
        relations = G.nodes[relative][orientation]
        dist = 2*(abs(ashell - shell))
        group = relations.intersection(frontier)
        minim = []
        if len(group) > 1:
            log.debug("Adding bounds for %s %s at distance %d to %d children on layer %d", orientation, relative, dist, len(group), shell)
            for first in group:
                fd = G.nodes[first]["coordinates"]
                for second in group:
                    if first < second:
                        sd = G.nodes[second]["coordinates"]
                        for a, b in zip(fd, sd):
                            minim += within_distance(G, M, a, b, dist, relax, minimize)
        return minim
    return []

def bounded_peer(G, M, orientation, relative, frontier, bounding, shell, offset, relax, minimize):
    ashell =  G.nodes[relative]["shell"]
    if ashell == shell:
        minim = []
        for adj in G.adj[relative]:
            if relative < adj and is_peer(G, adj, relative):
                left = G.nodes[relative][orientation]
                right = G.nodes[adj][orientation]
                group = left.union(right).intersection(frontier)
                dist = 2*(abs(ashell - shell)+1)
                if len(group) > 1:
                    log.debug("Adding bounds for peers %s %s at distance %d to %d children on layer %d", relative, adj, dist, len(group), shell)
                    for first in group:
                        fd = G.nodes[first]["coordinates"]
                        for second in group:
                            if first < second:
                                sd = G.nodes[second]["coordinates"]
                                for a, b in zip(fd, sd):
                                    minim += within_distance(G, M, a, b, dist, relax, minimize)
        return minim
    return []

def bounded_descendent(G, M, ancestor, frontier, bounding, shell, offset, relax, minimize):
    return bounded_dimension(G, M, lambda x,y: x > y, "descendents", ancestor, frontier, bounding, shell, offset, relax, minimize)

def bounded_ancestor(G, M, descendent, frontier, bounding, shell, offset, relax, minimize):
    return bounded_dimension(G, M, lambda x,y: x < y, "ancestors", descendent, frontier, bounding, shell, offset, relax, minimize)

def bounded(G, M, relative, frontier, bounding, shell, offset, relax, minimize):
    return bounded_descendent(G, M, relative, frontier, bounding, shell, offset, relax, minimize) + \
        bounded_ancestor(G, M, relative, frontier, bounding, shell, offset, relax, minimize)\
        # bounded_peer(G, M, "descendents", relative, frontier, bounding, shell, offset, relax, minimize) + \
        # bounded_peer(G, M, "ancestors", relative, frontier, bounding, shell, offset, relax, minimize)

def within_distance(G, M, a, b, d, relax, minimize):
    minim = []
    if relax and minimize:
        X = M.addVar(f"{a}_{b}_relax", vtype="I", lb=0, ub=relax)
        minim.append(X)
    else:
        X = relax
    M.addCons(abs(a-b) <= d + X)
    return minim

def proximate_layer(G, M, s, e, shell, offset, relax, minimize):
    a = G.nodes[s]["coordinates"]
    b = G.nodes[e]["coordinates"]
    return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, 1, relax, minimize)]

def distance_shell(G, M, s, e, shell, offset, relax, minimize):
    a = G.nodes[s]["coordinates"]
    a_rel = G.nodes[s]["relations"]
    b = G.nodes[e]["coordinates"]
    b_rel = G.nodes[e]["relations"]
    dist = a_rel.intersection(b_rel)
    # if no relationship constraint, bail
    if len(dist) == 0:
        return []
    else:
        # Find worst case distance requirement
        bound = min(d for _, _, d in dist) + 1
        return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, bound, relax, minimize)]

def max_distance(G, M, first, second, shell, offset, relax):
    a = G.nodes[first]["coordinates"]
    b = G.nodes[second]["coordinates"]
    X = M.addVar(vtype="I", lb=1)
    M.addCons(scip.quicksum(abs(x - y) for x, y in zip(a, b)) >= X)
    return [X]

def not_overlap(G, M, first, second, shell, offset, relax, minimize):
    a = G.nodes[first]["coordinates"]
    b = G.nodes[second]["coordinates"]
    M.addCons(scip.quicksum(abs(x - y) for x, y in zip(a, b)) >= 1)
    return []

def attach_to_side(G, M, side, node, shell, offset, relax, minimize):
    if "coordinates" not in G.nodes[side]:
        return []
    a = G.nodes[side]["coordinates"]
    b = G.nodes[node]["coordinates"]
    log.debug("Attaching %s to %s starting at %s", node, side, a)
    # if is_control(G, node) or is_flush(G, node):# or is_control(G, side) or is_flush(G, side):
        # M.addCons(a[2] == 0)
        # return []
    # Within +/- 1
    return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, 1, relax, minimize)]

def noop(G, M, neighbor, node, shell, offset, relax, minimize):
    return []

################### Runnning ###################
def run_by_dimension(G, skip, outfile, cache, start_condition, buffer_condition,
                 overlap, inside, distance, proximate, ahead, attach,
                 bounding, width = 40, height = 25, depth = 25,
                 offset=0, limit=10, timeout=60, minimize=False):
    render_dot_undir(G, "raw.dot")
    shells = find_center(G, start_condition, buffer_condition)
    if cache:
        try:
            start_shell = read_cache(G, cache)
            log.info("Loaded cache, starting at %d", start_shell)
        except FileNotFoundError:
            start_shell = 0
    else:
        start_shell = 0
    for shell in range(start_shell, shells):
        relax = 0
        current = {node for node, d in G.nodes.items() if d["shell"] == shell}
        bounds = bounding(width, height, depth, shell, offset)
        flat = [i for j in bounds for i in j]
        log.info("Bounded " + "(%d, %d) "*len(bounds), *flat)
        while True:
            success = solve_shell(G, skip, overlap, inside, distance, proximate, ahead, attach,
                                 current, shell, width, height, depth, bounds, offset, shells, relax, limit, timeout, minimize)
            if success:
                break
            if relax > limit:
                raise
            relax += 1
        render_scad(G, outfile, shells, colorful)
        if cache:
            write_cache(G, cache)
    return shells

def run_backwards(G, skip, outfile, cache, start_condition, buffer_condition,
                 overlap, inside, distance, proximate, ahead, attach,
                 bounding, width = 40, height = 25, depth = 25,
                 offset=0, limit=10, timeout=60, minimize=False):
    render_dot_undir(G, "raw.dot")
    shells = find_center(G, start_condition, buffer_condition)
    if cache:
        try:
            start_shell = read_cache(G, cache)
            log.info("Loaded cache, starting at %d", start_shell)
        except FileNotFoundError:
            start_shell = 0
    else:
        start_shell = 0
    working = start_shell
    reversed = False
    relax = 0
    highwater = 0
    borked = 0
    while working < shells:
        if reversed:
            direction = range(working, -1, -1)
        else:
            direction = range(working, shells)
        for shell in direction:
            latest = {node for node, d in G.nodes.items() if d["shell"] == shell}
            bounds = bounding(width, height, depth, shell, offset)
            flat = [i for j in bounds for i in j]
            log.info("Bounded " + "(%d, %d) "*len(bounds), *flat)
            if not reversed:
                a, b = ahead, attach
            else:
                b, a= ahead, attach
            success = solve_shell(G, skip, overlap, inside, distance, proximate, a, b,
                                     latest, shell, width, height, depth, bounds, offset, shells, relax, limit, timeout, minimize)
            if success:
                if not reversed or (working == shell and reversed):
                    working = shell + 1
                if reversed and shell == 0:
                    reversed = False
                    relax = 0
            else:
                borked += 1
                if borked > limit:
                    raise
                if reversed:
                    working += 1
                    relax += 1
                else:
                    working = shell
                    relax += 1
                    if relax > highwater:
                        reversed = True
                highwater = max(highwater, relax)
                break
        render_scad(G, outfile, shells, colorful)
        if cache:
            write_cache(G, cache)
    return shells

def solve_shell(G, skip, overlap, inside, distance, proximate, ahead, attach,
                frontier, shell, width, height, depth, bounding, offset, max_shell,
                relax = 0, limit=4, timeout=30, minimize=False):
    M = scip.Model()
    M.setParam("limits/time", timeout)
#     M.setParam("limits/solutions", 1)
    minim = add_constraints(G, M, skip, overlap, inside, distance, proximate, ahead, attach,
                frontier, shell, width, height, depth, bounding, offset, max_shell,
                relax = relax, limit=limit, timeout=timeout, minimize=minimize)

    # solve and extract position values
    if minim:
        M.setObjective(scip.quicksum(minim), sense="minimize")
    log.info("Presolving with %d variables and %d constraints", M.getNVars(), M.getNConss())
    M.presolve()
    log.info("Starting optimizations with %d variables and %d constraints", M.getNVars(), M.getNConss())
    M.optimize()

    if M.getNSols() == 0:
        log.warn("Finished optimizing, no solutions found")
        for node in frontier:
            props = G.nodes[node]
            del props["coordinates"]
        del M
        return False

    log.info("Finished optimizing, %d solutions found", M.getNSols())
    for node in frontier:
        props = G.nodes[node]
        props["coordinates"] = [int(M.getVal(i)) for i in props["coordinates"]]
        # log.debug("Final coordinates: %s %s", node, props["coordinates"])
    del M
    return True
def add_constraints(G, M, skip, overlap, inside, distance, proximate, ahead, attach,
                frontier, shell, width, height, depth, bounding, offset, max_shell,
                relax = 0, limit=4, timeout=30, minimize=False):
    if relax:
        log.warning("Relaxing distance constraints by %d", relax)
    log.warning("Solving shell %d, %d nodes", shell, len(frontier))
    minim = []
    # frontier = {node for node in frontier if not skip(G, node)}

    for node in frontier:
        assert(shell == G.nodes[node]["shell"])
        inside(G, M, node, width, height, depth, shell, offset, relax, minimize)
    for first in frontier:
        for second in frontier:
            if first < second:
                not_overlap(G, M, first, second, shell, offset, relax, minimize)
    for ancestor in G.nodes:
        if skip(G, ancestor):
            continue
        minim += distance(G, M, ancestor, frontier, bounding, shell, offset, relax, minimize)
    for node in frontier:

        if skip(G, node):
            continue
        for neighbor in G.adj[node]:
            if skip(G, neighbor):
                continue
            # next shell, add to next frontier
            if is_ancestor(G, neighbor, node):
                # assert(n_shell == shell-1)
                minim += ahead(G, M, neighbor, node, shell, offset, relax, minimize)
            elif is_peer(G, neighbor, node):
                minim += proximate(G, M, neighbor, node, shell, offset, relax, minimize)
            elif is_descendent(G, neighbor, node):
                # Previous shell, setup direct proximity from position
                minim += attach(G, M, neighbor, node, shell, offset, relax, minimize)
            else:
                raise
    return minim

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
def colorful(G, node):
    if is_dummy(G, node):
        return "lightblue"
    elif is_net(G, node):
        if is_flow(G, node):
            return "pink"
        elif is_control(G, node):
            return "orange"
        elif is_flush(G, node):
            return "yellow"
        else:
            return "lightgreen"
    else:
        if is_flush_cell(G, node):
            return "lightgreen"
        elif is_control_cell(G, node):
            return "green"
        elif is_port(G, node):
            return "red"
        else:
            return "black"
########## Cache #################
def read_cache(g, filename):
    data = pd.read_csv(filename, index_col="node")
    for node, props in data.iterrows():
        g.nodes[node]["coordinates"] = (int(props["x"]), int(props["y"]), int(props["z"]))
        g.nodes[node]["shell"] = int(props["shell"])
    return int(data["shell"].max() + 1)

def extract_coord(coordinates, shell):
    if len(coordinates) == 2:
        y, z = coordinates
        return [shell, y, z]
    else:
        return coordinates

def write_cache(g, filename):
    # I love how pandas is the defacto csv reader
    data = ((node, *extract_coord(props["coordinates"], props["shell"]), props["shell"])
            for node, props in g.nodes.items() if "coordinates" in props)
    node, x, y, z, shell = zip(*data)

    df = pd.DataFrame({"node": node, "x": x, "y": y, "z": z, "shell": shell})
    df.to_csv(filename)

################# Main #########################

if __name__ == "__main__":
    log.info("**************** Starting ****************")
    import sys
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("input_file")
    parser.add_argument("-o", "--output", required=True)
    parser.add_argument("--add_buffers", action="store_true", default=False)
    parser.add_argument("--flow_only", action="store_true", default=False)
    parser.add_argument("--offset", default=0, type=int)
    parser.add_argument("--orientation",
                        choices=["cube", "horizontal", "hemicube", "cylinder"],
                        default="horizontal")
    parser.add_argument("-r", "--relax", default=8, type=int)
    parser.add_argument("--timeout", default=30, type=int)
    # 1600/64 = 25, 2560/64 = 40
    parser.add_argument("--width", default=40, type=int)
    parser.add_argument("--height", default=25, type=int)
    parser.add_argument("--depth", default=25, type=int)
    parser.add_argument("--top", default="thing")
    parser.add_argument("--log", default="INFO")
    parser.add_argument("--collapse_hyperedge", default=False, action="store_true")
    parser.add_argument("--minimize", default=False, action="store_true")
    parser.add_argument("--backtrack", default=False, action="store_true")
    parser.add_argument("--cache")
    parser.add_argument("--everything", default=False, action="store_true")
    parser.add_argument("--logfile", default="3d_route.log")

    args = parser.parse_args()
    logging.basicConfig(filename=args.logfile, level=args.log)

    g = read_yosys_json(args.input_file,args.top)
    if args.collapse_hyperedge:
        g = collapse_edges(g)
    log.info("Loaded %s", g)

    bound = bounded
    start = lambda G, n: (is_input_port(G, n) or is_output_port(G, n)) and is_flow(G, n)
    buffer = lambda G, n: False
    if args.add_buffers:
        buffer = lambda G, node: not any(is_descendent(G, adj, node) for adj in G.adj[node])

    if args.orientation == "cube":
        orientation = in_shell
        shell_bound = shell_bound
    elif args.orientation == "horizontal":
        orientation = in_horizontal
        # bound = bounded_horizontal
        shell_bound = horizontal_bound
        start = lambda G, n: is_input_port(G, n) and is_flow(G, n)
        if args.add_buffers:
            buffer = lambda G, n: is_output_port(G, n) and is_flow(G, n)
    elif args.orientation == "hemicube":
        orientation = in_hemicube
        shell_bound = hemicube_bound
    elif args.orientation == "cylinder":
        orientation = in_cylinder
        shell_bound = cylinder_bound
    else:
        raise
    if args.flow_only:
        skip = lambda G, n: is_control_cell(G,n) or is_flush_cell(G,n) or is_control(G, n) or is_flush(G, n)
        # skip = lambda G, n: (is_input_port(G, n) or is_output_port(G, n)) and not is_flow(G, n)
        # skip = lambda G, node: is_control(G, node) or is_flush(G, node)
    else:
        skip = lambda G, node: False
    if args.backtrack:
        runner = run_backwards
    else:
        runner = run_by_dimension
    shells = runner(g, skip, args.output, args.cache, start, buffer,
                                 not_overlap, orientation, bound, attach_to_side, noop, attach_to_side,
                                 shell_bound,
                                 args.width, args.height, args.depth,
                                 args.offset, args.relax, args.timeout, args.minimize)
    # horizontal does only two dimensionals and has implicit x dimension of the shell
    if args.orientation == "horizontal":
        for node, props in g.nodes.items():
            if not "coordinates" in props:
                continue
            if len(props["coordinates"]) == 2:
                y, z = props["coordinates"]
                props["coordinates"] = [props["shell"], y, z]

    for x in g.nodes:
        log.debug("Final solution %s %s", x, g.nodes[x].get("coordinates", "none"))
    render_scad(g, args.output, shells, colorful)
    if args.cache:
        write_cache(g, args.cache)
    log.info("Done")
