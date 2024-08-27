# fmt:off
import networkx as nx
import numpy as np
import pandas as pd
import re
import csv
import ast

import SimulationXyce

import os
import json
import regex
import mmap
import copy
import logging


def add_probes_to_device(probes, netlist_graph):

    probe_list = []
    node = 'node'
    dev = 'device'

    if 'pressure' in probes:
        # TODO add dev to pressure probe call
        for p in probes['pressure']:
            print(p)
            if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                p_node = p.getNode()
                dev_node = list(netlist_graph[p.getNode()].keys())[0]
            else:
                p_node = p[node]
                dev_node = list(netlist_graph[p[node]].keys())[0]
            probe_list.append(f'V({p_node}_{dev_node})')

    if 'flow' in probes:
        for p in probes['flow']:
            if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                if p.getNode() not in netlist_graph.nodes:
                    logging.debug(f"Nodes in netlist:\n{netlist_graph.nodes}")
                    raise KeyError(f"Probe for node {p.getNode()} not in netlist")
                dev_node = list(netlist_graph[p.getNode()].keys())[0]
                pr_node  = p.getNode()
            else:
                if p[node] not in netlist_graph.nodes:
                    logging.debug(f"Nodes in netlist:\n{netlist_graph.nodes}")
                    raise KeyError(f"Probe for node {p[node]} not in netlist")
                dev_node = list(netlist_graph[p[node]].keys())[0]
                pr_node  = p[node]

            # netlist_graph.remove_edge(p[node], p[dev])
            flow_probe = f"vpr_{pr_node}_{dev_node}"
            # new_probe_nodes = [
                # (f"{p[node]}_{p[dev]}_pr", {
                    # 'node_type':'connection',
                    # 'chem_wire':p[node]}),
                # (f"{flow_probe}", {
                    # 'node_type':'flow_probe',
                    # 'device':p[dev],
                    # 'param':{'':'0'}})
                    # ]
            if "flow_probe" not in netlist_graph.nodes[dev_node]:
                netlist_graph.nodes[dev_node]["flow_probe"] = []
            netlist_graph.nodes[dev_node]["flow_probe"].append([pr_node])
            # new_es = []
            # new_es.append((new_probe_nodes[0][0], p[dev]))
            # new_es.append((new_probe_nodes[0][0], new_probe_nodes[1][0]))
            # new_es.append((new_probe_nodes[1][0], new_probe_nodes[2][0]))
            # new_es.append((new_probe_nodes[1][0], p[node]))

            # netlist_graph.add_nodes_from(new_probe_nodes)
            # netlist_graph.add_edges_from(new_es)

            probe_list.append(f'I({flow_probe})')

    if 'pressureNode' in probes:
        for p in probes['pressureNode']:
            if p in probes['flow']:
                # we don't need to edit the netlist after flow probes have been placed
                if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                    probe_list.append(f'V({p.getNode()}_{p.getDevice()}_pr)')
                else:
                    probe_list.append(f'V({p[node]}_{p[dev]}_pr)')
            else:
                netlist_graph.remove_edge(p[node], p[dev])
                new_probe_nodes = [
                    (f"{p[node]}_{p[dev]}_pr", {
                        'node_type':'connection',
                        'chem_wire':p[node]}),
                    (f"vpr_{p[node]}_{p[dev]}", {
                        'node_type':'pressure_probe',
                        'device':p[dev],
                        'param':{'':'0'}})
                        ]
                # new_probe_node = (f"", {
                #    'node_type':'pressure_probe',
                #    'device': p[dev]})
                new_es = []
                new_es.append((new_probe_nodes[0][0], p[dev]))
                new_es.append((new_probe_nodes[0][0], new_probe_nodes[1][0]))
                # new_es.append((new_probe_nodes[1][0], new_probe_nodes[2][0]))
                new_es.append((new_probe_nodes[1][0], p[node]))

                netlist_graph.add_nodes_from(new_probe_nodes)
                netlist_graph.add_edges_from(new_es)
                # same as if in list
                if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                    probe_list.append(f'V({p.getNode()}_{p.getDevice()}_pr)')
                else:
                    probe_list.append(f'V({p[node]}_{p[dev]}_pr)')

    # concentration probes are assumed (<connect_name>_chem)
    if 'concentration' in probes:
        for p in probes['concentration']:
            print(p)
            if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                if p.getNode() not in netlist_graph.nodes:
                    logging.debug(f"Nodes in netlist:\n{netlist_graph.nodes}")
                    raise KeyError(f"Probe for node {p.getNode()} not in netlist")
                dev_node = list(netlist_graph[p.getNode()].keys())[0]
                pr_node  = p.getNode()
            else:
                if p[node] not in netlist_graph.nodes:
                    logging.debug(f"Nodes in netlist:\n{netlist_graph.nodes}")
                    raise KeyError(f"Probe for node {p[node]} not in netlist")
                dev_node = list(netlist_graph[p[node]].keys())[0]
                pr_node  = p[node]

            # check for existing probes
            if f'V({pr_node}_{dev_node}_chem)' not in probe_list:
                dev_node = list(netlist_graph[pr_node].keys())[0]
                probe_list.append(f'V({pr_node}_{dev_node}_chem)')

    if 'concentrationNode' in probes:
        for p in probes['concentrationNode']:
            # explicit chem node dev
            if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                if p.getNode() not in netlist_graph.nodes:
                    logging.debug(f"Nodes in netlist:\n{netlist_graph.nodes}")
                    raise KeyError(f"Probe for node {p.getNode()} not in netlist")
                pr_node  = p.getNode()
                dev_node = p.getDevice()
            else:
                pr_node = p[node]
                dev_node = p[dev]

            if "chem_probe" not in netlist_graph.nodes[dev_node]:
                netlist_graph.nodes[dev_node]["chem_probe"] = []
            # handled by downstream instructions
            # add node as property in netlist
            netlist_graph.nodes[dev_node]["chem_probe"].append([pr_node])

            # node to probe list to print
            if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                #probe_list.append(f'V(vchpr_{p.getNode()}_{p.getDevice()}_chem)')
                probe_list.append(f'V({p.getNode()}_{p.getDevice()}_chem_pr)')
            else:
                probe_list.append(f'V({p[node]}_{p[dev]}_chem_pr)')

    return probe_list, netlist_graph

def generate_source_list(spice_config_class, has_chem=False):

    dev_lines = {}


    for key, dev in spice_config_class.getDeviceList().items():
        dev_lines[dev.getNode()] = [
            dev.getType(),
            f'{dev.getNode()}_dev',
            f'{dev.getNode()}_in']
        # adds chem port
        if has_chem:
            dev_lines[dev.getNode()].append(f"{dev.getNode()}_in_chem")
        # adds arguments
        if isinstance(dev.getArgs(), dict):
            for key, val in dev.getArgs().items():
                dev_lines[dev.getNode()].append(f'{key}={val}')
        elif isinstance(dev.getArgs(), list):
            for a in dev.getArgs():
                dev_lines[dev.getNode()].append(a)
        elif isinstance(dev.getArgs(), str):
            dev_lines[dev.getNode()].append(dev.getArgs())

    chem_args = {}
    #print(spice_config_class.getInputChemList())
    if has_chem:
        for key, chem in spice_config_class.getInputChemList().items():
            if isinstance(chem, SimulationXyce.SimulationXyce.ChemInput):
                chem_args[key] = {chem.getNode():chem.getInValue()}
            if isinstance(chem, list):
                chem_args[key] = {}
                for c in chem:
                    chem_args[key][c.getNode()] = chem.getInValue()

    return dev_lines, chem_args

def generate_time_lines(spice_config_class):
    # returns a list

    out_lines = []
    if 'transient' in spice_config_class.getSimulationTimes():
        for t in spice_config_class.getSimulationTimes()['transient']:
            out_lines.append(['.tran']+t[1:])
    if 'static' in spice_config_class.getSimulationTimes():
        for t in spice_config_class.getSimulationTimes()['static']:
            out_lines.append(['.dc']+t[1:])

    return out_lines


def merge_wl_net(in_g, wl_g, node, wl_file=None,
    debug_node = False, debug_edge = False, debug_draw=False):

    mapping = {}
    print("Node:", node)
    print(wl_g.nodes)
    print(wl_g.edges)
    # print(wl_file)
    print([n for n in wl_g.nodes if n in in_g.nodes and n != node])
    for common_node in [n for n in wl_g.nodes if n in in_g.nodes]:
        for prop in in_g.nodes[common_node].items():
            wl_g.nodes[common_node][prop[0]] = in_g.nodes[common_node][prop[0]]

    if wl_file is not None:
        node_wl_dict = wl_file[node]
    for n in list(wl_g.nodes):
        if re.match(r'br_\d_\d', str(n)) is not None:
            br_pt = True
            mapping[n] = f"{node}_{n}"
            wl_g.nodes[n]['virt_node'] = ''
        else:
            br_pt = False
        if n not in node_wl_dict and not br_pt and n not in in_g.nodes:
            print("Removing node:", n)
            wl_g.remove_node(n)
            continue
        if len(str(n)) > 0 and \
        (str(n)[0] in [str(i) for i in range(0,10)] and not br_pt):
            wl_g.nodes[n]['route'] = None
            wl_g.nodes[n]['node_type'] = 'wire'
            wl_g.nodes[n]['chan_len'] = node_wl_dict[n]
            for con_n in wl_g[n]:
                #if re.match(r'br_\d_\d', str(n)) is not None:
                wl_g.edges[(n, con_n)]['fl_net'] = {
                    f"{node}_{con_n}"
                }
                wl_g.edges[(n, con_n)]['ch_net'] = {
                    f"{node}_{con_n}_chem"
                }
            mapping[n] = f"{node}_{n}"
    wl_g = nx.relabel_nodes(wl_g, mapping)

    if in_g.nodes[node]['node_type'] in ['input', 'output']:
        if len(wl_g[node]) == 1:
            conn_node = list(wl_g[node])[0]
            print("New input/output node:", conn_node)
            # the regex if different now
            # Checks name if break point
            if re.match(r'[\w_]+_br_\d_\d', str(conn_node)) is not None:
                for conn_node2 in list(wl_g[conn_node]):
                    print(conn_node2)
                    wl_g.nodes[conn_node2]['node_type'] = wl_g.nodes[node]['node_type']
                    wl_g.nodes[conn_node2]['input_node'] = node
                    # wl_g.edges[(conn_node2, )]['fl_net'] = {
                    #     f"{node}_{con_n}"
                    # }
                    # wl_g.edges[(n, con_n)]['ch_net'] = {
                    #     f"{node}_{con_n}_chem"
                    # }
                wl_g.nodes[node]['virt_node'] = ''
            else:
                wl_g.nodes[conn_node]['node_type'] = wl_g.nodes[node]['node_type']
                if wl_g.nodes[node]['node_type'] == 'input':
                    wl_g.nodes[conn_node]['input_node'] = node
                wl_g.nodes[node]['virt_node'] = ''
        #for conn_node in list(wl_g[node]):
        #    conn_node = list(wl_g[node])[0]
        #    wl_g.nodes[conn_node]['node_type'] = wl_g.nodes[node]['node_type']
        #    wl_g.nodes[node]['virt_node'] = ''
        else:
            raise Exception(f"Too many nodes connected to {node}; nodes {in_g[node]}")

    in_g.remove_node(node)
    in_g = nx.compose(in_g, wl_g)

    # write nodes and edges to terminal

    if node == 'soln2':
        debug_node = True
        debug_edge = True
    # debug_draw = True
    if debug_node:
        print("Wirelength nodes: ")
        for n in wl_g.nodes:
            print(n)
            print(wl_g.nodes[n])
        print("Result nodes: ")
        for n in in_g.nodes:
            print(n)
            print(in_g.nodes[n])
    if debug_edge:
        print("Wirelength edges: ")
        for e in wl_g.edges:
            print(e)
            print(wl_g.get_edge_data(e[0], e[1]))
        print("Result edges: ")
        #for e in in_g.edges:
        #    print(e)
        #    print(in_g.nodes[n])
    if debug_draw:
        import matplotlib.pyplot as plt
        nx.draw_spring(wl_g, with_labels=True)
        plt.show()
        nx.draw_spring(in_g, with_labels=True)
        plt.show()

    return in_g


def generate_spice_nets(in_netlist,
                        # probes_list,
                        # source_lines,
                        length_list=None,
                        add_prn_to_list=False,
                        pcell_file=None,
                        wl_graph=None
                        ):

    if length_list is None:
        no_lengths = True
    else:
        no_lengths = False
        len_df = get_length_list(length_list)

    if 'XYCE_WL_GRAPH' in os.environ:
        from networkx.readwrite import json_graph
        wl_graph_f = ''
        if wl_graph is None:
            wl_graph_f = length_list.replace('_length.csv', '_route_nets.json')
        wl_graph = {}
        print("Reading: ", wl_graph_f)
        with open(wl_graph_f, 'r') as f:
            json_f = json.load(f)
            for r in json_f.items():
                new_graph = json_graph.node_link_graph(r[1])
                if len(new_graph.nodes) > 1:
                    wl_graph[r[0]] = new_graph
                #for wl_n in wl_graph.items():
                #    merge_wl_net(in_netlist, wl_n[1], wl[0])
        print("Loading graph:", wl_graph_f)
        # unset variable
        # os.environ.pop('XYCE_WL_GRAPH')



    def add_fl_net_2_edge(g, edge, net_name):
        if 'fl_net' in g.edges[edge]:
            if net_name == g.edges[edge]['fl_net']:
                print(f"  Net {net_name} already added to {edge}")
            else:
                raise Exception(f"Conflicting net names adding {net_name}, already {g.edges[edge]['fl_net']}")
        else:
            g.edges[edge]['fl_net'] = net_name

    def add_ch_net_2_edge(g, edge, net_name):
        if 'ch_net' in g.edges[edge]:
            if net_name == g.edges[edge]['ch_net']:
                print(f"  Net {net_name} already added to {edge}")
            else:
                raise Exception(f"Conflicting net names adding {net_name}, already {g.edges[edge]['ch_net']}")
        else:
            g.edges[edge]['ch_net'] = net_name

    for node in list(in_netlist.nodes):

        ############# IF INPUT #############

        if in_netlist.nodes[node]['node_type'] == 'input':
            # and (not no_lengths):
            if no_lengths:
                wl = 0.01
            elif isinstance(len_df, pd.DataFrame):
                wl = len_df.loc[node]["length (mm)"]
            elif isinstance(len_df, dict):
                wl = len_df[node] #["length (mm)"]

            if node == 'soln2':
                print(wl)
                #raise Exception()

            if isinstance(wl, float):
                in_netlist.nodes[node]['chan_len'] = wl
                node_edges = list(in_netlist.edges(node))

                if len(node_edges) == 1:
                    comp_node = list(in_netlist[node])[0]
                    input_fluid_net = f"{node}_{comp_node}"
                    input_chem_net  = f"{node}_{comp_node}_chem"
                    add_fl_net_2_edge(in_netlist, node_edges[0], input_fluid_net)
                    add_ch_net_2_edge(in_netlist, node_edges[0], input_chem_net)
                    # in_netlist.edges[node_edges[0]]['fl_net'] = input_fluid_net
                    # in_netlist.edges[node_edges[0]]['ch_net'] = input_chem_net
                else:
                    raise Exception(f"Too many nodes in input, {node_edges}. This will be handled by a net parser, the length file is invalid")
            elif isinstance(wl, dict):
                print(f"connecting net {node}")
                if wl_graph is None:
                    print(f"failed to connect graph, {('XYCE_WL_GRAPH' in os.environ)}")
                in_netlist = merge_wl_net(in_netlist, wl_graph[node], node, wl_file=len_df)
            else:
                pass

        ############# IF OUTPUT #############

        elif in_netlist.nodes[node]['node_type'] == 'output':
            # TODO check if output as dev
            #print(len_df)
            if no_lengths:
                wl = 0.01
            elif isinstance(len_df, pd.DataFrame):
                wl = len_df.loc[node]["length (mm)"]
            elif isinstance(len_df, dict):
                wl = len_df[node] #["length (mm)"]

            if isinstance(wl, float):
                in_netlist.nodes[node]['chan_len'] = wl
                node_edges = list(in_netlist.edges(node))

                if len(node_edges) == 1:
                    comp_node = list(in_netlist[node])[0]
                    output_fluid_net = f"{node}_{comp_node}"
                    output_chem_net  = f"{node}_{comp_node}_chem"
                    add_fl_net_2_edge(in_netlist, node_edges[0], output_fluid_net)
                    add_ch_net_2_edge(in_netlist, node_edges[0], output_chem_net)
                    # in_netlist.edges[node_edges[0]]['fl_net'] = output_fluid_net
                    # in_netlist.edges[node_edges[0]]['ch_net'] = output_chem_net
                else:
                    raise Exception(f"Too many nodes in input, {node_edges}. This will be handled by a net parser, the length file is invalid")
            elif isinstance(wl, dict):
                in_netlist = merge_wl_net(in_netlist, wl_graph[node], node, wl_file=len_df)
            else:
                pass

        ############# IF WIRE #############

        elif in_netlist.nodes[node]['node_type'] == 'wire':
            # and (not no_lengths):
            if no_lengths:
                wl = 0.01
            elif isinstance(len_df, pd.DataFrame):
                wl = len_df.loc[node]["length (mm)"]
            elif isinstance(len_df, dict):
                print("len df", len_df)
                wl = len_df[node] #["length (mm)"]

            if isinstance(wl, float):
                in_netlist.nodes[node]['chan_len'] = wl
                node_edges = list(in_netlist.edges(node))

                if len(node_edges) == 2:
                    for comp_node in in_netlist[node]:
                        print("comp node :", comp_node, "wire node: ", node)
                        chan_fluid_net = f"{node}_{comp_node}"
                        chan_chem_net  = f"{node}_{comp_node}_chem"
                        add_fl_net_2_edge(in_netlist, (comp_node, node), chan_fluid_net)
                        add_ch_net_2_edge(in_netlist, (comp_node, node), chan_chem_net)
                        # in_netlist.edges[(node, comp_node)]['fl_net'] = chan_fluid_net
                        # in_netlist.edges[(node, comp_node)]['ch_net'] = chan_chem_net
                else:
                    raise Exception(f"Too many nodes in input, {node_edges}. This will be handled by a net parser, the length file is invalid")
            elif isinstance(wl, dict):
                in_netlist = merge_wl_net(in_netlist, wl_graph[node], node, wl_file=len_df)
            else:
                pass

    return in_netlist


def write_components_from_graph(in_g, of, pcell_dict={}):

    if isinstance(of, str):
        of = open(of, 'w+')

    in_nodes = []
    out_nodes = []
    wire_nodes = []
    oth_nodes = []

    new_probes = []
    probe_2_write = []

    chan_comp = 'Ychannel'

    for n in in_g.nodes:
        # these are handled by the graph wires
        if 'virt_node' in in_g.nodes[n]:
            continue
        if in_g.nodes[n]['node_type'] == 'input':
            in_nodes.append(n)
        elif in_g.nodes[n]['node_type'] == 'output':
            out_nodes.append(n)
        elif in_g.nodes[n]['node_type'] == 'wire':
            wire_nodes.append(n)
        else:
            oth_nodes.append(n)

    print("IN nodes", in_nodes,'\nOUT nodes', out_nodes, '\nCHAN nodes', wire_nodes, '\nCOMP nodes', oth_nodes)

    # write nodes
    for i_n in in_nodes:
        try:
            e = list(in_g.edges(i_n))[0]
            e_fl = in_g[e[0]][e[1]]['fl_net']
            e_ch = in_g[e[0]][e[1]]['ch_net']
        except KeyError:
            raise KeyError(f"Net node properly made for edge {e}, node {i_n}")
        if isinstance(e_fl, set):
            e_fl = list(e_fl)[0]
        if isinstance(e_ch, set):
            e_ch = list(e_ch)[0]
        wl = in_g.nodes[i_n]['chan_len']
        if 'input_node' in in_g.nodes[i_n]:
            inst_n = i_n  # instance captured so it is unique
            i_n = in_g.nodes[i_n]['input_node']  # syncs up with pump nodes
            of.write(f"{chan_comp} {inst_n} {i_n}_in {e_fl} {i_n}_in_chem {e_ch} length={wl}\n")
        else:
            of.write(f"{chan_comp} {i_n} {i_n}_in {e_fl} {i_n}_in_chem {e_ch} length={wl}\n")

    of.write('\n\n')

    for w_n in wire_nodes:
        e = list(in_g.edges(w_n))
        print(f"edges of node {w_n}: {e}")
        e_fl1 = in_g[e[0][0]][e[0][1]]['fl_net']
        e_ch1 = in_g[e[0][0]][e[0][1]]['ch_net']
        e_fl2 = in_g[e[1][0]][e[1][1]]['fl_net']
        e_ch2 = in_g[e[1][0]][e[1][1]]['ch_net']
        if isinstance(e_fl1, set):
            e_fl1 = list(e_fl1)[0]
        if isinstance(e_fl2, set):
            e_fl2 = list(e_fl2)[0]
        if isinstance(e_ch1, set):
            e_ch1 = list(e_ch1)[0]
        if isinstance(e_ch2, set):
            e_ch2 = list(e_ch2)[0]
        wl = in_g.nodes[w_n]['chan_len']
        of.write(f"{chan_comp} {w_n} {e_fl1} {e_fl2} {e_ch1} {e_ch2} length={wl}\n")

    of.write('\n\n')

    for o_n in out_nodes:
        try:
            e = list(in_g.edges(o_n))[0]
            e_fl = in_g[e[0]][e[1]]['fl_net']
            e_ch = in_g[e[0]][e[1]]['ch_net']
        except KeyError:
            raise KeyError(f"Net node properly made for edge {e}, node {o_n}")
        if isinstance(e_fl, set):
            e_fl = list(e_fl)[0]
        if isinstance(e_ch, set):
            e_ch = list(e_ch)[0]
        wl = in_g.nodes[o_n]['chan_len']
        of.write(f"{chan_comp} {o_n} {e_fl} 0 {e_ch} {o_n}_out_chem length={wl}\n")

    of.write('\n\n')

    # if pcell_file is not None:
        # reader = csv.DictReader(open(len_file, 'r'))
        # pcell_ref = {}
        # for r in reader:
            # pcell_ref[r['lef']] = {"cell_name":r['cell_name'], "parameters":r['parameters']}
            # r['length (mm)'] = ast.literal_eval(r['length (mm)'])
    # else:
        # pcell_ref = {}

    print("PCELL DICT", pcell_dict)

    # component nodes
    for oth_n in oth_nodes:
        try:
            # get edge nets
            es = list(in_g.edges(oth_n))
            fl_wr = list([in_g.get_edge_data(e[0],e[1])['fl_net'] for e in es])
            ch_wr = list([in_g.get_edge_data(e[0],e[1])['ch_net'] for e in es])
        except KeyError:
            raise KeyError(f"Net node not properly made for edges {es}, node {oth_n}")
        #print(fl_wr)
        #print(ch_wr)
        for ind, l_i in enumerate(fl_wr):
            if isinstance(l_i, set):
                fl_wr[ind] = list(l_i)[0]
        for ind, l_i in enumerate(ch_wr):
            if isinstance(l_i, set):
                ch_wr[ind] = list(l_i)[0]
                #wire_reg = w + r"_\d_\d"
        #print(fl_wr)
        #print(ch_wr)
        # organize the ports
        #  TODO write to look at the module headers; this is hard coded
        port_n = []
        if len(fl_wr) == 2:
            port_n.append(in_g.nodes[oth_n]['in_fluid'])
            port_n.append(in_g.nodes[oth_n]['out_fluid'])
        if len(fl_wr) == 3:
            port_n.append(in_g.nodes[oth_n]['a_fluid'])
            port_n.append(in_g.nodes[oth_n]['b_fluid'])
            port_n.append(in_g.nodes[oth_n]['out_fluid'])

        #  TODO move to edge writing
        fl_wr_new = []
        ch_wr_new = []
        for pn in port_n:
            fl_wr_new.append(f"{pn}_{oth_n}")
            ch_wr_new.append(f"{pn}_{oth_n}_chem")

        fl_wr = ' '.join(fl_wr_new)
        ch_wr = ' '.join(ch_wr_new) + ' '

        # directly replace probe the string
        if "chem_probe" in in_g.nodes[oth_n]:
            ch_wr = re.sub(r'[ ]+', ' ',ch_wr).split(' ')
            for w in in_g.nodes[oth_n]["chem_probe"]:
                #print(w, oth_n)
                ch_wire = w[0] + "_" + oth_n + "_chem"
                re_ch_wire = w[0] + "_" + oth_n + "_chem_pr"
                for i, wr in enumerate(ch_wr):
                    if wr == ch_wire:
                        ch_wr[i] = re_ch_wire
                # ch_wr = [re_ch_wire if ch_wire else item for item in ch_wr]
                probe_2_write.append([
                    'vch_'+w[0]+'_'+oth_n,
                    ch_wire,
                    re_ch_wire,
                    '0V'
                ])
                print(ch_wr)
            ch_wr = ' '.join(ch_wr)

        if in_g.nodes[oth_n]['node_type'] not in pcell_dict:
            of.write(f"Y{in_g.nodes[oth_n]['node_type']} {oth_n} {fl_wr} {ch_wr}\n")
        else:
            pcell_node_type = pcell_dict[in_g.nodes[oth_n]['node_type']]['pcell']
            pcell_node_param = pcell_dict[in_g.nodes[oth_n]['node_type']]['params']
            of.write(f"Y{pcell_node_type} {oth_n} {fl_wr} {ch_wr} {pcell_node_param}\n")

    of.write('\n\n')
    for pr in probe_2_write:
        of.write(re.sub(r'[ ]+', ' ', ' '.join(pr)+'\n'))

    of.write('\n\n')

    return new_probes


def write_time_lines(spice_config_class):
    pass

def write_spice_file(in_netlist, probes_list, source_lines, sims_time_lines=None, 
    sim_type=None, length_list=None, chem_list=None, out_file=None, 
    add_prn_to_list=False, basename_only=False, pcell_file=None, wl_graph=None):

    dev = "dev"

    conn_channel = 'Ychannel'

    if out_file is None:
        out_file = 'out_spice'
    if out_file.split('.')[-1] == 'cir':
        out_file = '.'.join(out_file.split('.')[:-1])

    if chem_list is None or len(chem_list)==0:
        chem_list = {'':''}
        no_chems  = True
    else:
        no_chems = False

    if 'XYCE_WL_GRAPH' in os.environ or wl_graph is not None:
        if wl_graph is None:
            wl_graph = length_list.replace('_length.csv', '_route_nets.json')
    # if length_list == None:
    #     no_lengths = True
    # else:
    #     no_lengths = False
    #     len_df = get_length_list(length_list)

    pc_dict = {}
    if isinstance(pcell_file, str):
        has_pcells = True
        with open(pcell_file, 'r+') as pc_if:
            import csv
            pc_reader = csv.reader(pc_if)
            for i, row in enumerate(pc_reader):
                if i == 0:
                    continue
                else:
                    pc_dict[row[0]] = {'pcell':row[1], 'params':row[2]}
    else:
        has_pcells = False

    output_file_list = []

    for chem, chem_node_dict in chem_list.items():
        
        chem_out_file = f'{out_file}_{chem}.cir.str'

        if basename_only:
            output_file_entry = {
            'Chemical':chem,
            'spice_str_file':chem_out_file,
            'spice_file':os.path.basename(chem_out_file)[:-4]}
            if add_prn_to_list:
                output_file_entry['OutputFile'] = os.path.basename(chem_out_file)[:-4]+'.prn'
        else:
            output_file_entry = {
                'Chemical':chem,
                'spice_str_file':chem_out_file,
                'spice_file':chem_out_file[:-4]}
            if add_prn_to_list:
                a, b = os.path.split(chem_out_file)
                # output_file_entry['OutputFile'] = a + "/results/" + b[:-4]+'.prn'
                output_file_entry['OutputFile'] = a + "/" + b[:-4]+'.prn'


        output_file_list.append(output_file_entry)

        if not os.path.isdir(os.path.dirname(chem_out_file)):
            os.mkdir(os.path.dirname(chem_out_file))
        c_of = open(chem_out_file, 'w+')

        c_of.write(f"* Simulation of device {dev}; chem: {chem}\n")
        
        chem_source_list = copy.deepcopy(source_lines)
        if isinstance(chem_node_dict, dict):
            for node, val in chem_node_dict.items():
                chem_source_list[node].append(f'chemConcentration={val}')

        # write inputs and connections
        for node, line in chem_source_list.items():
            line[0] = "Y"+line[0]
            new_line = line+['\n']
            #if not no_lengths:
            #    new_line += [
            #        conn_channel, f'{node}_chan', f'{node}_0', f'{node}_1'
            #    ]
            #    if not no_chems:
            #        new_line += [f'{node}_0_chem', f'{node}_1_chem']
            #    new_line += ['length='+str(length_list['wire'][node]), '\n']
            #new_line += ['\n']
            new_line = ' '.join(new_line)

            c_of.write(new_line)

        wire_connections = {}
        probe_wires = [[],[]]

        in_netlist_temp = copy.deepcopy(in_netlist)
        in_netlist_ch = generate_spice_nets(in_netlist_temp, length_list)

        new_probes = write_components_from_graph(in_netlist_ch, c_of, pc_dict)

        # for node in in_netlist.nodes:
        #     chem_nodes = ''
        #
        #     ########### IF INPUT #############
        #
        #     if in_netlist.nodes[node]['node_type'] == 'input':
        #         # and (not no_lengths):
        #         wl = len_df.loc[node]["length (mm)"]
        #         
        #         if isinstance(wl, float):
        #             in_netlist.nodes[node]['chan_len'] = wl
        #             node_edges = list(in_netlist.edges(node))
        #             
        #             if len(node_edges) == 1:
        #                 input_fluid_net = f"{node}_{in_netlist[node]}"
        #                 input_chem_net  = f"{node}_{in_netlist[node]}_chem"
        #                 in_netlist.edges[node_edges[0]]['fl_net'] = input_fluid_net
        #                 in_netlist.edges[node_edges[0]]['ch_net'] = input_chem_net
        #             else:
        #                 raise Exception(f"Too many nodes in input, {node_edges}. This will be handled by a net parser, the length file is invalid")
        #         else:
        #             pass
        #             
        #         ##### for removal #####    
        #         #chem_nodes=f'{node}_in_chem '
        #         #fluid_nodes=f'{node}_in '
        #         ## TODO is this for loop necessary
        #         ##for ind, conn_node in enumerate(in_netlist[node]):
        #         #conn_node = list(in_netlist[node])[0]
        #         #if len(in_netlist[node]) == 1:
        #         #    if "chem_connection" in in_netlist.nodes[node]:
        #         #        chem_nodes +=f"{in_netlist.nodes[node]['chem_connection']} "
        #         #    else:
        #         #        chem_nodes += f"{node}_{conn_node}_chem "
        #         #else:
        #         #    chem_nodes += f"{node}_channel_out_chem "
        #
        #         #if in_netlist.nodes[conn_node]["node_type"] == "wire" or \
        #         #    len(in_netlist[node]) > 1:
        #         #    fluid_nodes += f"{node}_channel_out "
        #         #else:    
        #         #    fluid_nodes += f"{node}_{conn_node} "
        #
        #
        #         #input_line = f"{conn_channel} {node} {fluid_nodes} {chem_nodes}length={wl}m"
        #         #c_of.write(input_line+'\n')
        #
        #     ########### IF OUTPUT #############
        #     
        #     elif in_netlist.nodes[node]['node_type'] == 'output':
        #         # TODO check if output as dev
        #         #print(len_df)
        #         wl = len_df.loc[node]["length (mm)"]
        #         
        #         if isinstance(wl, float):
        #             in_netlist.nodes[node]['chan_len'] = wl
        #             node_edges = list(in_netlist.edges(node))
        #             
        #             if len(node_edges) == 1:
        #                 output_fluid_net = f"{node}_{in_netlist[node]}"
        #                 output_chem_net  = f"{node}_{in_netlist[node]}_chem"
        #                 in_netlist.edges[node_edges[0]]['fl_net'] = output_fluid_net
        #                 in_netlist.edges[node_edges[0]]['ch_net'] = output_chem_net
        #             else:
        #                 raise Exception(f"Too many nodes in input, {node_edges}. This will be handled by a net parser, the length file is invalid")
        #         else:
        #             pass
        #
        #         ##### for removal #####
        #         #chem_nodes=''
        #         #fluid_nodes=''
        #         #print(node, len(in_netlist[node]))
        #         #for ind, conn_node in enumerate(in_netlist[node]):
        #         #    if len(in_netlist[node]) == 1:
        #         #        if "chem_connection" in in_netlist.nodes[node] and \
        #         #            conn_node == in_netlist.nodes[node]["chem_connection"]["oth_node"]:
        #         #            chem_nodes +=f"{in_netlist.nodes[node]['chem_connection']['node']} "
        #         #        else:
        #         #            chem_nodes += f"{node}_{conn_node}_chem "
        #         #    elif ind == 0:
        #         #        chem_nodes += f"{node}_in_chem "
        #         #    else:
        #         #        pass
        #
        #         #    if len(in_netlist[node]) > 1 and \
        #         #        ind == 0:
        #         #        fluid_nodes += f"{node}_in "
        #         #    elif ind == 0:
        #         #        fluid_nodes += f"{node}_{conn_node} "
        #         #chem_nodes += f'{node}_out_chem '
        #         #output_line = f"{conn_channel} {node} {fluid_nodes} 0 {chem_nodes}length={wl}m"
        #         #c_of.write(output_line+'\n')
        #
        #     ########### IF WIRE #############
        #
        #     elif in_netlist.nodes[node]['node_type'] == 'wire':
        #         # and (not no_lengths):
        #         if no_lengths:
        #             wl = 0.01
        #         else:
        #             wl = len_df.loc[node]["length (mm)"]
        #
        #         if isinstance(wl, float):
        #             in_netlist.nodes[node]['chan_len'] = wl
        #             node_edges = list(in_netlist.edges(node))
        #             
        #             if len(node_edges) == 2:
        #                 for comp_node in in_netlist[node]:
        #                     chan_fluid_net = f"{node}_{comp_node}"
        #                     chan_chem_net  = f"{node}_{comp_node}_chem"
        #                     in_netlist.edges[(node, comp_node)]['fl_net'] = chan_fluid_net
        #                     in_netlist.edges[(node, comp_node)]['ch_net'] = chan_chem_net
        #             else:
        #                 raise Exception(f"Too many nodes in input, {node_edges}. This will be handled by a net parser, the length file is invalid")
        #         else:
        #             pass
        #
        #
        #         #chem_nodes=''
        #         #fluid_nodes=''
        #         #if len(in_netlist[node]) == 2:
        #         #    for ind, conn_node in enumerate(in_netlist[node]):
        #         #        # is a chemical node
        #         #        if "chem_connection" in in_netlist.nodes[node] and \
        #         #            conn_node == in_netlist.nodes[node]["chem_connection"]["oth_node"]:
        #         #            chem_nodes +=f"{in_netlist.nodes[node]['chem_connection']['node']} "
        #         #        # is a probe; TODO interaction of chem and conn nodes
        #         #        #elif in_netlist.nodes[conn_node]["node_type"] == "flow_probe" or \
        #         #            #in_netlist.nodes[conn_node]["node_type"] == "pressure_probe":
        #         #            #chem_nodes += f"{node}_{in_netlist.nodes[conn_node]['device']}_chem "
        #         #        else:
        #         #            chem_nodes += f"{node}_{conn_node}_chem "
        #         #        if in_netlist.nodes[conn_node]["node_type"] == "flow_probe" or \
        #         #            in_netlist.nodes[conn_node]["node_type"] == "pressure_probe":
        #         #            fluid_nodes += f"{node}_{in_netlist.nodes[conn_node]['device']}_pr "
        #         #        else:
        #         #            fluid_nodes += f"{node}_{conn_node} "
        #         #else:
        #         #    fluid_nodes = f'{node}_in {node}_out '
        #         #    chem_nodes  = f'{node}_in_chem {node}_out_chem '
        #
        #         #wire_line = f"{conn_channel} {node} {fluid_nodes} {chem_nodes}length={wl}m"
        #         #c_of.write(wire_line+'\n')
        #     elif in_netlist.nodes[node]['node_type'] == 'connection':
        #         continue
        #     #elif in_netlist.nodes[node]['node_type'] == 'flow_probe':
        #     #    print()
        #     #    vp_conn_nodes = in_netlist[node]
        #     #    probe_line = f"{node}"
        #
        #     ########### IF COMPONENT #############
        #
        #     else: # is component
        #         comp_type = in_netlist.nodes[node]['node_type']
        #         print(in_netlist[node])
        #         if comp_type != "flow_probe" and \
        #             comp_type != "pressure_probe" and \
        #             comp_type != "concentration_probe":
        #             # changes to pcell definition
        #             # later appends params
        #             if has_pcells:
        #                 is_pcell = False
        #                 pcell_params = ''
        #                 if comp_type in pc_dict:
        #                     pcell_params = ' '+pc_dict[comp_type]['params']
        #                     comp_type = pc_dict[comp_type]['pcell']
        #                     is_pcell = True
        #             comp_line = f"Y{comp_type} {node} "
        #             chem_line = ''
        #         else:  # not a probe
        #             comp_line = f"{node} "
        #             chem_line = ''
        #
        #
        #         # iterate through adjacent nodes
        #         for comp_net in in_netlist[node]:
        #             # no_wire = (n not in wire_connections)
        #             # zero_wire = (n in wire_connections) and (wire_connections[n] == 0)
        #
        #             wire_edges = len(in_netlist[comp_net])
        #
        #             if in_netlist.nodes[comp_net]["node_type"] == 'input':
        #                 if wire_edges == 1:
        #                     # comp_line += f"{comp_net}_{node} "
        #                     in_netlist.edges[(comp_net, node)]['fl_net'] = f"{comp_net}_{node}"
        #                     in_netlist.edges[(comp_net, node)]['ch_net'] = f"{comp_net}_{node}_chem"
        #                 else:
        #                     raise Exception(f"Too many nodes connected to input {in_netlist[comp_net]}")
        #                     # comp_line += f"{comp_net}_in "
        #                 
        #             elif in_netlist.nodes[comp_net]["node_type"] == 'output':
        #                 if wire_edges == 1:
        #                     # comp_line += f"{comp_net}_{node}"
        #                     in_netlist.edges[(comp_net, node)]['fl_net'] = f"{comp_net}_{node}"
        #                     in_netlist.edges[(comp_net, node)]['ch_net'] = f"{comp_net}_{node}_chem"
        #                 else:
        #                     raise Exception(f"Too many nodes connected to input {in_netlist[comp_net]}")
        #                     # comp_line += f"{comp_net}_out "
        #
        #             elif in_netlist.nodes[comp_net]["node_type"] == 'wire':
        #
        #                 if wire_edges == 2:
        #                     comp_line += f"{comp_net}_{node} "
        #                     in_netlist.edges[(comp_net, node)]['fl_net'] = f"{comp_net}_{node}"
        #                     in_netlist.edges[(comp_net, node)]['ch_net'] = f"{comp_net}_{node}_chem"
        #                 else:
        #                     # for components
        #                     raise Exception(f"Too many nodes connected to input {in_netlist[comp_net]}")
        #                     # if in_netlist.edges[node, comp_net]["port"] == "out_fluid":
        #                     #    comp_line += f"{comp_net}_in "
        #                     # else:
        #                     #    comp_line += f"{comp_net}_out "
        #                 
        #
        #
        #
        #
        #
        #
        #
        #
        #
        #             # adding probes
        #             elif in_netlist.nodes[comp_net]["node_type"] == 'connection':
        #                 comp_line += f"{comp_net} "
        #                 if in_netlist.nodes[comp_net]['chem_wire'] not in wire_connections:
        #                     wire_connections[in_netlist.nodes[comp_net]['chem_wire']] = 1
        #                     chem_line += f"{in_netlist.nodes[comp_net]['chem_wire']}_{node}_chem "
        #                     if comp_type != "flow_probe" and \
        #                         comp_type != "pressure_probe":
        #                         probe_wires[0].append(node)
        #                         probe_wires[1].append([in_netlist.nodes[n]['chem_wire'],0])
        #                         print(probe_wires)
        #                 else:
        #                     wire_connections[in_netlist.nodes[comp_net]['chem_wire']] += 1
        #                     chem_line += f"{in_netlist.nodes[comp_net]['chem_wire']}_{node}_chem "
        #                     if comp_type != "flow_probe" and comp_type != "pressure_probe":
        #                         probe_wires[0].append(node)
        #                         probe_wires[1].append([in_netlist.nodes[comp_net]['chem_wire'],1])
        #                         print(probe_wires)
        #             elif in_netlist.nodes[comp_net]["node_type"] == 'flow_probe':
        #                 if zero_wire:
        #                     wire_connections[comp_net] = 1
        #                     comp_line += f"{comp_net}_{node} "
        #                     #chem_line += f"{n}_0_chem "
        #                 else:
        #                     wire_connections[comp_net] += 1
        #                     comp_line += f"{comp_net}_{node} "
        #                     #chem_line += f"{n}_1_chem "
        #             elif in_netlist.nodes[comp_net]["node_type"] == 'pressure_probe':
        #                 if zero_wire:
        #                     wire_connections[comp_net] = 1
        #                     comp_line += f"{comp_net}_{node} "
        #                     #chem_line += f"{n}_0_chem "
        #                 else:
        #                     wire_connections[comp_net] += 1
        #                     comp_line += f"{comp_net}_{node} "
        #                     #chem_line += f"{n}_1_chem "
        #             elif in_netlist.nodes[comp_net]["node_type"] == 'concentration_probe':
        #                 # should not have connecting nodes
        #                 pass
        #                 
        #             else:
        #                 raise Exception(f"{comp_net} not of correct type")
        #
        #             # chemical nodes
        #             # TODO test with other probes
        #             if in_netlist.nodes[comp_net]["node_type"] == "input" or \
        #                 in_netlist.nodes[comp_net]["node_type"] == "output" or \
        #                 in_netlist.nodes[comp_net]["node_type"] == "wire":
        #                 #chem_line += f"{n}_{node}_chem "
        #
        #                 if "chem_connection" in in_netlist.nodes[node] and \
        #                     comp_net == in_netlist.nodes[node]["chem_connection"]["oth_node"]:
        #                     chem_line +=f"{in_netlist.nodes[node]['chem_connection']['node']} "
        #                 else:
        #                     if wire_edges == 2 and in_netlist.nodes[comp_net]["node_type"] == "wire":
        #                         chem_line += f"{comp_net}_{node}_chem "
        #                     elif wire_edges == 1 and in_netlist.nodes[comp_net]["node_type"] in ["input", "output"]:
        #                         chem_line += f"{comp_net}_{node}_chem "
        #                     else:
        #                         if in_netlist.edges[node, comp_net]["port"] == "out_fluid":
        #                             chem_line += f"{comp_net}_in_chem "
        #                         else:
        #                             chem_line += f"{comp_net}_out_chem "
        #                     #chem_line += f"{n}_{node}_chem "
        #
        #
        #         print(comp_type)
        #
        #         if (comp_type != "flow_probe") and \
        #             (comp_type != "pressure_probe") and \
        #             (comp_type != "concentration_probe"):
        #             comp_line += ' '+chem_line
        #             if has_pcells and is_pcell:
        #                 comp_line += ' '+pcell_params
        #         elif comp_type == "concentration_probe":
        #             print(comp_type)
        #             for w in in_netlist.nodes[node]["chem_pr_wires"]:
        #                 comp_line += f'{w} '
        #                 pass
        #             comp_line += "0V "
        #         elif comp_type == "flow_probe" or comp_type == "pressure_probe":
        #             comp_line += " 0V"
        #         c_of.write(comp_line+'\n')
        #         #raise Exception()
        #

        # add transient lines
        c_of.write('\n\n')

        for t in sims_time_lines:
            print(t)
            c_of.write(' '.join(t)+'\n')


        # add probes
        if sim_type is not None:
            if isinstance(sim_type, str):
                sim_type = [sim_type]

            for st in sim_type:
                if st == "transient":
                    nl = re.sub(r'[ ]+', r' ', '.print tran '+' '.join(probes_list)+' '.join(new_probes))
                    c_of.write(nl+'\n')
                elif st == "static":
                    nl = re.sub(r'[ ]+', r' ', '.print dc '+' '.join(probes_list)+' '.join(new_probes))
                    c_of.write(nl+'\n')
                else:
                    raise ValueError("sim_type must be transient or static")
        c_of.write('\n.end')
         
    if 'XYCE_WL_GRAPH' in os.environ:
        os.environ.pop('XYCE_WL_GRAPH')

    o_csv_col = ['Chemical', 'spice_str_file', 'spice_file']
    if add_prn_to_list:
        o_csv_col.append('OutputFile')
    o_csv = pd.DataFrame(output_file_list, columns=o_csv_col)
    #for of in output_file_list:
    #    o_csv = o_csv.concat([o_csv, of, ignore_index=True)
    return o_csv

        

def get_length_list(len_file):


    if len_file.split('.')[-1] == "csv":
        len_df = pd.read_csv(len_file, index_col=0)
    elif len_file.split('.')[-1] == 'xlsx':
        len_df = pd.read_excel(len_file, index_col=0) 
        #if len_df.columns.toList()[0].strip() == "":
        #    len_df = pd.read_execl(len_file, index_col=1)
    if len_df.shape[0] == 1:
        len_df = len_df.T
    elif len_df.shape[1] == 2:
        len_df = pd.read_csv(len_file, index_col=1)
        len_df = {}
        reader = csv.DictReader(open(len_file, 'r'))
        for r in reader:
            r['length (mm)'] = ast.literal_eval(r['length (mm)'])
            print(r)
            print(len(r))
            if len(r['length (mm)']) > 1:
                # possibly unsafe 
                len_df[r['wire']] =r['length (mm)']
            else:
                len_df[r['wire']] = r['length (mm)']['']
    elif len_df.shape[1] == 3:
        len_df = pd.read_csv(len_file, index_col=2)

    if isinstance(len_df, pd.DataFrame):
        print(len_df.shape[0], len_df.shape[1])
    print(len_df)

    return len_df
    
def convert_nodes_2_numbers_xyce(SPfile, cir_out=False):
    if os.path.isfile(SPfile) and (SPfile[-4:]==".cir" or SPfile[-8:]==".cir.str"):
        SPfile = [SPfile]
    else:
        # if directory is given
        SPfile = ['/'.join([SPfile, f]) 
                       for f in os.listdir(SPfile) 
                       if os.path.isfile(os.path.join(SPfile, f)) and f[-4:]==".cir"]

    for f in SPfile:
        SPfile_o = open(f, 'r')

        if cir_out:
            if len(f) > 8 and f[-8:] == '.cir.str':
                new_file = f[:-8]+'.cir'
            elif f[-4:] != '.cir':
                new_file = f+'.cir'
        else:
            new_file = f+'.num'
        SPfile_n = open(new_file, 'w')

        nodeList = {}

        for line in SPfile_o:
            # remove leading WS
            line = line.rstrip()

            # remove comments
            line = line.split('*')[0]
            line_comment = ''.join(line.split('*')[1:])

            


            if line == "" or line == "\n":
                SPfile_n.write(line + line_comment+'\n')
            else:
                line_vars = line.replace('  ', ' ').split(' ')
                if len(line_vars) > 1:
                    arg1 = line_vars[0]
                    end_line_str = []
                    line_nodes = []
                    # xyce command start with .
                    if arg1[0] == ".":
                        for ind, param in enumerate(line_vars[1:]):
                            for n in nodeList.keys():
                                if n in param:
                                    n_num = str(nodeList[n])
                                    rplace_str = '('+n+')'
                                    newParam = param.replace('('+n+')', '('+n_num+')')
                                    line_vars[ind+1] = newParam
                        new_sp_line = ' '.join(line_vars)+'\n'
                    # xyce voltage probes start with v
                    elif arg1[0] == "v":
                        for ind, param in enumerate(line_vars[1:]):
                            if ind < 2:
                                if "=" in param:
                                    end_line_str += [param]
                                elif param == '0':
                                    line_nodes.append(0)
                                else:
                                    if param not in nodeList.keys():
                                        # we do not want 0
                                        nodeList[param] = len(nodeList)+1
                                    line_node = nodeList[param]
                                    line_nodes.append(line_node)
                            if ind >=2:
                                end_line_str += [param]
                        # append all
                        print(arg1)
                        new_sp_line = ' '.join(
                            [arg1]+
                            [str(x) for x in line_nodes]+
                            end_line_str
                            )+'\n'
                    else:
                        # replaces params for numbers
                        # <device> <name>
                        device = [arg1, line_vars[1]]
                        for param in line_vars[2:]:
                            # exception for parameters which will explicitly use =
                            if "=" in param:
                                end_line_str += [param]
                            elif param == '0':
                                line_nodes.append(0)
                            else:
                                if param not in nodeList.keys():
                                    # we do not want 0
                                    nodeList[param] = len(nodeList)+1
                                line_node = nodeList[param]
                                line_nodes.append(line_node)
                    # append all
                        new_sp_line = ' '.join(
                            device+
                            [str(x) for x in line_nodes]+
                            end_line_str
                            )+'\n'
                    
                    SPfile_n.write(new_sp_line+line_comment)
                else:
                    SPfile_n.write(line + line_comment+'\n')

        node_file = f+'.nodes'
        with open(node_file, 'w') as node_f:
            json.dump(nodeList, node_f)

        SPfile_o.close()
        SPfile_n.close()
    

def visualize_netlist(in_cir):
    netlist_parse_reg = r"^[ ]*((?P<std_comp>[IVivRrCc]\w*)\s+(?P<pos_node>\w+)\s+(?P<neg_node>\w+)\s+(\d+[\w]?[\w]?)\s*?$|(?P<custom_component>[Yy]\w*)\s+(?P<instance>\w+)\s+(?P<params>[\w\s=.]*?$))"

    net_reg = bytes(netlist_parse_reg, 'utf-8')

    with open(in_cir, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)
        mo = regex.finditer(net_reg, data, re.MULTILINE)

    for m in mo:

        if "std_comp" in m.groups():
            pass
        elif "custom_component" in m.groups():
            pass

            param_reg = r"[\w=.]+"

            params = regex.finditer()
            
def generate_cir_main(design, verilog_file, config_file, length_file, out_file,
    basename_only=False, pcell_file=None, wl_graph_file=None):

    import sys, os
    
    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/verilog_2_NX/')
    from Verilog2NX import get_modules, visual_graph
    
    net_dict, net_graph = get_modules(in_v=verilog_file, visual=False)

    #out_probes, netlist_graph_out = add_probes_to_device(probes, netlist_graph['smart_toilet']['netlist'])

    from SimulationXyce import SimulationXyce
    Xcl = SimulationXyce()
    Xcl.parse_config_file(config_file)

    print(net_graph.keys())
    out_probes, netlist_graph_out = add_probes_to_device(Xcl.probes, net_graph[design]['netlist'])

    dev_lines, chem_args = generate_source_list(Xcl, has_chem=True)

    print(out_probes)

    sim_lines = generate_time_lines(Xcl)

    sp_files = write_spice_file(net_graph[design]['netlist'],
        probes_list=out_probes,
        source_lines=dev_lines,
        length_list=length_file,
        chem_list=chem_args,
        sims_time_lines=sim_lines,
        sim_type="transient",
        out_file=out_file,
        add_prn_to_list=True,
        basename_only=basename_only,
        pcell_file=pcell_file,
        wl_graph=wl_graph_file
                                )

    for spf in sp_files.iterrows():
        convert_nodes_2_numbers_xyce(spf[1]['spice_str_file'], cir_out=True)

    sp_files.to_csv(os.path.dirname(out_file)+'/spice_files.csv')
