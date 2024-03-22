
import argparse
import importlib
import sys, os

sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/src/openmfda_flow')
from openmfda_flow import *

# this is run from the remote environment
def main(design, platform, make_only=False, make_targets=None):
    
    if make_only.lower()=='true' or make_only=='1':
        run_flow(design, platform, make_arg=make_targets)
    else:
        run_w_gen_config(design, platform)


def run_w_gen_config(design, platform):
    py_call = f'{design}_configure'
    
    dir_path = os.path.dirname(os.path.realpath(__file__))
    sys.path.insert(0, f'{dir_path}/designs/{platform}/{design}')
    #design_sc = importlib.import_module(py_call)

    #design_sc = map(__import__, py_call)
    #design_sc
    exec(open(f"{dir_path}/designs/{platform}/{design}/{py_call}.py").read())

if __name__ == "__main__":

    parser = argparse.ArgumentParser()

    parser.add_argument("--design", type=str)
    parser.add_argument("--platform", type=str)
    parser.add_argument("--make_only", type=str, default="False")
    parser.add_argument("--make_targets", type=str, default=['all'], nargs='+')

    args = parser.parse_args()

    main(
        args.design, 
        args.platform,
        args.make_only,
        args.make_targets)
