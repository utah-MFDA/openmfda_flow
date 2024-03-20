
import argparse
import importlib
import sys, os

def main(design, platform):

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

    args = parser.parse_args()

    main(args.design, args.platform)