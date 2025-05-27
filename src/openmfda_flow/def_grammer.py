from lark import Lark


def import_def_parser():

    # def_parser =
    return Lark("""

    start : def_f+

    def_f : version ";"
        | dividerchar ";"
        | busbitchars ";"
        | design_block

    version  : "VERSION" VERSION
    dividerchar : "DIVIDERCHAR" ESCAPED_STRING
    busbitchars : "BUSBITCHARS" ESCAPED_STRING
    design_block : "DESIGN" CNAME ";" (prop)* "END" "DESIGN"

    prop : diearea
        | units
        | row
        | track
        | gcellgrid
        | via_block
        | cmp_block
        | net_block

    technology : "TECHNOLOGY" CNAME

    units : "UNITS" CNAME CNAME INT ";"

    diearea : "DIEAREA" pt pt ";"

    row : "ROW" CNAME CNAME origin do step ";"

    track : "TRACKS" (DIR|CNAME) INT do step layer ";"

    gcellgrid : "GCELLGRID" CNAME INT do step ";"

    origin : INT INT (ORIENT|CNAME)
    do : "DO" INT ["BY" INT]
    step : "STEP" INT [INT]

    via_block : "PINS" INT ";" (via_st ";")* "END" "PINS"
    cmp_block : "COMPONENTS" INT ";" (cmp_st ";")* "END" "COMPONENTS"
    net_block : "NETS" INT ";" (net_st ";")* "END" "NETS"

    via_st : "-" CNAME [("+" via_prop)*]
    !via_prop : "NET" CNAME
        | "DIRECTION" ("OUTPUT"|"INPUT")
        | "USE" ("SIGNAL")
        | "PORT"
        | layer pt pt
        | "FIXED" pt (ORIENT|CNAME)

    cmp_st : "-" CNAME CNAME [("+" cmp_prop)*]
    cmp_prop : "PLACED" pt (CNAME|ORIENT)
        | "FIXED" pt (CNAME|ORIENT)

    net_st : "-" CNAME [strnet+] [("+" net_prop)*]
    !net_prop : "USE" ("SIGNAL")
        | "ROUTED" net_route

    net_route : net_segment [("NEW" net_segment)*]
    net_segment : CNAME net_pt (net_pt|CNAME)
    net_pt : "(" (INT|"*") (INT|"*") [INT] ")"

    rect : CNAME pt pt

    strnet : "(" CNAME CNAME ")"
    pt : "(" INT INT ")"

    layer : "LAYER" CNAME

    ORIENT : "N"
        | "FN"
        | "S"
        | "FS"

    DIR : "X"
        | "Y"

    INT : /[-+]?(0|[1-9][0-9]*)/x
    VERSION : /[-+]?(0|[1-9][0-9]*)(\.[0-9]+)+/x
    CNAME : /[a-zA-Z_][a-zA-Z0-9_\.]*/
    // MOD_NAME : /[a-zA-Z_][a-zA-Z0-9_.]*/
    COMMENT : /\/\/.*$/
    %import common.ESCAPED_STRING
    %import common.WS
    %ignore WS
    """,
                start='start',
                lexer='basic')
