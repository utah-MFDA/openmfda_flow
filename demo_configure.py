from openmfda_flow import *

verilog_file = "demo.v"
design_name = "demo"
platform = "mfda_30px"
pins = [[None for i in range(0,8)] for j in range(0,4)]
pins[0][1] = "soln1"
pins[0][2] = "soln2"
pins[0][3] = "soln3"
pins[1][7] = "out"

gp_args = {}
gp_args['density'] = 0.88
gp_args['bin'] = 24
gp_args['max_phi'] = 1.06

generate_config(verilog_file, design_name, pin_names=pins, platform=platform, global_place_args=gp_args)
run_flow(design_name, platform=platform)

