from openmfda_flow.openmfda_flow import *
from openmfda_flow.openmfda_class import OpenMFDA

proj = OpenMFDA()

proj.verilog_file= "demoClass.v"
proj.design_name = "demoClass"
proj.platform    = "mfda_30px" 

#verilog_file = "demo.v"
#design_name = "demo"
#platform = "mfda_30px"

proj.set_pin([0, 1], "soln1")
proj.set_pin([0, 2], "soln1")
proj.set_pin([0, 3], "soln1")
proj.set_pin([1, 6], "soln1")

#pins = [[None for i in range(0,8)] for j in range(0,4)]
#pins[0][1] = "soln1"
#pins[0][2] = "soln2"
#pins[0][3] = "soln3"
#pins[1][7] = "out"

gp_args = {}
gp_args['density'] = 0.88
gp_args['bin'] = 24
gp_args['max_phi'] = 1.06

proj.set_replace_arg('density', 0.88)
proj.set_replace_arg('bin'    , 24)
proj.set_replace_arg('max_phi', 1.04)

proj.set_die_area([0, 0, 2550, 1590])
proj.set_core_area([0, 0, 2550, 1590])

proj.build()
proj.run_flow_remote(
    remote_pyenv_home='~/mfda_env',
    remote_dir="MFDA_flow",
    mk_targets=['pnr','render'])

#generate_config(verilog_file, design_name, pin_names=pins, platform=platform, global_place_args=gp_args, design_dir=True, platform_config=plat)
#run_flow(design_name, platform=platform, make_arg=['pnr', 'render'])

