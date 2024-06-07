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
proj.set_pin([0, 2], "soln2")
proj.set_pin([0, 3], "soln3")
proj.set_pin([1, 6], "out")

#pins = [[None for i in range(0,8)] for j in range(0,4)]
#pins[0][1] = "soln1"
#pins[0][2] = "soln2"
#pins[0][3] = "soln3"
#pins[1][7] = "out"

proj.set_replace_arg('density', 0.88)
proj.set_replace_arg('bin'    , 24)
proj.set_replace_arg('max_phi', 1.04)
#proj.set_replace_arg('min_phi', 1.04)
#proj.set_replace_arg('init_density_coef', 1.04)
#proj.set_replace_arg('init_wire_coef', 1.04)
#proj.set_replace_arg('fanout', 1.04)

proj.set_die_area([0, 0, 2550, 1590])
proj.set_core_area([0, 0, 2550, 1590])

proj.add_input('soln1', 'pressurePump', {'pressure': '69k'}, {'H2O':'10m'})
proj.add_input('soln2', 'pressurePump', {'pressure': '69k'}, {'Tag':'10m'})
proj.add_input('soln3', 'pressurePump', {'pressure': '69k'}, {'Sample':'10m'})

proj.add_probe('pressure', 'connect2')
proj.add_probe('pressure', 'connect6')

proj.add_eval('H2O', 'out', '9.8m', '0')

proj.add_analysis('transient','0.1ms','1ms')

print(proj.to_string_probes())
proj.build()
#proj.run_flow_remote(remote_pyenv_home='~/mfda_env', remote_dir="MFDA_flow", mk_targets=['pnr','render', 'simulate'])
proj.run_flow(mk_targets=['pnr','render', 'simulate'])

#generate_config(verilog_file, design_name, pin_names=pins, platform=platform, global_place_args=gp_args, design_dir=True, platform_config=plat)
#run_flow(design_name, platform=platform, make_arg=['pnr', 'render', 'simulate'])

