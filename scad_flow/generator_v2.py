
import os, sys
import shutil

import re
import mmap
import argparse

from generator_class import * 

#import solid
import regex
import pandas as pd

## Regex parsing
pin_block_reg = r'^PINS\s*\d*\s*;\w*\n(?|.*\n)*END\s*PINS$'
pin_line_reg  = r'^\s*-\s*(?P<pin>\w*)\s*\+\s*NET\s*(?P<net>\w*)\s*\+\s*DIRECTION\s*(?P<dir>\w*)\s*\+\sUSE\s*SIGNAL\s*\+\s*PORT\s*\+\s*LAYER\s*(?P<layer>\w*)\s*(\(\s*(?P<lx1>[-\d]*)\s*(?P<ly1>[-\d]*)\s*\))\s*(\(\s*(?P<lx2>[-\d]*)\s*(?P<ly2>[-\d]*)\s*\))\s*\+\s*FIXED\s*(\(\s*(?P<fx1>\d*)\s*(?P<fy1>\d*)\s*\)\s*(?P<fdir>\w))\s*;'

comp_block_reg = r'^COMPONENTS\s*\d*\s*;\w*\n(?|.*\n)*END\s*COMPONENTS$'
comp_line_reg = r'^\s*-\s*(?P<name>\w*)\s*(?P<comp>\w*)\s*\+\s*PLACED\s*(\(\s*(?P<x1>\d*)\s*(?P<y1>\d*)\s*\)\s*(?P<dir>\w*))\s*;'

nets_block_reg = r'^NETS\s*\d*\s*;\w*\n(?|.*\n)*END\s*NETS$'
#nets_line_reg = r'-\s*(?P<net>\w*)\s*(\(\s*(?P<dev1>\w*)\s*(?P<p1>\w*)\s*\))\s*(\(\s*(?P<dev2>\w*)\s*(?P<p2>\w*)\s*\))\s*\+\s*USE SIGNAL.*\s*\+\s*ROUTED.*\n(?|\s*NEW.*)*;$'
#nets_line_reg = r'^[ ]*-\s*(?P<net>\w*)\s*(?P<dev_groups>(\(\s*\w*\s*\w*\s*\))\s*(\(\s*\w*\s*\w*\s*\)\s*?)+)\s*\+\s*USE SIGNAL.*\s*\+\s*ROUTED.*\n(?|\s*NEW.*)*;$'
#nets_line_reg = r'^[ ]*-\s*(?P<net>\w*)\s*(?P<dev_groups>(\(\s*\w*\s*\w*\s*\)\s*?)+)\s*\+\s*USE SIGNAL.*\s*\+\s*ROUTED.*\n(?|\s*NEW.*)*;$'
nets_line_reg = r'^[ ]*-\s*(?P<net>\w*)\s*(?P<dev_groups>[\(\s\w\)]*?)\s*\+\s*USE SIGNAL.*\s*\+\s*ROUTED.*\n(?|\s*NEW.*)*;$'
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
}

def get_pins(in_def, in_pins_cdir, debug=False):
    
    pins={}

    mod_re = bytes(pin_block_reg, 'utf-8')

    # parse template
    with open(in_def, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)
        mo = regex.findall(mod_re, data, re.MULTILINE)

    if in_pins_cdir == None:
        _only_top = True
    elif in_pins_cdir.split('.')[-1] == 'csv':
        in_pin_list = pd.read_csv(in_pins_cdir)
        _only_top = False
    elif in_pins_cdir.split('.')[-1] == 'xlsx':
        in_pin_list = pd.read_excel(in_pins_cdir)
        _only_top = False

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
            # Fixed 
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
    
    mo = regex.finditer(mod_re, data, re.MULTILINE)

    return mo


def write_pins(o_file, pin_list, bulk, tlef_properties, mets, mode='w+', debug=False):
    
    f = open(o_file, mode)
    f.write("\n// PINS")

    nl = '\n'

    shape='cube'
    size = [0.1, 0.1, 0.1]
    rot  = [0, [0,0,1]]

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

        if p.connect_dir=='z+':
            pt1 = [
                float(p.fx1)/flp['def_scale']*flp['px'], 
                float(p.fy1)/flp['def_scale']*flp['px'], 
                bulk['z']*flp['layer']]
            pt2 = [
                float(p.fx1)/flp['def_scale']*flp['px'],
                float(p.fy1)/flp['def_scale']*flp['px'],
                (mets[p.layer]*flp['lpv']+flp['bot_layers'])*flp['layer']]
        elif p.connect_dir=='z-':
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


def get_components(in_def):
    
    mod_re = bytes(comp_block_reg, 'utf-8')

    # parse template
    with open(in_def, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)
        mo = regex.findall(mod_re, data, re.MULTILINE)

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
            mo = regex.findall(mod_re, data, re.MULTILINE)
    else:
        data = in_comp

    mo = regex.finditer(mod_re, data, re.MULTILINE)

    return mo

def write_components(o_file, comp_list, layer_h, px, mode="w+", pcell_file=None):

    if  isinstance(o_file, str):
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

    o_file.write(f"""
// Components
""")

    for c in comp_list:
        cx1 = float(c.x1)/net_property['def_scale']
        cy1 = float(c.y1)/net_property['def_scale']
        cz1 = net_property['bot_layers'] - 5 
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

    o_file.write(f"""
    
    """)

# hard coded properties
net_property = {
    'px':0.0076,
    'layer':0.010,
    'lpv':20,
    'def_scale':1000,
    'bot_layers':20
}


def get_nets(in_def, tlef=None, tlef_property=None, report_len_file=None, debug={}, testing=False):
    mod_re = bytes(nets_block_reg, 'utf-8')
    tlef_f = './def_test/test_1.tlef'
    #mod_re = regex.compile(nets_block_reg, re.MULTILINE)

    # parse template
    with open(in_def, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)
        mo = regex.findall(mod_re, data, re.MULTILINE)

    mo_l = get_net_lines(mo)

    nets_list = []

    if testing:
        print("Testing! Using test tlef file")
        tlef = tlef_f

    if tlef_property == None:
        nb = NetBuilder(
            px        =net_property['px'],
            layer     =net_property['layer'],
            lpv       =net_property['lpv'],
            def_scale =net_property['def_scale'],
            bottom_layers=net_property['bot_layers']
        )
    else:
        nb = NetBuilder(
            px        =tlef_property['px'],
            layer     =tlef_property['layer'],
            lpv       =tlef_property['lpv'],
            def_scale =tlef_property['def_scale'],
            bottom_layers=tlef_property['bot_layers']
        )
    nb.import_tlef(tlef)
    nb.import_met(mets)

    for l in mo_l:
        mo_r = get_net_route(l.group(0))

        net_dev_reg = r'\(\s*(?P<dev>\w+)\s+(?P<port>\w+)\s*\)'

        #print(l.group('net'))
        #print(l.group('dev_groups'))
        devs = regex.finditer(bytes(net_dev_reg, 'utf-8'), l.group('dev_groups'))

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
                z2=r_deco['z2']
            )
            elif route.group('via') is not None:
                nb.add_route(
                route.group('layer').decode('utf-8'),
                r_deco['x1'],
                r_deco['y1'],
                r_deco['z1'],
                via=route.group('via').decode('utf-8')
            )

            else:
                raise ValueError('Issue parsing route')

            

        nets_list.append(nb.export_net())

    for n in nets_list:
        if 'compress_routes' in debug and debug['compress_routes']==True:
            n.compress_routes(debug=True)
        else:
            n.compress_routes()

    if report_len_file is not None:
        route_len_dict = {}
        for n in nets_list:
            route_len_dict[n.net] = n.report_len()
        route_len_l = zip(*[route_len_dict.keys(),route_len_dict.values()])
        pd.DataFrame(route_len_l, 
            columns=['wire', 'length (mm)']).to_csv(report_len_file)

    return nets_list
    

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

    mo = regex.finditer(mod_re, data, re.MULTILINE)
    return mo

def get_net_route(in_net_line):
    mod_re = bytes(nets_route_reg, 'utf-8')

    # parse template
    if not isinstance(in_net_line, bytes):
        with open(in_net_line, 'r+') as f:
            data = mmap.mmap(f.fileno(), 0)
    else:
        data = in_net_line
    
    mo = regex.finditer(mod_re, data, 0)
    return mo

def write_nets(o_file, net_list, shape='cube', size=[0.1, 0.1, 0.1], mode="w+"):

    rot = [0, [0,0,1]]

    rend = None

    f = open(o_file, mode)
    nl = '\n'

    #print(net_list[0])

    for n in net_list:
        #o_file.write("""
        #// routing {n.net}
        #// connect {dev1}, {p1} to {dev2}, {p2}
        #polychannel(""")
        #print(n)

        pc_route = []
        
        for r in n.route:
            size = size
            pt = r
            
            pc_pt1 = [shape, size, pt, rot]
            #pc_pt2 = [shape, size, pt2, rot]

            pc_route.append(pc_pt1)
            #pc_rotue.append(pc_pt2)
            # todo


        #new_pc = pc.polychannel_route(
        #    n.net, [n.dev1, n.p1], [n.dev2, n.p2],
        #    str(pc_route).replace(']],', ']],\n')
        #)
        pc_route = str(pc_route).replace(']],', ']],\n').replace("'", '"')

        #["{n.dev1}", "{n.p1}"], ["{n.dev2}", "{n.p2}"],
        dev_str = ''.join([f"""["{x['dev']}", "{x['port']}"], """for x in n.devs])

        f.write(f"""polychannel_route("{n.net}", 
        [{dev_str}],
        [],
{pc_route}{nl});
        """)

        if n.dangle_routes:
            for dr in n.dangling_routes:
                pc_route = []
                for r in dr['route']:
                    size = size
                    pt = r
                    
                    pc_pt1 = [shape, size, pt, rot]
                    #pc_pt2 = [shape, size, pt2, rot]
                    pc_route.append(pc_pt1)
                
                pc_route = str(pc_route).replace(']],', ']],\n').replace("'", '"')

                #["{n.dev1}", "{n.p1}"], ["{n.dev2}", "{n.p2}"],
                dev_str = ''.join([f"""["{x['dev']}", "{x['port']}"], """for x in n.devs])

                f.write(f"""polychannel_route("{n.net}", 
        [{dev_str}],
        [],
{pc_route}{nl});
        """)


        if rend == None:
            rend = pc_route
        else:
            rend += pc_route
    f.close()

    #solid.scad_render_to_file(rend, o_file)

def write_imports(o_file, comp_file, routing_use, scad_lib_dir='.', copy=False, results_dir=None, mode='w'):

    of = open(o_file, mode)

    sc_base = '/'.join(os.path.realpath(__file__).split('/')[:-1]+\
        ['support_libs'])


    if '/' in comp_file:
        comp_dir = '.'
    else:
        comp_dir = scad_lib_dir
    #of.write(f"use <{scad_lib_dir}/{platform}_merged.scad>\n")
    if copy:
        if results_dir == None:
            raise ValueError("No results directory")
        shutil.copy(f"{comp_dir}/{comp_file}", 
            f"{results_dir}/{comp_file.split('/')[-1]}")
        of.write(f"use <./{comp_file.split('/')[-1]}>\n")
    else:
        of.write(f"use <{comp_dir}/{comp_file}>\n")
    
    if isinstance(routing_use, list):
        for r_use in routing_use:
            
            if copy and results_dir != None:
                #shutil.copy(f"{scad_lib_dir}/{r_use}.scad", 
                shutil.copy(f"{sc_base}/{r_use}.scad", 
                    f"{results_dir}/{r_use}.scad")
                of.write(f"use <./{r_use}.scad>\n")
            else:
                of.write(f"use <{scad_lib_dir}/{r_use}.scad>\n")
    elif isinstance(routing_use, str):
        #of.write(f"use <{scad_lib_dir}/{routing_use}.scad\n>")
        if copy and results_dir != None:
            shutil.copy(f"{scad_lib_dir}/{routing_use}.scad", 
                f"{results_dir}/{routing_use}.scad")
            of.write(f"use <./{routing_use}.scad>\n")
        else:
            of.write(f"use <{scad_lib_dir}/{routing_use}.scad>\n")


tlef_bl_re = r'(?P<key>(?:LAYER|SITE|VIA|PROPERTYDEFINITIONS|UNITS))\s*(?|.*\s*)*?END\s*\w*'
tlef_layer_re = r'LAYER\s*(?P<layer_name>\w*)\s*(?|(?:TYPE\s*(?P<type>(?:ROUTING|CUT))\s*;|DIRECTION\s*(?P<direction>(?:HORIZONTAL|VERTICAL))\s*;|MINWIDTH\s*(?P<minwidth>[\d.]*)\s*;|WIDTH\s*(?P<width>[\d.]*)\s*;)\s*)*END\s*(\w*)\s$'
tlef_via_re  = r'VIA\s*(?P<via_name>\w*)\s*(?P<type>\w*)(?|.*\n)*?(?:END\s*(?&via_name)\s*$)'
tlef_via_l_re= r'LAYER (?P<via_name>\w*)\s*;\s*(?:RECT\s*(?P<x1>[\d.-]*)\s*(?P<y1>[\d.-]*)\s*(?P<x2>[\d.-]*)\s*(?P<y2>[\d.-]*)\s*;)*'
tlef_site_re= r'SITE*\s(?P<site_name>\w*)\s*(?|(?:CLASS\s*(?P<class>\w*)\s*;|SYMMETRY\s*(?P<symmetry>\w*)\s*;|\s*SIZE\s*(?P<size_x>\d*)\s*BY\s*(?P<size_y>\d*)\s*;)\s*)*END\s*(\w*)\s*$'

def get_tlef_layer(tlef):
    
    mod_re = bytes(tlef_layer_re, 'utf-8')

    # parse template
    with open(tlef, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)

    mo = regex.finditer(mod_re, data, 0)
    

def get_tlef_via(tlef):
    
    mod_re = bytes(tlef_via_re, 'utf-8')

    # parse template
    with open(tlef, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)

    mo = regex.finditer(mod_re, data, 0)
    

def tlef_via_layer(in_via):
    
    mod_re = bytes(tlef_via_l_re, 'utf-8')

    if not isinstance(in_net_line, bytes):
        with open(in_via, 'r+') as f:
            data = mmap.mmap(f.fileno(), 0)
    else:
        data = in_via

    mo = regex.finditer(mod_re, data, 0)
    return mo

    

def get_tlef_site(tlef):

    mod_re = bytes(tlef_site_re, 'utf-8')

    # parse template
    with open(tlef, 'r+') as f:
        data = mmap.mmap(f.fileno(), 0)

    mo = regex.finditer(mod_re, data, 0)

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
    {tp}cube([{bulk_dim[0]}*px,{bulk_dim[1]}*px,{bulk_dim[2]}*layer]);
    union() {fb}
""")

# hard coded support files

routing_use = ['polychannel_v2', 'routing']

def main(platform, design, def_file, results_dir, px, layer, 
         bttm_layer, lpv, xbulk, ybulk, zbulk, xchip, ychip, 
         def_scale, pitch, res, dimm_file, tlef, comp_file=None, 
         pin_con_dir_f=None, pcell_file=None, transparent=False):
    
    print("""
    --------------------------------
          OpenSCAD generation
    --------------------------------
    """)

    if comp_file == None:
        comp_file = f"scad_flow/support_libs/{platform}_pdk_merged.scad"

    o_file = f"{results_dir}/{design}.scad"

    net_properties = {
        'px':px,
        'layer':layer,
        'lpv':lpv,
        'def_scale':def_scale,
        'bot_layers':bttm_layer
    }


    fb = '{'
    bb = '}'

    bulk = [xbulk, ybulk, zbulk] 

    len_file = f'{design}_length.csv'

    # generation
    # overwrites previous file
    print(f"Starting writing @ {results_dir}")
    os.makedirs(results_dir, exist_ok=True)

    write_imports(o_file, comp_file, routing_use, './support_libs', mode='w+', copy=True, results_dir=results_dir)

    with open(o_file, 'a') as of:
        of.write(f"""
px = {px};
layer = {layer};

""")

    # initial bulk generation
    write_bulk(o_file, bulk, transparent, mode='a')

    # write nets (routes)
    write_nets(o_file,
        get_nets(def_file, tlef, net_properties, report_len_file=results_dir+'/'+len_file),
        shape='cube',
        size=[0.1,0.1,0.1],
        mode='a')

    # write components
    write_components(o_file,
        get_components(def_file),
        net_property['layer'],
        net_property['px'],
        mode='a',
        pcell_file=pcell_file)

    # write pin vias
    write_pins(o_file,
        get_pins(def_file, pin_con_dir_f),
        bulk,
        net_properties,
        mets,
        mode='a')

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
{tp}interconnect_32channel({xbulk/2}, {ybulk/2}, {zbulk});
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
    parser.add_argument('--def_scale', type=float)
    parser.add_argument('--pitch', type=int)
    parser.add_argument('--res', type=int)
    parser.add_argument('--dimm_file', type=str)
    parser.add_argument('--tlef', type=str)
    parser.add_argument('--comp_file', type=str, default=None)
    parser.add_argument('--pin_file', type=str, default=None)
    parser.add_argument('--pcell_file', type=str, default=None)

    args = parser.parse_args()


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
        args.def_scale,
        args.pitch,
        args.res,
        args.dimm_file,
        args.tlef,
        args.comp_file,
        args.pin_file,
        args.pcell_file,
    )
