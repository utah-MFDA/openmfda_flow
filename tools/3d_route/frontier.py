import json
from math import ceil, sqrt, acos, atan2, pi
from collections import deque
import networkx as nx
from numpy.testing._private.utils import break_cycles
import pyscipopt as scip
from networkx_helpers import *
import solid2
import logging
log = logging.getLogger(__name__)

logging.basicConfig(filename='3d_route.log', level=logging.INFO)


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

def in_hemicube(G, M, node, width, height, depth, shell, offset, relax):
    layer = shell+offset
    add_position(G, M, node,
                 (-layer, layer),
                 (-layer, layer),
                 (0, layer))
    return []

def horizontal_bound(width, height, depth, shell, offset):
    return [(-height, height), (-depth, depth)]

def in_horizontal(G, M, node, width, height, depth, shell, offset, relax):
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

def shell_bound(width, height, depth, shell, offset):
    layer = shell+offset
    return [ (-layer, layer),
               (-layer, layer),
               (-layer, layer)]
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

def bounded_dimension(G, M, direction, orientation, relative, frontier, bounding, shell, offset, relax):
    ashell =  G.nodes[relative]["shell"]
    if direction(ashell, shell):
        relations = G.nodes[relative][orientation]
        dist = 2*(abs(ashell - shell)) + 1
        group = relations.intersection(frontier)
        minim = []
        if len(group) > 1:
            log.debug("Adding bounds for %s at distance %d to %d children on layer %d", relative, dist, len(group), shell)
            X = 0 if not relax else M.addVar(f"{relative}_relax", vtype="I", lb=0, ub=relax)
            # bounds = [(M.addVar(f"{relative}_ubound_{i}", vtype="I", lb=lb, ub=ub),
            #             M.addVar(f"{relative}_lbound_{i}", vtype="I", lb=lb, ub=ub))
            #             for i, (lb, ub) in enumerate(bounding)]
            # for U, L in bounds:
            #     M.addCons(U - L >= 1)
            #     M.addCons(U - L <= dist + X)
            # for node in group:
            #     for coord, (U, L) in zip(G.nodes[node]["coordinates"], bounds):
            #         M.addCons(coord <= U - 1)
            #         M.addCons(coord >= L)
            for first in group:
                fd = G.nodes[first]["coordinates"]
                for second in group:
                    if first != second:
                        sd = G.nodes[second]["coordinates"]
                        for a, b in zip(fd, sd):
                            # minim += within_distance(G, M, a, b, abs(ashell-shell), relax)
                            M.addCons(abs(a-b) <= dist + X)
        # return minim
            if relax:
                return [X]
            else:
                return []
    return []

def bounded_descendent(G, M, ancestor, frontier, bounding, shell, offset, relax):
    return bounded_dimension(G, M, lambda x,y: x > y, "descendents", ancestor, frontier, bounding, shell, offset, relax)

def bounded_ancestor(G, M, descendent, frontier, bounding, shell, offset, relax):
    return bounded_dimension(G, M, lambda x,y: x < y, "ancestors", descendent, frontier, bounding, shell, offset, relax)

def bounded(G, M, relative, frontier, bounding, shell, offset, relax):
    return bounded_descendent(G, M, relative, frontier, bounding, shell, offset, relax) + \
        bounded_ancestor(G, M, relative, frontier, bounding, shell, offset, relax)

def within_distance(G, M, a, b, d, relax):
    X = 0 if not relax else M.addVar(vtype="I", lb=0, ub=relax)
    # X = relax
    M.addCons(abs(a - b) <= d + X)
    if relax:
        return [X]
    else:
        return []

def proximate_layer(G, M, s, e, shell, offset, relax):
    a = G.nodes[s]["coordinates"]
    b = G.nodes[e]["coordinates"]
    return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, 1, relax)]

def distance_shell(G, M, s, e, shell, offset, relax):
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
        return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, bound, relax)]

def max_distance(G, M, first, second, shell, offset, relax):
    a = G.nodes[first]["coordinates"]
    b = G.nodes[second]["coordinates"]
    X = M.addVar(vtype="I", lb=1)
    M.addCons(scip.quicksum(abs(x - y) for x, y in zip(a, b)) >= X)
    return [X]

def not_overlap(G, M, first, second, shell, offset, relax):
    a = G.nodes[first]["coordinates"]
    b = G.nodes[second]["coordinates"]
    M.addCons(scip.quicksum(abs(x - y) for x, y in zip(a, b)) >= 1)
    return []

def attach_to_side(G, M, side, node, shell, offset, relax):
    log.debug("Attaching %s to %s", node, side)
    a = G.nodes[side]["coordinates"]
    b = G.nodes[node]["coordinates"]
    log.debug("Starting at %s", a)
    # if is_control(G, node) or is_flush(G, node):# or is_control(G, side) or is_flush(G, side):
        # M.addCons(a[2] == 0)
        # return []
    # Within +/- 1
    return [i for x, y in zip(a, b) for i in within_distance(G, M, x, y, 1, relax)]

def noop(G, M, neighbor, node, shell, offset, relax):
    return []

################### Runnning ###################
def run_by_dimension(G, skip, outfile, start_condition, buffer_condition,
                 overlap, inside, distance, proximate, ahead, attach,
                 bounding, width = 40, height = 25, depth = 25,
                 offset=0, limit=10, timeout=60):
    render_dot_undir(G, "raw.dot")
    shells = find_center(G, start_condition, buffer_condition)
    for shell in range(0, shells):
        relax = 0
        current = {node for node, d in G.nodes.items() if d["shell"] == shell}
        bounds = bounding(width, height, depth, shell, offset)
        flat = [i for j in bounds for i in j]
        log.info("Bounded " + "(%d, %d) "*len(bounds), *flat)
        while True:
            success = solve_shell(G, skip, overlap, inside, distance, proximate, ahead, attach,
                                 current, shell, width, height, depth, bounds, offset, shells, relax, limit, timeout)
            if success:
                break
            if relax > limit:
                raise
            relax += 1
        render_scad(G, outfile, shells)
    return shells

def solve_slice(G, overlap, inside, distance, proximate, ahead, attach,
                frontier, shell, width, height, depth, bounding, offset, max_shell,
                relax = 0, limit=4, timeout=30):
    if relax:
        log.warning("Relaxing distance constraints by %d", relax)
    M = scip.Model()
    M.setParam("limits/time", timeout)
    # M.setParam("limits/solutions", 1)
    for node in frontier:
        inside(G, M, node, width, height, depth, shell, offset, relax)
    minim = []
    for first in frontier:
        for second in frontier:
            if first < second:
                minim += overlap(G, M, first, second, shell, offset, relax)
    for node in G.nodes:
        minim += distance(G, M, node, frontier, bounding, shell, offset, relax)
    for node in frontier:
        for neighbor in G.adj[node]:
            if G.nodes[neighbor]["shell"] == shell - 1:
                minim += attach(G, M, neighbor, node, shell, offset, relax)
    if minim:
        log.info("Running with minimization")
        M.setObjective(scip.quicksum(minim), sense="minimize")
    log.info("Presolving with %d variables and %d constraints", M.getNVars(), M.getNConss())
    M.presolve()
    log.info("Start optimizations with %d variables and %d constraints", M.getNVars(), M.getNConss())
    M.optimize()
    log.info("Finished optimizing, %d solutions found", M.getNSols())

    if M.getNSols() == 0:
        for node in frontier:
            props = G.nodes[node]
            del props["coordinates"]
        return False
    for node in frontier:
        props = G.nodes[node]
        props["coordinates"] = [M.getVal(i) for i in props["coordinates"]]
        # log.debug("Final coordinates: %s %s", node, props["coordinates"])
    return True

def solve_shell(G, skip, overlap, inside, distance, proximate, ahead, attach,
                frontier, shell, width, height, depth, bounding, offset, max_shell,
                relax = 0, limit=4, timeout=30):
    M = scip.Model()
    M.setParam("limits/time", timeout)
    M.setParam("limits/solutions", 1)
    if relax:
        log.warning("Relaxing distance constraints by %d", relax)
    log.info("Solving shell %d, %d nodes", shell, len(frontier))
    minim = []
    frontier = {node for node in frontier if not skip(G, node)}

    for node in frontier:
        assert(shell == G.nodes[node]["shell"])
        inside(G, M, node, width, height, depth, shell, offset, relax)
    for first in frontier:
        for second in frontier:
            if first < second:
                not_overlap(G, M, first, second, shell, offset, relax)
    for ancestor in G.nodes:
        if skip(G, ancestor):
            continue
        minim += distance(G, M, ancestor, frontier, bounding, shell, offset, relax)
    for node in frontier:

        if skip(G, node):
            continue
        for neighbor in G.adj[node]:
            if skip(G, neighbor):
                continue
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

    if M.getNSols() == 0:
        for node in frontier:
            props = G.nodes[node]
            del props["coordinates"]
        del M
        return False
    for node in frontier:
        props = G.nodes[node]
        props["coordinates"] = [M.getVal(i) for i in props["coordinates"]]
        # log.debug("Final coordinates: %s %s", node, props["coordinates"])
    del M
    return True

################# Rendering ##################
def draw_channel(a, b, d):
    v = [i - j for i, j in zip(a, b)]
    length = sqrt(sum((i-j)**2 for i, j in zip(a, b)))
    bounds = d[0], d[1], length
    if length == 0.0:
        length += 0.000001
    angle = [0,180*acos(v[2]/length)/pi, 180*atan2(v[1], v[0])/pi]
    return solid2.translate(b)(solid2.rotate(angle)(solid2.cube(bounds)))

def scad_render_nodes(G,nodes):
    for node in nodes:
        if "coordinates" not in G.nodes[node]:
            continue

        dimensions = G.nodes[node].get("dimensions", [1, 1, 1])
        position = G.nodes[node]["coordinates"]
        if len(position) == 2:
            position = [G.nodes[node]["shell"]] + position
        s = solid2.translate(position)(solid2.cube(dimensions))
        cell = G.nodes[node]["cell"]
        if is_dummy(G, node):
            color = "lightblue"
        elif is_net(G, node):
            if is_flow(G, node):
                color = "pink"
            elif is_control(G, node):
                color = "orange"
            elif is_flush(G, node):
                color = "yellow"
            else:
                color = "lightgreen"
        else:
            color = "black"
        yield solid2.color(color, alpha=0.1)(s)

def scad_render_edges(G, edges):
    for edge in edges:
        start, end = edge
        if "coordinates" not in G.nodes[end] or "coordinates" not in G.nodes[start]:
            continue
        end_orig = G.nodes[end]["coordinates"]
        if len(end_orig) == 2:
            end_orig = [G.nodes[end]["shell"]] + end_orig

        end_dim = G.nodes[end].get("dimensions", [1,1,1])
        start_orig = G.nodes[start]["coordinates"]
        if len(start_orig) == 2:
            start_orig = [G.nodes[start]["shell"]] + start_orig
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


def render_shell(G, shell):
    nodes = [n for n, d in G.nodes.items() if d["shell"] == shell]
    edges = [(s, e) for s, e in G.edges
            if max(G.nodes[s]["shell"], G.nodes[e]["shell"]) == shell+1 and
               min(G.nodes[s]["shell"], G.nodes[e]["shell"]) == shell]
    scad_nodes = scad_comment(f"Nodes shell {shell}")(solid2.union()(*scad_render_nodes(G, nodes)))
    scad_edges = scad_comment(f"Edges shell {shell}")(solid2.union()(*scad_render_edges(G, edges)))
    return scad_comment(f"Shell {shell}")(solid2.union()(solid2.background()(scad_nodes),scad_edges))

@solid2.register_access_syntax
class scad_comment(solid2.object_base.ObjectBase, solid2.object_base.AccessSyntaxMixin, solid2.object_base.OperatorMixin):
    def __init__(self, comment):
        super().__init__()
        self.comment = comment
    def _render(self):
        return f"/*{self.comment}*/\n" + super()._render()

def render_scad(G,outfile,shells):
    final = (render_shell(G, shell) for shell in range(0, shells))
    scad = solid2.translate([-0.5, -0.5, 0])(*final)
    scad.save_as_scad(outfile)


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
    args = parser.parse_args()

    log.setLevel(args.log)

    g = read_yosys_json(args.input_file,args.top)
    log.info("Loaded %s", g)

    bound = bounded
    start = lambda G, n: (is_input_port(G, n) or is_output_port(G, n)) and is_flow(G, n)
    buffer = lambda G, n: False
    if args.add_buffers:
        buffer = lambda G, n: not any(is_descendent(G, adj, node) for adj in G.adj[node])

    if args.orientation == "cube":
        orientation = in_shell
        shell_bound = shell_bound
    elif args.orientation == "horizontal":
        orientation = in_horizontal
        # bound = bounded_horizontal
        shell_bound = horizontal_bound
        start = lambda G, n: is_input_port(G, n) and is_flow(G, n)
        # if args.add_buffers:
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
        skip = lambda G, node: is_control(G, node) or is_flush(G, node)
    else:
        skip = lambda G, node: False
    shells = run_by_dimension(g, skip, args.output, start, buffer,
                                 not_overlap, orientation, bound, noop, noop, attach_to_side,
                                 shell_bound,
                                 args.width, args.height, args.depth,
                                 args.offset, args.relax, args.timeout)
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
    render_scad(g, args.output, shells)
    log.info("Done")
