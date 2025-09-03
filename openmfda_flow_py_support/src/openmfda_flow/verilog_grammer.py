from lark import Lark


def import_verilog_parser():

    return Lark("""
    start : module+

    module : "module" CNAME "(" mod_ports ")" ";" mod_derective* "endmodule"

    mod_ports : mod_port_def [("," mod_port_def)*]

    !mod_port_def : ["input"|"output"|"inout"] CNAME

    mod_derective : input
      | output
      | inout
      | wire
      | component

    input :  "input" CNAME [("," CNAME)*] ";"
    output : "output" CNAME [("," CNAME)*] ";"
    inout : "inout" CNAME [("," CNAME)*] ";"
    wire :   "wire" CNAME [("," CNAME)*] ";"
    component : CNAME CNAME "(" [cmp_port] [("," cmp_port)*] ")" ";"
    cmp_port : "." CNAME "(" CNAME ")"

    COMMENT: "//" /.*$/

    %import common.CNAME
    %import common.WS
    %ignore COMMENT
    %ignore WS
    """,
                start='start',
                lexer='basic')
