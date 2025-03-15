
from lark import Lark, Transformer
import networkx as nx
import json
import os
import sys

if __name__ != "__main__":
    import openmfda_flow.def_obj_grammer as def_grammer
else:
    import def_obj_grammer as def_grammer
# import def_obj_grammer as def_grammer


def write_def_header():
    return """VERSION 5.8 ;
DIVIDERCHAR "/" ;
BUSBITCHARS "[]" ;"""


class Design:
    def __init__(self, design_name):
        self.design_name = design_name
        self.rows = []
        self.tracks = []
        self.gcellgrid = []
        # dictionaries since they are instantitated
        self.components = {}
        self.pins = {}
        self.nets = {}
        self.unit = 1
        self.units_str = ""
        self.dieA = [[0,0], [0,0]]

    def add_row(self, new_row):
        pass

    def add_rows(self, new_rows):
        if not isinstance(new_rows, list):
            raise ValueError("Input should be of type list")

        for nr in new_rows:
            if isinstance(nr, Row):
                self.rows.append(nr)
            else:
                raise ValueError("Expecting list of Row classes")

    def set_unit_str(self, unit_str):
        self.units_str = unit_str

    def set_units(self, units):
        self.unit = units

    def set_die_area(self, pt1, pt2):
        self.dieA = [pt1, pt2]

    def change_component_property(self, comp_inst, property, value):
        if comp_inst not in self.components:
            print(f"Cannot find component {comp_inst}")
            return
        if property == "type":
            self.components[comp_inst].set_component_type(value)
        elif property == "pos" or property == "position":
            self.components[comp_inst].set_pos([value[0]*self.unit,value[1]*self.unit])
        elif property == "raw_pos" or property == "raw_position":
            self.components[comp_inst].set_pos(value)

    def get_component_names(self):
        return list(self.components.keys())

    def write_units(self):
        return f"UNITS {self.units_str} ;"

    def write_die_area(self):
        return f"DIEAREA ( {self.dieA[0][0]} {self.dieA[0][1]} ) ( {self.dieA[1][0]} {self.dieA[1][1]} ) ;"

    def print_def(self, out_file=None):
        #with open(out_file, "w+") as def_of:
        print(write_def_header()+'\n')
        print(f'DESIGN {self.design_name} ;' + '\n')
        print(self.write_units() + '\n')
        print(self.write_die_area() + '\n')
        print('\n'.join([r.write_row() for r in self.rows]) + '\n')
        print('\n'.join([r.write_track() for r in self.tracks]) + '\n')
        print('\n'.join([r.write_gcellgrid() for r in self.gcellgrid]) + '\n')
        print(f'COMPONENTS {len(self.components)} ;' + '\n')
        print('\n'.join(['    '+c.write_component() for c in self.components.values()]) + '\n')
        print('END COMPONENTS\n')
        print(f'PINS {len(self.pins)} ;' + '\n')
        print('\n'.join(['    '+p.write_pin() for p in self.pins.values()]) + '\n')
        print('END PINS\n')
        print(f'NETS {len(self.nets)} ;' + '\n')
        print('\n'.join([''+n.write_net() for n in self.nets.values()]) + '\n')
        print('END NETS\n')
        print('END DESIGN')

    def write_def(self, out_file):
        with open(out_file, "w+") as def_of:
            def_of.write(write_def_header()+'\n')
            def_of.write(f'DESIGN {self.design_name} ;' + '\n')
            def_of.write(self.write_units() + '\n')
            def_of.write(self.write_die_area() + '\n')
            def_of.write('\n'.join([r.write_row() for r in self.rows]) + '\n')
            def_of.write('\n'.join([r.write_track() for r in self.tracks]) + '\n')
            def_of.write('\n'.join([r.write_gcellgrid() for r in self.gcellgrid]) + '\n')
            def_of.write(f'COMPONENTS {len(self.components)} ;' + '\n')
            #def_of.write('\n'.join(['    '+str(c) for c in self.components.values()]) + '\n')
            def_of.write('\n'.join(['    '+c.write_component() for c in self.components.values()]) + '\n')
            def_of.write('END COMPONENTS\n')
            def_of.write(f'PINS {len(self.pins)} ;' + '\n')
            def_of.write('\n'.join(['    '+p.write_pin() for p in self.pins.values()]) + '\n')
            def_of.write('END PINS\n')
            def_of.write(f'NETS {len(self.nets)} ;' + '\n')
            def_of.write('\n'.join([''+n.write_net() for n in self.nets.values()]) + '\n')
            def_of.write('END NETS\n')
            def_of.write('END DESIGN')



class Row:
    def __init__(
            self, row_name, site, origin_x, origin_y,
            orientation, num_x, num_y, step_x, step_y):
        self.rname = row_name
        self.site = site
        self.origin_x = origin_x
        self.origin_y = origin_y
        self.orientation = orientation
        self.num_x = num_x
        self.num_y = num_y
        self.step_x = step_x
        self.step_y = step_y

    def write_row(self):
        return f"ROW {self.rname} " + \
            f"{self.site} {self.origin_x} {self.origin_y} {self.orientation} " + \
            f"DO {self.num_x} BY {self.num_y} STEP {self.step_x} {self.step_y} ;"


class Tracks:
    def __init__(self, dir, origin, num_dir_1, step_dir_1, layer):
        self.dir = dir
        self.origin = origin
        self.num_dir_1 = num_dir_1
        self.step_dir_1 = step_dir_1
        self.layer = layer

    def write_track(self):
        return f"TRACKS {self.dir} {self.origin} DO {self.num_dir_1} STEP {self.step_dir_1} LAYER {self.layer} ;"


class GCellGrid:
    def __init__(self, dir, origin, num_x, step_x):
        self.dir = dir
        self.origin = origin
        self.num_x = num_x
        self.step_x = step_x

    def write_gcellgrid(self):
        return f"GCELLGRID {self.dir} {self.origin} DO {self.num_x} STEP {self.step_x} ;"


class Component:
    def __init__(self, instance_name, component_type):
        self.instance_name = instance_name
        self.component_type = component_type
        self.is_placed = False
        self.pos = [0, 0]
        self.orientation = "N"

    def set_pos(self, pt, orientation=None):
        self.pos = pt
        if orientation is not None:
            self.orientation = orientation
        self.is_placed = True

    def set_component_type(self, component):
        self.component_type = component

    def write_component(self):
        return f"- {self.instance_name} {self.component_type} + " + \
            f"{'PLACED' if self.is_placed else ''} " + \
            f"( {self.pos[0]} {self.pos[1]} ) {self.orientation} ;"


class Pin:
    def __init__(self, pin_name, pin_net, direction, use):
        self.pin_name = pin_name
        self.pin_net = pin_net
        self.dir = direction
        self.use = use
        self.size = [[0,0], [0,0], ""]
        self.pos = [[0,0], ""]

    def set_layer(self, pt1, pt2, layer):
        self.size[0] = pt1
        self.size[1] = pt2
        self.size[2] = layer

    def set_pos(self, pt, layer):
        self.pos[0][0] = pt[0]
        self.pos[0][1] = pt[1]
        self.pos[1]    = layer


    def write_pin(self):
        return f"""    - {self.pin_name} + NET {self.pin_net} + DIRECTION {self.dir} + USE {self.use}
          + PORT
            + LAYER {self.size[2]} ( {self.size[0][0]} {self.size[0][1]} ) ( {self.size[1][0]} {self.size[1][1]} )
            + FIXED ( {self.pos[0][0]} {self.pos[0][1]} ) {self.pos[1]} ;"""


class Net:
    class segement:
        def __init__(self, layer, pt1, pt2, is_via=False, init_segment=False):
            self.layer = layer
            self.pt1 = pt1
            self.pt2 = pt2
            self.is_via = is_via
            self.init_segment = init_segment

        def write_pt2(self):
            if self.is_via:
                return self.pt2
            else:
                return f"( {self.pt2[0]} {self.pt2[1]} )"

        def write_segment(self):
            pt_str = f"{self.layer} ( {self.pt1[0]} {self.pt1[1]} ) {self.write_pt2()}"
            if self.init_segment:
                return f"ROUTED {pt_str}"
            else:
                return f"NEW {pt_str}"


    def __init__(self, net_name):
        self.net_name = net_name
        self.net_components = {}
        self.net_segments = []

    def add_component(self, comp_inst, comp_port):
        if comp_inst in self.net_components:
            raise ValueError(f"Component {comp_inst} already defined in net {self.net_name}")
        self.net_components[comp_inst] = comp_port

    def add_segment(self, s_layer, s_pt1, s_pt2):
        if isinstance(s_pt2, list):
            self.net_segments.append(self.segement(s_layer, s_pt1, s_pt2, is_via=False))
        elif isinstance(s_pt2, str):
            self.net_segments.append(self.segement(s_layer, s_pt1, s_pt2, is_via=True))
        else:
            raise ValueError("Pt2 is not of correct type "+str(type(s_pt2)))

    def write_net(self):
        nl = '\n        '
        if len(self.net_segments) > 0:
            segment_str = f"{nl}    + {nl.join([r.write_segment() for r in self.net_segments])}"
        else:
            segment_str = ""

        net_str = f"""    - {self.net_name} {' '.join(['( '+c[0]+' '+c[1]+' )' for c in self.net_components.items()])} + USE SIGNAL {segment_str};"""
        return net_str


class Def_transformer(Transformer):

    def __init__(self, get_nx_graph=False):
        self.get_nx = get_nx_graph
        super(Def_transformer, self).__init__()

    def INT(self, i):
        # (i,) = i
        return int(i)

    def CNAME(self, s):
        return str(s)

    def ORIENT(self, o):
        return str(o)

    def DIR(self, d):
        return str(d)

    def layer(self, lay):
        return lay[0]

    def pt(self, pt):
        return list(pt)

    def ESCAPED_STRING(self, es):
        return str(es)[1:-1]

    def VERSION(self, v):
        return str(v)

    ##########################
    # net parsing
    def net_pt(self, s):
        return [s[0], s[1]]
    # need the rule passe

    def net_segment(self, ns):
        layer = ns[0]
        ns = [ns[1], ns[2]]
        if isinstance(ns[1], list):
            # print(ns[1])
            for indp, pt in enumerate(ns):
                # print(pt)
                for indn, num in enumerate(pt):
                    if num is None:
                        # Assign to other point value
                        # print(ns)
                        ns[indp][indn] = ns[int(not indp)][indn]
            ns[0].append(layer)
        elif isinstance(ns[1], str):
            ns[0].append(layer)
            pass
        return ns

    def net_route(self, seg):
        return list(seg)

    def net_prop(self, prop):
        if prop[0] == "USE":
            return {str(prop[0]): str(prop[1])}
        elif prop[0] == "ROUTED":
            return {str(prop[0]): prop[1]}

    def strnet(self, comp):
        return {"COMPONENT": {"inst":comp[0], "port":comp[1]}}

    def net_st(self, statement):
        net_name = statement[0]
        n_cl = Net(net_name=statement[0])

        n = {net_name: {
            "COMPONENT": [],
            "ROUTED": [],
            "USE": None
        }}
        for inds, s in enumerate(statement):
            # print(s)
            if inds == 0:
                continue
            elif list(s.keys())[0] == "COMPONENT":
                n_cl.add_component(
                    comp_inst=s['COMPONENT']['inst'],
                    comp_port=s['COMPONENT']['port']
                )
                n[net_name]["COMPONENT"].append(s["COMPONENT"])
            else:
                n[net_name][list(s.keys())[0]] = s
                if list(s.keys())[0] == "ROUTED":
                    for nt_seg in s['ROUTED']:
                        n_cl.add_segment(
                            s_layer=nt_seg[0][2],
                            s_pt1=[nt_seg[0][0],nt_seg[0][1]],
                            s_pt2=nt_seg[1],
                            )
        n_cl_d = {statement[0]: n_cl}
        #print(n_cl_d)
        return n_cl_d
        #  return n

    def net_block(self, nb):
        temp = {}
        for x in nb[1:]:
            temp.update(x)
        return temp, "NETS"
        # return [{**x} for x in nb[1:]], "NETS"

    ##########################
    # component parsing
    def cmp_prop(self, prop):
        return {"pt": prop[0], "orientation": str(prop[1])}

    def cmp_st(self, st):
        cmp = Component(
            instance_name=st[0],
            component_type=st[1]
        )
        cmp.set_pos(st[2]["pt"], st[2]['orientation'])
        return {st[0]:cmp}
        #  return {st[0]: {"comp_type": st[1], **st[2]}}

    def cmp_block(self, cb):
        temp = {}
        for x in cb[1:]:
            # print(x)
            temp.update(x)
        return temp, "COMPONENTS"
        # return [{**x} for x in cb[1:]], "COMPONENTS"

    ##########################
    # via parsing
    def via_prop(self, p):
        if str(p[0]) == "DIRECTION" \
                or str(p[0]) == "USE" \
                or str(p[0]) == "NET":
            return {str(p[0]): str(p[1])}
        elif str(p[0]) == "PORT":
            return {"PORT": True}
        elif str(p[0]) == "FIXED" :
            return {"FIXED": {"pt":p[1], "orientation":p[2]}}
        else:  # is a layer
            return {"LAYER": [p[1], p[2], str(p[0])]}


    def via_st(self, st):
        # print ({st[0]:[{**x} for x in st[1:]]})
        temp = {}
        for p in st[1:]:
            temp.update(p)
        p = Pin(
                pin_name=st[0],
                pin_net=temp['NET'],
                direction=temp['DIRECTION'],
                use=temp['USE']
                )
        p.set_layer(temp["LAYER"][0], temp["LAYER"][1], temp["LAYER"][2],)
        p.set_pos(temp["FIXED"]['pt'], temp["FIXED"]['orientation'])
        return {st[0]: p}
        #  return {st[0]: temp}

        # return {st[0]:[{**x} for x in st[1:]]}

    def via_block(self, vb):
        temp = {}
        for p in vb[1:]:
            temp.update(p)
        return temp, "PINS"
        # return [{**x} for x in vb[1:]], "PINS"

    ##########################
    # design block parsing

    def do(self, d):
        return {"do": list(d)}

    def step(self, s):
        return {"step": list(s)}

    def origin(self, o):
        return list(o)

    def row(self, r):
        return Row(row_name=r[0],
                   site=r[1],
                   origin_x=r[2][0],
                   origin_y=r[2][1],
                   orientation=r[2][2],
                   num_x=r[3]["do"][0],
                   num_y=r[3]["do"][1],
                   step_x=r[4]["step"][0],
                   step_y=r[4]["step"][1]
                   ), "ROW"
        # return {r[0]: {"site": r[1], "origin": r[2], **r[3], **r[4]}}, "ROW"

    def track(self, t):
        return Tracks(
            dir=t[0],
            origin=t[1],
            num_dir_1=t[2]["do"][0],
            step_dir_1=t[3]["step"][0],
            layer=t[4]
            ), "TRACK"
        # return {
        #     "dir": t[0],
        #     "origin": t[1],
        #     **t[2],
        #     **t[3],
        #     "layer": t[4]}, "TRACK"

    def gcellgrid(self, gcg):
        return GCellGrid(
            dir=gcg[0],
            origin=gcg[1],
            num_x=gcg[2]["do"][0],
            step_x=gcg[3]["step"][0]
        ), "GCELLGRID"
        # return {
        #     "dir": gcg[0],
        #     "origin": gcg[1],
        #     **gcg[2],
        #     **gcg[3]
        # }, "GCELLGRID"

    def diearea(self, d):
        return {
            "pt": list(d)
        }, "DIEAREA"

    def units(self, u):
        return {
            'ustr':f"{u[0]} {u[1]} {u[2]}",
            'unit':u[2]
            }, "UNITS"
        # return {
        #     "type": u[0],
        #     "unit": u[1],
        #     "value": u[2]
        # }, "UNITS"

    def prop(self, p):
        p1, p2 = p[0]
        return p[0]

    # def design_block(self, db):
    #     d_dict = {
    #         "ROW": {},
    #         "TRACK": [],
    #         "GCELLGRID": []
    #     }
    #     for d in db:
    #         if d[1] == "ROW":
    #             d_dict["ROW"] = {**d_dict["ROW"], **d[0]}
    #         elif d[1] == "TRACK":
    #             d_dict["TRACK"].append(d[0])
    #         elif d[1] == "GCELLGRID":
    #             d_dict["GCELLGRID"].append(d[0])
    #         elif d[1] == "PINS" \
    #             or d[1] == "COMPONENTS" \
    #             or d[1] == "NETS" \
    #             or d[1] == "DIEAREA" \
    #             or d[1] == "UNITS":
    #             d_dict[d[1]] = d[0]
    #     return {db[0]: d_dict}

    def design_block(self, db):
        d_class = Design(db[0])
        d_dict = {
            "ROW": {},
            "TRACK": [],
            "GCELLGRID": []
        }
        for d in db:
            if d[1] == "ROW":
                #d_dict["ROW"] = {**d_dict["ROW"], **d[0]}
                d_class.rows.append(d[0])
            elif d[1] == "TRACK":
                #d_dict["TRACK"].append(d[0])
                d_class.tracks.append(d[0])
            elif d[1] == "GCELLGRID":
                #d_dict["GCELLGRID"].append(d[0])
                d_class.gcellgrid.append(d[0])
            elif d[1] == "PINS" \
                    or d[1] == "COMPONENTS" \
                    or d[1] == "NETS" \
                    or d[1] == "DIEAREA" \
                    or d[1] == "UNITS":
                d_dict[d[1]] = d[0]
                if d[1] == "NETS":
                    d_class.nets = d[0]
                elif d[1] == "COMPONENTS":
                    d_class.components = d[0]
                elif d[1] == "PINS":
                    d_class.pins = d[0]
                elif d[1] == "UNITS":
                    d_class.set_unit_str(d[0]['ustr'])
                    d_class.set_units(d[0]['unit'])
                elif d[1] == "DIEAREA":
                    d_class.set_die_area(d[0]['pt'][0], d[0]['pt'][1])
        # print(d_class.print_def())
        return {"design": {db[0]: d_class}}
        # return {db[0]: d_dict}

    ##########################
    # def parsing

    def busbitchars(self, bbchar):
        return {"BUTBITCHARS":bbchar[0]}

    def dividerchar(self, dchar):
        return {"BUTBITCHARS":dchar[0]}

    def version(self, v):
        return {"DEF_VERSION":v[0]}

    def def_f(self, d):
        temp = {}
        for x in d:
            temp.update(x)
        return temp

    def start(self, s):
        temp = {}
        for x in s:
            temp.update(x)
        return temp


def test(in_file, ofile):
    def_obj_parser = def_grammer.import_def_parser()

    with open(in_file, 'r') as ifile:
        tree = def_obj_parser.parse(ifile.read())
    tr_tree = Def_transformer().transform(tree)

    print(tr_tree)
    tr_demo = tr_tree['design']['demo']
    # def change_component_property(self, comp_inst, property, value):
    tr_demo.change_component_property('serp0', 'pos', [2100, 420])
    tr_demo.change_component_property('serp0', 'type', 'serpentine_210px_0')

    tr_demo.print_def()
    # print(tr_tree)


if __name__ == "__main__":

    ifl = "../../flow/results/demo/base/4_final.def"
    ofl = "./demo_out_test.def"

    test(ifl, ofl)
