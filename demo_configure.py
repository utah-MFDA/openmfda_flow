from openmfda_flow import *

verilog_file = "demo.v"
design_name = "demo"
platform = "h.r.3.3"

pins = [[None for i in range(0,8)] for j in range(0,4)]
pins[0][1] = "soln1"
pins[0][2] = "soln2"
pins[0][3] = "soln3"
pins[1][7] = "out"

generate_config(verilog_file, design_name, pin_names=pins, platform=platform)

run_flow(design_name, platform=platform, mk_targets=["pnr", "render", "simulate"])
