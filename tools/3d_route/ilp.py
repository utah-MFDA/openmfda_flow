from pyscipopt import Model, quicksum
import networkx as nx
import solid2
from math import sqrt, acos, atan2, pi

origin = (0, 0, 0)
force_type = "I"
force_constant = 1
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

def node_force(model, network, left, right):
    start = network.nodes[left]["coords"]
    end = network.nodes[right]["coords"]
    start_dimension = network.nodes[left]["dimensions"]
    end_dimension = network.nodes[right]["dimensions"]
    # Worst case radius, scalar value
    # f0 = magnitude(vector(origin, start_dimension))
    # f1 = magnitude(vector(origin, end_dimension))
    f0 = 2
    f1 = 2
    z = model.addVar(f"force_{left}_{right}", vtype=force_type)
    # Don't take sqrt, the force is inverse square which cancels
    dist = squared_magnitude(vector(start, end))
    model.addCons(z*dist >= force_constant*f0*f1, name=f"force_{left}_{right}_cons")
    # model.setObjective(z, sense="minimize")
    return z

def edge_force(model, network, left, right):
    a0, b0, k0 = left
    s0 = network.edges[left]["start"]
    e0 = network.edges[left]["end"]
    c0 = network.edges[left]["dimensions"]

    a1, b1, k1 = right
    s1 = network.edges[right]["start"]
    e1 = network.edges[right]["end"]
    c1 = network.edges[right]["dimensions"]

    # Worst case cross-section radius, scalar value
    f0 = magnitude(vector(origin, c0))
    f1 = magnitude(vector(origin, c0))

    z = model.addVar(f"force_{a0}_{b0}_{k0}__{a1}_{b1}_{k1}", vtype=force_type)
    # Don't take sqrt, the force is inverse square which cancels magnitude
    # the 1/4 on the bottom is moved to LHS
    m0 = add(s0, e0)
    m1 = add(s1, e1)
    dist = squared_magnitude(vector(m0, m1))
    model.addCons(4*z*dist >= f0*f1)
    # model.setObjective(z, sense="minimize")
    return z


def cross_force(model, network, node, edge):

    center = network.nodes[node]["coords"]
    dimension = network.nodes[node]["dimensions"]
    f0 = magnitude(vector(origin, dimension))

    start_node, end_node, key = edge
    start = network.edges[edge]["start"]
    end = network.edges[edge]["end"]
    cross_section = network.edges[edge]["dimensions"]
    f1 = magnitude(vector(origin, cross_section))
    mid = add(start, end)
    dist = squared_magnitude(vector(mid, scale(2, center)))
    z = model.addVar(f"force_{node}__{start_node}_{end_node}_{key}", vtype=force_type)
    model.addCons(4*z*dist >= f0*f1)
    return z

    # # Case boundary conditions
    # left = dot(vector(start, end), vector(start, center))
    # right = dot(vector(start, end), vector(start, end))
    # # One-hot for each case
    # a0 = model.addVar()
    # a1 = model.addVar()
    # a2 = model.addVar()
    # model.addCons(a0 + a1 + a2 == 1)

    # # Cases
    # start_center = vector(start, center)
    # start_end = vector(start, end)
    # end_center = vector(end, centerb)
    # z = model.addVar(vtype="INTEGER")
    # case_left = z*squared_magnitude(start_center) - f1*f0
    # case_orth = z*squared_magnitude(cross(start_end, start_center)) - f1*f0*squared_magnitude(start_end)
    # case_right = z*squared_magnitude(end_center) - f1*f0
    # model.addCons(a0*case_left + a1*case_orth + a2*case_right >= 0)
    # model.setObjective(z, "minimize")

def setup(network, depth_bound):
    model = Model()
    width = 2560
    height = 1600
    if not depth_bound:
        depth = model.addVar("depth", vtype="INTEGER", lb=0, ub=1000)
    # Setup coordinates
    for a in network.nodes:
        w, h, d = network.nodes[a]["dimensions"]
        x, y, z = [model.addVar(f"{a}_{i}", vtype="INTEGER", lb=lb, ub=ub)
                   for i, lb, ub
                   in [("x", w//2, width - w//2), ("y", h//2, height - w//2), ("z", d//2, depth_bound)]]
        network.nodes[a]["coords"] = (x, y, z)
        # # Outer boundary constraint
        # model.addCons(x - w//2 >= 0)
        # model.addCons(x + w//2 <= width)
        # model.addCons(y - h//2 >= 0)
        # model.addCons(y + h//2 <= height)
        # model.addCons(z - d//2 >= 0)
        # if depth_bound:
        #     model.addCons(z + d//2 <= depth_bound, name=f"depth_{a}")
        # else:
        #     model.addCons(z + d//2 <= depth, name=f"depth_{a}")
    for edge in network.edges(keys=True):
        start, end, key = edge
        start_pin = network.edges[edge]["start_pin"]
        end_pin = network.edges[edge]["end_pin"]
        start_center = network.nodes[start]["coords"]
        end_center = network.nodes[end]["coords"]
        network.edges[edge]["start"] = add(start_center, start_pin)
        network.edges[edge]["end"] = add(end_center, end_pin)

    # Forces
    # Only need one pair of nodes and edges, skip reciprocol
    internode = quicksum(node_force(model, network, a, b)
                         for a in network.nodes for b in network.nodes
                         if a < b)
    interedge = quicksum(edge_force(model, network, e, f)
                         for e in network.edges(keys=True) for f in network.edges
                         if e < f)
    interentity = quicksum(cross_force(model, network, a, e)
                           for a in network.nodes for e in network.edges(keys=True)
                           if a not in e)
    if depth_bound:
        model.setObjective(internode + interedge + interentity, sense="minimize")
    else:
        model.setObjective(depth, sense="minimize")
    return model

def draw_channel(a, b, d):
    v = sub(a, b)
    length = magnitude(v)
    bounds = d[0], d[1], length
    if length == 0.0:
        length += 0.000001
    angle = [0,180*acos(v[2]/length)/pi, 180*atan2(v[1], v[0])/pi]
    return solid2.translate(b)(solid2.rotate(angle)(solid2.cube(bounds)))

def scad_render(G, M, solution):
    for node in G.nodes:
        dimensions = G.nodes[node]["dimensions"]
        position = [solution[f"{node}_{i}"] for i in ["x", "y", "z"]]
        adj = sub(position, scale(1/2, dimensions))
        print(node, *adj)
        yield solid2.translate(adj)(solid2.cube(dimensions))
    for edge in G.edges:
        start, end, key = edge
        dimensions = G.edges[edge]["dimensions"]
        start_pin = G.edges[edge]["start_pin"]
        end_pin = G.edges[edge]["end_pin"]
        start = [solution[f"{start}_{i}"] for i in ["x", "y", "z"]]
        end = [solution[f"{end}_{i}"] for i in ["x", "y", "z"]]
        front = add(start, start_pin)
        back = add(end, end_pin)
        yield draw_channel(front, back, dimensions)
if __name__ == "__main__":
    G = nx.MultiGraph()
    size = 32
    for i in range(0, size):
        G.add_node(f"n{i}", dimensions=(128,128,128))
    # Really doesn't like pin offsets, solver dies
    for i in range(0, size-1):
        G.add_edge(f"n{i}", f"n{i+1}", start_pin=(0, 0, 0), end_pin=(0, 0, 0), dimensions=(20,20))
    depth_bound = 1000
    print("\n\n\n\n\n\n****************************************************************")
    M = setup(G, depth_bound)
    print("Variables:", M.getVars())
    print("Constraints:", M.getConss())
    M.optimize()
    solution = M.getVarDict()
    print("Solution:")
    for k, v in solution.items():
        print(k, v)
    depth = depth_bound if depth_bound else solution["depth"]
    scad = solid2.background()(solid2.cube([2560,1600,depth]))
    for i in scad_render(G, M, solution):
        scad += i
    scad.save_as_scad()
