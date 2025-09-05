from math import sqrt, acos, atan2, pi
from collections import deque
import networkx as nx
from pyscipopt import Model, quicksum
import uuid
from networkx_helpers import read_yosys_json
import time
import solid2

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
                        G.nodes[leaf]["relations"].append((first, second, 0))
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
                dummy = str(uuid.uuid4())
                G.add_node(dummy, shell=shell+1, dummy=True, setup=False, relations=set())
                G.add_edge(leaf, dummy)
                nexts.append(dummy)
            # Pass your relations to your children
            for child in children:
                for first, second, distance in G.nodes[leaf]["relations"]:
                    G.nodes[neighbor]["relations"].add((first, second, distance + 1))
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
            root = str(uuid.uuid4())
            G.add_node(root, shell=shell+1, dummy=True)
            for leaf in frontier:
                G.add_edge(leaf, root)
            return shell+1, root
        else:
            frontier = nexts
            nexts = deque()
    raise

def setup(G):
    shells, root = find_center(G)
    # Setup root node at center
    for node in G:
        # Reverse the order of the shells from inside to out
        G.nodes[node]["shell"] = shells - G.nodes[node]["shell"]
    return root

def relations_map(G):
    constraints = dict()
    for node, relations in G.nodes.data("relations"):
        for first, second, distance in relations:
            if (first, second) not in constraints:
                constraints[(first, second)] = dict()
            if distance not in constraints[(first, second)]:
                constraints[(first, second)][distance] = set()
            constraints[(first, second)][distance] += node
    return constraints

def no_overlap(M, G, a, b):
    shell = G.nodes[a]["shell"]
    ax, ay, az = G.nodes[a]["position"]
    bx, by, bz = G.nodes[b]["position"]
    ax0 = M.addVar(f"v_x0_{a}_{b}", vtype="B")
    ay0 = M.addVar(f"v_y0_{a}_{b}", vtype="B")
    az0 = M.addVar(f"v_z0_{a}_{b}", vtype="B")
    # Detect which face is active
    M.addCons(ax0*(ax - bx) == 0, name=f"over_x_{a}_{b}")
    M.addCons(ay0*(ay - by) == 0, name=f"over_y_{a}_{b}")
    M.addCons(az0*(az - bz) == 0, name=f"over_z_{a}_{b}")
    M.addCons(ax0 + ay0 + az0 == 0)
    return ax0, ay0, az0

def on_shell(M, G, shell, node):
    x, y, z = G.nodes[node]["position"]
    # Shell boundary
    bound = shell
    M.addCons(x <= bound, name=f"sx0_{node}")
    M.addCons(x >= -bound, name=f"sx1_{node}")
    M.addCons(y <= bound, name=f"sy0_{node}")
    M.addCons(y >= -bound, name=f"sy1_{node}")
    M.addCons(z <= bound, name=f"sz0_{node}")
    M.addCons(z >= -bound, name=f"sz1_{node}")

    # First point face detection
    ax0 = M.addVar(f"f_x0_{node}", vtype="B")
    ay0 = M.addVar(f"f_y0_{node}", vtype="B")
    az0 = M.addVar(f"f_z0_{node}", vtype="B")
    ax1 = M.addVar(f"f_x1_{node}", vtype="B")
    ay1 = M.addVar(f"f_y1_{node}", vtype="B")
    az1 = M.addVar(f"f_z1_{node}", vtype="B")
    # Detect which face is active
    M.addCons(ax0*(x - bound) == 0, name=f"face_x0_{node}")
    M.addCons(ax1*(x + bound) == 0, name=f"face_x1_{node}")
    M.addCons(ay0*(y - bound) == 0, name=f"face_y0_{node}")
    M.addCons(ay1*(y + bound) == 0, name=f"face_y1_{node}")
    M.addCons(az0*(z - bound) == 0, name=f"face_z0_{node}")
    M.addCons(az1*(z + bound) == 0, name=f"face_z1_{node}")
    # At least one face is active
    M.addCons(ax0+ax1+ay0+ay1+az0+az1 >= 1, name=f"face_{node}")
    return (ax0,ax1,ay0,ay1,az0,az1)

def dist_same_shell(M, G, s, e, shell):
    x, y, z = G.nodes[s]["position"]
    a_rel = G.nodes[s]["relations"]
    nx, ny, nz = G.nodes[e]["position"]
    b_rel = G.nodes[node]["relations"]
    dist = a_rel.intersect(b_rel)
    # if no relationship constraint, bail
    if not len(dist):
        return
    # Find worst case distance requirement
    bound = min(d for _, _, d in dist)
    # same_face(M, G, s, e)
    M.addCons(nx - x <= bound, name=f"dx0_{s}_{e}")
    M.addCons(nx - x >= -bound, name=f"dx1_{s}_{e}")
    M.addCons(ny - y <= bound, name=f"dy0_{s}_{e}")
    M.addCons(ny - y >= -bound, name=f"dy1_{s}_{e}")
    M.addCons(nz - z <= bound, name=f"dz0_{s}_{e}")
    M.addCons(nz - z >= -bound, name=f"dz1_{s}_{e}")

def same_face(M, G, s, e, shell):
    M.addCons(sum(a * b for a, b in zip(G.nodes[s]["face"], G.nodes[e]["face"]) >= 1))

def dist_next_shell_out(M, s, e, constraints):
    x, y, z = G.nodes[s]["position"]
    nx, ny, nz = G.nodes[e]["position"]
    bound = 1
    M.addCons(nx - x <= bound, name=f"cx0_{s}_{e}")
    M.addCons(nx - x >= -bound, name=f"cx1_{s}_{e}")
    M.addCons(ny - y <= bound, name=f"cy0_{s}_{e}")
    M.addCons(ny - y >= -bound, name=f"cy1_{s}_{e}")
    M.addCons(nz - z <= bound, name=f"cz0_{s}_{e}")
    M.addCons(nz - z >= -bound, name=f"cz1_{s}_{e}")
    # Distance is +-1 on next shell. the on_shell requirement should simplify this during preprocessing

def run(G, width = 2560, height = 1600, depth = 1000):
    root = setup(G)

    M = Model()
    for node in G.nodes:
        G.nodes[node]["visited"] = False
        x, y, z = [M.addVar(f"{node}_{i}", vtype="INTEGER", lb=lb, ub=ub)
                   for i, lb, ub
                   in [("x", -width//2, width//2),
                       ("y", -height//2, height//2),
                       ("z", -depth//2, depth//2)]]
        G.nodes[node]["position"] = (x, y, z)

    rx, ry, rz = G.nodes[root]["position"]
    M.addCons(rx == 0, name="origin_x")
    M.addCons(ry == 0, name="origin_y")
    M.addCons(rz == 0, name="origin_z")


    frontier = deque([root])
    for node in G.nodes():
        shell = G.nodes[node]["shell"]
        G.nodes[node]["face"] = on_shell(M, G, shell, node)
    overlaps = deque()
    while frontier:
        nexts = set()
        # Everything in frontier is on the same shell
        overlaps.extend(no_overlap(M, G, first, second)
                        for first in frontier
                        for second in frontier
                        if first < second)

        for node in frontier:
            shell = G.nodes[node]["shell"]
            G.nodes[node]["visited"] = True
            for neighbor in G.adj[node]:
                n_shell = G.nodes[neighbor]["shell"]
                # next shell, add to next frontier
                if n_shell > shell:
                    nexts.add(neighbor)
                # Same shell, setup proximity from constraints
                elif shell == n_shell:
                    if G.nodes[neighbor]["visited"]:
                        # relationships are symmetric. is already setup
                        continue
                    else:
                        dist_same_shell(M, node, neighbor, shell)
                # Previous shell, setup direct proximity from position
                else:
                    dist_next_shell_out(M, neighbor, node, shell)
        frontier = nexts
    return M, overlaps

def draw_channel(a, b, d):
    v = sub(a, b)
    length = magnitude(v)
    bounds = d[0], d[1], length
    if length == 0.0:
        length += 0.000001
    angle = [0,180*acos(v[2]/length)/pi, 180*atan2(v[1], v[0])/pi]
    return solid2.translate(b)(solid2.rotate(angle)(solid2.cube(bounds)))

def scad_render(G, M):
    for node in G.nodes:
        dimensions = G.nodes[node].get("dimensions", (1,1,1))
        position = [i.getObj() for i in G.nodes[node]["position"]]
        # adj = sub(position, scale(1/2, dimensions))
        yield solid2.translate(position)(solid2.cube(dimensions))
    for edge in G.edges:
        start, end = edge
        dimensions = G.edges[edge].get("dimensions", (1,1,1))
        start_pin = G.edges[edge].get("start_pin", (0, 0, 0))
        end_pin = G.edges[edge].get("end_pin", (0, 0, 0))
        start = [i.getObj() for i in G.nodes[start]["position"]]
        end = [i.getObj() for i in G.nodes[end]["position"]]
        front = add(start, start_pin)
        back = add(end, end_pin)
        yield draw_channel(front, back, dimensions)

if __name__ == "__main__":
    print("*"*32)
    import sys
    input_file = sys.argv[1]
    G = read_yosys_json(input_file, "thing")
    M, over = run(G, width = 256, height=160, depth=100)
    print("Variables:", M.getVars())
    print("Constraints:", M.getConss())
    print("overlap count", len(over))
    M.setObjective(quicksum(i for j in over for i in j), sense="minimize")
    M.optimize()
    # depth = depth_bound if depth_bound else solution["depth"]
    for x in G.nodes:
        print(x, [i.getObj() for i in G.nodes[x]["position"]], [i.getObj() for i in  G.nodes[x]["face"]])
    scad = solid2.background()(solid2.cube([256,160,100]))
    for i in scad_render(G, M):
        scad += i
    scad.save_as_scad()
    print("Done")
