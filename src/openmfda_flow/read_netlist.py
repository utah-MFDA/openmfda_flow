
from lark import Lark
from lark import Transformer

import networkx as nx
import matplotlib.pyplot as plt
import os

import openmfda_flow.verilog_grammer as verilog_grammer

comp_type = "comp_type"

f_dir = os.path.abspath(os.path.dirname(__file__))
#v_parser = Lark.open(f"{f_dir}/verilog_grammer.lark", lexer='basic')
v_parser = verilog_grammer.import_verilog_parser()

class V_Graph():

    def __init__(self, graph=None):
        if isinstance(graph, nx.Graph):
            self.graph = graph
        elif graph is None:
            self.graph = None
        else:
            raise ValueError("Input is not NetworkX Graph")

    def get_graph(self):
        return self.graph

    def show_plot(self):
        nx.draw_spring(self.graph, with_labels=True)
        plt.show()

def import_from_file(in_verilog):
    with open(in_verilog, 'r') as tf:
        tree = v_parser.parse(tf.read())
    return Verilog_Transformer().transform(tree)

class Verilog_Transformer(Transformer):

    def start(self, p):
        return p[0]

    def CNAME(self, t):
        return str(t)

    def module(self, p):
        m = {p[0]: {}}
        nets = {}
        G_net = nx.Graph()
        print("Reading module", p[0])
        for ind, t in enumerate(p[2:]):
            #if t[0][0] == "NET":
            if t[0] == "NET":
                print(t)
                nets.update(t[1])
            #elif t[0][0] == "COMPONENT":
            elif t[0] == "COMPONENT":
                # print(t[0][1]['node'])
                # print(t[0][1]['edges'])
                G_net.add_nodes_from([t[1]["node"]])
                G_net.add_edges_from(t[1]["edges"])
            else:
                raise ValueError(f"Unhandled rule: {t}")

        for n in nets.items():
            G_net.nodes[n[0]][comp_type] = n[1]
        m[p[0]]["graph"] = G_net

        print("Nodes:", G_net.nodes)
        print("Edges:", G_net.edges)

        return V_Graph(G_net)

            #print(ind, t)

    def mod_ports(self, p):
        mp = {}
        for i in p:
            mp.update(i)
        return mp
        # print([mp.update(i) for i in p])

    def mod_port_def(self, p):
        if p[0] is None:
            return {p[1]: "PORT"}
        else:
            return {p[1].upper(): p[0]}

    def mod_derective(self, p):
        # md = {}
        # return [md.update(i) for i in p]
        return p[0]


    def input(self, p):
        ip = {}
        for i in p:
            ip.update({i: "INPUT"})
        return ("NET", ip)

    def output(self, p):
        op = {}
        for i in p:
            op.update({i: "OUTPUT"})
        return ("NET", op)

    def inout(self, p):
        iop = {}
        for i in p:
            iop.update({i: "INOUT"})
        return ("NET", iop)

    def wire(self, p):
        w = {}
        for i in p:
            w.update({i: "WIRE"})
        return ("NET", w)

    def component(self, p):
        es = []
        nd = (p[1], {comp_type: p[0]})
        for pin in p[2:]:
            es.append((p[1], pin[1], {"PIN": pin[0]}))
        return ("COMPONENT", {"node": nd, "edges": es})

    def cmp_port(self, p):
        return (p[0], p[1])


def test():
    test_file = "parallel_test_5_place.v"

    with open(test_file, 'r') as tf:
        tree = v_parser.parse(tf.read())
    tr_tree = Verilog_Transformer().transform(tree)
    # print(tr_tree)
    # tr_tree.show_plot()

if __name__ == "__main__":

    test()
