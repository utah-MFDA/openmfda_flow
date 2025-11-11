import networkx as nx
from math import ceil, sqrt, acos, atan2, pi
import solid2
from networkx_helpers import *

def draw_channel(a, b, d):
    v = [i - j for i, j in zip(a, b)]
    length = sqrt(sum((i-j)**2 for i, j in zip(a, b)))
    bounds = d[0], d[1], length
    if length == 0.0:
        length += 0.000001
    angle = [0,180*acos(v[2]/length)/pi, 180*atan2(v[1], v[0])/pi]
    return solid2.translate(b)(solid2.rotate(angle)(solid2.cube(bounds)))

def scad_render_nodes(G,nodes, colorful):
    for node in nodes:
        if "coordinates" not in G.nodes[node]:
            continue

        dimensions = G.nodes[node].get("dimensions", [1,1,1])
        position = G.nodes[node]["coordinates"]
        if len(position) == 2:
            position = [G.nodes[node]["shell"]] + position
        s = solid2.translate(position)(solid2.cube(dimensions))
        cell = G.nodes[node]["cell"]
        color = colorful(G, node)
        yield scad_comment(f"Node {node}") (solid2.color(color, alpha=0.1)(s))

def scad_render_nodes_flat(G,nodes):
    for node in nodes:
        dimensions = G.nodes[node].get("dimensions", [100, 100, 100])
        position = G.nodes[node]["coordinates"]
        s = solid2.translate(position)(solid2.cube(dimensions))
        yield scad_comment(f"Node {node}")(s)

def scad_render_edges_flat(G, edges):
    for edge in edges:
        start, end = edge
        end_orig = G.nodes[end]["coordinates"]
        start_orig = G.nodes[start]["coordinates"]
        channel_dim = G.edges[edge].get("dimensions", (10,10,10))
        start_pin = G.edges[edge].get("start_pin", (0.5, 0.5, 0.5))
        end_pin = G.edges[edge].get("end_pin", (0.5, 0.5, 0.5))
        front = [i + j for i, j in zip(start_orig, start_pin)]
        back = [i + j for i, j in zip(end_orig, end_pin)]
        bit = G.edges[edge]["bit"]
        yield scad_comment(f"Edge {bit} from {start} to {end}")(draw_channel(front, back, channel_dim))

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
        bit = G.edges[edge]["bit"]
        yield scad_comment(f"Edge {bit} from {start} to {end}")(draw_channel(front, back, channel_dim))

def render_shell(G, shell, colorful):
    nodes = [n for n, d in G.nodes.items() if d["shell"] == shell]
    edges = [(s, e) for s, e in G.edges
            if max(G.nodes[s]["shell"], G.nodes[e]["shell"]) == shell+1 and
               min(G.nodes[s]["shell"], G.nodes[e]["shell"]) == shell]
    scad_nodes = scad_comment(f"Nodes shell {shell}")(solid2.union()(*scad_render_nodes(G, nodes, colorful)))
    scad_edges = scad_comment(f"Edges shell {shell}")(solid2.union()(*scad_render_edges(G, edges)))
    return scad_comment(f"Shell {shell}")(solid2.union()(solid2.background()(scad_nodes),scad_edges))

def render_flat(G):
    nodes = [n for n, d in G.nodes.items()]
    edges = [(s, e) for s, e in G.edges]
    scad_nodes = scad_comment(f"Nodes")(solid2.union()(*scad_render_nodes_flat(G, nodes)))
    scad_edges = scad_comment(f"Edges")(solid2.union()(*scad_render_edges_flat(G, edges)))
    return solid2.union()(solid2.background()(scad_nodes),scad_edges)

@solid2.register_access_syntax
class scad_comment(solid2.object_base.ObjectBase, solid2.object_base.AccessSyntaxMixin, solid2.object_base.OperatorMixin):
    def __init__(self, comment):
        super().__init__()
        self.comment = comment
    def _render(self):
        return f"/*{self.comment}*/\n" + super()._render()

def render_scad(G,outfile,shells, colorful):
    final = (render_shell(G, shell, colorful) for shell in range(0, shells))
    scad = solid2.translate([-0.5, -0.5, 0])(*final)
    scad.save_as_scad(outfile)
