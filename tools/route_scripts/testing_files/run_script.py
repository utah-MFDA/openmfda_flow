import os
import sys
import json

# fmt: off
this_file_dir = os.path.abspath(os.path.dirname(__file__))

sys.path.append(this_file_dir+'/../')
import routing_fix_main
# fmt: on

test_def_file = this_file_dir + '/6_reroute_cp.def'
test_def_file_lnk = this_file_dir + '/6_reroute.def'

lef_files = [
    this_file_dir + '/lef/h.r.3.3_albumin_opt_0_pcells.lef',
    this_file_dir + '/lef/h.r.3.3_albumin_opt_0_pcells_reroute.lef',
    this_file_dir + '/lef/h.r.3.3_merged.up.lef'
]

plt_conf = this_file_dir + '/h.r.3.3.techlef.config.json'


def run_test_1():
    routing_fix_main.fix_routes(
        def_file=test_def_file,
        design_name='albumin_opt_0',
        platform_config_file=plt_conf,
        lef_files=lef_files,
        out_def='alb_fix.def',
        grid_size=[84, 52, 10],
        def_scale=1000,
        write_polyroute=True
    )


def run_test_lnk():
    routing_fix_main.fix_routes(
        def_file=test_def_file_lnk,
        design_name='albumin_opt_0',
        platform_config_file=plt_conf,
        lef_files=lef_files,
        grid_size=[84, 52, 10],
        def_scale=1000,
    )


run_test_1()
