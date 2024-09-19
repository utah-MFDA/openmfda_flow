
from lark import Lark, Transformer
import json
import os

class Def_transformer(Transformer):
    def INT(self, i):
        # (i,) = i
        return int(i)
    def CNAME(self, s):
        return str(s)
    def ORIENT(self, o):
        return str(o)
    def DIR(self, d):
        return str(d)
    def layer(self, l):
        return l[0]
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
                    if num == None:
                        # Assign to other point value
                        # print(ns)
                        ns[indp][indn] = ns[int(not indp)][indn]
            ns[0].append(layer)
        elif isinstance(ns[1], str):
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
                n[net_name]["COMPONENT"].append(s["COMPONENT"])
            else:
                n[net_name][list(s.keys())[0]] = s
        return n

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
        return {st[0]: {"comp_type": st[1], **st[2]}}

    def cmp_block(self, cb):
        temp = {}
        for x in cb[1:]:
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
        else: # is a layer
            return {"LAYER": [p[1], p[2], str(p[0])]}
    def via_st(self, st):
        # print ({st[0]:[{**x} for x in st[1:]]})
        temp = {}
        for p in st[1:]:
            temp.update(p)
        return {st[0]: temp}
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
        return {r[0]: {"site": r[1], "origin": r[2], **r[3], **r[4]}}, "ROW"

    def track(self, t):
        return {
            "dir": t[0],
            "origin": t[1],
            **t[2],
            **t[3],
            "layer": t[4]}, "TRACK"

    def gcellgrid(self, gcg):
        return {
            "dir": gcg[0],
            "origin": gcg[1],
            **gcg[2],
            **gcg[3]
        }, "GCELLGRID"

    def diearea(self, d):
        return {
            "pt": list(d)
        }, "DIEAREA"

    def units(self, u):
        return {
            "type": u[0],
            "unit": u[1],
            "value": u[2]
        }, "UNITS"

    def prop(self, p):
        p1, p2 = p[0]
        return p[0]

    def design_block(self, db):
        d_dict = {
            "ROW": {},
            "TRACK": [],
            "GCELLGRID": []
        }
        for d in db:
            if d[1] == "ROW":
                d_dict["ROW"] = {**d_dict["ROW"], **d[0]}
            elif d[1] == "TRACK":
                d_dict["TRACK"].append(d[0])
            elif d[1] == "GCELLGRID":
                d_dict["GCELLGRID"].append(d[0])
            elif d[1] == "PINS" \
                or d[1] == "COMPONENTS" \
                or d[1] == "NETS" \
                or d[1] == "DIEAREA" \
                or d[1] == "UNITS":
                d_dict[d[1]] = d[0]
        return {db[0]: d_dict}

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


def main(in_file, design=None, info_output=None, debug=False):

    info = get_info(in_file, design, info_output, debug)
    
    if debug: print(info)
 

def get_info(in_file, design=None, info_output=None, debug=False):
    f_dir = os.path.abspath(os.path.dirname(__file__))
    def_parser = Lark.open(f"{f_dir}/def_grammer.lark", lexer='basic')

    with open(in_file, 'r') as ifile:
        tree = def_parser.parse(ifile.read())
    tr_tree = Def_transformer().transform(tree)

    if info_output is not None and design is not None:
        n_tree = {}
        if isinstance(info_output, str):
            info_output = [info_output]
        print(f"outputing info {design}:{info_output}")
        for info in info_output:
            n_tree[info] = tr_tree[design][info]
            #print(tr_tree[design][info])
        tr_tree = n_tree


    debug = True
    if debug:
        with open("debug_def_out", "w+") as of:
            of.write(json.dumps(tr_tree, indent=3))

    return tr_tree

def testing():

    in_fi = "test_3.def"
    tree = def_parser.parse(open(in_fi, 'r').read())#.pretty()
    # print(tree)

    tree = Def_transformer().transform(tree)
    with open("temp_out", "w+") as of:
        of.write(json.dumps(tree, indent=3))

if __name__ == "__main__":
    import argparse

    a_parser = argparse.ArgumentParser()

    a_parser.add_argument("--def_file", required=True)
    a_parser.add_argument("--design", default=None)
    a_parser.add_argument("--output_info", default=None)

    args = a_parser.parse_args()

    main(args.def_file, args.design, args.output_info)

