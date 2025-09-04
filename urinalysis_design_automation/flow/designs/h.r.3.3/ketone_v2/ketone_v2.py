
from openmfda_flow.openmfda_class import OpenMFDA

import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-B", "--run_all_deps", action="store_true", default=False)
args = parser.parse_args()

proj = OpenMFDA()

proj.verilog_file = "ketone_v2.v"
proj.design_name  = "ketone_v2"
proj.platform     = "h.r.3.3"

proj.set_replace_arg('density', 0.80)
proj.set_replace_arg('bin'    , 4)
proj.set_replace_arg('max_phi', 1.04)
proj.set_replace_arg('overflow', 0.1)

make_targets = ['gen_pcells', 'pnr','render', 'simulate', '-B']

if args.run_all_deps:
    make_targets.append("-B")

proj.run_flow(mk_targets=make_targets)
    