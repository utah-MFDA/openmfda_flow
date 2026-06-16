# from design_automation import init_mix, mix_v, v_file, routing_file
import os

# Generate all necessary files
def file_generation(design, device_name, platform, assay_ls, num_assays):
    # Generate concentration and resistance length ratios 
    design = conc_ratio(design, assay_ls, num_assays)
    # Generate necessary files
    configure_file(device_name, platform) 
    make_file(device_name, platform) 
    constraint_file(device_name, platform) 
    io_file(device_name, platform, design, assay_ls, num_assays)
    design, soln_list, soln_str = solution_dict(design, assay_ls, num_assays)
    design = sim_eval_files(device_name, platform, design, assay_ls)
    # Initial mixing and verilog file 
    design = init_mix(design, assay_ls)
    mix_str, connect_str, output_str, routing_str = mix_v(design, assay_ls)
    v_file(device_name, soln_list, soln_str, connect_str, output_str, mix_str)
    routing_file(device_name, platform, routing_str)

# Function to define concentration ratios
def conc_ratio(design, assay_ls, num_assays):
    for i in range(num_assays):
        # Get input_dict for each assay
        input_dict = design[assay_ls[i]]["input_dict"]
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
        design[assay_ls[i]]["ratio_dict"] = ratio_dict
        design[assay_ls[i]]["length_dict"] = length_dict
    return design

# Function to assign samples to solution numbers and to outline/format solutions used in .v file
def solution_dict(design, assay_ls, num_assays):
    soln_list = ""
    soln_str = ""
    j = 2
    for assay in assay_ls:
        soln_dict = {}
        for key in design[assay]["length_dict"].keys():
            if key == "sample":
                soln_dict[key] = f"soln1"
                if j == 2:
                    soln_list += f"\tsoln1,\n"
                    soln_str += f"soln1, " 
            else:
                soln_dict[key] = f"soln{j}"
                soln_list += f"\tsoln{j},\n"
                soln_str += f"soln{j}"
                j += 1
                if list(design[assay]["length_dict"].keys())[-1] == "sample":
                    key_stop = list(design[assay]["length_dict"].keys())[-2]
                else:
                    key_stop = list(design[assay]["length_dict"].keys())[-1]
                if assay == assay_ls[-1] and key == key_stop:
                    soln_str += ";"
                else:
                    soln_str += ", "
        design[assay]["solution_dict"] = soln_dict
    for i in range(num_assays):
        if i == num_assays - 1:
            soln_list += f"\tout{i+1}"
        else:
            soln_list += f"\tout{i+1},\n"
    return design, soln_list, soln_str

# Function to create {device_name}.py
def configure_file(device_name, platform):
    # Create configure.py file
    directory = f'../flow/designs/{platform}/{device_name}'
    filename = f'{device_name}.py'
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

proj.verilog_file = "{device_name}.v"
proj.design_name  = "{device_name}"
proj.platform     = "{platform}"

proj.set_replace_arg('density', 0.80)
proj.set_replace_arg('bin'    , 4)
proj.set_replace_arg('max_phi', 1.04)
proj.set_replace_arg('overflow', 0.1)

make_targets = ['gen_pcells', 'pnr','scad', 'simulate', '-B']

if args.run_all_deps:
    make_targets.append("-B")

proj.run_flow(mk_targets=make_targets)
    """)

# Function to create config.mk
def make_file(device_name, platform):
    directory = f'../flow/designs/{platform}/{device_name}'
    filename = f'config.mk'
    filepath = os.path.join(directory, filename)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, 'w') as f:
        f.write(f"""export DESIGN_NAME     	= {device_name}
export VERILOG_FILES 	= ./designs/src/$(DESIGN_NAME)/$(DESIGN_NAME).v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc
export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/io_constraints.tcl
export SIMULATION_CONFIG= ./designs/$(PLATFORM)/$(DESIGN_NAME)/simulation.config
export DIMM_FILE = ./designs/$(PLATFORM)/$(DESIGN_NAME)/routing.csv
SCAD_ARGS += --dimm_file "$(DIMM_FILE)" 
SCAD_LIB = $(PLATFORM_DIR)/pdk/scad_lib
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

export ADDITIONAL_LEFS += $(PCELL_MERGE_LEF)

gen_pcells: $(PCELL_MERGE_LEF)
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
		--scad_include $(SCAD_INCLUDE_FILES) \\
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
		--local_xyce \\
		--xyce_run_config $(RESULTS_DIR)/xyce_run.config \\
		--length_file $(LENGTH_FILE_REROUTE) \\
        --pcell_file $(RESULTS_DIR)/pcell_out_xyce \\
--lib ../tools/simulation/stdCellLib/StandardCellLibrary.csv 2>&1 | tee $(RESULTS_DIR)/simulation.log
        """)

# Function to create constraint.sdc
def constraint_file(device_name, platform):
    # Create configure.py file
    directory = f'../flow/designs/{platform}/{device_name}'
    filename = f'constraint.sdc'
    filepath = os.path.join(directory, filename)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, 'w') as f:
        f.write(f"current_design {device_name}")

# Function to create io_constraints.tcl
def io_file(device_name, platform, design, assay_ls, num_assays):
    pin_str = ""
    f1_o = 960
    f2_o = 660
    k = 1
    for i in range(num_assays):   
        pin_str += f"#{assay_ls[i]}\n" 
        f1 = f1_o
        f2 = f2_o
        # logic to account for all assays drawing from single sample solution line
        if i == 0:
            soln_num = design[assay_ls[i]]["num_samples"]
        else:
            soln_num = design[assay_ls[i]]["num_samples"] - 1
        for j in range(soln_num):
            pin_str += f"place_pin -pin_name soln{k} -layer met9 -location" + " { " + str(f1) + " " + str(f2) +" } -pin_size {1 1}" + f"\n"
            f2 += 90
            if f2 > 930:
                f1 += 90
                f2 -= 90
            if f1 > 1590:
                f1 -= 90
            k+=1
        pin_str += f"place_pin -pin_name out{i+1} -layer met9 -location" + " { " + str(f1) + " " + str(f2) +" } -pin_size {1 1}" + f"\n\n"
        f1_o += 90
    directory = f'../flow/designs/{platform}/{device_name}'
    filename = 'io_constraints.tcl'
    filepath = os.path.join(directory, filename)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, 'w') as file:
        file.write(f"{pin_str}")

# Function to create simulation.config and eval.config
def sim_eval_files(device_name, platform, design, assay_ls):
    input_str = ""
    chem_str = ""
    eval_str = ""
    i = 1
    j = 1
    for assay in assay_ls:
        eval_dict = {}
        soln_dict = design[assay]["solution_dict"]
        ratio_dict = design[assay]["ratio_dict"]
        eval_str += f"# {assay}\n"
        for key in soln_dict.keys():
            if key == "sample":
                key_name = "sample"
                if j == 1: 
                    input_str += f"input\t{soln_dict[key]}\tpressurePump\tpressure=100k\n"
                    chem_str += f"chem\t{key_name}\t{soln_dict[key]}\t1\n"
            else:
                key_name = f"R{i}"
                i += 1
                input_str += f"input\t{soln_dict[key]}\tpressurePump\tpressure=100k\n"
                chem_str += f"chem\t{key_name}\t{soln_dict[key]}\t1\n"
            eval_str += f"eval\t{key_name}\t0\tout{j}\t{round(ratio_dict[key]*10**3, 5)}m\n"
            eval_dict[key] = key_name
        design[assay]["eval_dict"] = eval_dict
        j += 1
    # Create simulation.config
    directory = f'../flow/designs/{platform}/{device_name}'
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
    return design