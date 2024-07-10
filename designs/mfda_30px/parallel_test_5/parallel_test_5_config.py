from openmfda_flow.openmfda_flow import *
from openmfda_flow.openmfda_class import OpenMFDA

proj = OpenMFDA()

proj.verilog_file = "parallel_test_5.v"
proj.design_name = "parallel_test_5"
proj.platform = "mfda_30px"

proj.set_pin([0, 1], "soln1")
proj.set_pin([0, 2], "soln2")
proj.set_pin([0, 3], "soln3")
proj.set_pin([1, 6], "out")

proj.set_die_area([0, 0, 2550, 1590])
proj.set_die_area([100, 100, 2450, 1490])

density_var = [0.5, 0.7, 0.80, 0.90, 0.96]
# commented bins have been tried
bin_var = [
    2,
    4,
    8,
    16,
    20,
    24,
    28,
    32,
    64,
]
max_phi = [1.04, 1.03, 1.02, 1.01]
min_phi = [0.95, 0.90]
i_wire_coef = [0.001, 0.01, 0.1, 1, 10, 100, 1000, 10000]
i_dens_coef = [0.001, 0.01, 0.1, 1, 10, 100, 1000, 10000]
fan_out = [10]
overflow = [0.2, 0.1, 0.08, 0.06]

iter_list = [
    density_var,  # 0
    bin_var,
    max_phi,
    min_phi,
    i_wire_coef,
    i_dens_coef,
    fan_out,
    overflow,
]
proj.add_input("soln1", "pressurePump", {"pressure": "69k"}, {"S1": "300m"})
proj.add_input("soln2", "pressurePump", {"pressure": "69k"}, {"S2": "300m"})
proj.add_input("soln3", "pressurePump", {"pressure": "69k"}, {"S3": "300m"})

# proj.add_probe("pressure", "connect2")
# proj.add_probe("pressure", "connect6")

proj.add_eval("S1", "out", "100m", "0")
proj.add_eval("S2", "out", "100m", "0")
proj.add_eval("S3", "out", "100m", "0")

proj.add_analysis("transient", "0.1ms", "1ms")

design = proj.design_name
platform = proj.platform
o_mfda_base = os.path.normpath(os.path.realpath(__file__) + "/../../../../")
len_f = o_mfda_base + f"/scad_flow/results/{design}/base/{design}_length.csv"
eval_f = o_mfda_base + f"/xyce_flow/results/{platform}/{design}/Chem_Eval.csv"
o_csv_len = "length_out.csv"
o_csv_chem = "chem_out.csv"


proj.run_flow_iter_soln(iter_list, len_f, eval_f, o_csv_len, o_csv_chem)
