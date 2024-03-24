from openmfda_flow.openmfda_flow import *
from openmfda_flow.openmfda_class import OpenMFDA

proj = OpenMFDA()

proj.verilog_file= "demoClass.v"
proj.design_name = "demoClass"
proj.platform    = "h.r.3.3" 

proj.set_pin([0, 1], "soln1")
proj.set_pin([0, 2], "soln1")
proj.set_pin([0, 3], "soln1")
proj.set_pin([1, 7], "soln1")

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

