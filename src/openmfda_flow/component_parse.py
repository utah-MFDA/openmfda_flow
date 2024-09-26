import ply.lex as lex
import ply.yacc as yacc


RESERVED = {
    "MACRO": "MACRO",
    "CLASS": "CLASS",
    "ORIGIN": "ORIGIN",
    "FOREIGN": "FOREIGN",
    "SIZE": "SIZE",
    "SYMMETRY": "SYMMETRY",
    "SITE": "SITE",
    "PIN": "PIN",
    "DIRECTION": "DIRECTION",
    "USE": "USE",
    "PORT": "PORT",
    "LAYER": "LAYER",
    "RECT": "RECT",
    "END": "END",
    "OBS": "OBS",
    "PROPERTY": "PROPERTY",
    "BY": "BY",
    # "X": "X",
    # "Y": "Y",
    "INPUT": "INPUT",
    "INOUT": "INOUT",
    "OUTPUT": "OUTPUT",
    "SIGNAL": "SIGNAL",
    "VERSION": "VERSION",
    "BUSBITCHARS": "BUSBITCHARS",
    "DIVIDERCHAR": "DIVIDERCHAR",
    "LIBRARY": "LIBRARY",
}

tokens = ["END_STMT", "CNAME", "NUMBER", "ESCAPED_STRING", "COMMENT"] + list(
    RESERVED.values()
)  # , "NL"

# t_NL = r"\n"
t_END_STMT = r";"
t_COMMENT = r"\#.*$"


def t_NUMBER(t):
    r"0|[1-9][0-9]*(\.[0-9]+)?"
    t.value = float(t.value)
    return t


def t_CNAME(t):
    r"[_a-zA-Z][_a-zA-Z0-9]*"
    t.type = RESERVED.get(t.value, "CNAME")
    return t


def t_ESCAPED_STRING(t):
    r"\"[^\"]*\" "
    t.value = t.value.replace('"', "")
    return t


# Error handling rule
def t_error(t):
    print("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)


t_ignore = " \t\n"

lexer = lex.lex()


def p_in_file(p):
    """in_file : in_file macro
    | in_file comment
    | in_file lef_noimp
    | macro
    | comment
    | lef_noimp"""
    # | in_file NL
    # | NL"""
    # if p is None:
    # pass
    if len(p) == 2:
        if p[1] is None:
            pass
        # elif "\n" == p[1][0]:
        # pass
        elif isinstance(p[1], str) and "#" in p[1][0]:
            pass
        else:
            p[0] = p[1]
            # raise SyntaxError(f"Input value is not a dict")
    elif len(p) == 3:
        if p[1] is None:
            if p[2] is None:
                pass
            else:
                p[0] = p[2]
        elif isinstance(p[1], str) and "\n" == p[1][0]:
            p[0] = p[1]
        elif isinstance(p[1], str) and "#" == p[1][0]:
            p[0] = p[1]
        elif p[2] is None:
            p[0] = p[1]
        else:
            print(f"Parsing macro: {list(p[2].keys())[0]}")
            p[0] = p[1] | p[2]


def p_lef_noimp(p):
    """lef_noimp : end_lib
    | busbit
    | divider
    | version"""
    pass


def p_end_lib(p):
    """end_lib : END LIBRARY"""
    pass


def p_busbit(p):
    """busbit : BUSBITCHARS ESCAPED_STRING END_STMT"""
    pass


def p_divider(p):
    """divider : DIVIDERCHAR ESCAPED_STRING END_STMT"""
    pass


def p_version(p):
    """version : VERSION NUMBER END_STMT"""
    pass


def p_macro(p):
    """macro : MACRO CNAME macro_stmt_list END CNAME"""
    if p[2] == p[5]:
        p[0] = {p[2]: p[3]}
    else:
        raise SyntaxError(f"Macro {p[2]} does not match END {p[5]}")


def p_macro_stmt_list(p):
    """macro_stmt_list : macro_stmt_list macro_stmt
    | macro_stmt_list comment
    | macro_stmt
    | comment"""
    # | macro_stmt_list NL
    # | NL
    # print(p[1])
    if len(p) == 2:
        # print(p[1])
        if isinstance(p[1], dict):
            p[0] = p[1]
        elif isinstance(p[1], tuple):
            if p[1][0] == "PIN":
                p[0] = {"PIN": p[1][1]}
            else:
                raise SyntaxError(f"Unhandled exception {p[1][0]}")
            # p[0] = p[1]
        elif isinstance(p[1], str) and "\n" == p[1][0]:
            p[0] = {}
        elif isinstance(p[1], str) and "#" == p[1][0]:
            p[0] = {}
        else:
            raise SyntaxError(f"Input value is not a dict")
    elif len(p) == 3:
        # print(p[2])
        if p[2] is None:
            p[0] = p[1]
        elif isinstance(p[2], dict):
            p[0] = p[1] | p[2]
        elif isinstance(p[2], tuple):
            if "PIN" not in p[1]:
                p[1]["PIN"] = {}
            if p[2][0] == "PIN":
                # print(p[1])
                p[1]["PIN"] = p[1]["PIN"] | p[2][1]
                p[0] = p[1]
                # print(p[0])
            else:
                raise SyntaxError(f"Unhandled exception {p[2][0]}")
        elif isinstance(p[2], str) and p[2][0] == "\n":
            p[0] = p[1]
        elif isinstance(p[2], str) and p[2][0] == "#":
            p[0] = p[1]
        else:
            raise SyntaxError(f"Input value is not a dict")
    else:
        raise SyntaxError(f"Input value is not a dict")


def p_macro_stmt(p):
    """macro_stmt : class
    | origin
    | foreign
    | size
    | symmetry
    | site
    | pin
    | obs
    | property"""
    p[0] = p[1]


def p_class(p):
    """class : CLASS CNAME END_STMT"""
    p[0] = {p[1]: p[2]}


def p_origin(p):
    """origin : ORIGIN NUMBER NUMBER END_STMT"""
    p[0] = {p[1]: [p[2], p[3]]}


def p_foreign(p):
    """foreign : FOREIGN CNAME NUMBER NUMBER END_STMT"""
    p[0] = {p[1]: list(p[2:5])}


def p_size(p):
    """size : SIZE NUMBER BY NUMBER END_STMT"""
    p[0] = {p[1]: [p[2], p[4]]}


def p_symmetry(p):
    """symmetry : SYMMETRY CNAME CNAME END_STMT
    | SYMMETRY CNAME END_STMT"""
    if len(p) == 4 and p[2] in ["X", "Y"]:
        p[0] = {p[1]: p[2]}
    elif len(p) == 5 and p[2] in ["X", "Y"] and p[3] in ["X", "Y"]:
        p[0] = {p[1]: "XY"}
    else:
        raise SyntaxError("Symmetry is not set to X and/or Y")


def p_site(p):
    """site : SITE CNAME END_STMT"""
    p[0] = {p[1]: p[2]}


def p_pin(p):
    """pin : PIN CNAME pin_stmt_list END CNAME"""
    if p[2] == p[5]:
        p[0] = ("PIN", {p[2]: p[3]})
    else:
        raise SyntaxError(f"Pin {p[2]} is not eq {p[5]}")


def p_pin_stmt_list(p):
    """pin_stmt_list : pin_stmt_list pin_stmt
    | pin_stmt"""
    # | pin_stmt_list NL
    # | NL"""
    if len(p) == 2:
        if "\n" in p[1]:
            p[0] = {}
        else:
            p[0] = p[1]
    else:
        if "\n" in p[2]:
            p[0] = p[1]
        else:
            p[0] = p[1] | p[2]


def p_pin_stmt(p):
    """pin_stmt : direction
    | use
    | port"""
    p[0] = p[1]


def p_direction(p):
    """direction : DIRECTION OUTPUT END_STMT
    | DIRECTION INPUT END_STMT
    | DIRECTION INOUT END_STMT"""
    p[0] = {p[1]: p[2]}


def p_use(p):
    """use : USE SIGNAL END_STMT"""
    p[0] = {"USE": p[2]}


def p_port(p):
    """port : PORT geom END"""
    p[0] = {p[1]: p[2]}


def p_obs(p):
    """obs : OBS geom_list END"""
    p[0] = {"OBS": p[2]}


def p_geom_list(p):
    """geom_list : geom_list geom
    | geom
    """
    # | geom_list NL
    if len(p) == 2:
        if "\n" in p[1]:
            p[0] = {}
        else:
            p[0] = [p[1]]
    else:
        if "\n" in p[2]:
            p[0] = p[1]
        else:
            p[0] = p[1] + [p[2]]


def p_geom(p):
    """geom : LAYER CNAME END_STMT rect"""
    p[0] = {"LAYER": p[2]} | p[4]


def p_rect(p):
    """rect : RECT NUMBER NUMBER NUMBER NUMBER END_STMT"""
    p[0] = {"RECT": [[p[2], p[3]], [p[4], p[5]]]}


def p_property(p):
    """property : PROPERTY CNAME ESCAPED_STRING END_STMT"""
    p[0] = {p[2]: p[3]}


def p_comment(p):
    """comment : COMMENT"""
    pass


def p_error(p):
    # print(f"Error: {p}")
    # while 1:
    # tok = yacc.token()  # Get the next token
    print("next token: ", parser.token())
    print("next token: ", parser.token())
    raise SyntaxError(f"Error with token '{p}'")


parser = yacc.yacc()


class ComponentParser:

    def __init__(self):
        self.parser = parser
        self.lexer = lexer

    def parser_file(self, in_file):
        with open(in_file, "r") as f:
            self.lexer.input(f.read())
        p_out = self.parser.parse(lexer=self.lexer)
        # for c in p_out.items():
        # print(c[0], c[1].values())
        return p_out

    def parser_multi_file(self, in_file):
        with open(in_file, "r") as f:
            self.lexer.input(f.read())
        return self.parser.parse(lexer=self.lexer)
        # for c in p_out.items():
        # print(c[0], c[1].values())

    def get_comp_pins_from_lef(self, in_file, scale=1):
        par_f = self.parser_multi_file(in_file)
        if len(par_f) == 0:
            raise Exception(f"No macros in file: '{in_file}'")
        c_list = {}
        pos = "pos"
        layer = "layer"
        for c in par_f.items():
            # print(c[1]["PIN"])
            pins = {}
            for pin in c[1]["PIN"].items():
                # print(pin[1]["PORT"]["RECT"], pin[1]["PORT"]["LAYER"])
                pins = pins | {
                    pin[0]: {
                        pos: [[j * scale for j in i] for i in pin[1]["PORT"]["RECT"]],
                        layer: pin[1]["PORT"]["LAYER"],
                    }
                    # p
                    # .append()
                    # for p in pin[1]["PORT"]["RECT"]
                    # ]
                }
            print("SIZE:", [i * scale for i in c[1]["SIZE"]])
            c_list[c[0]] = Component(c[0], pins, [i * scale for i in c[1]["SIZE"]])
        return c_list


class Component:

    def __init__(self, macro, pins, size):
        self.macro = macro
        self.pins = pins
        self.size = size

    def get_component_center(self, pos=[0,0]):
        return [
            sum(self.size[0::2])/(len(self.size)/2) + pos[0],
            sum(self.size[1::2])/(len(self.size)/2) + pos[1]]

    def get_pin_center(self, pin_name, pos=[0,0], orient="N"):
        p = self.pins[pin_name]["pos"]
        return [sum(p[0::2])/(len(p)/2), sum(p[1::2])/(len(p)/2)]

    def get_pins_from_pos(self, pos, orient="N", rescale=1):
        import copy

        new_pin_pos = copy.deepcopy(self.pins)
        for p in self.pins.items():
            for i, pt in enumerate(p[1]["pos"]):
                if orient == "N":
                    new_pin_pos[p[0]]["pos"][i] = [
                        (pt[0] + pos[0]) * rescale,
                        (pt[1] + pos[1]) * rescale,
                    ]
                elif orient == "FN":
                    new_pin_pos[p[0]]["pos"][i] = [
                        (self.size[0] - pt[0] + pos[0]) * rescale,
                        (pt[1] + pos[1]) * rescale,
                    ]
                elif orient == "FS":
                    # print(pos)
                    # print(self.size[1], pt[1], self.size[1] - pt[1])
                    new_pin_pos[p[0]]["pos"][i] = [
                        (pt[0] + pos[0]) * rescale,
                        ((self.size[1] - pt[1]) + pos[1]) * rescale,
                    ]
                elif orient == "S":
                    new_pin_pos[p[0]]["pos"][i] = [
                        (self.size[0] - pt[0] + pos[0]) * rescale,
                        (self.size[1] - pt[1] + pos[1]) * rescale,
                    ]

        return new_pin_pos

    def is_pt_in_rect(self, pt, rect, err=0.0):
        if (
            pt[0] > rect[0][0] - err
            and pt[0] < rect[1][0] + err
            and pt[1] > rect[0][1] - err
            and pt[1] < rect[1][1] + err
        ):
            return True
        else:
            return False

    def is_pt_in_pins(
        self, pt, pos=[0, 0], orient=None, layer=None, rescale=1, err=0.0
    ):
        ref_pins = self.get_pins_from_pos(pos, orient, rescale)
        for p in ref_pins.items():
            print("Component pin:", p[0], p[1]["pos"])
            if self.is_pt_in_rect(pt, p[1]["pos"], err):
                if layer is None:
                    return True, p[0]
                elif isinstance(layer, str) and layer == p[1]["layer"]:
                    return True, p[0]
                else:
                    continue
        return False, None


#################### TESTING FUNCTIONS ###########################


def test_load_file():
    test_file = "def_test/comp_1.lef"
    p = ComponentParser().parser_file(test_file)
    print(p)


def test_load_multi_file():
    test_file = "def_test/mfda_30px_merged.lef"
    p = ComponentParser().parser_multi_file(test_file)
    for c in p.items():
        print(c[0], c[1])


def test_load_components_and_pins():
    test_file = "def_test/mfda_30px_merged.lef"
    cs = ComponentParser().get_comp_pins_from_lef(test_file)
    for c in cs.items():
        print(c[1].get_pins_from_pos([1000, 1000]))
        print(c[1].get_pins_from_pos([0, 0]))


def test_load_components_and_shift():
    test_file = "def_test/mfda_30px_merged.lef"
    cs = ComponentParser().get_comp_pins_from_lef(test_file)
    for c in cs.items():
        print(c[1].get_pins_from_pos([0, 0], orient="N"))
        print(c[1].get_pins_from_pos([0, 0], orient="FN"))
        print(c[1].get_pins_from_pos([0, 0], orient="S"))
        print(c[1].get_pins_from_pos([0, 0], orient="FS"))


def test_is_pt_in_pin():
    test_file = "def_test/mfda_30px_merged.lef"
    cs = ComponentParser().get_comp_pins_from_lef(test_file)
    pt = [40, 40]
    layer = "met2"
    pos = [10, 10]
    for c in cs.items():
        print(c[1].is_pt_in_pins(pt, pos, layer=layer))
    pt = [30, 30]
    print("------- no shift -------")
    for c in cs.items():
        print(c[1].is_pt_in_pins(pt, pos, layer=layer))


if __name__ == "__main__":

    # test_load_file()
    # test_load_multi_file()
    # test_load_components_and_pins()
    test_load_components_and_shift()
    # test_is_pt_in_pin()
