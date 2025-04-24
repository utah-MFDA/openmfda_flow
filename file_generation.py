from design_automation import init_mix, v_file
import os

# Generate all necessary files
def file_generation(platform, assay, num_samples, input_dict):
    ratio_dict, length_dict = conc_ratio(input_dict, num_samples)
    # Generate necessary files
    configure_file(assay, platform)
    make_file(assay, platform)
    constraint_file(assay, platform)
    io_file(assay, platform, num_samples, solution_dict(length_dict))
    sim_eval_files(assay, platform, solution_dict(length_dict), ratio_dict)
    # Initial mixing and verilog file
    len_list, layer_list, pitch_list, turn_list, chan_vol, reg_vol = init_mix(num_samples, length_dict)
    v_file(assay, num_samples, len_list, layer_list, pitch_list, turn_list)

# Function to define concentration ratios
def conc_ratio(input_dict, num_samples):
    # Calculate total concentration
    conc_sum = sum(input_dict.values())
    # Calculate relative ratio of each sample
    ratio_dict = {}
    for key in input_dict.keys():
        ratio_dict[key] = input_dict[key] / conc_sum
    # Calculate hydraulic resistance values for each sample
    resist_dict = {}
    for key in input_dict.keys():
        resist_dict[key] = 1 / ratio_dict[key]
    # Order resistances from greatest to smallest
    resist_sort = dict(sorted(resist_dict.items(), key=lambda item : item[1], reverse=True))
    # Calculate relative channel lengths based on largest concentration/smallest length
    length_dict = {}
    for key in resist_sort.keys():
        length_dict[key] = resist_sort[key] / resist_sort[next(reversed(resist_sort))] 
    return ratio_dict, length_dict

# Function to assign samples to solution numbers
def solution_dict(length_dict):
    soln_dict = {}
    i = 1
    for key in length_dict.keys():
        soln_dict[key] = f"soln{i}"
        i += 1
    return soln_dict

# Function to create {assay}.py
def configure_file(assay, platform):
    # Create configure.py file
    directory = f'flow/designs/{platform}/{assay}'
    filename = f'{assay}.py'
    filepath = os.path.join(directory, filename)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, 'w') as f:
        f.write(f"""
from openmfda_flow.openmfda_class import OpenMFDA

import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-B", "--run_all_deps", action="store_true", default=False)
args = parser.parse_args()

proj = OpenMFDA()

proj.verilog_file = "{assay}.v"
proj.design_name  = "{assay}"
proj.platform     = "{platform}"

proj.set_replace_arg('density', 0.80)
proj.set_replace_arg('bin'    , 4)
proj.set_replace_arg('max_phi', 1.04)
proj.set_replace_arg('overflow', 0.1)

make_targets = ['pnr','render', 'simulate', '-B']

if args.run_all_deps:
    make_targets.append("-B")

proj.run_flow(mk_targets=make_targets)
    """)

# Function to create config.mk
def make_file(assay, platform):
    # Create configure.py file
    directory = f'flow/designs/{platform}/{assay}'
    filename = f'config.mk'
    filepath = os.path.join(directory, filename)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, 'w') as f:
        f.write(f"""export DESIGN_NAME     	= {assay}
export VERILOG_FILES 	= ./designs/src/$(DESIGN_NAME)/$(DESIGN_NAME).v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc
export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/io_constraints.tcl
export SIMULATION_CONFIG= ./designs/$(PLATFORM)/$(DESIGN_NAME)/simulation.config
SCAD_ARGS += --dimm_file "$(DIMM_FILE)" 
export XYCE_WL_GRAPH = ./$(RESULTS_DIR)/$(DESIGN_NAME)_route_nets.json

export GLOBAL_PLACEMENT_ARGS = -skip_nesterov_place

export BUILD_PDK_LIBRARY ?= T
include $(FLOW_HOME)/../tools/p_cell_generator/util.mk

# export XYCE_LIB = $(PLATFORM_DIR)/pdk/Components/verilogA_build/.libs/MFXyce.so

# For updating routing, SCAD rendering, and simulation following .def file modification
SCAD_DEF = 3_route_1.def
#SCAD_DEF = 3_route.def

run_tcl_script: $(PCELL_MERGE_LEF)
	$(OPENROAD_CMD) ./scripts/update_design.tcl
	make re_render
	make re_simulate	

re_render: $(RESULTS_DIR)/$(DESIGN)_reroute.scad
re_simulate: $(RESULTS_DIR)/xyceOut_1.csv

LENGTH_FILE_REROUTE = $(RESULTS_DIR)/7_$(DESIGN)_length.csv
ROUTE_MAP_OUT_REROUTE = $(RESULTS_DIR)/7_$(DESIGN)_route_nets.json

$(RESULTS_DIR)/$(DESIGN)_reroute.scad: $(RESULTS_DIR)/$(SCAD_DEF) $(LIBRARY_DEPS)
	mkdir -p "$(RESULTS_DIR)"
	$(TIME_CMD) python3 $(SCAD_SCRIPT) $(SCAD_ARGS) \\
		--def_file $< \\
        --design $(DESIGN) \\
		--length_out $(LENGTH_FILE_REROUTE) \\
		--route_map_out $(ROUTE_MAP_OUT_REROUTE) \\
		--scad_out_file $(RESULTS_DIR)/$(DESIGN)_reroute.scad \\
		--results_dir "$(RESULTS_DIR)" 2>&1 | tee $@.log

$(RESULTS_DIR)/xyceOut_1.csv: $(RESULTS_DIR)/$(DESIGN)_reroute.scad $(SIMULATION_CONFIG) $(RESULTS_DIR)/xyce_run.config
	mkdir -p $(RESULTS_DIR)/simulation
	$(TIME_CMD) python3 $(SIMULATION_SCRIPT) \\
		$(SIMULATION_ARGS) \\
		--output_dir $(RESULTS_DIR) \\
		--netlist $(VERILOG_FILES) \\
		--sim_config $(SIMULATION_CONFIG) \\
		--design $(DESIGN) \\
		--sim_dir $(RESULTS_DIR)/simulation \\
		--cir_config ../tools/simulation/V2Va_Parser/VMF_template.mfsp \\
		--local_xyce True \\
		--xyce_run_config $(RESULTS_DIR)/xyce_run.config \\
		--length_file $(LENGTH_FILE_REROUTE) \\
--lib ../tools/simulation/stdCellLib/StandardCellLibrary.csv 2>&1 | tee $(RESULTS_DIR)/simulation.log
        """)

# Function to create constraint.sdc
def constraint_file(assay, platform):
    # Create configure.py file
    directory = f'flow/designs/{platform}/{assay}'
    filename = f'constraint.sdc'
    filepath = os.path.join(directory, filename)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, 'w') as f:
        f.write(f"current_design {assay}")

# Function to create io_constraints.tcl
def io_file(assay, platform, num_samples, soln_dict):
    pin_str = ""
    f1 = 1050
    f2 = 660
    for i in range(num_samples):
        pin_str += f"place_pin -pin_name soln{i+1} -layer met9 -location" + " { " + str(f1) + " " + str(f2) +" } -pin_size {1 1}" + f"\n"
        f1 += 90
        if f1 >= 1590:
            f1 = 960
            f2 = 750
    pin_str += "place_pin -pin_name out -layer met9 -location { 1590 750 } -pin_size {1 1}"
    directory = f'flow/designs/{platform}/{assay}'
    filename = 'io_constraints.tcl'
    filepath = os.path.join(directory, filename)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, 'w') as file:
        file.write(f"{pin_str}")


# Function to create simulation.config and eval.config
def sim_eval_files(assay, platform, soln_dict, ratio_dict):
    input_str = ""
    chem_str = ""
    eval_str = ""
    for key in soln_dict.keys():
        input_str += f"input\t{soln_dict[key]}\tpressurePump\tpressure=100k\n"
        chem_str += f"chem\t{key}\t{soln_dict[key]}\t1\n"
        eval_str += f"eval\t{key}\t0\tout\t{round(ratio_dict[key]*10**3, 5)}m\n"
    # Create simulation.config
    directory = f'flow/designs/{platform}/{assay}'
    filename1 = 'simulation.config'
    filepath = os.path.join(directory, filename1)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, 'w') as file:
        file.write(f"""
# time inputs\n
transient\t1m\t0.1m\n\n
# input devices
{input_str}
# chemical definitions
{chem_str}
# eval chem time concentration node
{eval_str}
    """)
    # Create eval.config 
    filename2 = 'eval.config'
    filepath = os.path.join(directory, filename2)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, 'w') as file:
        file.write(f"# eval chem time concentration node\n{eval_str}")



