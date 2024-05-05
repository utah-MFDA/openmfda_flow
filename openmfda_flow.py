import sys
import os
import shutil
import subprocess

def default_pin_names():
    return [[f"pin_{i}_{j}" for i in range(0,8)] for j in range(0,4)]

def copy_defaults(input_verilog, io_file, top, design_name, platform):
    verilog_path = f"openroad_flow/designs/src/{design_name}"
    sdc_filename = f"openroad_flow/designs/{platform}/{design_name}/constraint.sdc"
    io_filename = f"openroad_flow/designs/{platform}/{design_name}/io_constraints.tcl"
    make_filename = f"openroad_flow/designs/{platform}/{design_name}/config.mk"
    scad_make_filename = f"scad_flow/designs/{platform}/{design_name}/config.mk"
    scad_dimm_filename = f"scad_flow/designs/{platform}/{design_name}/dimm.csv"
    os.makedirs(f"openroad_flow/designs/{platform}/{design_name}", exist_ok=True)
    os.makedirs(f"openroad_flow/designs/src/{design_name}", exist_ok=True)
    os.makedirs(f"scad_flow/designs/{platform}/{design_name}", exist_ok=True)
    print("Copy design netlists")
    for filename in input_verilog:
        os.symlink(filename, verilog_path)
#        shutil.copy(filename, verilog_path)
    shutil.copy(io_file, io_filename)
    print("Writing SDC constraints")
    write_sdc_constraints(sdc_filename, top_name=design_name)
    print("Writing makefile configuration")
    write_make_config(make_filename, input_verilog, design_name, platform=platform)
    print("Writing SCAD configuration")
    write_scad_make(scad_make_filename, design_name, platform=platform)


def generate_config(input_file, design_name, pin_names=None, startx=960, starty=660, platform="h.r.3.3"):
    verilog_name = os.path.basename(input_file)
    verilog_filename = f"openroad_flow/designs/src/{design_name}/{verilog_name}"
    sdc_filename = f"openroad_flow/designs/{platform}/{design_name}/constraint.sdc"
    io_filename = f"openroad_flow/designs/{platform}/{design_name}/io_constraints.tcl"
    make_filename = f"openroad_flow/designs/{platform}/{design_name}/config.mk"
    scad_make_filename = f"scad_flow/designs/{platform}/{design_name}/config.mk"
    scad_dimm_filename = f"scad_flow/designs/{platform}/{design_name}/dimm.csv"

    os.makedirs(f"openroad_flow/designs/{platform}/{design_name}", exist_ok=True)
    os.makedirs(f"openroad_flow/designs/{platform}/{design_name}", exist_ok=True)
    os.makedirs(f"openroad_flow/designs/src/{design_name}", exist_ok=True)
    os.makedirs(f"scad_flow/designs/{platform}/{design_name}", exist_ok=True)
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
    print("Writing SCAD configuration")
    write_scad_make(scad_make_filename, design_name, platform=platform)
    print("Done")

def run_flow(design_name, platform="h.r.3.3"):
    subprocess.run(["pwd"],
                   stdout=None, stderr=None, check=True)

    subprocess.run(["make", "-e", f"DESIGN={design_name}", "-e", f"PLATFORM={platform}"],
                   stdout=None, stderr=None, check=True)
    # todo make archive

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
def write_make_config(make_filename, verilog_files, design_name, platform="h.r.3.3"):
    files = " ".join("./designs/src/$(DESIGN_NICKNAME)/" + f for f in verilog_files)
    with open(make_filename, "w") as f:
        print(f"""export DESIGN_NAME     	= {design_name}
export PLATFORM    		= {platform}

export VERILOG_FILES 	= {files}
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export DIE_AREA    	 	= 0 0 2550 1590
export CORE_AREA   	 	= 0 0 2550 1590

export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl""", file=f)

################ SCAD files ################
def write_scad_make(scad_make_filename, design_name, dimm_file=None, platform="h.r.3.3"):
    with open(scad_make_filename, "w") as f:
        print(f"""
#------------------------------------------------------------------------------
# DESIGN NAMES
#------------------------------------------------------------------------------
# platform name from OpenROAD flow
export PLATFORM = {platform}
# design name from OpenROAD flow
export DESIGN = {design_name}
# design variant from OpenROAD flow
export DESIGN_VARIANT = base

#------------------------------------------------------------------------------
# DESIGN PARAMETERS
#------------------------------------------------------------------------------s
# Path to the def file form OpenROAD flow
DEF_FILE		= $(OR_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)/4_final.def
RESULT_OUT              = $(SCAD_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)
# mm/px value
PX_VAL 			= 0.0076
# mm/layer value
LAYER_VAL		= 0.01
# layer number for the bottom layer
BOT_LAYER_VAL	= 20
# layers/via value
LPV_VAL			= 20
# bulk x value in pixels
XBULK_VAL		= 2550
# bulk y value in pixels
YBULK_VAL		= 1590
# bulk z value in layers
ZBULK_VAL		= 280
# chip min and max x values in pixels
XCHIP_VALS		= 0 2550
# chip min and max y values in pixels
YCHIP_VALS		= 0 1590
# scale the .def file uses for dimensions
DEF_SCALE_VAL	= 1000
# PNR pitch of platform
PITCH 			= 30
# render smoothness in scad render
RES_VAL			= 120
# optional - path to route dimensions specifications

# SCAD script arguments
SCAD_ARGS =\\
			--platform "$(PLATFORM)" --design "$(DESIGN)" --def_file "$(DEF_FILE)" --results_dir "$(RESULT_OUT)" 	\\
			--px $(PX_VAL) --layer $(LAYER_VAL) --bottom_layer $(BOT_LAYER_VAL) --lpv $(LPV_VAL) --xbulk $(XBULK_VAL)	\\
			--ybulk $(YBULK_VAL) --zbulk $(ZBULK_VAL) --xchip $(XCHIP_VALS) --ychip $(YCHIP_VALS)			        \\
			--def_scale $(DEF_SCALE_VAL) --pitch $(PITCH) --res $(RES_VAL)""", file=f)
        if dimm_file:
            print(f"DIMM_FILE = {dimm_file}", file=f)
        print(f"""
ifdef DIMM_FILE
SCAD_ARGS +=\
			--dimm_file "$(DIMM_FILE)"
endif""", file=f)

# ################ dimm csv file ################
# def write_dimm_file(scad_dimm_filename, wires):
#     with open(scad_dimm_filename, "w") as f:
#         for e in graph.edges:
#             print(graph.edges[e]["wire"],",20,20,15", sep="", file=f)
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
