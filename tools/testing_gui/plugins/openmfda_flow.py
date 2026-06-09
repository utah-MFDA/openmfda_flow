import sys
import os
import shutil
import subprocess

def default_pin_names():
    return [[f"pin_{i}_{j}" for i in range(0,8)] for j in range(0,4)]

def copy_defaults(input_verilog, io_file, top, design_name, platform):
    verilog_path = f"flow/designs/src/{design_name}"
    sdc_filename = f"flow/designs/{platform}/{design_name}/constraint.sdc"
    io_filename = f"flow/designs/{platform}/{design_name}/io_constraints.tcl"
    make_filename = f"flow/designs/{platform}/{design_name}/config.mk"
    scad_dimm_filename = f"flow/designs/{platform}/{design_name}/dimm.csv"
    os.makedirs(f"flow/designs/{platform}/{design_name}", exist_ok=True)
    os.makedirs(f"flow/designs/src/{design_name}", exist_ok=True)
    print("Copy design netlists")
    for filename in input_verilog:
        os.symlink(filename, verilog_path)
#        shutil.copy(filename, verilog_path)
    shutil.copy(io_file, io_filename)
    print("Writing SDC constraints")
    write_sdc_constraints(sdc_filename, top_name=design_name)
    print("Writing makefile configuration")
    write_make_config(make_filename, input_verilog, design_name, platform=platform)

def generate_config(input_file, design_name, pin_names=None, startx=960, starty=660, platform="h.r.3.3"):
    verilog_name = os.path.basename(input_file)
    verilog_filename = f"flow/designs/src/{design_name}/{verilog_name}"
    sdc_filename = f"flow/designs/{platform}/{design_name}/constraint.sdc"
    io_filename = f"flow/designs/{platform}/{design_name}/io_constraints.tcl"
    make_filename = f"flow/designs/{platform}/{design_name}/config.mk"
    scad_dimm_filename = f"flow/designs/{platform}/{design_name}/dimm.csv"

    os.makedirs(f"flow/designs/{platform}/{design_name}", exist_ok=True)
    os.makedirs(f"flow/designs/src/{design_name}", exist_ok=True)
    print("Copy design netlist")
    shutil.copy(input_file, verilog_filename)
    if pin_names is None:
        pin_names = default_pin_names()
    print("Writing pin constraints")
    write_pin_constraints(io_filename, pin_names, "met9", startx=startx, starty=starty)
    print("Writing SDC constraints")
    write_sdc_constraints(sdc_filename, top_name=design_name)
    print("Writing makefile configuration")
    write_make_config(make_filename, [verilog_name], design_name, platform=platform)
    print("Done")

def run_flow(design_name, platform="h.r.3.3", mk_targets="all", force_run_deps=False):
    subprocess.run(["pwd"], stdout=None, stderr=None, check=True)
    mk_args = []
    if isinstance(mk_targets, str):
        mk_targets = [mk_targets]
    if force_run_deps:
        mk_args =+ '-B'
    run_cmd = f"cd flow && make {' '.join(mk_targets)} -e DESIGN={design_name} -e PLATFORM={platform} {' '.join(mk_args)}"
    subprocess.run(run_cmd, stdout=None, stderr=None, check=True, shell=True)
    # subprocess.run(["cd flow"],
    #                stdout=None, stderr=None, check=True)
    #
    # subprocess.run(["make", "-e", f"DESIGN={design_name}", "-e", f"PLATFORM={platform}"],
    #                stdout=None, stderr=None, check=True)

################ Generate pin constraints ################
def write_pin_constraints(io_filename, pin_names, layer, startx=960, starty=660):
    with open(io_filename, "w") as f:
        for j, row in enumerate(pin_names):
            for i, col in enumerate(row):
                xpos = startx+i*90
                ypos = starty+j*90
                if pin_names[j][i]:
                    print(f"place_pin -pin_name {col} -layer {layer} -location {{ {xpos} {ypos} }} -pin_size {{1 1}}", file=f)

################ SDC constraints ################
def write_sdc_constraints(sdc_filename, top_name="top"):
    with open(sdc_filename, "w") as f:
        print(f"current_design {top_name}", file=f)

################ config.mk ################
def write_make_config(make_filename, verilog_files, design_name, platform="h.r.3.3", dimm_file=False):
    files = " ".join("./designs/src/$(DESIGN_NICKNAME)/" + f for f in verilog_files)
    with open(make_filename, "w") as f:
        print(f"export DESIGN_NAME     	= {design_name}", file=f)
        print(f"export VERILOG_FILES 	= {files}", file=f)
        print(f"export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc", file=f)
        print(f"export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/io_constraints.tcl", file=f)
        print(f"export SIMULATION_CONFIG= ./designs/$(PLATFORM)/$(DESIGN_NAME)/simulation.config", file=f)
        if dimm_file:
            print(f"DIMM_FILE = {dimm_file}", file=f)
        print("""SCAD_ARGS += --dimm_file "$(DIMM_FILE)" """, file=f)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--design')
    parser.add_argument('-t', '--top', default='top')
    parser.add_argument('-p', '--platform', default='h.r.3.3')
    parser.add_argument('-i', '--io', default='./io_constraints.tcl')
    parser.add_argument('files', nargs='+')

    args = parser.parse_args()

    verilog_files = args.files
    io_files = args.io
    design_name = args.design
    platform = args.platform
    top = args.top
    copy_defaults(verilog_files, io_files, top=top, design_name=design_name, platform=platform)
    # run_flow(design_name, platform=platform)
