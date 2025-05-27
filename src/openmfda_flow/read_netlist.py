
from lark import Lark
from lark import Transformer

import networkx as nx
import matplotlib.pyplot as plt

import os
import re
import copy

from pprint import pp

import openmfda_flow.verilog_grammer as verilog_grammer

comp_type = "comp_type"

f_dir = os.path.abspath(os.path.dirname(__file__))
# v_parser = Lark.open(f"{f_dir}/verilog_grammer.lark", lexer='basic')
v_parser = verilog_grammer.import_verilog_parser()


class V_Graph():

    def __init__(self, module, graph=None):
        self.module = module
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


NET_TYPES = ['WIRE', 'INPUT', 'OUTPUT', 'INOUT']
PORT_TYPES = ['INPUT', 'OUTPUT', 'INOUT']


def reduce_to_primatives(v_graph_list):

    print("REDUCE TO PRIM")

    if isinstance(v_graph_list, dict):
        v_graph_list = list(v_graph_list.values())

    def get_submodule(mod_type):
        for m in v_graph_list:
            if m.module == mod_type:
                return m
        raise ValueError(f"Submodule {mod_type} not found in file")

    top_module = None

    v_mods = {}
    for m in v_graph_list:
        if m in v_mods:
            raise ValueError(
                "Multiple instances of defined module in verilog file")
        v_mods.update({m.module: {'is_submod': False}})

    print("Verilog modules: ", list(v_mods.keys()))

    for m in v_graph_list:
        m_name = m.module
        mG = m.get_graph()

        # fmt: off
        m_comps = [n
            for n in mG.nodes
                if 'comp_type' in mG.nodes[n] and \
                    mG.nodes[n]['comp_type'] not in NET_TYPES
        ]
        print("  Comp list: ", m_comps)
        # fmt: on

        # check if types of m_comps are modules
        for mc in m_comps:
            if mG.nodes[mc]['comp_type'] in v_mods:
                # point to sub_module
                mG.nodes[mc]['sub_module'] = get_submodule(
                    mG.nodes[mc]['comp_type']
                ).get_graph()
                v_mods[mG.nodes[mc]['comp_type']]['is_submod'] = True
                print(f" found {mc} as submodule")

    for vm in v_mods.items():
        if not vm[1]['is_submod']:
            if top_module is not None:
                raise ValueError("Multiple top modules found")
            top_module = get_submodule(vm[0]).module
            t_graph = get_submodule(vm[0]).get_graph()

    print("Top module: ", top_module)
    # need to replace port with wire

    def replace_ports_w_wire(top_mod):
        # fmt: off
        comp_nd = [n
                    for n in top_mod.nodes
                        if 'comp_type' in top_mod.nodes[n] and \
                            top_mod.nodes[n]['comp_type'] not in NET_TYPES
                   ]
        # fmt: on

        top_mod_cp = copy.deepcopy(top_mod)

        for c in comp_nd:
            if 'sub_module' in top_mod.nodes[c]:
                print(f'   submodule: {c}')
                submod_type = top_mod.nodes[c]['comp_type']
                # check for sub mods
                new_sub = replace_ports_w_wire(top_mod.nodes[c]['sub_module'])

                # copy graph
                sub_cp = copy.deepcopy(
                    get_submodule(submod_type).get_graph()
                )

                sub_wires = top_mod[c]
                print('    -wires: ', sub_wires)

                # change node names
                # for nd in get_submodule(submod_type).get_graph().nodes:
                remapping = {}
                new_edges = []
                for nd in top_mod[c]:
                    pin = top_mod[c][nd]['PIN']
                    # print('    ', nd, ': pin -',  pin)
                    remapping[pin] = nd
                    print("  NODE REMAP:", top_mod.nodes[nd])
                    if top_mod.nodes[nd]['comp_type'] == 'OUTPUT':
                        new_edges.append((c+'.'+nd, pin))
                    # if top_mod[c][nd]['PIN'] in ['OUTPUT']:
                    # new_edges.append((c+'.'+nd, ))
                print("  REMAPPING")
                pp(remapping)
                sub_cp = nx.relabel_nodes(sub_cp, remapping)

                # rename internal wires and components
                remapping_in = {}
                for nd in sub_cp:
                    if sub_cp.nodes[nd]['comp_type'] not in ['INPUT']:
                        remapping_in[nd] = c + '.' + nd

                print('\n     s.nd REMAP:')
                pp(remapping_in)

                sub_cp = nx.relabel_nodes(sub_cp, remapping_in)

                print('\n     s.nd new nodes')
                pp(list(sub_cp))

                # add graph to top mod
                top_mod_cp.remove_node(c)
                top_mod_cp = nx.compose(top_mod_cp, sub_cp)

                print("  OUTPUT edges")
                pp(new_edges)
                top_mod_cp.add_edges_from(new_edges)

        return top_mod_cp

    new_list = replace_ports_w_wire(t_graph)

    print('')
    pp(sorted(list(new_list.nodes)))

    nx.draw_spring(new_list, with_labels=1)
    plt.show()

    return new_list


def import_from_file(in_verilog, no_subs=False):
    with open(in_verilog, 'r') as tf:
        # remove comments
        f_str = re.subn('//[^\n]*', '', tf.read())[0]
        tree = v_parser.parse(
            f_str
        )
    if not no_subs:
        return Verilog_Transformer().transform(tree)
    else:
        return reduce_to_primatives(
            Verilog_Transformer().transform(tree)
        )


class Verilog_Transformer(Transformer):

    def start(self, p):
        if len(p) == 1:
            return p[0]
        else:
            return {
                g.module: g for g in p
            }

    def CNAME(self, t):
        return str(t)

    def module(self, p):
        m = {p[0]: {}}
        nets = {}
        G_net = nx.Graph()
        print("Reading module", p[0])
        for ind, t in enumerate(p[2:]):
            # if t[0][0] == "NET":
            if t[0] == "NET":
                print(t)
                nets.update(t[1])
            # elif t[0][0] == "COMPONENT":
            elif t[0] == "COMPONENT":
                print(t)
                # print(t[0][1]['node'])
                # print(t[0][1]['edges'])
                G_net.add_nodes_from([t[1]["node"]])
                G_net.add_edges_from(t[1]["edges"])
            else:
                raise ValueError(f"Unhandled rule: {t}")

        for n in nets.items():
            if n[0] not in G_net.nodes:
                print(f"Node {n[0]} not used in netlist")
            else:
                G_net.nodes[n[0]][comp_type] = n[1]
        m[p[0]]["graph"] = G_net

        print("Nodes:", G_net.nodes)
        print("Edges:", G_net.edges)

        # print('p[0]', p[0])
        return V_Graph(
            module=p[0],
            graph=G_net
        )

        # print(ind, t)

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
