from openmfda_flow.openmfda_class import OpenMFDA

import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-B", "--run_all_deps", action="store_true", default=False)
args = parser.parse_args()

proj = OpenMFDA()

proj.verilog_file = "demoPCell.v"
proj.design_name  = "demoPCell"
proj.platform     = "h.r.3.3"

proj.set_replace_arg('density', 0.80)
proj.set_replace_arg('bin'    , 4)
proj.set_replace_arg('max_phi', 1.04)
proj.set_replace_arg('overflow', 0.1)

make_targets = ['pnr','render', 'simulate']

if args.run_all_deps:
    make_targets.append("-B")

# print(proj.to_string_probes())
# proj.build()
#proj.run_flow(mk_targets=['rr_echo', '-B'])
proj.run_flow(mk_targets=make_targets)
# proj.run_flow(mk_targets=['pnr','render', 'simulate'])
