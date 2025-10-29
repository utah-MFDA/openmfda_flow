# fmt:off
import os
import sys
import shutil

import re
import mmap
import argparse

# custom classes
# import lef_component_class as lcc
#from generator_class import *

#import solid
#import regex
import json
import csv
import pandas as pd
import networkx as nx

from generator_class import NetBuilder
from generator_class import Pin, Component, Nets
#from route_scripts import link_routes, convert_layers, convert_lengths, get_intersections
#from route_scripts import check_net_intersections
import route_scripts
import component_parse

## Regex parsing
#pin_block_reg = r'^PINS\s*\d*\s*;\w*\n(?|.*\n)*END\s*PINS$' # last implementation
pin_block_reg = r'^PINS\s*\d*\s*;\w*\n([\s\S]*)^\s*END\s*PINS$'
pin_line_reg  = r'^\s*-\s*(?P<pin>\w*)\s*\+\s*NET\s*(?P<net>[\w\.]*)\s*\+\s*DIRECTION\s*(?P<dir>\w*)\s*\+\sUSE\s*SIGNAL\s*\+\s*PORT\s*\+\s*LAYER\s*(?P<layer>\w*)\s*(\(\s*(?P<lx1>[-\d]*)\s*(?P<ly1>[-\d]*)\s*\))\s*(\(\s*(?P<lx2>[-\d]*)\s*(?P<ly2>[-\d]*)\s*\))\s*\+\s*FIXED\s*(\(\s*(?P<fx1>\d*)\s*(?P<fy1>\d*)\s*\)\s*(?P<fdir>\w))\s*;'

#comp_block_reg = r'^COMPONENTS\s*\d*\s*;\w*\n(?|.*\n)*END\s*COMPONENTS$' # last implementation
comp_block_reg = r'^\s*COMPONENTS\s*\d*\s*;([\s\S]*)^\s*END\s*COMPONENTS$'
comp_line_reg = r'^\s*-\s*(?P<name>[\w\.]*)\s*(?P<comp>\w*)\s*\+\s*(?:PLACED|FIXED)\s*(\(\s*(?P<x1>\d*)\s*(?P<y1>\d*)\s*\)\s*(?P<dir>\w*))\s*;'

#nets_block_reg = r'^NETS\s*\d*\s*;\w*\n(?|.*\n)*END\s*NETS$' # last implementation
nets_block_reg = r'^NETS\s*\d*\s*;\w*\n([\s\S]*)^\s*END\s*NETS$'
#nets_line_reg = r'-\s*(?P<net>\w*)\s*(\(\s*(?P<dev1>\w*)\s*(?P<p1>\w*)\s*\))\s*(\(\s*(?P<dev2>\w*)\s*(?P<p2>\w*)\s*\))\s*\+\s*USE SIGNAL.*\s*\+\s*ROUTED.*\n(?|\s*NEW.*)*;$'
#nets_line_reg = r'^[ ]*-\s*(?P<net>\w*)\s*(?P<dev_groups>(\(\s*\w*\s*\w*\s*\))\s*(\(\s*\w*\s*\w*\s*\)\s*?)+)\s*\+\s*USE SIGNAL.*\s*\+\s*ROUTED.*\n(?|\s*NEW.*)*;$'
#nets_line_reg = r'^[ ]*-\s*(?P<net>\w*)\s*(?P<dev_groups>(\(\s*\w*\s*\w*\s*\)\s*?)+)\s*\+\s*USE SIGNAL.*\s*\+\s*ROUTED.*\n(?|\s*NEW.*)*;$'
#nets_line_reg = r'^[ ]*-\s*(?P<net>[\w\.]*)\s*(?P<dev_groups>[\(\s\w\.\)]*?)\s*\+\s*USE SIGNAL.*\s*\+\s*ROUTED.*\n?(?|\s*NEW.*)*;$' # last implemenation
nets_line_reg = r'^[ ]*-\s*(?P<net>[\w\.]*)\s*(?P<dev_groups>[\(\s\w\.\)\-]*?)\s*\+\s*USE\s+SIGNAL.*\s*\+\s*ROUTED.*\n?(?:[\s\S]*?);$'
nets_route_reg= r'(?:ROUTED|NEW)\s*(?P<layer>\w*)\s*((?:\(\s*(?P<x1>[\d\*]*)\s*(?P<y1>[\d\*]*)\s*(?P<z1>[\d\*]*)\s*\)))\s((?:\(\s*(?P<x2>[\d\*]*)\s*(?P<y2>[\d\*]*)\s*(?P<z2>[\d\*]*)\s*\)|(?P<via>\w*)))'

# solid imports

#pdk = solid.import_scad(os.getcwd()+'/support_libs/h.r.3.3_pdk_merged.scad')
#pc = solid.import_scad(os.getcwd()+'/support_libs/polychannel_v2.scad')
#routing = solid.import_scad(os.getcwd()+'/support_libs/routing.scad')

mfda_scad = None

# hard coded metal layers
mets = {
    'met1':0,
    'met2':1,
    'met3':2,
    'met4':3,
    'met5':4,
    'met6':5,
    'met7':6,
    'met8':7,
    'met9':8,
    'met10':9,
    'met11':10,
    'met12':11,
    'met13':12,
    'met14':13,
    'met15':14,
    'met16':15,
    'met17':16,
    'met18':17,
    'met19':18,
    'met20':19,
    'met21':20,
    'met22':21,
    'met23':22,
    'met24':23,
    'met25':24,
    'met26':25,
    'met27':26,
    'met28':27,
    'met29':28,
    'met30':29,
    'met31':30,
    'met32':31,
    'met33':32,
    'met34':33,
}

run_u_adjustment_script = False

METS = mets


def get_pins(in_def, in_pins_cdir, debug=False):

    pins = {}

    mod_re = bytes(pin_block_reg, 'utf-8')

    # parse template
    with open(in_def, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)
        #mo = regex.findall(mod_re, data, re.MULTILINE)
        mo = re.findall(mod_re, data, re.MULTILINE)

    if in_pins_cdir is None:
        _only_top = True
    elif in_pins_cdir.split('.')[-1] == 'csv':
        in_pin_list = pd.read_csv(in_pins_cdir)
        _only_top = False
    elif in_pins_cdir.split('.')[-1] == 'xlsx':
        in_pin_list = pd.read_excel(in_pins_cdir)
        _only_top = False
    else:
        _only_top = True

    for m in mo:

        obj = get_pin_line(m)

        # iterate through pin objects
        for o in obj:
            pin_n = o.group('pin').decode('utf-8')
            if not _only_top:
                pin_f_i = in_pin_list.loc[in_pin_list['pin'] == pin_n].index
                pin_cdir = in_pin_list['connect_direction'].iloc[pin_f_i[0]]
            elif _only_top:
                pin_cdir = 'TOP'

            if debug:
                if not _only_top:
                    print(in_pin_list.loc[in_pin_list['pin'] == pin_n].index[0])

            pins[pin_n] = Pin(
                    name=pin_n,
                    net=o.group('net').decode('utf-8'),
                    direction=o.group('dir').decode('utf-8'),
                    # layer
                    layer=o.group('layer').decode('utf-8'),
                    l_size=[o.group('lx1').decode('utf-8'),
                    o.group('ly1').decode('utf-8'),
                    o.group('lx2').decode('utf-8'),
                    o.group('ly2').decode('utf-8')],
                    #  Fixed
                    fixed=[o.group('fx1').decode('utf-8'),
                    o.group('fy1').decode('utf-8'),
                    o.group('fdir').decode('utf-8')],
                    connect_dir=pin_cdir
                )
    if debug:
        print(pins)
    return pins


def get_pin_line(in_pin):

    #if not isinstance(bytes):
    mod_re = bytes(pin_line_reg, 'utf-8')

    # parse template
    if not isinstance(in_pin, bytes):
        with open(in_pin, 'r+') as f:
            data = mmap.mmap(f.fileno(), 0)
    else:
        data = in_pin

    mo = re.finditer(mod_re, data, re.MULTILINE)

    return mo


def write_pins(
        o_file,
        pin_list,
        bulk,
        tlef_properties,
        mets,
        use_def_io_size=False,
        io_interface_size=None,
        mode='w+',
        debug=False):

    f = open(o_file, mode)
    f.write("\n// PINS\n")

    nl = '\n'

    shape = 'cube'
    if not use_def_io_size:
        if io_interface_size is None:
            size = [0.1, 0.1, 0.1]
        elif isinstance(io_interface_size, list) and len(io_interface_size) == 3:
            size = io_interface_size
        else:
            raise ValueError(f'io_interface_size not correctly defined; got {io_interface_size} expecting len 3 list')
    else:
        print('use_def_io_size, not yet implemented used io_interface_size')
        size = [0.1, 0.1, 0.1]
        print(f'  default value {size}')

    rot = [0, [0, 0, 1]]

    flp = tlef_properties

    if isinstance(bulk, list):
        bulk = {
            'x':bulk[0],
            'y':bulk[1],
            'z':bulk[2]
        }

    for p in pin_list.values():
        if debug:
            print(mets[p.layer])

        if p.connect_dir == 'z+':
            if 'def_scale' not in flp or flp['def_scale'] is None:
                raise ValueError("def_scale not defined")
            if 'px' not in flp or flp['px'] is None:
                raise ValueError("px not defined")
            if p.fx1 is None:
                raise ValueError(f"Issues with pin definition: {p.name}")
            pt1 = [
                float(p.fx1)/flp['def_scale']*flp['px'],
                float(p.fy1)/flp['def_scale']*flp['px'],
                bulk['z']*flp['layer']]
            pt2 = [
                float(p.fx1)/flp['def_scale']*flp['px'],
                float(p.fy1)/flp['def_scale']*flp['px'],
                (mets[p.layer]*flp['lpv']+flp['bot_layers'])*flp['layer']]
        elif p.connect_dir == 'z-':
            pt1 = [p.x1/flp['def_scale'], p.y1/flp['def_scale'], bulk['z']*flp['layer_h']]
            pt2 = [p.x1/flp['def_scale'], p.y1/flp['def_scale'], 0]

        pc_route = [[shape, size, pt1, rot]]
        pc_route.append([shape, size, pt2, rot])

        pc_route = str(pc_route).replace("'", '"').replace(']],', ']],\n')

        f.write(f"""
    polychannel_route("{p.name}",
    ["PIN"], ["net", "{p.net}"],
{pc_route}{nl});
""")
    return pin_list


def get_components(in_def, in_lef_merged=None):

    mod_re = bytes(comp_block_reg, 'utf-8')

    if not isinstance(in_lef_merged, type(None)):
        lefs_c = lcc.Lef_list(in_lef_merged)

    # parse template
    with open(in_def, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)
        mo = re.findall(mod_re, data, re.MULTILINE)

    mo_l = get_comp_line(mo)

    comp_list = []

    for l in mo_l:

        nc = Component(
            name=l.group('name').decode('utf-8'),
            comp=l.group('comp').decode('utf-8'),
            x1=l.group('x1').decode('utf-8'),
            y1=l.group('y1').decode('utf-8'),
            dir=l.group('dir').decode('utf-8'),
            #def_scale=net_property['def_scale']
        )

        # get port locations
        if not isinstance(in_lef_merged, type(None)):
            nc.add_pins(lef_c[nc.comp].pins)

        comp_list.append(nc)
    return comp_list
    #write_components(comp_list)


def get_comp_line(in_comp):

    mod_re = bytes(comp_line_reg, 'utf-8')

    if isinstance(in_comp, list):
        in_comp = in_comp[0]

    # parse template
    if not isinstance(in_comp, bytes):
        with open(in_comp, 'r+') as f:
            data = mmap.mmap(f.fileno(), 0)
            mo = re.findall(mod_re, data, re.MULTILINE)
    else:
        data = in_comp

    mo = re.finditer(mod_re, data, re.MULTILINE)

    return mo

def write_components(o_file, comp_list, layer_h, px, def_scale, bottom_layers=0, mode="w+", pcell_file=None):

    if isinstance(o_file, str):
        o_file = open(o_file, mode)

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

    print('pcell dict: ', pc_dict)

    o_file.write("""
// Components
""")

    for c in comp_list:
        cx1 = float(c.x1)/def_scale
        cy1 = float(c.y1)/def_scale
        cz1 = bottom_layers - 5
        # all components have a 5 layer offset for some reason

        if has_pcells and (c.comp in pc_dict):
            o_file.write(f'''// {c.name}
{pc_dict[c.comp]["pcell"]}(xpos = {cx1}, ypos = {cy1}, zpos = {cz1}, orientation = "{c.dir}"''')

            cell_params = ', '.join(pc_dict[c.comp]['params'].split(' '))
            o_file.write(f", {cell_params} ")
            o_file.write(');\n')
        else:
            o_file.write(f"""// {c.name}
{c.comp}(xpos = {cx1}, ypos = {cy1}, zpos = {cz1}, orientation = "{c.dir}");
""")

    o_file.write("""

    """)

    return comp_list


# hard coded properties
hc_net_property = {
    'px':0.0076,
    'layer':0.010,
    'lpv':20,
    'def_scale':1000,
    'bot_layers':20
}


def get_nets(in_def, design, tlef=None, tlef_property=None,
             report_len_file=None, pins=None, components=None,
             component_lef=None, debug={}, testing=False,
             dimm_file=None, report_route_net_file=None,
             gen_with_px_conversion=True, skip_u_adj=(not run_u_adjustment_script)
             ):

    mod_re = bytes(nets_block_reg, 'utf-8')
    tlef_f = './def_test/test_1.tlef'
    #mod_re = regex.compile(nets_block_reg, re.MULTILINE)

    # parse template
    with open(in_def, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)
        mo = re.findall(mod_re, data, re.MULTILINE)

    mo_l = get_net_lines(mo)

    nets_list = []

    if testing:
        print("Testing! Using test tlef file")
        tlef = tlef_f

    if tlef_property is None:  # load defaults
        nb = NetBuilder(
            px        =hc_net_property['px'],
            layer     =hc_net_property['layer'],
            lpv       =hc_net_property['lpv'],
            def_scale =hc_net_property['def_scale'],
            bottom_layers=hc_net_property['bot_layers']
        )
        s = hc_net_property['px']*1000/hc_net_property['def_scale']
    else:
        nb = NetBuilder(
            px        =tlef_property['px'],
            layer     =tlef_property['layer'],
            lpv       =tlef_property['lpv'],
            def_scale =tlef_property['def_scale'],
            bottom_layers=tlef_property['bot_layers']
        )
        s = tlef_property['px']*1000/tlef_property['def_scale']
    nb.import_tlef(tlef)
    nb.import_met(mets)


    os.environ["XYCE_WL_GRAPH"] = ''
    # with open(components_lef, 'r') as f:
    # component pins can be checked by
    # def is_pt_in_pins(self, pt, pos=None, layer=None):
    #get_comp_pins_from_lef
    # comp_dict = component_parse.ComponentParser().parser_multi_file(components_lef)
    # s = 7.6/1000  # hard coded scale
    comp_dict = {}
    if isinstance(component_lef, str):
        comp_dict = component_parse.ComponentParser().get_comp_pins_from_lef(component_lef, scale=s)
    elif isinstance(component_lef, list):
        for c_lef in component_lef:
            new_dict = component_parse.ComponentParser().get_comp_pins_from_lef(c_lef, scale=s)
            for cmp in new_dict.items():
                if cmp[0] in comp_dict:
                    print(f"Component {cmp[0]} already read in, skipping")
                else:
                    comp_dict[cmp[0]] = cmp[1]

    for l in mo_l:
        mo_r = get_net_route(l.group(0))

        net_dev_reg = r'\(\s*(?P<dev>\w+)\s+(?P<port>\w+)\s*\)'

        print(l.group('net'))
        print(l.group('dev_groups'))
        devs = re.finditer(bytes(net_dev_reg, 'utf-8'), l.group('dev_groups'))

        dev_list = []
        for d in devs:
            dev_list.append({'dev':d.group('dev').decode('utf-8'), 'port':d.group('port').decode('utf-8')})

        n = Nets(net=l.group('net').decode('utf-8'),
                 devs=dev_list
                 )

        nb.set_net(n)

        for route in mo_r:
            r_deco = {}
            v_deco = ''
            #print(route.group('layer'))
            for coor in ['x1', 'y1', 'z1', 'x2', 'y2', 'z2']:
                if route.group(coor) is not None:
                    r_deco[coor] = route.group(coor).decode('utf-8')
                else:
                    r_deco[coor] = None

            if route.group('x2') is not None:
                nb.add_route(
                    route.group('layer').decode('utf-8'),
                    r_deco['x1'],
                    r_deco['y1'],
                    r_deco['z1'],
                    x2=r_deco['x2'],
                    y2=r_deco['y2'],
                    z2=r_deco['z2'],
                    convert_layer=False
                )
            elif route.group('via') is not None:
                nb.add_route(
                    route.group('layer').decode('utf-8'),
                    r_deco['x1'],
                    r_deco['y1'],
                    r_deco['z1'],
                    via=route.group('via').decode('utf-8'),
                    convert_layer=False
                )

            else:
                raise ValueError('Issue parsing route')

        if not (dimm_file is None or dimm_file == "") and \
                l.group('net') in dimm_file:
            pass
            nb.set_dimm(dimm_file[l.group('net')])


        nets_list.append(nb.export_net())

    if gen_with_px_conversion:
        def_scale = 7.6e-6
        # def_scale = 1e3
        # px_size = 7.6e-3
    else:
        def_scale = 1000
        px_size = 1

    for n in nets_list:
        print("ROUTE:",n.route)
        if 'compress_routes' in debug and debug['compress_routes'] is True:
            n.compress_routes(debug=True, design=design)
            # linked_net = link_routes(n.route, n.devs, debug=True, design=design)
        else:
            if components is None:
                n.compress_routes(design=design, pin_list=pins, def_scale=def_scale)
                # linked_net = link_routes(
                #     n.route,
                #     n.devs,
                #     debug=True,
                #     design=design,
                #     pin_list=pins,
                #     def_scale=def_scale,
                #     px_sz=px_size
                # )
            else:
                n.compress_routes(design=design, pin_list=pins, component_list=components,
                                  components_lef=component_lef, comp_dict=comp_dict,
                                  def_scale=def_scale)
                # linked_net = link_routes(
                #     n.route,
                #     n.devs,
                #     debug=True,
                #     design=design,
                #     pin_list=pins,
                #     component_list=components,
                #     components_lef=component_lef,
                #     def_scale=def_scale,
                #     px_sz=px_size
                # )

        if gen_with_px_conversion:
            n.convert_layers(nb)
            # linked_net = convert_layers(
            #     linked_net,
            #     METS,
            # )
    segment_limit = 120*7.6e-3

    if not skip_u_adj:
        # used to remove unnessary "u-turn vias"
        #   currently removes too many pts
        for net1 in nets_list:
            if isinstance(net1.route, nx.Graph):
                print(f"Analyzing {net1.net}")
                for subnet in net1.route.nodes:
                    print(f"rt: {net1.route.nodes[subnet]['route']}")
                    # print(net1.route.nodes[subnet])
                    net1.route.nodes[subnet]['route'] = \
                        route_scripts.u_adjustments(
                            route=net1.route.nodes[subnet]['route'],
                            other_rt=[
                                ch_net.route.nodes[ck_subnet]['route']
                                for ch_net in nets_list if ch_net.net != net1.net
                                for ck_subnet in ch_net.route.nodes
                            ],
                            u_len_limit=segment_limit
                        )
                    net1.route.nodes[subnet]['route'] = \
                        route_scripts.u_adjustments(
                            route=net1.route.nodes[subnet]['route'],
                            other_rt=[
                                ch_net.route.nodes[ck_subnet]['route']
                                for ch_net in nets_list if ch_net.net != net1.net
                                for ck_subnet in ch_net.route.nodes
                            ],
                            u_len_limit=segment_limit
                        )
                    net1.route.nodes[subnet]['route'] = \
                        route_scripts.u_adjustments(
                            route=net1.route.nodes[subnet]['route'],
                            other_rt=[
                                ch_net.route.nodes[ck_subnet]['route']
                                for ch_net in nets_list if ch_net.net != net1.net
                                for ck_subnet in ch_net.route.nodes
                            ],
                            u_len_limit=segment_limit
                        )
                    print(f"after\nrt: {net1.route.nodes[subnet]['route']}\n")
            if isinstance(net1.route, list):
                print("Route flattening not support")


    # check for intersections
    intersect_pts = {}
    for net1 in nets_list:
        for net2 in nets_list:
            if net1.net == net2.net:
                continue
            # TODO update to check routes instead of combining them
            i = route_scripts.check_net_intersections(
                    net1.get_list(),
                    net2.get_list()
            )
            if len(i) > 0:
                if net1 not in intersect_pts:
                    intersect_pts[net1.net] = {}
                intersect_pts[net1.net][net2.net] = i

    # if len(intersect_pts) > 0:
    #     intersct_file = "net_intersections.json"
    #     with open(intersct_file, "w+") as insct_f:
    #         insct_f.write(str(intersect_pts))

    return nets_list, intersect_pts


def get_net_lines(in_net):
    mod_re = bytes(nets_line_reg, 'utf-8', )

    if isinstance(in_net, list):
        in_net = in_net[0]

    # parse template
    if not isinstance(in_net, bytes):
        with open(in_net, 'r+') as f:
            data = mmap.mmap(f.fileno(), 0)
    else:
        data = in_net

    mo = re.finditer(mod_re, data, re.MULTILINE)
    return mo


def get_net_route(in_net_line):
    mod_re = bytes(nets_route_reg, 'utf-8')

    # parse template
    if not isinstance(in_net_line, bytes):
        with open(in_net_line, 'r+') as f:
            data = mmap.mmap(f.fileno(), 0)
    else:
        data = in_net_line

    mo = re.finditer(mod_re, data, 0)
    return mo


def write_nets(o_file, net_list, shape='cube',
               size=[14, 14, 10], mode="w+",
               dimm_file=None, init_size=[14, 14, 10],
               report_len_file=None, report_route_net_file=None,
               tlef=None, tlef_property=None,
               dim_is_converted=False, poly_px_module=False,
               px_conversion=1
               ):

    rot = [0, [0,0,1]]

    rend = None

    f = open(o_file, mode)
    nl = '\n'

    if poly_px_module:
        route_module = poly_px_module
    else:
        route_module = "polychannel_route"


    def convert_size(sz):
        if poly_px_module:
            return f"[{sz[0]}, {sz[1]}, {sz[2]}]"
        else:
            return f"[{sz[0]}*px, {sz[1]}*px, {sz[2]}*layer]"

    if tlef_property is None:  # load defaults
        nb = NetBuilder(
            px        =hc_net_property['px'],
            layer     =hc_net_property['layer'],
            lpv       =hc_net_property['lpv'],
            def_scale =hc_net_property['def_scale'],
            bottom_layers=hc_net_property['bot_layers']
        )
        s = hc_net_property['px']*1000/hc_net_property['def_scale']
    else:
        nb = NetBuilder(
            px        =tlef_property['px'],
            layer     =tlef_property['layer'],
            lpv       =tlef_property['lpv'],
            def_scale =tlef_property['def_scale'],
            bottom_layers=tlef_property['bot_layers']
        )
        s = tlef_property['px']*1000/tlef_property['def_scale']
    nb.import_tlef(tlef)
    nb.import_met(mets)

    #print(net_list[0])

    for n in net_list:
        #o_file.write("""
        #// routing {n.net}
        #// connect {dev1}, {p1} to {dev2}, {p2}
        #polychannel(""")
        print(n)

        pc_route = []

        if dimm_file is None:
            rt_size = convert_size(size)
        else:
            if n.net in dimm_file and \
                    isinstance(dimm_file[n.net]["dimm"], list) and \
                    len(dimm_file[n.net]["dimm"]) == 3:
                dimm = dimm_file[n.net]["dimm"]
                rt_size = convert_size(dimm)
                dimm_file[n.net]["been-read"] = True
                pass
            else:
                if n.net in dimm_file and isinstance(dimm_file[n.net]["dimm"], list) and \
                        len(dimm_file[n.net]["dimm"]) != 3:
                    print(f"Net {n.net} does not have the correct amount of args")
                rt_size = convert_size(size)

        for r in n.route.nodes:
            pc_route = []
            #print(n.route[r])
            if 'route' in n.route.nodes[r]:
                for pt in n.route.nodes[r]['route']:
                    #pt = r

                    if len(pc_route) == 0:
                        # pc_pt1 = [shape, convert_size(init_size), pt, rot]
                        pc_pt1 = [shape, rt_size, pt, rot]
                    elif len(pc_route) == len(n.route.nodes[r]) - 1:
                        # pc_pt1 = [shape, convert_size(init_size), pt, rot]
                        pc_pt1 = [shape, rt_size, pt, rot]
                    else:
                        # pc_pt1 = [shape, convert_size(init_size), pt, rot]
                        pc_pt1 = [shape, rt_size, pt, rot]
                    #pc_pt2 = [shape, size, pt2, rot]

                    pc_route.append(pc_pt1)
                    #pc_rotue.append(pc_pt2)
                    # todo
            else:
                continue  # does not write empty routes


            #new_pc = pc.polychannel_route(
            #    n.net, [n.dev1, n.p1], [n.dev2, n.p2],
            #    str(pc_route).replace(']],', ']],\n')
            #)
            pc_route = str(pc_route).replace(']],', ']],\n').replace("'", '"')

            #["{n.dev1}", "{n.p1}"], ["{n.dev2}", "{n.p2}"],
            dev_str = ''.join([f"""["{x['dev']}", "{x['port']}"], """for x in n.devs])

            if r == '':
                r_str = ''
            else:
                r_str = f'({r})'

            f.write(f"""{route_module}("{n.net}{r_str}",
        [{dev_str}],
        [],
{pc_route.replace('"[','[').replace(']"',']')}{nl});
        """)

        if report_len_file is not None:
            route_len_dict = {}
            route_graph_dict = {}
            for n in net_list:
                if not dim_is_converted:
                    n.convert_layers(nb)
                    n.convert_lengths(nb, px_conversion)
                route_len_dict[n.net] = n.report_len()
                route_graph_dict[n.net] = n.report_route_graph()
            route_len_l = zip(*[route_len_dict.keys(),route_len_dict.values()])
            pd.DataFrame(
                route_len_l,
                columns=['wire', 'length (mm)']).to_csv(report_len_file)
            if '/' in report_len_file:
                dirname = os.path.dirname(report_len_file)+'/'
            else:
                dirname = ''
            # if os.path.isfile(dirname+f"{design}_route_nets.json"):
                # os.remove(dirname+f"{design}_route_nets.json")
            if report_route_net_file is None:
                with open(dirname+f"{design}_route_nets.json", "w+") as of_rnets:
                    of_rnets.write(json.dumps(route_graph_dict, indent=4))
            else:
                with open(report_route_net_file, "w+") as of_rnets:
                    of_rnets.write(json.dumps(route_graph_dict, indent=4))
    f.close()

    if dimm_file is not None and isinstance(dimm_file, dict):
        for nt in dimm_file:
            if not dimm_file[nt]["been-read"]:
                print(f"Net {nt} was not used in design; dimm:{dimm_file[nt]['dimm']}")
    elif dimm_file is not None:
        print(f"Dimm file not read correctly, type {type(dimm_file)}")

    #solid.scad_render_to_file(rend, o_file)


def write_imports(
        o_file,
        comp_file,
        routing_use,
        scad_lib_dir='.',
        scad_include=[],
        copy=False,
        results_dir=None,
        mode='w'):

    of = open(o_file, mode)

    #sc_base = '/'.join(
        #os.path.realpath(__file__)
        #.split('/')[:-1]+['support_libs'])

    sc_base = scad_lib_dir

    if '/' in comp_file:
        comp_dir = '.'
    else:
        comp_dir = scad_lib_dir
    #of.write(f"use <{scad_lib_dir}/{platform}_merged.scad>\n")
    if copy:
        if not isinstance(comp_file, list):
            raise ValueError(f"comp_file is not a list, is of type: {type(comp_file)}")
        for cf in comp_file:
            if results_dir is None:
                raise ValueError("No results directory")
            if scad_lib_dir == '.':
                shutil.copy(
                    cf,
                    f"{results_dir}/{cf.split('/')[-1]}"
                )
            else:
                shutil.copy(
                    f"{comp_dir}/{cf}",
                    f"{results_dir}/{cf.split('/')[-1]}"
                )
            of.write(f"use <./{cf.split('/')[-1]}>\n")
    else:
        print("Has results file", results_dir)
        if isinstance(comp_file, list):
            if results_dir is None:
                for cf in comp_file:
                    of.write(f"use <{comp_dir}/{cf}>\n")
            else:
                for cf in comp_file:
                    if '/' in cf:
                        of.write(f"use <./{cf.split('/')[-1]}>\n")
                    else:
                        of.write(f"use <./{cf}>\n")
        else:
            if results_dir is None:
                of.write(f"use <{comp_dir}/{comp_file}>\n")
            else:
                of.write(f"use <./{os.path.basename(comp_file)}>\n")


    of.write("//Routing library\n")
    if isinstance(routing_use, list):
        for r_use in routing_use:
            r_name = os.path.basename(r_use) if '/' in r_use else r_use
            if copy and results_dir is not None:
                # shutil.copy(f"{scad_lib_dir}/{r_use}.scad",
                if scad_lib_dir == '.':
                    shutil.copy(
                        r_use,
                        f"{results_dir}/{r_name}"
                    )
                else:
                    shutil.copy(
                        f"{sc_base}/{r_name}",
                        f"{results_dir}/{r_name}"
                    )
                of.write(f"use <./{r_name}>\n")
            else:
                of.write(f"use <{scad_lib_dir}/{r_name}>\n")
    else:
        raise ValueError(f"routing use of wrong type is of type {type(routing_use)}")

    of.write("//Additional includes\n")
    if isinstance(scad_include, list):
        for sc_i in scad_include:
            sc_i_name = os.path.basename(sc_i) if '/' in sc_i else sc_i
            if copy and results_dir is not None:
                # shutil.copy(f"{scad_lib_dir}/{r_use}.scad",
                if scad_lib_dir == '.':
                    shutil.copy(
                        sc_i,
                        f"{results_dir}/{sc_i_name}"
                    )
                else:
                    shutil.copy(
                        f"{sc_base}/{sc_i_name}",
                        f"{results_dir}/{sc_i_name}"
                    )
                of.write(f"use <./{sc_i_name}>\n")
            else:
                of.write(f"use <{scad_lib_dir}/{sc_i_name}>\n")
    elif scad_include is None:
        # Nothing to do
        pass
    else:
        raise ValueError(f"routing use of wrong type is of type {type(scad_include)}")
    # elif isinstance(routing_use, str):
    #     # of.write(f"use <{scad_lib_dir}/{routing_use}.scad\n>")
    #     if copy and results_dir is not None:
    #         shutil.copy(
    #             f"{scad_lib_dir}/{routing_use}.scad",
    #             f"{results_dir}/{routing_use}.scad"
    #         )
    #         of.write(f"use <./{routing_use}.scad>\n")
    #     else:
    #         of.write(f"use <{scad_lib_dir}/{routing_use}.scad>\n")


def read_dimm(dimm_file):
    out_dict = {}
    reader = csv.reader(open(dimm_file, 'r'))
    for ind, i in enumerate(reader):
        if len(i) > 1 and i[-1] == '':
            i = i[:-1]
        # net, dim1, dim2, dim3
        if len(i) == 4:
            out_dict[i[0]] = {}
            out_dict[i[0]]["dimm"] = i[1:4]
            out_dict[i[0]]["been-read"] = False
        else:
            print(f"Line {ind} is defined incorrectly, expecting [net_name, dimm_wd_1, dimm_wd_2, dimm_ht]")
    return out_dict

# these are currently unused
#tlef_bl_re = r'(?P<key>(?:LAYER|SITE|VIA|PROPERTYDEFINITIONS|UNITS))\s*(?|.*\s*)*?END\s*\w*'
tlef_bl_re = r'(?P<key>(?:LAYER|SITE|VIA|PROPERTYDEFINITIONS|UNITS))\s*(?:[\S\s]*?)*?END\s*\w*'
tlef_layer_re = r'LAYER\s*(?P<layer_name>\w*)\s*(?|(?:TYPE\s*(?P<type>(?:ROUTING|CUT))\s*;|DIRECTION\s*(?P<direction>(?:HORIZONTAL|VERTICAL))\s*;|MINWIDTH\s*(?P<minwidth>[\d.]*)\s*;|WIDTH\s*(?P<width>[\d.]*)\s*;)\s*)*END\s*(\w*)\s$'
tlef_via_re  = r'VIA\s*(?P<via_name>\w*)\s*(?P<type>\w*)(?|.*\n)*?(?:END\s*(?&via_name)\s*$)'
tlef_via_l_re= r'LAYER (?P<via_name>\w*)\s*;\s*(?:RECT\s*(?P<x1>[\d.-]*)\s*(?P<y1>[\d.-]*)\s*(?P<x2>[\d.-]*)\s*(?P<y2>[\d.-]*)\s*;)*'
#tlef_site_re= r'SITE*\s(?P<site_name>\w*)\s*(?|(?:CLASS\s*(?P<class>\w*)\s*;|SYMMETRY\s*(?P<symmetry>\w*)\s*;|\s*SIZE\s*(?P<size_x>\d*)\s*BY\s*(?P<size_y>\d*)\s*;)\s*)*END\s*(\w*)\s*$'
tlef_site_re= r'SITE*\s(?P<site_name>\w*)\s*(?|(?:CLASS\s*(?P<class>\w*)\s*;|SYMMETRY\s*(?P<symmetry>\w*)\s*;|\s*SIZE\s*(?P<size_x>\d*)\s*BY\s*(?P<size_y>\d*)\s*;)\s*)*END\s*(\w*)\s*$'


def get_tlef_layer(tlef):

    mod_re = bytes(tlef_layer_re, 'utf-8')

    # parse template
    with open(tlef, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)

    mo = re.finditer(mod_re, data, 0)


def get_tlef_via(tlef):

    mod_re = bytes(tlef_via_re, 'utf-8')

    # parse template
    with open(tlef, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)

    mo = re.finditer(mod_re, data, 0)


def tlef_via_layer(in_via):

    mod_re = bytes(tlef_via_l_re, 'utf-8')

    if not isinstance(in_net_line, bytes):
        with open(in_via, 'r+') as f:
            data = mmap.mmap(f.fileno(), 0)
    else:
        data = in_via

    mo = re.finditer(mod_re, data, 0)
    return mo


def get_tlef_site(tlef):

    mod_re = bytes(tlef_site_re, 'utf-8')

    # parse template
    with open(tlef, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)

    mo = re.finditer(mod_re, data, 0)

def write_bulk(o_file, bulk_dim, transparent=False, mode='a'):

    fb = '{'
    bb = '}'

    if transparent:
        tp = '%'
    else:
        tp = ''

    with open(o_file, mode) as of:
        of.write(f"""
difference() {fb}
    if($preview) {fb}
        {tp}%cube([{bulk_dim[0]}*px,{bulk_dim[1]}*px,{bulk_dim[2]}*layer]);
    {bb} else {fb}
        {tp}cube([{bulk_dim[0]}*px,{bulk_dim[1]}*px,{bulk_dim[2]}*layer]);
    {bb}
    union() {fb}
""")

# hard coded support files



def main(
        platform,
        design,
        def_file,
        results_dir,
        px,
        layer,
        bttm_layer,
        lpv,
        xbulk,
        ybulk,
        zbulk,
        xchip,
        ychip,
        pitch,
        res,
        dimm_file,
        tlef,
        o_file,
        def_scale=1000,
        routing_size=[14, 14, 10],
        io_size=[14, 14, 10],
        use_def_io=False,
        comp_file=None,
        pin_con_dir_f=None,
        pcell_file=None,
        transparent=False,
        no_copy_include=False,
        component_merge_lef=None,
        add_comp_to_routes=False,
        component_scad=None,
        routing_scad=None,
        scad_bulk=None,
        scad_src_dir='.',  # './support_libs'
        scad_includes=[],
        length_out_file=None,
        route_net_file=None
        ):

    print("""
    --------------------------------
          OpenSCAD generation
    --------------------------------
    """)

    # default scad component file
    if isinstance(routing_scad, str):
        routing_scad = [routing_scad]
    elif routing_scad is None:
        print("No instances of routing scad files supplied")
        routing_scad = ['polychannel_v2.scad', 'routing.scad']

    if component_scad is None and comp_file is not None:
        component_scad = comp_file
    # old implementation needs remove, this is a bad default path
    # elif component_scad is None and comp_file is None:
    #     component_scad = f"scad_flow/support_libs/{platform}_pdk_merged.scad"
    if isinstance(component_scad, str):
        component_scad = [component_scad]

    if isinstance(scad_includes, str):
        scad_includes = [scad_includes]

    #o_file = f"{results_dir}/{design}.scad"

    net_properties = {
        'px': px,
        'layer': layer,
        'lpv': lpv,
        'def_scale': def_scale,
        'bot_layers':bttm_layer
    }


    fb = '{'
    bb = '}'

    bulk = [xbulk, ybulk, zbulk]

    len_file = f'{design}_length.csv'

    # generation
    # overwrites previous file
    print(f"Starting writing @ {results_dir}/{design}.scad")
    os.makedirs(results_dir, exist_ok=True)

    write_imports(
        o_file, component_scad, routing_scad, scad_src_dir,
        scad_include=scad_includes,
        mode='w+',
        copy=(not no_copy_include),
        results_dir=results_dir
        )

    with open(o_file, 'a') as of:
        of.write(f"""
px = {px} ;
layer = {layer} ;
lpv = {lpv} ;

// options

show_lefs=false ;

""")

    # initial bulk generation
    write_bulk(o_file, bulk, transparent, mode='a')

    # write components
    comp_list = write_components(
        o_file,
        get_components(def_file),
        net_properties['layer'],
        net_properties['px'],
        net_properties['def_scale'],
        bottom_layers=net_properties['bot_layers'],
        mode='a',
        pcell_file=pcell_file)

    # write pin vias
    io_list = write_pins(
        o_file=o_file,
        pin_list=get_pins(def_file, pin_con_dir_f),
        bulk=bulk,
        tlef_properties=net_properties,
        mets=mets,
        io_interface_size=io_size,
        use_def_io_size=use_def_io,
        mode='a')

    if dimm_file is not None:
        dimm_ = read_dimm(dimm_file)
    else:
        dimm_ = None

    # write nets (routes)
    # lengths are not reported in this step
    nets_list, net_intersects = get_nets(
            def_file,
            design,
            tlef,
            net_properties,
            report_len_file=length_out_file,
            pins=io_list if add_comp_to_routes else None,
            components=comp_list if add_comp_to_routes else None,
            component_lef=component_merge_lef,
            report_route_net_file=route_net_file
        )

    if len(net_intersects) > 0:
        pt_reg = r"\[\s*(\d+[.]?\d*),\s*(\d+[.]?\d*),\s*(\d+[.]?\d*)\s*\]"
        if os.path.dirname(o_file) == '':
            intersct_file = "./net_intersections.json"
        else:
            intersct_file = os.path.dirname(o_file) + "/net_intersections.json"
        print(o_file)
        with open(intersct_file, "w+") as insct_f:
            insct_f.write(
                re.sub(
                    pt_reg,
                    r"[\1, \2, \3]",
                    json.dumps(net_intersects, indent=4),
                    re.MULTILINE)
            )
            #insct_f.write("{"+str(net_intersects)+"}")


    write_nets(
        o_file,
        nets_list,
        shape='cube',
        size=routing_size,
        mode='a',
        dimm_file=dimm_,
        report_len_file=length_out_file,
        report_route_net_file=route_net_file,
        tlef=tlef,
        tlef_property=net_properties
    )
    # pins=io_list,
    # components=comp_list)

    with open(o_file, 'a') as of:
        of.write(f"""
{bb} // end union
{bb} // end difference
""")

    # write interconnect
    if transparent:
        tp = '%'
    else:
        tp = ''
    with open(o_file, 'a') as of:
        of.write(f"""
if($preview) {fb}
    {tp}%interconnect_32channel({xbulk/2}, {ybulk/2}, {zbulk});
{bb} else {fb}
    {tp}interconnect_32channel({xbulk/2}, {ybulk/2}, {zbulk});
{bb}
""")

    print("""
    --------------------------------
          OpenSCAD complete
    --------------------------------
    """)


if __name__ == "__main__":

    parser = argparse.ArgumentParser()

    parser.add_argument('--platform', type=str)
    parser.add_argument('--design', type=str)
    parser.add_argument('--def_file', type=str)
    parser.add_argument('--results_dir', type=str)
    parser.add_argument('--px', type=float)
    parser.add_argument('--layer', type=float)
    parser.add_argument('--bottom_layer', type=int)
    parser.add_argument('--lpv', type=int)
    parser.add_argument('--xbulk', type=int)
    parser.add_argument('--ybulk', type=int)
    parser.add_argument('--zbulk', type=int)
    parser.add_argument('--xchip', type=int, nargs=2)
    parser.add_argument('--ychip', type=int, nargs=2)
    parser.add_argument('--def_scale', type=float, default=1000)
    parser.add_argument('--pitch', type=int)
    parser.add_argument('--res', type=int)
    parser.add_argument('--dimm_file', type=str)
    parser.add_argument('--tlef', type=str, default=None)
    parser.add_argument('--tlef_file', type=str, default=None)
    parser.add_argument('--comp_file', type=str, default=None)
    parser.add_argument('--pin_file', type=str, default=None)
    parser.add_argument('--pcell_file', type=str, default=None)
    parser.add_argument('--lef_file', type=str, default=None, nargs='*')
    parser.add_argument('--transparent_bulk', action='store_true', default=False)
    parser.add_argument('--no_copy_include', action='store_true', default=False)

    parser.add_argument('--routing_size', type=int, default=None, nargs='+')

    parser.add_argument('--io_size', type=int, default=None, nargs='+')
    parser.add_argument('--use_def_io_size', action='store_true', default=False)

    parser.add_argument('--scad_out_file', type=str, default=None)

    parser.add_argument('--component_file', type=str, default=None)
    parser.add_argument('--routing_file', type=str, default=None)
    parser.add_argument('--scad_include', type=str, nargs='*')

    parser.add_argument('--length_out', type=str, default=None)
    parser.add_argument('--route_map_out', type=str, default=None)

    parser.add_argument('--use_poly_px_mod', type=str, default=None)

    args = parser.parse_args()

    # --scad_out_file
    if args.scad_out_file is None:
        if '/' in args.design:
            o_file_basename = os.path.basename(args.design)
            args.scad_out_file = f"{args.results_dir}/{o_file_basename}.scad"
        else:
            args.scad_out_file = f"{args.results_dir}/{args.design}.scad"

    # --tlef_file
    if args.tlef is not None and args.tlef_file is not None:
        raise ValueError("Cannot define both --tlef and --tlef_file")
    elif args.tlef is not None:
        pass
    elif args.tlef_file is not None:
        args.tlef = args.tlef_file

    # -- routing_size
    if args.routing_size is not None:
        if len(args.routing_size) == 2:
            routing_size = [
                    args.routing_size[0],
                    args.routing_size[0],
                    args.routing_size[1]]
        elif len(args.routing_size) == 3:
            routing_size = args.routing_size
        else:
            raise ValueError(f'Too many arguments for --routing_size, expecting 2 or 3 got {len(args.routing_size)}')

    else:
        routing_size = [14, 14, 10]

    if args.io_size is not None and args.use_def_io_size:
        print('  Both io_size and use_def_io_size defined, the def io size will get priority')
    if args.io_size is not None:
        if len(args.io_size) == 2:
            args.io_size = [
                args.io_size[0] * args.px,
                args.io_size[1] * args.px,
                routing_size[2] * args.layer,
            ]
            print('  Defaulting io_size height to routing hieght')
        elif len(args.io_size) == 3:
            args.io_size = [
                args.io_size[0] * args.px,
                args.io_size[1] * args.px,
                args.io_size[2] * args.layer,
            ]
            pass # nothing to be done
        else:
            raise ValueError(f'Incorrect amount of arguments expecting 2 or 3, got {len(args.io_size)}')

    if args.comp_file is not None and args.component_file is not None:
        raise ValueError("Cannot define both --comp_file and --component_file")
    elif args.component_file is not None:
        args.comp_file = args.component_file

    if args.lef_file is not None:
        add_comps = True
    else:
        add_comps = False

    if args.dimm_file == '':
        args.dimm_file = None

    if args.length_out is None:
        args.length_out = f"{args.results_dir}/{args.design}_length.csv"

    if args.route_map_out is None:
        args.route_map_out = f"{args.results_dir}/{args.design}_route_nets.json"

    if args.use_poly_px_mod is None:
        args.use_poly_px_mod = False

    main(
        args.platform,
        args.design,
        args.def_file,
        args.results_dir,
        args.px,
        args.layer,
        args.bottom_layer,
        args.lpv,
        args.xbulk,
        args.ybulk,
        args.zbulk,
        args.xchip,
        args.ychip,
        args.pitch,
        args.res,
        args.dimm_file,
        args.tlef,
        o_file=args.scad_out_file,
        def_scale=args.def_scale,
        routing_size=routing_size,
        io_size=args.io_size,
        use_def_io=args.use_def_io_size,
        comp_file=args.comp_file,
        pin_con_dir_f=args.pin_file,
        pcell_file=args.pcell_file,
        transparent=args.transparent_bulk,
        no_copy_include=args.no_copy_include,
        add_comp_to_routes=add_comps,
        component_merge_lef=args.lef_file,
        routing_scad=args.routing_file,
        scad_includes=args.scad_include,
        length_out_file=args.length_out,
        route_net_file=args.route_map_out
    )
