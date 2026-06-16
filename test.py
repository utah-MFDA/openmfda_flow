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
import csv

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
def edit_file(filename, num_samples, serp_num, old_serp, new_serp, max_x, zero):
    # Read and modify each line of a file
    with open(filename, "r") as f:
        lines = f.readlines()
    new_lines = []
    serp_ls = []
    x_pos = [] 
    y_pos = []
    for line in lines:
        # Keep track of y_pos of serpentines
        if filename.endswith("def") and "serp" in line:
            if line.split()[-4] != "+":
                serp_ls.append(line.split()[2])
                x_pos.append(line.split()[-5])
                y_pos.append(line.split()[-4])
        if serp_num in line:
            new_lines.append(line.replace(old_serp, new_serp))
        else:
            new_lines.append(line)

    # Write the modified lines back to the file
    with open(filename, "w") as f:
        f.writelines(new_lines)
    
    if filename.endswith("def") and zero:
        print("serpnum", serp_num)
        print("serpnum[-1]", serp_num[-1])
        print("{x_pos[int(serp_num[-1])]}", f"{x_pos[int(serp_num[-1])]}")
        time.sleep(10)
        edit_file(filename, num_samples, serp_num, f"{x_pos[int(serp_num[-1])]}", "0", max_x, False)

    # Check for serpentines that share same ypos and overlap
    # if 0 < len(set(y_pos)) < num_samples:
    for i in range(len(y_pos)):
        width_x_i, width_y_i = calc_width(i, serp_ls, x_pos)
        if int(width_x_i) > x_coord and num_samples == 4:
                edit_file(filename, num_samples, serp_num, old_serp, new_serp, max_x, True)
        for j in range(len(y_pos)):
            width_x_j, width_y_j = calc_width(j, serp_ls, x_pos)
            if int(width_x_i) > max_x:
                max_x = int(width_x_i)
            if i != j:
                if (int(x_pos[i]) <= int(x_pos[j])) and (int(x_pos[j]) <= int(width_x_i)) and ((int(y_pos[i]) - width_y_i) <= int(y_pos[j]) <= (int(y_pos[i]) + width_y_i) or (int(y_pos[j]) - width_y_j) <= int(y_pos[i]) <= (int(y_pos[j]) + width_y_j)): 
                    if serp_ls[i].split("_")[3] > serp_ls[j].split("_")[3]:
                        px_add = serp_ls[i].split("_")[3]
                    else:
                        px_add = serp_ls[j].split("_")[3]
                    add_px_y = int(px_add + '000') + 120000
                    if int(y_pos[j]) + add_px_y >= y_coord - (width_y_j + 50000):
                        add_px_x = (int(width_x_i) - int(x_pos[i])) + 120000
                        if int(x_pos[j]) + add_px_x >= x_coord - 100000:
                            if int(x_pos[j]) - add_px_x < 0:
                                edit_file(filename, num_samples, f"serp{j}", f"( {x_pos[j]}", "( 0", max_x, zero)
                            else:
                                edit_file(filename, num_samples, f"serp{j}", f"( {x_pos[j]}", f"( {int(x_pos[j]) - add_px_x}", max_x, zero)
                        else:
                            edit_file(filename, num_samples, f"serp{j}", f"( {x_pos[j]}", f"( {int(x_pos[j]) + add_px_x}", max_x, zero)
                    else:
                        edit_file(filename, num_samples, f"serp{j}", f" {y_pos[j]} )", f" {int(y_pos[j]) + add_px_y} )", max_x, zero)      
    return max_x    

# Function to calculate x_pos + width of serpentine
def calc_width(i, serp_ls, x_pos):
    width_x = int(serp_ls[i].split("_")[4]) * (int(serp_ls[i].split("_")[5]) + 1)
    width_y = int(serp_ls[i].split("_")[3])
    return str(int(x_pos[i]) + int((str(width_x) + '000'))), int((str(width_y) + '000'))

# Function for re-running second half of flow when modifying serpentine(s)
def update_flow(assay, num_samples, old_serp, new_serp, serp_num, max_x, zero):
    # Edit .def and .v files
    def_file = f"flow/results/{assay}/base/2_place.def"
    verilog_file = f"flow/designs/src/{assay}/{assay}.v"
    
    max_x = edit_file(def_file, num_samples, serp_num, old_serp, new_serp, 0, zero)
    max_x = edit_file(verilog_file, num_samples, serp_num, old_serp, new_serp, max_x, zero)
   
    # Run Tcl script commands following .def and .v modification 
    command = f"cd flow && make -e DESIGN={assay} run_tcl_script -B"
    result = subprocess.run(command, shell=True)

    # Print results
    table_str, error_list, expect_conc, eval_conc = con_results(assay, num_samples)
    print(table_str)
    return error_list, expect_conc, eval_conc, result, max_x

# Function to perform Newton-Raphson method on number of turns
def newton_method(i, assay, num_samples, len_list, layer_list, pitch_list, turn_list, eval_conc, error_condition, eval_list, count, old_error, max_x, zero):
    serp_num = f"serp{i}"
    count += 1
    table_str, error_list, expect_conc, eval_conc = con_results(assay, num_samples)
    eval_list.append(eval_conc[i])
    if eval_conc[i] > expect_conc[i]:
        old_serp = f"p_serpentine_{layer_list[i][len(turn_list[i])-1]}_{len_list[i][len(turn_list[i])-1]}_{pitch_list[i][len(turn_list[i])-1]}_{turn_list[i][len(turn_list[i])-1]}"
        while eval_conc[i] > expect_conc[i]:
            if turn_list[i][len(turn_list[i])-1] >= max_turn or turn_list[i][len(turn_list[i])-1] * 2 >= max_turn:
                if layer_list[i][len(turn_list[i])-1] == 3:
                    a = turn_list[i][len(turn_list[i])-1]
                    b = max_turn
                    turn_list[i][len(turn_list[i])-1] = b
                    new_serp = f"p_serpentine_{layer_list[i][len(turn_list[i])-1]}_{len_list[i][len(turn_list[i])-1]}_{pitch_list[i][len(turn_list[i])-1]}_{turn_list[i][len(turn_list[i])-1]}"
                    error_list, expect_conc, eval_conc, result, max_x = update_flow(assay, num_samples, old_serp, new_serp, serp_num, max_x, zero)
                    return a, b, new_serp, eval_list, expect_conc[i], count, error_list, max_x
                elif layer_list[i][len(turn_list[i])-1] <= 2:
                    layer_list[i][len(turn_list[i])-1] += 1
                    turn_list[i][len(turn_list[i])-1] = 1
            count += 1
            a = turn_list[i][len(turn_list[i])-1]
            b = a * 2
            if b > 75:
                b == 75
            turn_list[i][len(turn_list[i])-1] = b
            new_serp = f"p_serpentine_{layer_list[i][len(turn_list[i])-1]}_{len_list[i][len(turn_list[i])-1]}_{pitch_list[i][len(turn_list[i])-1]}_{turn_list[i][len(turn_list[i])-1]}"
            error_list, expect_conc, eval_conc, result, max_x = update_flow(assay, num_samples, old_serp, new_serp, serp_num, max_x, zero)
            eval_list.append(eval_conc[i])
            if result.returncode != 0:
                count += 1
                old_serp = new_serp 
                if layer_list[i][len(turn_list[i])-1] <= 2:
                    layer_list[i][len(turn_list[i])-1] += 1
                    b = 41
                else: 
                    b = 41
                turn_list[i][len(turn_list[i])-1] = b
                new_serp = f"p_serpentine_{layer_list[i][len(turn_list[i])-1]}_{len_list[i][len(turn_list[i])-1]}_{pitch_list[i][len(turn_list[i])-1]}_{turn_list[i][len(turn_list[i])-1]}"
                error_list, expect_conc, eval_conc, result, max_x = update_flow(assay, num_samples, old_serp, new_serp, serp_num, max_x, zero)
                eval_list.append(eval_conc[i])
            old_serp = new_serp
    else:
        b = turn_list[i][len(turn_list[i])-1] 
        old_serp = f"p_serpentine_{layer_list[i][len(turn_list[i])-1]}_{len_list[i][len(turn_list[i])-1]}_{pitch_list[i][len(turn_list[i])-1]}_{b}"
        while eval_conc[i] < expect_conc[i]:
            a = turn_list[i][len(turn_list[i])-1] // 2
            if a == 0:
                a = 1
                return a, b, old_serp, eval_list, expect_conc[i], count, error_list, max_x
            count += 1
            turn_list[i][len(turn_list[i])-1] = a
            new_serp = f"p_serpentine_{layer_list[i][len(turn_list[i])-1]}_{len_list[i][len(turn_list[i])-1]}_{pitch_list[i][len(turn_list[i])-1]}_{a}"
            error_list, expect_conc, eval_conc, result, max_x = update_flow(assay, num_samples, old_serp, new_serp, serp_num, max_x, zero)
            eval_list.append(eval_conc[i])
    return a, b, new_serp, eval_list, expect_conc[i], count, error_list, max_x

# Recursive function to perform bisection method on number of turns
def bisection_method(i, assay, num_samples, error_condition, eval_list, len_list, layer_list, pitch_list, turn_list, a, b, old_serp, count, old_error, max_x, zero):
    count += 1
    serp_num = f"serp{i}"
    m = int((a + b) / 2)
    turn_list[i][len(turn_list[i])-1] = m
    new_serp = f"p_serpentine_{layer_list[i][len(turn_list[i])-1]}_{len_list[i][len(turn_list[i])-1]}_{pitch_list[i][len(turn_list[i])-1]}_{turn_list[i][len(turn_list[i])-1]}"
    error_list, expect_conc, eval_conc, result, max_x = update_flow(assay, num_samples, old_serp, new_serp, serp_num, max_x, zero)
    old_serp = new_serp
    eval_list.append(eval_conc[i])
    if result.returncode != 0:
        zero = True 
        update_flow(assay, num_samples, old_serp, new_serp, serp_num, max_x, zero)
        zero = False
    if error_list[i] * 100 <= error_condition or error_calc(old_error, error_list[i]) * 100 <= error_diff_condition or a == b or b - a == 1:
        return eval_list, count, error_list, max_x
    # Update a and b appropriately 
    else:
        if eval_conc[i] > expect_conc[i]:
            a = m
        else:
            b = m
    return bisection_method(i, assay, num_samples, error_condition, eval_list, len_list, layer_list, pitch_list, turn_list, a, b, old_serp, count, error_list[i], max_x, zero)

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
def min_error(i, len_list, layer_list, pitch_list, turn_list, error_condition, assay, num_samples, recurv_count, platform, length_dict, old_error, start_time, error_list_stored, max_x):
    end_time = time.time()
    # Display results
    table_str, error_list, expect_conc, eval_conc = con_results(assay, num_samples)
    # print(table_str)
    # Store best design 
    if max(error_list) < max(error_list_stored):
        error_list_stored = error_list
        opt_time = end_time - start_time
        # Store .def and .v files
        command = f"cp flow/results/{assay}/base/2_place.def flow/results/{assay}/base/2_place_stored.def"
        # command = f"cp flow/results/{assay}/base/2_2_place_iop.def flow/results/{assay}/base/2_2_place_iop_stored.def"
        subprocess.run(command, shell=True)
        command = f"cp flow/designs/src/{assay}/{assay}.v flow/designs/src/{assay}/{assay}_stored.v"
        subprocess.run(command, shell=True)
    # Base case
    for j in range(len(error_list)):
        if j == len(error_list) - 1:
            if error_list[j] * 100  <= error_condition: 
            # or error_calc(old_error, error_list[j]) * 100 <= error_diff_condition:
                return error_list, opt_time, max_x
        else:
            if error_list[j] * 100 <= error_condition: 
            # or error_calc(old_error, error_list[j]) * 100 <= error_diff_condition:
                continue
            else:
                break 
    # Exit error minimiation after 30 min 
    if end_time - start_time > cutoff_time:
        # Assign optimal time
        try:
            opt_time
        except NameError or UnboundLocalError:
            opt_time = end_time - start_time
        # Replace current design with best design
        command = f"cp flow/results/{assay}/base/2_place_stored.def flow/results/{assay}/base/2_place.def"
        # command = f"cp flow/results/{assay}/base/2_2_place_iop_stored.def flow/results/{assay}/base/2_2_place_iop.def"
        subprocess.run(command, shell=True)
        command = f"cp flow/designs/src/{assay}/{assay}_stored.v flow/designs/src/{assay}/{assay}.v"
        subprocess.run(command, shell=True)
        command = f"cp flow/results/{assay}/base/2_place.def"
        # command = f"cp flow/results/{assay}/base/2_2_place_iop.def"

        # Run Tcl script commands following .def and .v modification 
        command = f"cd flow && make -e DESIGN={assay} run_tcl_script"
        result = subprocess.run(command, shell=True)

        # Print results
        table_str, error_list, expect_conc, eval_conc = con_results(assay, num_samples)
        print(f"AFTER {cutoff_time/60} MINUTES")
        print(table_str)
        return error_list, opt_time, max_x
    # Perform Newton Rapshon method on current component/soln, return a and b for bisection method 
    eval_list = []
    count = 0
    a, b, old_serp, eval_y, expect_y, count_x, error_list, max_x = newton_method(i, assay, num_samples, len_list, layer_list, pitch_list, turn_list, eval_conc, error_condition, eval_list, count, error_list[i], max_x, False)
    # plot(i, assay, count_x, eval_y, expect_y, "Newton-Raphson")
    # Perform Bisection Method on current component/soln using a and b from Newton Raphson method
    eval_list = []
    count = 0
    eval_y, count_x, error_list, max_x = bisection_method(i, assay, num_samples, error_condition, eval_list, len_list, layer_list, pitch_list, turn_list, a, b, old_serp, count, error_list[i], max_x, False)
    # plot(i, assay, count_x, eval_y, expect_y, "Bisection")
    # Update i to perform bisection method on each component/soln
    if i < num_samples - 1:
        i += 1
        recurv_count = 0
    else:
        i = 0
        recurv_count = 0
    error_list, opt_time, max_x = min_error(i, len_list, layer_list, pitch_list, turn_list, error_condition, assay, num_samples, recurv_count, platform, length_dict, error_list[i], start_time, error_list_stored, max_x)
    return error_list, opt_time, max_x


    
#################################################################################
design = conc_ratio(design, assay_ls, num_assays)
design, soln_list, soln_str = solution_dict(design, assay_ls, num_assays)
design = sim_eval_files(device_name, platform, design, assay_ls)   
design = init_mix(design, assay_ls)
mix_str, connect_str, output_str, routing_str = mix_v(design, assay_ls)
table_str, error_dict = con_results(device_name, num_assays)
print(error_dict)
# print(table_str)
print(design)
# print("keys", design.keys())
# for assay in design:
#     # print(design[assay].keys())
#     print(design[assay]['eval_dict'])
# print("ROUTING_STR: ", routing_str)
# routing_file(device_name, platform, routing_str)
# print("CONNECT_STR: ", connect_str)
# v_file(device_name, soln_list, soln_str, connect_str, output_str, mix_str)