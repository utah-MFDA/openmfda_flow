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

device_name = "multiplex_test"
platform= "h.r.3.3x2"

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
                if assay == assay_ls[-1] and key == list(design[assay]["length_dict"].keys())[-1]:
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

# Function that formats mix_list for verilog file
def mix_v(design, assay_ls):
    mix_str = ""
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
            k += 1

        # Define mixing 
        connect_ls = list(connect_dict.values())
        for h in range(len(connect_ls)-1):
            if h == 0:
                if len(connect_ls) <= 2:
                    mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_ls[h]}), .b_fluid({connect_ls[h+1]}), .out_fluid(out{j}));\n"
                else:
                    mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_ls[h]}), .b_fluid({connect_ls[h+1]}), .out_fluid(connect{k}));\n"
                    k += 1
            elif h == len(connect_ls) - 2:
                mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_ls[h+1]}), .b_fluid(connect{k-1}), .out_fluid(out{j}));\n"
            else:
                mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_ls[h+1]}), .b_fluid(connect{k-1}), .out_fluid(connect{k}));\n"
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

    return mix_str, connect_str, output_str


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

    

design = conc_ratio(design, assay_ls, num_assays)
design, soln_list, soln_str = solution_dict(design, assay_ls, num_assays)
sim_eval_files(device_name, platform, design, assay_ls)   
# print("DESIGN: ", design)
# print("SOLN_LIST: ", soln_list)
# print("SOLN_STR: ", soln_str)
design = init_mix(design, assay_ls)
# for assay in assay_ls:
#     print("----------------------")
#     print("ASSAY: ", assay)
#     print(design[assay])
#     print("[length_dict]", design[assay]["length_dict"])
#     print("[block_dict]", design[assay]["block_dict"]) 
#     print("[w_dict]", design[assay]["w_dict"])
#     print("[h_dict]", design[assay]["h_dict"])
#     print("[w3_dict]", design[assay]["w3_dict"])
#     print("[h3_dict]", design[assay]["h3_dict"])
#     print("[len_dict]", design[assay]["len_dict"] ) 
mix_str, connect_str, output_str = mix_v(design, assay_ls)
print("MIX_STR: ", mix_str)
# print("CONNECT_STR: ", connect_str)
# v_file(device_name, soln_list, soln_str, connect_str, output_str, mix_str)