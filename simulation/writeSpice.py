# fmt:off
import networkx as nx
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import re
import csv
import ast

import SimulationXyce

import os
import sys
import json
import regex
import mmap
import copy
import logging

from pprint import pp

def add_probes_to_device(probes, netlist_graph):

    probe_list = []
    node = 'node'
    dev = 'device'

    def add_probe_no_node(probe, probe_list, probe_type):
        print(probe)
        if isinstance(probe, SimulationXyce.SimulationXyce.Probe):
            if p.getNode() not in netlist_graph.nodes:
                logging.debug(f"Nodes in netlist:\n{netlist_graph.nodes}")
                raise KeyError(f"Probe for node {probe.getNode()} not in netlist")
            dev_node = list(netlist_graph[probe.getNode()].keys())[0]
            pr_node  = probe.getNode()
        elif isinstance(probe, dict):
            if probe[node] not in netlist_graph.nodes:
                logging.debug(f"Nodes in netlist:\n{netlist_graph.nodes}")
                raise KeyError(f"Probe for node {probe[node]} not in netlist")
            dev_node = list(netlist_graph[probe[node]].keys())[0]
            pr_node  = probe[node]
        else:
            raise ValueError("Passed probe is not of type dict or Probe")

        # check for existing probes
        if f'V({pr_node}_{dev_node}_chem)' not in probe_list:
            dev_node = list(netlist_graph[pr_node].keys())[0]
            probe_list.append(f'V({pr_node}_{dev_node}_chem)')

    # sub-functions ---------------------------------------
    def add_probe_w_node(probe, probe_list, probe_type):
        print(probe)
        if isinstance(probe, SimulationXyce.SimulationXyce.Probe):
            if p.getNode() not in netlist_graph.nodes:
                logging.debug(f"Nodes in netlist:\n{netlist_graph.nodes}")
                raise KeyError(f"Probe for node {probe.getNode()} not in netlist")
            dev_node = list(netlist_graph[probe.getNode()].keys())[0]
            pr_node  = probe.getNode()
        elif isinstance(probe, dict):
            if probe[node] not in netlist_graph.nodes:
                logging.debug(f"Nodes in netlist:\n{netlist_graph.nodes}")
                raise KeyError(f"Probe for node {probe[node]} not in netlist")
            dev_node = list(netlist_graph[probe[node]].keys())[0]
            pr_node  = probe[node]
        else:
            raise ValueError("Passed probe is not of type dict or Probe")

        netlist_graph.remove_edge(pr_node, dev_node)
        flow_probe = f"vfl_{pr_node}_{p[dev]}"
        new_probe_nodes = [
            # node for probe -> device
            (f"{pr_node}_{dev_node}_pr", {
                'node_type':'connection',
                'chem_wire':pr_node}),
            # node for
            (f"{flow_probe}", {
                'node_type':'flow_probe',
                'device':dev_node,
                'param':{'':'0'}})
                ]
        # add edges to graph
        new_es = []
        # do we know what port this is connected to?
        new_es.append((new_probe_nodes[0][0], dev_node))
        new_es.append((new_probe_nodes[0][0], new_probe_nodes[1][0]))
        new_es.append((new_probe_nodes[1][0], pr_node))

        netlist_graph.add_nodes_from(new_probe_nodes)
        netlist_graph.add_edges_from(new_es)

        # do I need to return the probe list?
        if probe_type == "flow":
            probe_list.append(f'I({flow_probe})')
        elif probe_type == "pressure":
            probe_list.append(f'V({p[node]}_{p[dev]}_pr)')
        elif probe_type ==  "concentration":
            probe_list.append(f'V({pr_node}_{dev_node}_chem)')

    def swap_port_net(g, dev_n, curr_n, new_n):
        NODE_NAMES = [
                'in_fluid',
                'out_fluid',
                'a_fluid',
                'b_fluid',
                'out_fluid'
        ]
        for nn in NODE_NAMES:
            if nn in g.nodes[dev_n] and \
                    g.nodes[dev_n][nn] == curr_n:
                g.nodes[dev_n][nn] = new_n


    def check_probe_node_pair(dev_node, probe_node):
        if (dev_node, probe_node) not in netlist_graph.edges:
            raise KeyError(f"Device probe pair not in netlist, adj dev nodes {dev_node}:{netlist_graph[dev_node]} " + \
                           f"adj probe nodes {probe_node}: {netlist_graph}")

    # start function ---------------------------------------

    if 'pressure' in probes:
        # TODO add dev to pressure probe call
        for p in probes['pressure']:
            # print(p)
            if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                dev_node = list(netlist_graph[p.getNode()].keys())[0]
                probe_list.append({
                    "probe":"pressure_probe",
                    "print":f'V({p.getNode()}_{dev_node})'
                })
            else:
                dev_node = list(netlist_graph[p[node]].keys())[0]
                probe_list.append({
                    "probe":"pressure_probe",
                    "print":f'V({p[node]}_{dev_node})'
                })

    if 'flow' in probes:
        for p in probes['flow']:
            if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                if p.getNode() not in netlist_graph.nodes:
                    logging.debug(f"Nodes in netlist:\n{netlist_graph.nodes}")
                    raise KeyError(f"Probe for node {p.getNode()} not in netlist")
                try:
                    dev_node = list(netlist_graph[p.getNode()].keys())[0]
                except IndexError:
                    raise IndexError(f"Flow probe error: Not able to find device {list(netlist_graph[p.getNode()].keys())} for node {p.getNode()}")
                pr_node  = p.getNode()
            else:
                if p[node] not in netlist_graph.nodes:
                    logging.debug(f"Nodes in netlist:\n{netlist_graph.nodes}")
                    raise KeyError(f"Probe for node {p[node]} not in netlist")
                dev_node = list(netlist_graph[p[node]].keys())[0]
                pr_node  = p[node]

            check_probe_node_pair(dev_node, pr_node)
            print(f"Adding flow probe at: {pr_node}, dev: {dev_node}")
            flow_probe = f"vfl_{pr_node}_{dev_node}"
            netlist_graph.edges[(pr_node, dev_node)]["flow_probe"] = flow_probe
            probe_list.append({
                "probe":"flow_probe",
                "name":flow_probe,
                "edge":(dev_node, pr_node),
                "print":f'I({flow_probe})'
            })

    if 'pressureNode' in probes:
        for p in probes['pressureNode']:
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

            check_probe_node_pair(dev_node, pr_node)
            pressure_probe = f'vpr_{pr_node}_{dev_node}'
            pressure_probe_nd = f'{pr_node}_{dev_node}_comp'
            netlist_graph.edges[(dev_node, pr_node)]["pressure_probe"] = pressure_probe

            probe_list.append({
                "probe":"pressure_probe",
                "name": pressure_probe,
                "edge": (dev_node, pr_node),
                "print": f'V({pressure_probe_nd})'
            })

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

            check_probe_node_pair(dev_node, pr_node)
            # check for existing probes
            if f'V({pr_node}_{dev_node}_chem)' not in [p_pr['print'] for p_pr in probe_list]:
                dev_node = list(netlist_graph[pr_node].keys())[0]
                probe_list.append({
                    "probe":"chem_probe",
                    "print":f'V({pr_node}_{dev_node}_chem)'
                })

    if 'concentrationNode' in probes:
        for p in probes['concentrationNode']:
# <<<<<<< HEAD
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

            check_probe_node_pair(dev_node, pr_node)
            if "chem_probe" not in netlist_graph.nodes[dev_node]:
                #netlist_graph.nodes[dev_node]["chem_probe"] = []
                netlist_graph.edges[(dev_node, pr_node)]["chem_probe"] = []
# =======
#                 # explicit chem node dev
#                 if isinstance(p, SimulationXyce.SimulationXyce.Probe):
#                                         
#                     netlist_graph.nodes[p.getDevice()]["chem_connection"] ={"node":f"vchpr_{p.getNode()}_{p.getDevice()}_chem","oth_node":p.getNode()}
#                     #netlist_graph.nodes[p.getNode()]["chem_connection"]={"node":f"vchpr_{p.getNode()}_conn_chem","oth_node":p.getDevice()}
#                     if netlist_graph.nodes[p.getNode()]["node_type"] in "input" and \
#                         len(netlist_graph[p.getNode()]) > 1:
#                         chan_node = f"{p.getNode()}_channel_out_chem "
#                     elif netlist_graph.nodes[p.getNode()]["node_type"] == "output" and \
#                         len(netlist_graph[p.getNode()]) > 1:
#                         chan_node = f"{p.getNode()}_in_chem "
#                     elif netlist_graph.nodes[p.getNode()]["node_type"] == "wire" and \
#                         len(netlist_graph[p.getNode()]) > 2:
#                         # which port
#                         if netlist_graph.edges[p.getDevice(), p.getNode()]["port"] == "out_fluid":
#                             chan_node = f"{p.getNode()}_in "
#                         else:
#                             chan_node = f"{p.getNode()}_channel_out "
#                     elif "chem_connection" in netlist_graph.nodes[p.getNode()]:
#                         chan_node = f"vchpr_{p.getNode()}_conn_chem"
#                         netlist_graph.nodes[p.getNode()]["chem_connection"]={"node":chan_node,"oth_node":p.getDevice()}
#                     else:
#                         chan_node = f"vchpr_{p.getNode()}_conn_chem"
#
#                     new_probe_node = [
#                         (f"vchpr_{p.getNode()}_{p.getDevice()}_pr", {
#                         'node_type':'concentration_probe',
#                         'chem_pr_wires':[
#                             f"vchpr_{p.getNode()}_{p.getDevice()}_chem",
#                             chan_node] 
#                             }),
#                     ]
#                 else:
#                     netlist_graph.nodes[p[dev]]["chem_connection"] ={"node":f"vchpr_{p[node]}_{p[dev]}_chem","oth_node":p[node]}
#                     #netlist_graph.nodes[p[node]]["chem_connection"]={"node":f"vchpr_{p[node]}_conn_chem","oth_node":p[dev]}
#                     print(netlist_graph.nodes[p[node]])
#                     if netlist_graph.nodes[p[node]]["node_type"] in "input" and \
#                         len(netlist_graph[p[node]]) > 1:
#                         chan_node = f"{p[node]}_channel_out_chem "
#                     elif netlist_graph.nodes[p[node]]["node_type"] == "output" and \
#                         len(netlist_graph[p[node]]) > 1:
#                         chan_node = f"{p[node]}_in_chem "
#                     elif netlist_graph.nodes[p[node]]["node_type"] == "wire" and \
#                         len(netlist_graph[p[node]]) > 2:
#                         # which port
#                         if netlist_graph.edges[p.getDevice(), p[node]]["port"] == "out_fluid":
#                             chan_node = f"{p[node]}_in "
#                         else:
#                             chan_node = f"{p[node]}_channel_out "
#                     elif "chem_connection" in netlist_graph.nodes[p[node]]:
#                         chan_node = f"vchpr_{p[node]}_conn_chem"
#                         netlist_graph.nodes[p[node]]["chem_connection"]={"node":chan_node,"oth_node":p.getDevice()}
#                     else:
#                         chan_node = f"vchpr_{p[node]}_conn_chem"
#                 # explicit chem node wire
#                     new_probe_node = [
#                         (f"vchpr_{p[node]}_{p[dev]}_pr", {
#                             'node_type':'concentration_probe',
#                             'chem_pr_wires':[
#                                 f"vchpr_{p[node]}_{p[dev]}_chem",
#                                 chan_node] 
#                                 }),
#                     ]
#                 #new_es = []
#                 #new_es.append((new_probe_nodes[0][0], p[dev]))
#                 #new_es.append((new_probe_nodes[0][0], new_probe_nodes[1][0]))
#                 #new_es.append((new_probe_nodes[1][0], p[node]))
# >>>>>>> main

            chem_probe = f'V({p.getNode()}_{p.getDevice()}_comp_chem)'
            # handled by downstream instructions
            # netlist_graph.nodes[dev_node]["chem_probe"].append([chem_probe])
            if chem_probe not in netlist_graph.edges[(dev_node, pr_node)]['chem_probe']:
                netlist_graph.edges[(dev_node, pr_node)]["chem_probe"].append([chem_probe])
                # same as if in list
            if chem_probe not in [p_pr['print'] for p_pr in probe_list]:
                probe_list.append({
                    "probe":"chem_probe",
                    "name":f"vch_{dev_node}_{pr_node}",
                    "edge":(dev_node, pr_node),
                    "print":chem_probe
                })

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


"""
This function inserts the channel graph into the verilog graph
"""
def merge_wl_net(in_g, wl_g, node, wl_file=None,
    debug_node = False, debug_edge = False, debug_draw=False):

    import matplotlib.pyplot as plt

    mapping = {}

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

    # validate
    # nx.draw(in_g, with_labels = True)
    # plt.show()

    # if re.match(f'soln\d+', str(node)) is not None:
    #     return in_g

    if in_g.nodes[node]['node_type'] in ['input', 'output']:

        # if len(in_g[node]) == 1:
        if len(wl_g.nodes) == 1:
            conn_node = list(wl_g[node])[0]
            print("New input/output node:", conn_node)
            # the regex if different now
            # Checks name if break point
            if re.match(r'[\w_]+_br_\d_\d', str(conn_node)) is not None:
                for conn_node2 in list(wl_g[conn_node]):
                    # print(conn_node2)
                    wl_g.nodes[conn_node2]['node_type'] = wl_g.nodes[node]['node_type']
                    wl_g.nodes[conn_node2]['input_node'] = node
                wl_g.nodes[node]['virt_node'] = ''
            else:
                wl_g.nodes[conn_node]['node_type'] = wl_g.nodes[node]['node_type']
                if wl_g.nodes[node]['node_type'] == 'input':
                    wl_g.nodes[conn_node]['input_node'] = node
                wl_g.nodes[node]['virt_node'] = ''
        else:
            pass
            #raise Exception(f"Too many nodes connected to {node}; nodes {in_g[node]}")

    in_g.remove_node(node)
    in_g = nx.compose(in_g, wl_g)

    # write nodes and edges to terminal

    if node == 'soln2':
        debug_node = False
        debug_edge = False
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
    if debug_draw:
        import matplotlib.pyplot as plt
        nx.draw_spring(wl_g, with_labels=True)
        plt.show()
        nx.draw_spring(in_g, with_labels=True)
        plt.show()

    return in_g

"""
    Used as nx.node_link_graph() was having issues in this code
"""

def build_graph(dict_gph):
    G_out = nx.Graph()
    for nd in dict_gph['nodes']:
        G_out.add_node(nd['id'])
        for nd_k, nd_val in nd.items():
            if nd_k is not 'id':
                G_out.nodes[nd['id']][nd_k] = nd_val

    if 'edges' in dict_gph:
        for edg in dict_gph['edges']:
            G_out.add_edge(edg['source'], edg['target'])
    if 'links' in dict_gph:
        for edg in dict_gph['links']:
            G_out.add_edge(edg['source'], edg['target'])


    return G_out
"""


"""

def generate_spice_nets(
        in_netlist,
        length_list=None,
        add_prn_to_list=False,
        pcell_file=None,
        wl_graph=None
        ):

    WIRE = ['wire', 'input', 'output']
    PROBE = ['flow_probe', 'pressure_probe', 'concentration_probe']
    FL_PROBE = ['flow_probe', 'pressure_probe']
    C_PROBE = ['chem_probe', 'concentration_probe']

    if length_list is None:
        no_lengths = True
    else:
        no_lengths = False
        len_df = get_length_list(length_list)

        # check default path for route_nets
    if 'XYCE_WL_GRAPH' in os.environ or \
            os.path.exists(length_list.replace('_length.csv', '_route_nets.json')):
        from networkx.readwrite import json_graph
        wl_graph_f = ''
        if wl_graph is None:
            wl_graph_f = length_list.replace('_length.csv', '_route_nets.json')
        wl_graph = {}
        print("Reading: ", wl_graph_f)
        with open(wl_graph_f, 'r') as js_f:
            json_f = json.load(js_f)
        for r in json_f.keys():
            print(f'r: "{r}"')
            print('VAL:')
            pp(json_f[r])
            #new_graph = json_graph.node_link_graph(r[1])
            #new_graph = nx.node_link_graph(json_f[r])
            new_graph = build_graph(json_f[r])
            if len(new_graph.nodes) > 1:
                wl_graph[r] = new_graph
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
        #print(f"Prop: {g.edges[edge]}")
        if "has_flow_probe" in g.edges[edge]:
            print("EDGE IN FLOW NODE", edge)

        if 'ch_net' in g.edges[edge]:
            if net_name == g.edges[edge]['ch_net']:
                print(f"  Net {net_name} already added to {edge}")
            else:
                raise Exception(f"Conflicting net names adding {net_name}, already {g.edges[edge]['ch_net']}")
        else:
            g.edges[edge]['ch_net'] = net_name

    def add_net_defs_to_graph(g, node, comp_node):
        if g.nodes[comp_node]['node_type'] in PROBE:
            print(f"  Skipping probe node {comp_node}")
            return
        print("comp node :", comp_node, "wire node: ", node)
        net_edge = (comp_node, node)
        if any([(fl_pr in g.edges[net_edge]) for fl_pr in FL_PROBE]):
            print(f"fluid probe at edge {net_edge}")
            g.edges[net_edge]['fl_net'] = {
                "comp_net": f"{node}_{comp_node}_comp",
                "channel_net": f"{node}_{comp_node}_net"
            }
            print(g.edges[net_edge]['fl_net'])
        else:
            chan_fluid_net = f"{node}_{comp_node}"
            add_fl_net_2_edge(g, (comp_node, node), chan_fluid_net)
        if any([(fl_pr in g.edges[net_edge]) for fl_pr in C_PROBE]):
            print(f"chemical probe at edge {net_edge}")
            g.edges[net_edge]['ch_net'] = {
                "comp_net": f"{node}_{comp_node}_comp_chem",
                "channel_net": f"{node}_{comp_node}_net_chem"
            }
        else:
            chan_chem_net  = f"{node}_{comp_node}_chem"
            add_ch_net_2_edge(g, (comp_node, node), chan_chem_net)

    for node in list(in_netlist.nodes):

        #nx.draw(in_netlist, with_labels=True)
        #plt.show()

        ############# IF INPUT #############

        if in_netlist.nodes[node]['node_type'] == 'input':
            # and (not no_lengths):
            #in_netlist.nodes[node]['node_color']='tab:blue'
            #nx.draw(in_netlist, with_labels=True)
            #plt.show()
            #nx.draw(wl_graph[node], with_labels=True)
            #plt.show()

            #  add a place holder
            # TODO make direct connections to components
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
                    add_net_defs_to_graph(in_netlist, node, comp_node)

                else:
                    raise Exception(f"Too many nodes in input, {node_edges}. This will be handled by a net parser, the length file is invalid")

            elif isinstance(wl, dict):
                print(f"connecting net {node}")
                if wl_graph is None:
                    print(f"failed to connect graph, {('XYCE_WL_GRAPH' in os.environ)}")
                print(wl_graph)
                in_netlist = merge_wl_net(
                    in_netlist,
                    wl_graph[node],
                    node, 
                    wl_file=len_df
                )
            else:
                pass

        ############# IF OUTPUT #############

        elif in_netlist.nodes[node]['node_type'] == 'output':
            # TODO check if output as dev
            #print(len_df)
            if no_lengths:
                wl = 0.01
            elif isinstance(len_df, pd.DataFrame):
                try:
                    wl = len_df.loc[node]["length (mm)"]
                except KeyError:
                    raise KeyError(f"Not able to find node {node} in lenght file {os.path.abspath(wl_graph_f)}")
            elif isinstance(len_df, dict):
                wl = len_df[node] #["length (mm)"]

            if isinstance(wl, float):
                in_netlist.nodes[node]['chan_len'] = wl
                node_edges = list(in_netlist.edges(node))

                if len(node_edges) == 1:
                    comp_node = list(in_netlist[node])[0]
                    add_net_defs_to_graph(in_netlist, node, comp_node)

                else:
                    raise Exception(f"Too many nodes in input, {node_edges}. This will be handled by a net parser, the length file is invalid")
            elif isinstance(wl, dict):
                try:
                    in_netlist = merge_wl_net(in_netlist, wl_graph[node], node, wl_file=len_df)
                except TypeError:
                    raise ValueError("Missing XYCE_WL_GRAPH in environment, usually (design)_route_nets.json in results dir")
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
                print(len_df)
                wl = len_df[node] #["length (mm)"]

            if isinstance(wl, float):
                in_netlist.nodes[node]['chan_len'] = wl
                node_edges = list(in_netlist.edges(node))

                if len(node_edges) == 2:
                    for comp_node in in_netlist[node]:
                        add_net_defs_to_graph(in_netlist, node, comp_node)

                else:
                    raise Exception(f"Too many nodes in input, {node_edges}. This will be handled by a net parser, the length file is invalid")
            elif isinstance(wl, dict):
                in_netlist = merge_wl_net(in_netlist, wl_graph[node], node, wl_file=len_df)
            else:
                pass

        # since only nets are added the components are implicitly added
        elif in_netlist.nodes[node]['node_type'] in ['flow_probe', 'pressure_probe']:
            node_edges = list(in_netlist.edges(node))
            if len(node_edges) == 2:
                a_pr_ns = list(in_netlist[node])
                a_pr_nt = [
                    in_netlist.nodes[a_pr_ns[0]]['node_type'],
                    in_netlist.nodes[a_pr_ns[1]]['node_type']
                ]
                if a_pr_nt[0] in WIRE and a_pr_nt[1] not in WIRE:
                    chan_chem_net  = f"{a_pr_ns[0]}_{a_pr_ns[1]}_chem"
                elif a_pr_nt[0] not in WIRE and a_pr_nt[1] in WIRE:
                    chan_chem_net  = f"{a_pr_ns[1]}_{a_pr_ns[0]}_chem"
                elif a_pr_nt[0] not in WIRE and a_pr_nt[1] not in WIRE:
                    print(f"Connecting two components {a_pr_ns}")
                    chan_chem_net  = f"{a_pr_ns[0]}_{a_pr_ns[1]}_chem"
                else:
                    raise Exception("Nodes are both nodes wires for probe")
                for att_node in in_netlist[node]:
                    chan_fluid_net = f"{node}_{att_node}"
                    print("attached node :", att_node, "probe node: ", node,'\nNet:', chan_fluid_net)
                    add_fl_net_2_edge(in_netlist, (att_node, node), chan_fluid_net)
                    add_ch_net_2_edge(in_netlist, (att_node, node), chan_chem_net)
            else:
                raise Exception(f"Too many nodes in input, {node_edges}. This will be handled by a net parser, the length file is invalid")
        else:
            print(f"Node {node} is of type {in_netlist.nodes[node]['node_type']}")

    # iterate through nodes only looking at component nets

    return in_netlist


def read_pcell_file(pc_file):

    if '.' not in os.path.basename(pc_file):
        reader = csv.DictReader(open(pc_file, 'r'))
        pcomp_dict = {}
        for row in reader:
            pcomp_dict[row['lef']] = {'base cell': row['cell_name'], 'parameters':row['parameters']}
        print(pcomp_dict)
        return pcomp_dict
    elif pc_file[-4] == '.csv':
        reader = csv.DictReader(open(pc_file, 'r'))
        pcomp_dict = {}
        for row in reader:
            pcomp_dict[row['lef']] = {'base cell': row['cell_name'], 'parameters':row['parameters']}
        print(pcomp_dict)
        return reader
    else:
        print("Pcell file type not supported yet,", pc_file)


def write_components_from_graph(
        in_g,
        of,
        probe_list=[],
        pcell_file=None
):
    #nx.draw_spring(in_g, with_labels=True)
    #plt.show()

    if isinstance(of, str):
        of = open(of, 'w+')

    if pcell_file is not None:
        pcells = read_pcell_file(pcell_file)
    else:
        pcells = {}

    in_nodes = []
    out_nodes = []
    wire_nodes = []
    probe_nodes= []
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
        elif in_g.nodes[n]['node_type'] in ['flow_probe', 'pressure_probe']:
            probe_nodes.append(n)
        else:
            oth_nodes.append(n)

    print("IN nodes", in_nodes,'\nOUT nodes', out_nodes, '\nCHAN nodes', wire_nodes, '\nCOMP nodes', oth_nodes)

    # write nodes
    for i_n in in_nodes:
        if 'chan_len' not in in_g.nodes[i_n]:
            in_g.nodes[i_n]['chan_len'] = '0.1m'
            e_in = list(nx.all_neighbors(in_g, i_n))[0]
            if 'fl_net' not in in_g[i_n][e_in] or 'fl_net' not in in_g[e_in]:
                in_g.edges[(i_n, e_in)]['fl_net'] = e_in
                in_g.edges[(i_n, e_in)]['ch_net'] = e_in + "_chem"
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
        if isinstance(e_fl, dict):
            e_fl = e_fl["channel_net"]
        if isinstance(e_ch, dict):
            e_ch = e_ch["channel_net"]
        if 'input_node' in in_g.nodes[i_n]:
            inst_n = i_n  # instance captured so it is unique
            i_n = in_g.nodes[i_n]['input_node']  # syncs up with pump nodes
            of.write(f"{chan_comp} {inst_n} {i_n}_in {e_fl} {i_n}_in_chem {e_ch} length={wl}m\n")
        else:
            of.write(f"{chan_comp} {i_n} {i_n}_in {e_fl} {i_n}_in_chem {e_ch} length={wl}m\n")

    of.write('\n\n')

    for w_n in wire_nodes:
        e = list(in_g.edges(w_n))
        print(f"edges of node {w_n}: {e}")
        if len(e) != 2:
            continue
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
        if isinstance(e_fl1, dict):
            e_fl1 = e_fl1["channel_net"]
        if isinstance(e_ch1, dict):
            e_ch1 = e_ch1["channel_net"]
        if isinstance(e_fl2, dict):
            e_fl2 = e_fl2["channel_net"]
        if isinstance(e_ch2, dict):
            e_ch2 = e_ch2["channel_net"]
        wl = in_g.nodes[w_n]['chan_len']
        of.write(f"{chan_comp} {w_n} {e_fl1} {e_fl2} {e_ch1} {e_ch2} length={wl}m\n")

    of.write('\n\n')

    for o_n in out_nodes:
        if 'chan_len' not in in_g.nodes[o_n]:
            e_out = list(in_g[o_n])[0]
            #print(o_n, e_out)
            in_g.edges[(o_n, e_out)]['fl_net'] = e_out
            in_g.edges[(o_n, e_out)]['ch_net'] = e_out + "_chem"
            in_g.nodes[o_n]['chan_len'] = '0.1m'
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
        # change for probe
        if isinstance(e_fl, dict):
            e_fl = e_fl["channel_net"]
        if isinstance(e_ch, dict):
            e_ch = e_ch["channel_net"]
        wl = in_g.nodes[o_n]['chan_len']
        of.write(f"{chan_comp} {o_n} {e_fl} 0 {e_ch} {o_n}_out_chem length={wl}m\n")

    of.write('\n\n')

    for oth_n in oth_nodes:
        n_type = in_g.nodes[oth_n]['node_type']

        def check_port(c_nd, c_port):
            if in_g.nodes[c_nd][c_port] in in_g[c_nd]:
                return in_g.nodes[c_nd][c_port]
            else:
                port_reg = in_g.nodes[c_nd][c_port] + r'\w+;'
                nets = re.findall(port_reg, '; '.join(list(in_g[c_nd]))+';')
                if len(nets) == 1:
                    return nets[0][:-1]  # remove ';'
                elif len(nets) > 1:
                    raise ValueError("Port naming collision, "+str(nets))
                else:
                    raise Exception("No ports found matching "+str(port_reg))


        port_n = []
        print(f"node: {oth_n}, connected nodes {in_g[oth_n]}")
        if len(in_g[oth_n]) == 2:
            port_n.append(check_port(oth_n, 'in_fluid'))
            port_n.append(check_port(oth_n, 'out_fluid'))
        if len(in_g[oth_n]) == 3:
            port_n.append(check_port(oth_n, 'a_fluid'))
            port_n.append(check_port(oth_n, 'b_fluid'))
            port_n.append(check_port(oth_n, 'out_fluid'))

        #  TODO move to edge writing
        # overwrites previous probe nodes
        fl_wr_new = []
        ch_wr_new = []
        try:
            for pn in port_n:
                if isinstance(in_g.edges[(oth_n, pn)]['fl_net'], dict):
                    fl_wr_new.append(in_g.edges[(oth_n, pn)]['fl_net']["comp_net"])
                else:
                    if isinstance(in_g.edges[(oth_n, pn)]['fl_net'], set):
                        fl_wr_new.append(list(in_g.edges[(oth_n, pn)]['fl_net'])[0])
                    else:
                        fl_wr_new.append(in_g.edges[(oth_n, pn)]['fl_net'])

                if isinstance(in_g.edges[(oth_n, pn)]['ch_net'], dict):
                    ch_wr_new.append(in_g.edges[(oth_n, pn)]['ch_net']["comp_net"])
                else:
                    if isinstance(in_g.edges[(oth_n, pn)]['ch_net'], set):
                        ch_wr_new.append(list(in_g.edges[(oth_n, pn)]['ch_net'])[0])
                    else:
                        ch_wr_new.append(in_g.edges[(oth_n, pn)]['ch_net'])
        except KeyError:
            raise KeyError(f"{pn} not in nets of component {oth_n}, nets: {in_g[oth_n]}")

        fl_wr = ' '.join(fl_wr_new)
        ch_wr = ' '.join(ch_wr_new) + ' '

        if pcell_file is not None and \
                pcells is not None and \
                n_type in pcells:
            of.write(f"Y{pcells[n_type]['base cell']} {oth_n} {fl_wr} {ch_wr} {pcells[n_type]['parameters']}\n")
        else:
            of.write(f"Y{in_g.nodes[oth_n]['node_type']} {oth_n} {fl_wr} {ch_wr}\n")


    of.write("\n\n")
    for pr_n in probe_list:
        if 'edge' not in pr_n:
            continue
        #try:
        e = in_g.edges[pr_n['edge']]['fl_net']
        if not isinstance(e, dict):
            raise ValueError(f"Net not properly made for probe {pr_n}, {e}")
        e_fl1 = e['comp_net']
        e_fl2 = e['channel_net']

        if pr_n["probe"] == "chem_probe":
            of.write(f"{pr_n['name']} {e_fl1}_chem {e_fl2}_chem 0V\n")
        else:
            of.write(f"{pr_n['name']} {e_fl1} {e_fl2} 0V\n")

    of.write('\n\n')
    for pr in probe_2_write:
        of.write(re.sub(r'[ ]+', ' ', ' '.join(pr)+'\n'))

    of.write('\n\n')

    return new_probes


def write_time_lines(spice_config_class):
    pass


def write_spice_file(
      in_netlist, probes_list, source_lines, sims_time_lines=None,
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

        if not os.path.isdir(os.path.dirname(chem_out_file)) and \
                os.path.dirname(chem_out_file) != '':
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
            new_line = ' '.join(new_line)

            c_of.write(new_line)

        wire_connections = {}
        probe_wires = [[],[]]

        in_netlist_temp = copy.deepcopy(in_netlist)
        in_netlist_ch = generate_spice_nets(in_netlist_temp, length_list)

        new_probes = write_components_from_graph(
            in_g=in_netlist_ch,
            of=c_of,
            probe_list=probes_list,
            pcell_file=pcell_file
        )

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
                    nl = re.sub(r'[ ]+', r' ', '.print tran '+' '.join([pr["print"] for pr in probes_list])+' '.join(new_probes))
                    c_of.write(nl+'\n')
                elif st == "static":
                    nl = re.sub(r'[ ]+', r' ', '.print dc '+' '.join([pr["print"] for pr in probes_list])+' '.join(new_probes))
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

    return o_csv


def get_length_list(len_file):


    if len_file.split('.')[-1] == "csv":
        len_df = pd.read_csv(len_file, index_col=0)
    elif len_file.split('.')[-1] == 'xlsx':
        len_df = pd.read_excel(len_file, index_col=0)

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
                        # print(arg1)
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


def generate_cir_main(
        design, verilog_file, config_file, length_file, out_file,
        basename_only=False, pcell_file=None, wl_graph_file=None):

    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/v_2_NX/')
    from Verilog2NX import get_modules, visual_graph

    net_dict, net_graph = get_modules(in_v=verilog_file, visual=False)

    #out_probes, netlist_graph_out = add_probes_to_device(probes, netlist_graph['smart_toilet']['netlist'])

    from SimulationXyce import SimulationXyce
    Xcl = SimulationXyce()
    Xcl.parse_config_file(config_file)

    print("Simulation import config")
    print(Xcl.get_sim_str())

    # print(net_graph.keys())
    out_probes, netlist_graph_out = add_probes_to_device(Xcl.probes, net_graph[design]['netlist'])

    dev_lines, chem_args = generate_source_list(Xcl, has_chem=True)

    # print(out_probes)

    sim_lines = generate_time_lines(Xcl)

    sp_files = write_spice_file(
        net_graph[design]['netlist'],
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