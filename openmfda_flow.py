import sys
import argparse
import os
import shutil
import subprocess

def default_pin_names():
    return [[f"pin_{i}_{j}" for i in range(0,8)] for j in range(0,4)]

def generate_config(input_file, design_name, pin_names=None, top_module="top", platform="mfda_30px"):
    verilog_filename = f"openroad_flow/designs/src/{design_name}/generated.v"
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
    write_pin_constraints(io_filename, pin_names, "met9")
    print("Writing SDC constraints")
    write_sdc_constraints(sdc_filename, top_module)
    print("Writing makefile configuration")
    write_make_config(make_filename, design_name, platform=platform)
    print("Writing SCAD configuration")
    write_scad_make(scad_make_filename, design_name, platform=platform)
    print("Done")

def run_flow(design_name, platform="mfda_30px"):
    subprocess.run(["pwd"],
                   stdout=None, stderr=None, check=True)

    subprocess.run(["make", "-e", f"DESIGN={design_name}", "-e", f"PLATFORM={platform}"],
                   stdout=None, stderr=None, check=True)
    # todo make archive

################ Generate pin constraints ################
def write_pin_constraints(io_filename, pin_names, layer):
    with open(io_filename, "w") as f:
        for j, x in enumerate([960, 1050, 1140, 1230, 1320, 1410, 1500, 1590]):
            for i, y in enumerate([930, 840, 750, 660]):
                if pin_names[i][j]:
                    print(f"place_pin -pin_name {pin_names[i][j]} -layer {layer} -location {{ {x} {y} }} -pin_size {{1 1}}", file=f)

################ SDC constraints ################
def write_sdc_constraints(sdc_filename, top_name="top"):
    with open(sdc_filename, "w") as f:
        print("current_design {top_name}", file=f)

################ config.mk ################
def write_make_config(make_filename, design_name, platform="mfda_30px"):
    with open(make_filename, "w") as f:
        print(f"""export DESIGN_NAME     	= {design_name}
        export PLATFORM    		= {platform}

        export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/generated.v
        export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

        export DIE_AREA    	 	= 0 0 2550 1590
        export CORE_AREA   	 	= 0 0 2550 1590

        export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl""", file=f)

################ SCAD files ################
def write_scad_make(scad_make_filename, design_name, platform="mfda_30px"):
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
# Path to results dir
DESIGN_RESULTS	= $(RESULTS_DIR)/$(PLATFORM)/$(DESIGN)/$(DESIGN_VARIANT)
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
DIMM_FILE		= $(SCAD_FLOW_DESIGN_DIR)/$(PLATFORM)/$(DESIGN)/dimm.csv

# SCAD script arguments
SCAD_ARGS =\
			--platform "$(PLATFORM)" --design "$(DESIGN)" --def_file "$(DEF_FILE)" --results_dir "$(DESIGN_RESULTS)" 	\
			--px $(PX_VAL) --layer $(LAYER_VAL) --bottom_layer $(BOT_LAYER_VAL) --lpv $(LPV_VAL) --xbulk $(XBULK_VAL)	\
			--ybulk $(YBULK_VAL) --zbulk $(ZBULK_VAL) --xchip $(XCHIP_VALS) --ychip $(YCHIP_VALS)						\
			--def_scale $(DEF_SCALE_VAL) --pitch $(PITCH) --res $(RES_VAL)

ifdef DIMM_FILE
SCAD_ARGS +=\
			--dimm_file "$(DIMM_FILE)"
endif""", file=f)

# ################ dimm csv file ################
# def write_dimm_file(scad_dimm_filename, wires):
#     with open(scad_dimm_filename, "w") as f:
#         for e in graph.edges:
#             print(graph.edges[e]["wire"],",20,20,15", sep="", file=f)
