# fmt:off
import os, sys

import regex
import re
import mmap

import networkx as nx

import matplotlib.pyplot as plt
import matplotlib
#matplotlib.use("TkAgg")

#module_reg = r"\s*module\s*(?P<module>\s*[a-zA-Z][\w]*)\s*\((?P<ports>[\s*\w*,]*)\)\s*;(?P<module_netlist>[\w*\s*,;\(\)\.]*?)endmodule"
comm_remove= r'[ ]*\/\/.*$\n'
module_reg = r"^[ ]*module\s*(?P<module_name>[a-zA-Z][\w]*)\s*\((?P<module_ports>[\s\w,]*)\)\s*;(?P<module_netlist>[\s\w.,\(\);\/]*?)endmodule"
input_reg  = r"^[ ]*input\s*(?P<input_port>[\w*, \n]*);"
output_reg = r"^[ ]*output\s*(?P<output_port>[\w*, \n]*);"
wire_reg   = r"^[ ]*wire\s*(?P<wires>[\w*, \n]*);"
comp_reg   = r"^[ ]*(?P<component>[a-zA-Z][\w]*)\s*(?P<name>[a-zA-Z][\w]*)\s*\((?P<ports>[\w\(\),\s.]*)\)\s*;"
net_reg = r"^[ ]*(module\s*(?P<module_name>[a-zA-Z][\w]*)\s*\((?P<module_ports>[\s\w,]*\);)|wire\s*(?P<wires>[a-zA-Z][\w\s,]*);|input\s*(?P<in_ports>[a-zA-Z][\w\s,]*);|output\s*(?P<out_ports>[a-zA-Z][\w\s,]*);|(?P<component>[a-zA-Z][\w]*)\s*(?P<name>[a-zA-Z][\w]*)\s*\((?P<ports>[\w\(\),\s.]*)\)\s*;)"
component_port_reg = r".(?P<component_port>[a-zA-Z][\w]*)\s*\(\s*(?P<net_port>[a-zA-Z][\w]*)\s*\)\s*"

m_frm = 'utf-8'
"""
in_v input verilog file
"""
def get_modules(in_v, visual=False, debug=False, no_submodules=False):

    # get modules
    mod_re_b = bytes(module_reg, 'utf-8')

    in_v = remove_comments(in_v)

    with open(in_v, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)
        mo = regex.finditer(mod_re_b, data, re.MULTILINE)

    mod_names= {}
    mod_nets = {}

    mod_graphs = {} # place for nx graph mod_name : {'netlist':Graph()}

    #print(mo)

    # get module names
    for m in mo:
        if debug:
            print(m.group('module_netlist').decode('utf-8'))
        mod_nets[m.group('module_name').decode('utf-8')] = {
            'ports':{},
            'wires':[],
            'components':{}
        }
        mod_names[m.group('module_name').decode('utf-8')] = {'isSubmodule':False} 

        mod_graphs[m.group('module_name').decode('utf-8')] = {
                'netlist':nx.Graph(),
                'inputs':[],
                'outputs':[],
                'wires':[]}

    if debug:
        print(mod_graphs)

    with open(in_v, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)
        mo = regex.finditer(mod_re_b, data, re.MULTILINE)

    for m in mo:
        mod_name = m.group('module_name').decode('utf-8')
        # remove ws and split by ,
        mod_ports = [p.strip() for p in m.group('module_ports').decode('utf-8').split(',')]
        #mod_ports = regex.sub(r'\s', '', m.group('module_ports').decode('utf-8')).split(',')
        
        # build out netlist
        mod_parsed_net = parse_net(m.group('module_netlist'), mod_names=mod_names, mod_graph=mod_graphs[mod_name]['netlist'])
        #print(mod_parsed_net)
    
        for p in mod_ports:
            print(p)
            p_type = None
            if len(p.split(' ')) == 2:
                p_type = p.split(' ')[0]
                p = p.split(' ')[1]
                if p_type in ['output', 'input']:
                    mod_parsed_net[p_type+'s'].append(p)
                    mod_graphs[mod_name]['netlist'].nodes[p]['node_type'] = p_type
            if p in mod_parsed_net['inputs'] or p_type == 'input':
                mod_nets[mod_name]['ports'][p] = 'input'
                mod_graphs[mod_name]['inputs'].append(p)
                #mod_parsed_net[mod_name].nodes[p]['node_type'] = 'input'
            elif p in mod_parsed_net['outputs'] or p_type == 'output':
                mod_nets[mod_name]['ports'][p] = 'output'
                mod_graphs[mod_name]['outputs'].append(p)
                #mod_parsed_net[mod_name].nodes[p]['node_type'] = 'output'

        if isinstance(mod_parsed_net['wires'][0], list):
            join_list = []
            for l_item in mod_parsed_net['wires']:
                join_list.append(l_item)
            mod_parsed_net['wires'] = join_list

        print(mod_parsed_net)

        

        mod_nets[mod_name]['wires'] = mod_parsed_net['wires']
        mod_nets[mod_name]['components'] = mod_parsed_net['components']

    if debug:
        print(mod_names)

    top_module = None
    for m in mod_names:
        if not mod_names[m]['isSubmodule']:
            if top_module is None:
                top_module = m
            else:
                raise ValueError("More than one top module")
        else:
            continue
    if debug:
        print(top_module)

    if no_submodules:
        mod_graphs[top_module]['netlist'] = graphs_2_just_components(in_netlist_dict=mod_graphs, top_module=top_module)


 
    if visual:
        for G_el in mod_graphs:
            #print(G_el)
            G = mod_graphs[G_el]['netlist']
            #pos = {n:(ind*5, (ind/6-ind%6)*10) for ind,n in enumerate(G.nodes)}
            
            #subax1 = plt.subplot(121)
            #nx.draw(G, pos=pos, with_labels=True, font_weight='bold')
            nx.draw(G, with_labels=True, font_weight='bold')
            #subax2 = plt.subplot(122)
            #nx.draw_shell(G, nlist=[range(5, 10), range(5)], with_labels=True, font_weight='bold')
            plt.show()

    return mod_nets, mod_graphs

def graphs_2_just_components(in_netlist_dict, top_module, in_netlist=None, debug=False):
    
    if not isinstance(in_netlist, nx.Graph):
        top_graph = in_netlist_dict[top_module]['netlist']
    else:
        top_graph = in_netlist

    for t_node in list(top_graph.nodes):
        #print("node :"+str(t_node))
        if top_graph.nodes[t_node]['node_type'] == 'module':
            t_node_edges = list(top_graph.edges(t_node))
            #print("module node :"+str(t_node))
            # get netlist graph
            mod_net_name = top_graph.nodes[t_node]['mod_name']
            sub_mod_netlist = in_netlist_dict[mod_net_name]['netlist']
            # check for submodules of submodules
            graphs_2_just_components(in_netlist_dict, top_module, sub_mod_netlist)
            # remap node names for <submod_name>_<submod_node/component> that 
            #   are not inputs or outputs (needed for shifting nodes)
            new_node_map = {x:t_node+"_"+x for x in list(sub_mod_netlist.nodes)
                if not (sub_mod_netlist.nodes[x]['node_type'] == 'input' or \
                    sub_mod_netlist.nodes[x]['node_type'] == 'output')}
            if debug:
                print(new_node_map)
            sub_mod_netlist = nx.relabel_nodes(sub_mod_netlist, new_node_map)
            #ge['port'] = t_node+"_"+ge

            # attach graph to current graph
            for e in t_node_edges:
                # get internal module port and all connecting nodes
                if debug:
                    print("edge: "+str(e))
                ge = top_graph.edges[e[0],e[1]]

                in_edges = list(sub_mod_netlist.edges(ge['port']))
                in_comp =[]
                for in_e in in_edges:
                    #print("in_edge: "+str(in_e))
                    in_p = sub_mod_netlist.edges[in_e]['port']
                    #print("ge: "+str(ge['port']))
                    #print(in_p)
                    if in_e[0] == ge['port']:         
                        in_comp.append([in_e[1], in_p])
                    else:
                        in_comp.append([in_e[0], in_p])
                    # remove internal edge
                    sub_mod_netlist.remove_edge(in_e[0], in_e[1])
                # remove port node
                sub_mod_netlist.remove_node(ge['port'])

                # add edges
                new_edges = []
                for c in in_comp:
                    # get net wire
                    if e[0] == t_node:
                        w_node = e[1]
                    else:
                        w_node = e[0]
                    new_edges.append((w_node, c[0], {'port':c[1]}))
                top_graph.add_edges_from(new_edges)

                # remove existing edge with submodule
                top_graph.remove_edge(e[0],e[1])
            # add module netlist
            top_graph = nx.compose(top_graph, sub_mod_netlist)
            # remove submodule node
            top_graph.remove_node(t_node)
        else:
            # do nothing
            pass
    if debug:
        print(top_graph.nodes)
    return top_graph


def parse_net(in_net, mod_names=None, mod_graph=None, debug=False):

    net_re_b = bytes(net_reg, 'utf-8')

    if isinstance(in_net, bytes):
        values = regex.finditer(net_re_b, in_net, re.MULTILINE)
    else:
        ValueError("in_net not bytes")

    net_dict = {
        'inputs':[],
        'outputs':[],
        'wires':[],
        'components':{}
    }

    for v in values:
        v_str = v.groups()[0].decode('utf-8')
        #print(v_str)
        ports = []
        key = regex.match(r'\w*', v_str)[0]
        #print(key)
        if key == 'input':
            ports = regex.sub(bytes(r'[\s;]','utf-8'),bytes('','utf-8'), v.group('in_ports'))
            ports = ports.decode('utf-8').split(',')
            net_dict['inputs'].append(ports)
            mod_graph.add_nodes_from([(x, {'node_type':'input'}) for x in ports])
        elif key == 'output':
            ports = regex.sub(bytes(r'[\s;]','utf-8'),bytes('','utf-8'), v.group('out_ports'))
            ports = ports.decode('utf-8').split(',')
            net_dict['outputs'].append(ports)
            mod_graph.add_nodes_from([(x, {'node_type':'output'}) for x in ports])
        elif key == 'wire':
            connections = regex.sub(bytes(r'[\s;]','utf-8'),bytes('','utf-8'), v.group('wires'))
            connections = connections.decode('utf-8').split(',')
            net_dict['wires'].append(connections)
            mod_graph.add_nodes_from([(x, {'node_type':'wire'}) for x in connections])
        else: # component
            cv = regex.match(comp_reg, v_str)
            cp = regex.finditer(component_port_reg, cv.group('ports'), re.MULTILINE)
            net_dict['components'][cv.group('name')] =  {
                'component_type':cv.group('component'),
                'ports':{}
            }
            #if mod_names is not None:
            #else:
            #mod_graph.add_node(cv.group('name'), node_type=cv.group('component'))
            comp_name = cv.group('name')
            comp_type = cv.group('component')
            if debug:
                print(mod_names)

            if isinstance(mod_names, dict):
                #if cv.group('name') in mod_names:
                if cv.group('component') in mod_names:
                    #print(f"adding module: {comp_name}")
                    mod_names[comp_type]['isSubmodule'] = True
                    net_dict['components'][comp_name]['isModule'] = True
                    mod_graph.add_nodes_from([(comp_name,
                        {"node_type":"module", "mod_name":comp_type}
                    )])
                else:
                    #print(f"adding component: {comp_name} of type {comp_type}")
                    net_dict['components'][comp_name]['isModule'] = False
                    mod_graph.add_nodes_from([(comp_name,
                        {"node_type":cv.group('component')}
                    )])
                    #mod_graph[comp_name]['node_type'] = cv.group('component')
            else:
                mod_graph.add_nodes_from([(cv.group('name'),
                    {"node_type":cv.group('component')}
                )])

            for p in cp:
                net_dict['components'][comp_name]['ports'] = {
                    'comp_port':p.group('component_port'),
                    'net_port':p.group('net_port')
                }
                nx.set_node_attributes(mod_graph, {comp_name: {p.group('component_port'):p.group('net_port')}})
                # mod_graph[comp_name][p.group('component_port')] = p.group('net_port')
                mod_graph.add_edge(cv.group('name'), p.group('net_port'), port=p.group('component_port'))

    return net_dict

# remember to call G[mod]['netlist']
def visual_graph(net_graph):

    G = net_graph
    nx.draw(G, with_labels=True, font_weight='bold')
    plt.show()

def visual_all_graphs(net_graphs):
    for G_el in net_graphs:
            G = net_graphs[G_el]['netlist']
            nx.draw(G, with_labels=True, font_weight='bold')
            plt.show()

def remove_comments(in_v):
    # get modules
    mod_re_b = bytes(comm_remove, 'utf-8')

    with open(in_v, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)
        mo = regex.sub(mod_re_b, '', data, flags=re.MULTILINE)

    f_str = mo.decode("utf-8")

    #if write_output:
    of_v = in_v+".uncommented"
    of = open(in_v+".uncommented", 'w+')
    of.write(f_str)

    return of_v

def main(in_v, out_dir):
    pass

# fmt: on
