from multiplex_design_automation.file_generation import conc_ratio, solution_dict, sim_eval_files
import json

with open('multiplex_design_automation/multiplex.json', 'r') as file:
    design = json.load(file)

num_assays = len(design.keys())
assay_ls = list(design.keys())

import os, csv, subprocess
import time
import matplotlib.pyplot as plt 
from matplotlib.ticker import MultipleLocator

error_diff_condition = 0.0000000001
cutoff_time = 30 * 60
max_turn = 82
max_turn = 79
x_coord = 2550000
y_coord = 1590000
error_condition = 3

device_name = "multiplex_test"
platform= "h.r.3.3"


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
    # directory = f'../flow/designs/{platform}/{device_name}'
    directory = f'./flow/designs/{platform}/{device_name}'
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
    # directory = f'../flow/designs/{platform}/{device_name}'
    directory = f'./flow/designs/{platform}/{device_name}'
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
#SCAD_DEF = 3_route_1.def
SCAD_DEF = 3_route.def

.PHONY: run_tcl_script gen_pcells re_render re_simulate 

export ADDITIONAL_LEFS += $(PCELL_MERGE_LEF)

gen_pcells: $(PCELL_MERGE_LEF)
re_render: $(RESULTS_DIR)/$(DESIGN)_reroute.scad
re_simulate: $(RESULTS_DIR)/xyceOut_1.csv

run_tcl_script: 
\t$(MAKE) gen_pcells
\t$(OPENROAD_CMD) ./scripts/update_design.tcl
\t$(MAKE) re_render
\t$(MAKE) re_simulate

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
    # directory = f'../flow/designs/{platform}/{device_name}'
    directory = f'./flow/designs/{platform}/{device_name}'
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
            pin_str += f"place_pin -pin_name soln{k} -layer met9 -location" + " { " + str(f1) + " " + str(f2) +" } -pin_size {10 10}" + f"\n"
            f2 += 90
            if f2 > 930:
                f1 += 90
                f2 -= 90
            if f1 > 1590:
                f1 -= 90
            k+=1
        pin_str += f"place_pin -pin_name out{i+1} -layer met9 -location" + " { " + str(f1) + " " + str(f2) +" } -pin_size {10 10}" + f"\n\n"
        f1_o += 90
    # directory = f'../flow/designs/{platform}/{device_name}'
    directory = f'./flow/designs/{platform}/{device_name}'
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
    # directory = f'../flow/designs/{platform}/{device_name}'
    directory = f'./flow/designs/{platform}/{device_name}'
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


# Function for initial mixing geometry based on resistance length
def init_mix(design, assay_ls): 
    for assay in assay_ls:
        # Empty dictionary for specifying extra number of blocks
        block_dict = {}
        # Empty dictionary for large channel width
        w_dict = {}
        # Empty dictionary for large channel height
        h_dict = {}
        # Empty dictionary for smaller channel width
        w3_dict = {}
        # Empty dictionary for smaller channel height
        h3_dict = {}
        # Empty dictionary for channel lengths
        len_dict = {}
        
        # Get length_dict for each assay
        length_dict = design[assay]["length_dict"]
        # Assign 100, 10, or 1 resistance block for each input 
        for key in length_dict.keys():
            if length_dict[key] // 100 > 0:
                w_dict[key] = 14
                h_dict[key] = 10
                w3_dict[key] = 6
                h3_dict[key] = 5
                len_dict[key] = 5
                block_dict[key] = int(length_dict[key]/100)
            elif length_dict[key] // 10 > 0:
                w_dict[key] = 20
                h_dict[key] = 15
                w3_dict[key] = 11
                h3_dict[key] = 8
                len_dict[key] = 5
                block_dict[key] = int(length_dict[key]/10)
            else:
                w_dict[key] = 40
                h_dict[key] = 30
                w3_dict[key] = 20
                h3_dict[key] = 15
                len_dict[key] = 5
                block_dict[key] = int(length_dict[key]/1)
        
        design[assay]["block_dict"] = block_dict
        design[assay]["w_dict"] = w_dict
        design[assay]["h_dict"] = h_dict
        design[assay]["w3_dict"] =  w3_dict
        design[assay]["h3_dict"] = h3_dict
        design[assay]["len_dict"] = len_dict        
    return design

######### UPDATE VOLUME CALCULATIONS 
# # Function that calculates entire px length
# def calc_px_len(len, turn, layer, pitch):
#     actual_px_len = len * turn + 1
#     actual_px_len += pitch * turn
#     actual_px_len *= (layer + 1)
#     # Account for double counted corners
#     actual_px_len -= 14 * turn * 2 * (layer + 1)
#     return actual_px_len

# # Function that calculates percent error based on expected and observed values 
# def error_calc(expected, actual):
#     return abs(actual - expected) / expected * 100

# # Function to calculate theoretical channel volumes in mL
# def volume(len_list):
#     chan_vol = []
#     reg_vol = []
#     w = 14 * 7.6
#     h = 10 * 7.6
#     for i in range(len(len_list)):
#         l = len_list[i] * 7.6
#         chan_vol.append(w * h * l * 10**-12)
#         reg_vol.append((len_list[0]**2 / len_list[i]**2) * w * h * l * 10**-12)
#     return chan_vol, reg_vol

# Function that formats mix_list, and input and output strings for verilog file; keeps track of routing dimensions
def mix_v(design, assay_ls):
    mix_str = ""
    routing_str = ""
    i = 0
    j = 1
    k = 0
    for assay in assay_ls:
        mix_str += f"\n// {assay}"
        connect_dict = {}

        # Define resistance for each assay solution
        num_blocks = design[assay]["block_dict"]
        w_chan = design[assay]["w_dict"] 
        h_chan = design[assay]["h_dict"] 
        w3_chan = design[assay]["w3_dict"]
        h3_chan = design[assay]["h3_dict"]
        len_chan = design[assay]["len_dict"]
        solution_dict = design[assay]["solution_dict"]
        
        for key in solution_dict.keys(): 
            mix_str += f"\np_resistor_0_{num_blocks[key]}_{w_chan[key]}_{h_chan[key]}_{w3_chan[key]}_{h3_chan[key]}_{len_chan[key]}"
            mix_str += f"\tresist{k}\t(.in_fluid({solution_dict[key]}), .out_fluid(connect{k}));"
            mix_str += "\n"
            connect_dict[key] = f"connect{k}"
            if "soln1" in routing_str and solution_dict[key] == "soln1":
                pass
            else:
                routing_str += f"{solution_dict[key]},{w_chan[key]},{w_chan[key]},{h_chan[key]}\n"
            routing_str += f"connect{k},{w_chan[key]},{w_chan[key]},{h_chan[key]}\n"
            k += 1

        # Define mixing 
        connect_ls = list(connect_dict.values())
        for h in range(len(connect_ls)-1):
            if h == 0:
                if len(connect_ls) <= 2:
                    mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_ls[h]}), .b_fluid({connect_ls[h+1]}), .out_fluid(out{j}));\n"
                    routing_str += f"out{j},{w_chan[key]},{w_chan[key]},{h_chan[key]}\n"
                else:
                    mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_ls[h]}), .b_fluid({connect_ls[h+1]}), .out_fluid(connect{k}));\n"
                    routing_str += f"connect{k},{w_chan[key]},{w_chan[key]},{h_chan[key]}\n"
                    k += 1
            elif h == len(connect_ls) - 2:
                mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_ls[h+1]}), .b_fluid(connect{k-1}), .out_fluid(out{j}));\n"
                routing_str += f"out{j},{w_chan[key]},{w_chan[key]},{h_chan[key]}\n"
            else:
                mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_ls[h+1]}), .b_fluid(connect{k-1}), .out_fluid(connect{k}));\n"
                routing_str += f"connect{k},14,14,10\n"
                k += 1
            i += 1  
        j += 1

        # Connect string
        connect_str = ""
        for m in range(k-1):
            if m == k-2:
                connect_str += f"connect{m};"
            else:
                connect_str += f"connect{m}, "
        
        # Output string
        output_str = ""
        for n in range(1, j):
            if n == j-1:
                output_str += f"out{n};"
            else:
                output_str += f"out{n}, "

    return mix_str, connect_str, output_str, routing_str


# Function for creating verilog file based on mixing specifications
def v_file(device_name, soln_list, soln_str, connect_str, output_str, mix_str):
    # Create and define .v file
    directory = f'flow/designs/src/{device_name}'
    filename = f'{device_name}.v'
    filepath = os.path.join(directory, filename)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, "w") as f:
        f.write(f"""module {device_name} (\n{soln_list} \n);
input\t{soln_str}
output\t{output_str}\n
wire\t{connect_str}\n
    {mix_str}
    \nendmodule
    """)
        
# Function for creating routing.csv file to define routing geometry based on channel cross section
def routing_file(device_name, platform, routing_str):
    # Create and define .v file
    directory = f'flow/designs/{platform}/{device_name}'
    filename = 'routing.csv'
    filepath = os.path.join(directory, filename)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, "w") as f:
        f.write(routing_str)


# Function for displaying concentration results from Chem_Eval.csv
def con_results(device_name, num_assays):
    error_list = []
    expect_conc = []
    eval_conc = []
    error_dict = {}

    table_str = "\n"
    table_str += "-" * 65
    table_str += f"\n|{device_name.upper().center(63)}|\n"
    table_str += "-" * 65
    table_str += f"\n| SAMPLES/REAGENTS | EXPECTED CON. | EVALUATED CON. | ERROR [%] |\n"
    table_str += "-" * 65

    base_path = f"./flow/results/{device_name}/base"
    paths = [
        f"{base_path}/Chem_Eval.csv",
        f"{base_path}/simulation/Chem_Eval.csv",
    ]

    for path in paths:
        try:
            with open(path, mode="r", newline="") as file:
                reader = csv.DictReader(file)
                for row in reader:
                    table_str += f"\n|{row['Chemical'].center(18)}|"\
                    f"{str(round(float(row['Expected Conc']), 5)).center(15)}|"\
                    f"{str(round(float(row['Eval Conc']), 5)).center(16)}|"

                    percent_error = "{:.2f}".format(round(float(row['Error']), 4) * 100)
                    table_str += percent_error.center(11) + "|"

                    error_list.append(float(row['Error']))
                    expect_conc.append(float(row['Expected Conc']))
                    eval_conc.append(float(row['Eval Conc']))
                    error_dict[f'{row['Chemical']}_{row['Node']}'] = {
                    "error": float(row["Error"]) * 100,
                    "expected_conc": float(row["Expected Conc"]),
                    "evaluated_conc": float(row["Eval Conc"]),
                    }
            break

        except FileNotFoundError:
            continue

    else:
        table_str += f"\n|{'CSV FILE NOT FOUND'.center(63)}|"
        table_str += f"\n" + "-" * 65
        return table_str, [10 for _ in range(num_assays)], [], []

    table_str += f"\n" + "-" * 65
    return table_str, error_dict

######################################################################################
# Function for replacing serpentine information in specified file(s)
def edit_file(filename, resist_num, old_resist, new_resist):
    # Read and modify each line of a file
    with open(filename, "r") as f:
        lines = f.readlines()
    new_lines = []
    # serp_ls = []
    # x_pos = []
    # y_pos = []
    for line in lines:
        # # Keep track of y_pos of resistors
        # if filename.endswith("def") and "serp" in line:
        #     if line.split()[-4] != "+":
        #         serp_ls.append(line.split()[2])
        #         x_pos.append(line.split()[-5])
        #         y_pos.append(line.split()[-4])
        if resist_num in line:
            new_lines.append(line.replace(old_resist, new_resist))
        else:
            new_lines.append(line)

    # Write the modified lines back to the file
    with open(filename, "w") as f:
        f.writelines(new_lines)
    
    # if filename.endswith("def") and zero:
    #     print("serpnum", serp_num)
    #     print("serpnum[-1]", serp_num[-1])
    #     print("{x_pos[int(serp_num[-1])]}", f"{x_pos[int(serp_num[-1])]}")
    #     time.sleep(10)
    #     edit_file(filename, num_samples, serp_num, f"{x_pos[int(serp_num[-1])]}", "0", max_x, False)

    # Check for resistors that share same ypos and overlap??

    # return max_x

# Function to calculate x_pos + width of serpentine
def calc_width(i, serp_ls, x_pos):
    width_x = int(serp_ls[i].split("_")[4]) * (int(serp_ls[i].split("_")[5]) + 1)
    width_y = int(serp_ls[i].split("_")[3])
    return str(int(x_pos[i]) + int((str(width_x) + '000'))), int((str(width_y) + '000'))

# Function for re-running second half of flow when modifying resistor(s)
def update_flow(device_name, resist_num, old_resist, new_resist):
    # Edit .def and .v files
    # def_file = f"flow/results/{device_name}/base/2_place.def"
    def_file = f"flow/results/{device_name}/base/2_2_place_iop.def"
    verilog_file = f"flow/designs/src/{device_name}/{device_name}.v"

    edit_file(def_file, resist_num, old_resist, new_resist)
    edit_file(verilog_file, resist_num, old_resist, new_resist)
    print("EDIT FILES")
    print("old_resist", old_resist)
    print("new_resist", new_resist)
    time.sleep(5)
   
    # Run Tcl script commands following .def and .v modification 
    command = f"cd flow && make -e DESIGN={device_name} run_tcl_script -B"
    result = subprocess.run(command, shell=True)

    # Print results
    table_str, error_dict = con_results(device_name, num_assays)
    print(table_str)
    return table_str, error_dict, result

# Function to perform Newton-Raphson method on number of turns
def newton_method(design, assay, key, error_dict, error_key, resist_num):
    old_resist = f"p_resistor_0_{design[assay]["block_dict"][key]}_{design[assay]["w_dict"][key]}_{design[assay]["h_dict"][key]}_{design[assay]["w3_dict"][key]}_{design[assay]["h3_dict"][key]}_{design[assay]["len_dict"][key]}"
    if error_dict[error_key]['evaluated_conc'] > error_dict[error_key]['expected_conc']:
        while error_dict[error_key]['evaluated_conc'] > error_dict[error_key]['expected_conc']:
            a = design[assay]["block_dict"][key]
            b = a * 2
            design[assay]["block_dict"][key] = b
            new_resist = f"p_resistor_0_{design[assay]["block_dict"][key]}_{design[assay]["w_dict"][key]}_{design[assay]["h_dict"][key]}_{design[assay]["w3_dict"][key]}_{design[assay]["h3_dict"][key]}_{design[assay]["len_dict"][key]}"
            table_str, error_dict, result = update_flow(device_name, resist_num, old_resist, new_resist)
    else:
        while error_dict[error_key]['evaluated_conc'] < error_dict[error_key]['expected_conc']:
            b = design[assay]["block_dict"][key]
            a = b // 2
            if a == 0:
                a = 1
            design[assay]["block_dict"][key] = a
            new_resist = f"p_resistor_0_{design[assay]["block_dict"][key]}_{design[assay]["w_dict"][key]}_{design[assay]["h_dict"][key]}_{design[assay]["w3_dict"][key]}_{design[assay]["h3_dict"][key]}_{design[assay]["len_dict"][key]}"
            table_str, error_dict, result = update_flow(device_name, resist_num, old_resist, new_resist)
            print(table_str)
            time.sleep(5)
    return a, b

# Function to perform bisection method on number of turns
def bisection_method(a, b, design, assay, key, error_key, resist_num, error_condition):
    old_resist = f"p_resistor_0_{design[assay]["block_dict"][key]}_{design[assay]["w_dict"][key]}_{design[assay]["h_dict"][key]}_{design[assay]["w3_dict"][key]}_{design[assay]["h3_dict"][key]}_{design[assay]["len_dict"][key]}"
    # Calculate m
    m = int((a + b) / 2)
    design[assay]["block_dict"][key] = m
    new_resist = f"p_resistor_0_{design[assay]["block_dict"][key]}_{design[assay]["w_dict"][key]}_{design[assay]["h_dict"][key]}_{design[assay]["w3_dict"][key]}_{design[assay]["h3_dict"][key]}_{design[assay]["len_dict"][key]}"
    table_str, error_dict, result = update_flow(device_name, resist_num, old_resist, new_resist)
    print(table_str)
    time.sleep(5)
    if error_dict[error_key]['error'] < error_condition:
        return
    else:
    # Update a and b appropriately
        if error_dict[error_key]['evaluated_conc'] > error_dict[error_key]['expected_conc']:
            a = m
        else:
            b = m
    return bisection_method(a, b, design, assay, key, error_key, resist_num, error_condition)

# Function to plot results
def plot(i, assay, count_x, eval_y, expect_y, method):
    print("COUNT X", count_x)
    count_x_list = list(range(1, count_x + 1))
    print("COUNT X LIST", count_x_list)
    print("EXPECT Y", expect_y)
    expect_y_list = [expect_y] * count_x
    print("EXPECT Y LIST", expect_y_list)
    fig, ax = plt.subplots()
    print("EVAL Y", eval_y)
    ax.plot(count_x_list, eval_y, 'o-', linewidth=2, label="Evaluated")
    ax.plot(count_x_list, expect_y_list, linewidth=2, label="Expected")
    ax.xaxis.set_major_locator(MultipleLocator(1))
    plt.xlabel('Iteration', fontsize=12)
    plt.ylabel('Relative Concentration [uL/uL]', fontsize=12)
    plt.title(f'{method} Method\nAssay: {assay} | Component: {i+1}', fontsize=14)
    plt.legend()
    plt.show()

# Function to calculate difference in errors 
def error_diff(old_error, new_error):
    return abs(old_error - new_error) / old_error * 100

# Recursive function for error minimization based on difference between expected and evaluated concentration values
def min_error(design, error_condition):
    assay_num = 0
    resist_num_index = 0
    for assay in design:
        assay_num += 1
        for key in design[assay]["eval_dict"].keys():
            error_key = f"{key}_out{assay_num}"
            resist_num = f"resist{resist_num_index}"
            if error_dict[error_key]['error'] <= error_condition:
                break
            else:
                a, b = newton_method(design, assay, key, error_dict, error_key, resist_num)
                bisection_method(a, b, design, assay, key, error_key, resist_num, error_condition)
            resist_num_index += 1

    # return min_error(design, error_condition)


    
#################################################################################
# # Generate concentration and resistance length ratios
# design = conc_ratio(design, assay_ls, num_assays)
# # Generate necessary files
# configure_file(device_name, platform)
# make_file(device_name, platform)
# constraint_file(device_name, platform)
# io_file(device_name, platform, design, assay_ls, num_assays)
# design, soln_list, soln_str = solution_dict(design, assay_ls, num_assays)
# design = sim_eval_files(device_name, platform, design, assay_ls)
# # Initial mixing and verilog file
# design = init_mix(design, assay_ls)
# mix_str, connect_str, output_str, routing_str = mix_v(design, assay_ls)
# v_file(device_name, soln_list, soln_str, connect_str, output_str, mix_str)
# routing_file(device_name, platform, routing_str)
# subprocess.run(["python3", f"./flow/designs/{platform}/{device_name}/{device_name}.py"])
# table_str, error_dict = con_results(device_name, num_assays)
# print(table_str)
# min_error(design, 3)

device_name = "multiplex_test"
def_file = f"flow/results/{device_name}/base/2_2_place_iop.def"
verilog_file = f"flow/designs/src/{device_name}/{device_name}.v"
resist_num = "resist10"
old_resist = "p_resistor_0_1_14_10_6_5_5"
new_resist = "p_resistor_0_1_14_10_6_5_15"
filename = verilog_file 
edit_file(filename, resist_num, old_resist, new_resist)
# update_flow(device_name, resist_num, old_resist, new_resist)
# newton_method(design, assay, key, error_dict, error_key, resist_num)
# bisection_method(a, b, design, assay, key, error_key, resist_num, error_condition)
# min_error(design, error_condition)

# for assay in design:
#     for key in design[assay]["eval_dict"].keys():
#         print("key", key)
#         print("design[assay]", design[assay]["block_dict"][key])
#
#         print("{design[assay]['block_dict'[key]]}", {design[assay]["block_dict"][key]})
#         print("{design[assay]['w_dict'[key]]}", {design[assay]["w_dict"][key]})
#         print("{design[assay]['h_dict'[key]]}", {design[assay]["h_dict"][key]})
#         print("{design[assay]['w3_dict'[key]]}", {design[assay]["w3_dict"][key]})
#         print("{design[assay]['h3_dict'[key]]}", {design[assay]["h3_dict"][key]})
#         print("{design[assay]['len_dict'[key]]}", {design[assay]["len_dict"][key]})

