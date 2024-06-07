
import os, sys

import regex
import re
import mmap

import networkx as nx


#module_reg = r"\s*module\s*(?P<module>\s*[a-zA-Z][\w]*)\s*\((?P<ports>[\s*\w*,]*)\)\s*;(?P<module_netlist>[\w*\s*,;\(\)\.]*?)endmodule"
module_reg = r"^[ ]*module\s*(?P<module_name>[a-zA-Z][\w]*)\s\((?P<module_ports>[\s\w,]*)\)\s*;(?P<module_netlist>[\s\w.,\(\);]*?)endmodule"
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
def get_modules(in_v, debug=False):

    # get modules
    mod_re_b = bytes(module_reg, 'utf-8')

    with open(in_v, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)
        mo = regex.findall(mod_re_b, data, re.MULTILINE)

    mod_names= {}
    mod_nets = {}

    # get module names
    for m in mo:
        mod_net[m.group('module_name').decode('uft-8')] = {
            'ports':{},
            'wires':[],
            'components':{}
        }
        mod_names[m.group('module_name').decode('uft-8')] = {'isSubmodule':False} 

    for m in mo:
        mod_name = m.group('module_name').decode('uft-8')
        # remove ws and split by ,
        mod_ports = regex.sub('\s', '', m.group('module_ports').decode('utf-8')).split(',')
        
        # build out netlist
        mod_parsed_net = parse_net(m.group('module_netlist'), mod_names=mod_names)
    
        for p in mod_ports:
            if p in mod_parsed_net['inputs']:
                mod_net[mod_name]['ports'][p] = 'input'
            elif p in mod_parsed_net['outputs']:
                mod_net[mod_name]['ports'][p] = 'output'

        mod_net[mod_name]['wires'] = mod_parsed_net['wires']
        mod_net[mod_name]['components'] = mod_parsed_net['components']

    top_module = None
    for m in mod_names:
        if m['isSubModule']:
            if top_module is None:
                top_module = m
            else:
                raise ValueError("More than one top module")
        else:
            continue
 
    pass

def parse_net(in_net, mod_names=None, debug=False):

    net_re_b = bytes(net_reg, 'utf-8')

    if isinstance(in_net, bytes):
        values = regex.findall(net_re_b, in_net, re.MULTILINE)
    else:
        ValueError("in_net not bytes")

    net_dict = {
        'inputs':[],
        'outputs':[],
        'wires':[],
        'components':{}
    }

    for v in values:
        v = v.decode('utf-8')
        ports = []
        key = regex.match('/w*', v)
        if key == 'input':
            ports = regex.sub('[\s;]','', v.group('in_ports')).split(',')
            net_dict['inputs'].append(ports)
        elif key == 'output':
            ports = regex.sub('[\s;]','', v.group('out_ports')).split(',')
            net_dict['outputs'].append(ports)
        elif key == 'wire':
            connections = regex.sub('[\s;]','', v.group('wires')).split(',')
            net_dict['wires'].append(connections)
        else: # component
            cv = regex.match(comp_reg, v)
            cp = regex.findall(component_port_reg, cv.group('ports')) 
            net_dict['components'][cv.group('name')] =  {
                'component_type':cv.group('component'),
                'ports':{}
            }
            for p in cp:
                net_dict['components'][cv.group('name')]['ports'] = {
                    'comp_port':p.group('component_port'),
                    'net_port':p.group('net_port')
                }
            if mod_names is not None:
                if cv.group('name') in mod_names:
                    mod_names[cv.group('name')] = True
                    net_dict['components'][cv.group('name')]['isModule'] = True
                else:
                    net_dict['components'][cv.group('name')]['isModule'] = False

    return net_dict

def main(in_v, out_dir):
    pass

