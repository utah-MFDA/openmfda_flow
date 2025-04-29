import os, csv, subprocess
import time
import matplotlib.pyplot as plt 
from matplotlib.ticker import MultipleLocator

error_diff_condition = 0.0000000001
cutoff_time = 30 * 60
max_turn = 82
x_coord = 2550000
y_coord = 1590000

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
        # print("Actual px len", actual_px_len)
        actual_px_len_list.append(actual_px_len)
        error_val = error_calc((px_len * mult_factor), actual_px_len)
        # print("Percent error: ", error_val)
        key_num += 1
    # print("Expected px length list", expect_px_len_list) 
    # print("Actual px length list", actual_px_len_list)   
    # print("Actual len list", actual_len_list)
    chan_vol, reg_vol = volume(expect_px_len_list)
    return len_list, layer_list, pitch_list, turn_list, chan_vol, reg_vol

# Function that calculates entire px length
def calc_px_len(len, turn, layer, pitch):
    actual_px_len = len * turn + 1
    actual_px_len += pitch * turn
    actual_px_len *= (layer + 1)
    # Account for double counted corners
    ### CHECK WIDTH OF CHANNEL IN PIXELS
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

# Function for displaying concentration results from Chem_Eval.csv
def con_results(assay):
    error_list = []
    expect_conc = []
    eval_conc = []
    table_str = f"\n"
    table_str += "-" * 65
    table_str += f"\n|{assay.upper().center(63)}|\n"
    table_str += "-" * 65
    table_str += f"\n| SAMPLES/REAGENTS | EXPECTED CON. | EVALUATED CON. | ERROR [%] |\n"
    table_str += "-" * 65
    csv_file_path = f"flow/results/{assay}/base/simulation/Chem_Eval.csv"
    with open(csv_file_path, mode="r", newline="") as file:
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
    table_str += f"\n"
    table_str += "-" * 65
    return table_str, error_list, expect_conc, eval_conc 

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
        print("Wdith_x_iu", int(width_x_i))
        if int(width_x_i) > x_coord and num_samples == 4:
                # print("OUT of BOUNDS")
                # print("(width_x_i)", int(width_x_i))
                # add_px_x = (int(width_x_i) - x_coord) + 20000 
                # print("add_px_x", add_px_x)
                # print("int(x_pos[i]) - add_px_x", int(x_pos[i]) - add_px_x)
                # edit_file(filename, num_samples, f"serp{j}", f"( {x_pos[i]}", f"( {int(x_pos[i]) - add_px_x}", max_x, zero)
                # time.sleep(5)
                edit_file(filename, num_samples, serp_num, old_serp, new_serp, max_x, True)
        for j in range(len(y_pos)):
            width_x_j, width_y_j = calc_width(j, serp_ls, x_pos)
            print("Wdith_x_iu", int(width_x_i))
            if int(width_x_i) > max_x:
                max_x = int(width_x_i)
            if i != j:
                print("I: ", i)
                print("J: ", j)
                print("x_pos[i] <= x_pos[j]", int(x_pos[i]) <= int(x_pos[j]))
                print("x_pos[i]: ", x_pos[i])
                print("x_pos[j]: ", x_pos[j])
                print("x_pos[j] <= width_x_i", int(x_pos[j]) <= int(width_x_i))
                print("width_x_i: ", int(width_x_i))
                print("((int(y_pos[i]) - width_y_i) <= int(y_pos[j]) <= (int(y_pos[i]) + width_y_i) or (int(y_pos[j]) - width_y_j) <= int(y_pos[i]) <= (int(y_pos[j]) + width_y_j))", ((int(y_pos[i]) - width_y_i) <= int(y_pos[j]) <= (int(y_pos[i]) + width_y_i) or (int(y_pos[j]) - width_y_j) <= int(y_pos[i]) <= (int(y_pos[j]) + width_y_j)))
                print("y_pos[i]: ", y_pos[i])
                print("y_pos[j]: ", y_pos[j])
                print("width_y_i", width_y_i)
                print(f"\n\n\n")
                if (int(x_pos[i]) <= int(x_pos[j])) and (int(x_pos[j]) <= int(width_x_i)) and ((int(y_pos[i]) - width_y_i) <= int(y_pos[j]) <= (int(y_pos[i]) + width_y_i) or (int(y_pos[j]) - width_y_j) <= int(y_pos[i]) <= (int(y_pos[j]) + width_y_j)): 
                    time.sleep(5)
                    if serp_ls[i].split("_")[3] > serp_ls[j].split("_")[3]:
                        px_add = serp_ls[i].split("_")[3]
                    else:
                        px_add = serp_ls[j].split("_")[3]
                    add_px_y = int(px_add + '000') + 120000
                    if int(y_pos[j]) + add_px_y >= y_coord - (width_y_j + 50000):
                        add_px_x = (int(width_x_i) - int(x_pos[i])) + 120000
                        if int(x_pos[j]) + add_px_x >= x_coord - 100000:
                            if int(x_pos[j]) - add_px_x < 0:
                                print("x_pos[j]", int(x_pos[j]))
                                print("0", 0)
                                time.sleep(2)
                                edit_file(filename, num_samples, f"serp{j}", f"( {x_pos[j]}", "( 0", max_x, zero)
                            else:
                                print("x_pos[j]", int(x_pos[j]))
                                print("add_px_x", add_px_x)
                                print("int(x_pos[j]) - add_px_x", int(x_pos[j]) - add_px_x)
                                time.sleep(2)
                                edit_file(filename, num_samples, f"serp{j}", f"( {x_pos[j]}", f"( {int(x_pos[j]) - add_px_x}", max_x, zero)
                        else:
                            print("x_pos[j]", int(x_pos[j]))
                            print("add_px_x", add_px_x)
                            print("int(x_pos[j]) + add_px_x", int(x_pos[j]) + add_px_x)
                            time.sleep(2)
                            edit_file(filename, num_samples, f"serp{j}", f"( {x_pos[j]}", f"( {int(x_pos[j]) + add_px_x}", max_x, zero)
                    else:
                        print("y_pos[j]", int(y_pos[j]))
                        print("add_px_y", add_px_y)
                        print("{int(y_pos[j]) + add_px_y}", int(y_pos[j]) + add_px_y)
                        time.sleep(2)
                        edit_file(filename, num_samples, f"serp{j}", f" {y_pos[j]} )", f" {int(y_pos[j]) + add_px_y} )", max_x, zero)      
    return max_x    

    # # Working check for serpentines that share same ypos
    # if 0 < len(set(y_pos)) < num_samples:
    #     for i in range(len(y_pos) - 1):
    #         for j in range(len(y_pos)-1):
    #             width_x, width_y = calc_width(i, serp_ls, x_pos)
    #             if i != j:
    #                 if x_pos[i] < x_pos[j] and width_x >= x_pos[j] and (int(y_pos[i]) - width_y) <= int(y_pos[j]) <= (int(y_pos[i]) + width_y):  
    #                     if serp_ls[i].split("_")[3] > serp_ls[j].split("_")[3]:
    #                         px_add = serp_ls[i].split("_")[3]
    #                     else:
    #                         px_add = serp_ls[j].split("_")[3]
    #                     add_px_y = int(px_add + '000') + 120000
    #                     edit_file(filename, num_samples, f"serp{j}", f"{y_pos[j]}", f"{int(y_pos[j]) + add_px_y}", max_x, zero)

    
# Function to calculate x_pos + width of serpentine
def calc_width(i, serp_ls, x_pos):
    width_x = int(serp_ls[i].split("_")[4]) * (int(serp_ls[i].split("_")[5]) + 1)
    width_y = int(serp_ls[i].split("_")[3])
    return str(int(x_pos[i]) + int((str(width_x) + '000'))), int((str(width_y) + '000'))

# Function for re-running second half of flow when modifying serpentine(s)
def update_flow(assay, num_samples, old_serp, new_serp, serp_num, max_x, zero):
    # Edit .def and .v files
    def_file = f"flow/results/{assay}/base/2_place.def"
    # def_file = f"flow/results/{assay}/base/2_2_place_iop.def"
    verilog_file = f"flow/designs/src/{assay}/{assay}.v"
    
    max_x = edit_file(def_file, num_samples, serp_num, old_serp, new_serp, 0, zero)
    max_x = edit_file(verilog_file, num_samples, serp_num, old_serp, new_serp, max_x, zero)
   
    # Run Tcl script commands following .def and .v modification 
    command = f"cd flow && make -e DESIGN={assay} run_tcl_script"
    result = subprocess.run(command, shell=True)

    # Print results
    table_str, error_list, expect_conc, eval_conc = con_results(assay)
    print(table_str)
    return error_list, expect_conc, eval_conc, result, max_x

# Function to perform Newton-Raphson method on number of turns
def newton_method(i, assay, num_samples, len_list, layer_list, pitch_list, turn_list, eval_conc, error_condition, eval_list, count, old_error, max_x, zero):
    ### NEED TO CHECK FOR ERROR CONDITION IN NEWTON-RAPHSON?
    serp_num = f"serp{i}"
    count += 1
    table_str, error_list, expect_conc, eval_conc = con_results(assay)
    eval_list.append(eval_conc[i])
    if eval_conc[i] > expect_conc[i]:
        old_serp = f"p_serpentine_{layer_list[i][len(turn_list[i])-1]}_{len_list[i][len(turn_list[i])-1]}_{pitch_list[i][len(turn_list[i])-1]}_{turn_list[i][len(turn_list[i])-1]}"
        while eval_conc[i] > expect_conc[i]:
            if turn_list[i][len(turn_list[i])-1] >= max_turn or turn_list[i][len(turn_list[i])-1] * 2 >= max_turn:
                if layer_list[i][len(turn_list[i])-1] == 3:
                    #### MAY NEED TO REVISIT 
                    a = turn_list[i][len(turn_list[i])-1]
                    b = max_turn
                    print("A", a)
                    print("B", b)
                    time.sleep(5)
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
                    # b = turn_list[i][len(turn_list[i])-1]
                    # b -= 2
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
    table_str, error_list, expect_conc, eval_conc = con_results(assay)
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
                # if error_list[j] * 100 <= 10 and error_list == error_list_stored:
                #     recurv_count += 1
                #     if recurv_count > 200:
                #         return 
                # else:
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
        table_str, error_list, expect_conc, eval_conc = con_results(assay)
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
