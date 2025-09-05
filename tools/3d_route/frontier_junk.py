
def setup_shells():
    G = nx.Graph()
    # shell, face, x, y
    G.add_node("0_0_0", position=[0,0,0,0], assigned=None)
    for shell in range(1,64):
        width = shell*2+1
        height = width
        for face in range(0,6):
            for x in range(1,width-1):
                for y in range(1,height-1):
                    for a in [-1, 0, 1]:
                        for b in [-1, 0, 1]:
                            for c in [-1, 0]:
                                G.add_edge(f"{shell}_{face}_{x}_{y}", f"{shell+c}_{face}_{x+a}_{y+b}")

def adjacents(shell, face, x, y, max_height, max_width):
    width = min(shell*2+1, max_height)
    height = min(shell*2+1, max_width)
    if x >= width or x < 0 or y >= height or y < 0:
        return
    if
    for a in [-1, 0, 1]:
        for b in [-1, 0, 1]:
            for c in [-1, 0, 1]:
                if x+b < 0 or x+b >= width or y+b < 0 or ya == b and b == c and c == 0:
                                     continue
                                 G.add_edge(f"{shell}_{face}_{x}_{y}", f"{shell+c}_{face}_{x+a}_{y+b}")
def shell(x, y, z, w, h, d):
    return max(min(abs(x), w), min(abs(y),h), min(abs(z),d))

def adjacent(x, y, z, w, h, d):
     for a in [0, -1, 1]:
         for b in [0, -1, 1]:
             for c in [0, -1, 1]:
                 dx, dy, dz = x+a, y+b, y+c
                 if shell(dx,dy,dz) > shell(x, y, z, w, h, d):
                 # if dx < -width or dx >= width or dy < -width or dy >= height or dz < -depth or dz >= depth or shell(dx,dy,dz) >:
                     yield (dx, dy, dz)
def near(x, y, z, p, q, r):
    return x - 1 <= p <= x + 1 and y - 1 <= q <= y + 1 and z - 1 <= r <= z + 1

def setup(network, start):
    shells = []
    current = [start]
    num = 0
    # Count shells
    while current:
        nexts = []
        for cell in current:
            network.nodes[cell]["shell"] = num
            for adj in network.nodes[cell].adj:
                if network.nodes[cell]["shell"] < num:
                    # last shell
                    continue
                nexts.append(adj)
        shells.append(current)
        current = nexts
        nexts = []
        num += 1
    # Setup cousins

    while num:
        num -= 1
        for node in shells[num]:
            if network.degree(node) == 1:
                network.nodes[node]["cousins"] = []
            else:
                for neighbor in network.nodes[node].adj:
                    if network.nodes[neighbor]["shell"] == num:
                        network.nodes[node]["cousins"].append((0, node, neighbor))
                        # do i have any 1st cousins
        leaf = frontier.popleft()
        shell = network.nodes[leaf]["shell"]
        for adj in network.nodes[leaf].adj:
            if shell != num:
                leaf.push()
                continue
            adj_shell
            if shell == adj_shell:
                if network.nodes[adj]["shell"] < shell

def dothething(network, start):
    mapped = nx.Graph()
    frontier = deque()
    problems = deque()
    frontier.push(start)
    network.nodes[start]["assigned"] = (0, 0, 0)
    mapped.add_node((0,0,0), assigned=start)
    w = 1600
    d = 1000
    h = 2560
    while frontier:
        node = frontier.popleft()
        x, y, z = node
        s = shell(x, y, z, w, d, h)
        for adj in network.nodes[node].adj:
            ass = network.nodes[adj].get("assigned", None)
            prob = network.nodes[adj].get("problem", 0)
            p, q, r
            # Case 0, in the previous shell
            # Skipping multigraph, if there's more than one connection there's probably enough surface area.

            # Case 1, in the next shell
            # Case 2, in the same shell.
            # Case 4. not adjacent but one step removed

            # if not prob and ass and not near(x, y, z, ass[0], ass[1], ass[2]):
            #     network.nodes[adj]["problem"] = 2
            #     continue
            found = False
            for n in adjacent(x, y, z, w, h, d):
                if n not in mapped:
                    mapped.add_node(n, assigned=adj)
                    network.nodes[adj]["assigned"] = n
                    found = True
                    break
            if not found:
                network.nodes[adj]["problem"] = 1
                continue
            else:
                frontier.push(adj)
    return mapped
