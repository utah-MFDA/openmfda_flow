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
                    soln_str += f"soln1" 
            else:
                soln_dict[key] = f"soln{j}"
                soln_list += f"\tsoln{j},\n"
                soln_str += f"soln{j}"
                j += 1
            if assay == assay_ls[-1] and key == list(design[assay]["length_dict"].keys())[-1]:
                soln_str += ";"
            elif key != list(design[assay]["length_dict"].keys())[-1]:
                soln_str += ", "
                print("KEY: ", key)
                print("SOLN_STR")
        design[assay]["solution_dict"] = soln_dict
    for i in range(num_assays):
        if i == num_assays - 1:
            soln_list += f"\tout{i+1}"
        else:
            soln_list += f"\tout{i+1},\n"
    return design, soln_list, soln_str

# Function for specifying solutions; used in .v file
def soln_spec(num_samples):
    soln_list = ""
    soln_str = ""
    for i in range(1, num_samples+1):
        soln_list += f"\tsoln{i},\n"
        soln_str += f"soln{i}"
        if i == num_samples:
            soln_list += f"\tout"
            soln_str += ";"
        else:
            soln_str += ", "
    return soln_list, soln_str


# Function for initial mixing geometry based on resistance length
def init_mix(num_samples, length_dict): 
    # Empty list for specifying extra number of layers
    layer_list = [[] for i in range(num_samples)]
    # Empty list for adding mixing length based on sample concentration values
    len_list = [[] for i in range(num_samples)]
    # Empty list for specifying pitch between turns
    pitch_list = [[] for i in range(num_samples)]
    # Empty list for specifying number of turns
    turn_list = [[] for i in range(num_samples)]
    # Assign number of turns based on length of first (smallest concentration/highest resistance) soln
    key_num = 0
    expect_px_len_list = []
    actual_px_len_list = []
    actual_len_list = []
    for key in length_dict.keys():
        actual_len_list.append(length_dict[key])
        if num_samples <= 3:
            if key_num == 0:
                px_len = length_dict[key] * 60
                mult_factor = 9
            else:
                px_len = length_dict[key] * 30
                mult_factor = 1
        else:
            mult_factor = 8
            px_len = length_dict[key] * 60
        expect_px_len_list.append(px_len * mult_factor)
        # Assign length, turns, pitch, and layers to each sample/reagent p_serp
        px_int = 360
        while px_len // px_int == 0:
            px_int -= 30
        len_list[key_num].append(px_int)
        turn_num = round(px_len / px_int) * mult_factor
        layer_list[key_num].append(0)
        pitch_list[key_num].append(30)
        turn_list[key_num].append(turn_num)
        # Add additional layer if turns exceeds maximum amount
        if turn_num > max_turn:
            layer_list[key_num][0] = 1
            turn_list[key_num][0] = max_turn
        # Calculate actual px length versus expected
        actual_px_len = calc_px_len(px_int, turn_list[key_num][0], layer_list[key_num][0], pitch_list[key_num][0])
        actual_px_len_list.append(actual_px_len)
        error_val = error_calc((px_len * mult_factor), actual_px_len)
        key_num += 1
    chan_vol, reg_vol = volume(expect_px_len_list)
    return len_list, layer_list, pitch_list, turn_list, chan_vol, reg_vol

# Function that calculates entire px length
def calc_px_len(len, turn, layer, pitch):
    actual_px_len = len * turn + 1
    actual_px_len += pitch * turn
    actual_px_len *= (layer + 1)
    # Account for double counted corners
    actual_px_len -= 14 * turn * 2 * (layer + 1)
    return actual_px_len

# Function that calculates percent error based on expected and observed values 
def error_calc(expected, actual):
    return abs(actual - expected) / expected * 100

# Function to calculate theoretical channel volumes in mL
def volume(len_list):
    chan_vol = []
    reg_vol = []
    w = 14 * 7.6
    h = 10 * 7.6
    for i in range(len(len_list)):
        l = len_list[i] * 7.6
        chan_vol.append(w * h * l * 10**-12)
        reg_vol.append((len_list[0]**2 / len_list[i]**2) * w * h * l * 10**-12)
    return chan_vol, reg_vol

# Function that formats mix_list for verilog file
def mix_v(num_samples, len_list, layer_list, pitch_list, turn_list):
    # Define serpentine combinations for each solution
    mix_str = ""
    k = 0
    connect_list = []
    for i in range(len(len_list)):
        for j in range(len(len_list[i])):
            mix_str += f"\np_serpentine_{layer_list[i][j]}_{len_list[i][j]}_{pitch_list[i][j]}_{turn_list[i][j]}"
            if j == 0:
                mix_str += f"\tserp{k}\t(.in_fluid(soln{i+1}), .out_fluid(connect{k}));"
            else:
                mix_str += f"\tserp{k}\t(.in_fluid(connect{k-1}), .out_fluid(connect{k}));"
            k += 1
        mix_str += "\n"
        if len_list[i] == []:
            connect_list.append(f"soln{i+1}")       
        else:
            connect_list.append(f"connect{k-1}")

    # Define mixing 
    for i in range(len(len_list)- 1):
        if i == len(len_list) - 2:
            if len_list[num_samples-1] == []:
                if connect_list == []:
                    mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid(soln{len(len_list)-1}), .b_fluid(soln{len(len_list)}), .out_fluid(out));\n"
                else:
                    mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid(soln{len(len_list)}), .b_fluid(connect{k-1}), .out_fluid(out));\n"
            else:
                if num_samples < 3:
                    mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_list[i]}), .b_fluid(connect{k-1}), .out_fluid(out));\n"
                else:
                    mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_list[i+1]}), .b_fluid(connect{k-1}), .out_fluid(out));\n"
        else:
            if i == 0:
                mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_list[i]}), .b_fluid({connect_list[i+1]}), .out_fluid(connect{k}));\n"
            else:
                mix_str += f"diffmix_25px_0\tmix{i}\t(.a_fluid({connect_list[i+1]}), .b_fluid({connect_list[len(connect_list)-1]}), .out_fluid(connect{k}));\n"
            connect_list.append(f"connect{k}")
        k += 1

    # Connect string
    connect = ""
    for i in range(k-1):
        if i == k-2:
            connect += f"connect{i};"
        else:
            connect+= f"connect{i},\t"
    
    return connect, mix_str

# Function for creating verilog file based on mixing specifications
def v_file(assay, num_samples, len_list, layer_list, pitch_list, turn_list):
    soln_list, soln_str = soln_spec(num_samples)
    connect, mix_str = mix_v(num_samples, len_list, layer_list, pitch_list, turn_list)
    # Create and define .v file
    directory = f'flow/designs/src/{assay}'
    filename = f'{assay}.v'
    filepath = os.path.join(directory, filename)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, "w") as f:
        f.write(f"""module {assay} (\n{soln_list} \n);
input\t{soln_str}
output\tout;\n
wire\t{connect}\n
    {mix_str}
    \nendmodule
    """)

    

design = conc_ratio(design, assay_ls, num_assays)
design, soln_list, soln_str = solution_dict(design, assay_ls, num_assays)
sim_eval_files(device_name, platform, design, assay_ls)   
print("DESIGN: ", design)
print("SOLN_LIST: ", soln_list)
print("SOLN_STR: ", soln_str)