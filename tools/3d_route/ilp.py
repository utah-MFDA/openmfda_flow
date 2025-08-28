from pyscipopt import Model, quicksum
import networkx as nx
from math import sqrt
# model = Model()
# x = model.addVar("x")
# y = model.addVar("y", vtype="INTEGER")
# model.setObjective(x + y)
# model.addCons(2*x - y*y >= 0)
# model.optimize()
# sol = model.getBestSol()
# print(sol[x], sol[y])
origin = (0, 0, 0)

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

def squared_magnitude(a):
    # return a[0]**2 + a[1]**2 + a[2]**2
    return sum(i**2 for i in a)

def scale(s, a):
    return [s*i for i in a]

def node_force(model, network, left, right):
    start = network.nodes[left]["coords"]
    end = network.nodes[right]["coords"]
    start_dimension = network.nodes[left]["dimensions"]
    end_dimension = network.nodes[right]["dimensions"]
    # Worst case radius, scalar value
    f0 = magnitude(vector(origin, start_dimension))
    f1 = magnitude(vector(origin, end_dimension))

    z = model.addVar(f"force_{left}_{right}", vtype="INTEGER")
    # Don't take sqrt, the force is inverse square which cancels
    dist = squared_magnitude(vector(start, end))
    model.addCons(z*dist == f0*f1)
    return z
    #model.setObjective(z, sense="minimize")

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

    z = model.addVar(f"force_{a0}_{b0}_{k0}__{a1}_{b1}_{k1}", vtype="INTEGER")
    # Don't take sqrt, the force is inverse square which cancels magnitude
    # the 1/4 on the bottom is moved to LHS
    m0 = add(s0, e0)
    m1 = add(s1, e1)
    dist = squared_magnitude(vector(m0, m1))
    model.addCons(4*z*dist == f0*f1)
    return z
    #model.setObjective(z, sense="minimize")

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
    z = model.addVar(f"force_{node}__{start_node}_{end_node}_{key}", vtype="INTEGER")
    model.addCons(4*z*dist == f0*f1)
    return z
    # model.setObjective(z, sense="minimize")

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

def setup(network):
    model = Model()
    width = 2560
    height = 1600
    depth = model.addVar("depth", vtype="INTEGER")
    model.setObjective(depth, sense="minimize")
    # Setup coordinates
    for a in network.nodes:
        w, h, d = network.nodes[a]["dimensions"]
        x, y, z = [model.addVar(f"{a}_{i}", vtype="INTEGER", lb=lb, ub=ub)
                   for i, lb, ub
                   in [("x", w//2, width - w//2), ("y", h//2, height - w//2), ("z", d//2, None)]]
        network.nodes[a]["coords"] = (x, y, z)
        # # Outer boundary constraint
        # model.addCons(x - w/2 >= 0)
        # model.addCons(x + w/2 <= width)
        # model.addCons(y - h/2 >= 0)
        # model.addCons(y + h/2 <= height)
        # model.addCons(z - d/2 >= 0)
        model.addCons(z + d/2 <= depth)
    for edge in network.edges(keys=True):
        start, end, key = edge
        start_pin = network.edges[edge]["start_pin"]
        end_pin = network.edges[edge]["end_pin"]
        start_center = network.nodes[start]["coords"]
        end_center = network.nodes[start]["coords"]
        network.edges[edge]["start"] = add(start_center, start_pin)
        network.edges[edge]["end"] = add(end_center, end_pin)

    # Forces
    # Only need one pair of nodes and edges, skip reciprocol
    internode = quicksum(node_force(model, network, a, b)
                    for a in network.nodes for b in network.nodes if a < b)
    interedge = quicksum(edge_force(model, network, e, f)
                    for e in network.edges(keys=True) for f in network.edges if e < f)
    interentity = quicksum(cross_force(model, network, a, e)
                      for a in network.nodes for e in network.edges(keys=True))
    model.setObjective(internode + interedge + interentity, sense="minimize")
    return model
if __name__ == "__main__":
    G = nx.MultiGraph()
    G.add_node("a", dimensions=(128,128,128))
    # G.add_node("b", dimensions=(128,128,128))
    # G.add_node("c", dimensions=(128,128,128))
    # G.add_node("d", dimensions=(128,128,128))
    # G.add_edge("a", "b", start_pin=(128, 0, 0), end_pin=(0, 0, 100), dimensions=(20,20))
    # G.add_edge("b", "c", start_pin=(128, 0, 0), end_pin=(0, 0, 100), dimensions=(20,20))
    # G.add_edge("c", "d", start_pin=(128, 0, 0), end_pin=(0, 0, 100), dimensions=(20,20))
    # G.add_edge("d", "a", start_pin=(128, 0, 0), end_pin=(0, 0, 100), dimensions=(20,20))
    M = setup(G)
    print(M.getVars())
    M.optimize()
    print(M.getBestSol())
