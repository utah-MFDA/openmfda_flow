# main.py
from file_generation import file_generation, conc_ratio
from design_automation import min_error, init_mix, con_results
from datetime import date
import subprocess, time, csv


# Operating platform
platform = "h.r.3.3"

# Define assay name
assay = (str(input("What is the name of your assay?\n")).lower()).replace(" ", "") 

# Collect number of samples/reagents 
while True:
    try:  
        num_samples = int(input(f"How many samples and reagents are part of {assay}?\n"))
        break
    except ValueError:
        print("Error: Please enter a valid integer.")

# Define dictionary for storing sample/reagent data
input_dict = {}


# Collect sample/reagent name(s) and concentration(s)
for i in range(0, num_samples):
    if i == 0:
        name = str(input("What is the name of the first sample/reagent?\n"))
    else:
        name = str(input("What is the name of the next sample/reagent?\n"))
    while True:
        try:  
            concentration = float(input(f"What is the concentration of {name} [uL]?\n")) * 10**(-6)
            break
        except ValueError:
            print("Error: Please enter a valid concentration value.")
    input_dict[name] = concentration


# Collect maximum acceptable error 
while True:
    try:  
        error_condition = float(input(f"What is the maximum acceptable error between expected and evaluated concentration values [%]?\n"))
        break
    except ValueError:
        print("Error: Please enter a valid percentage.")
        

# Best design after 30 min. 
def store_design(num_samples):
    error_list_stored = [100 for _ in range(num_samples)]
    return error_list_stored

# Main flow process
def main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored):
    # Generate necessary files
    io_loc = file_generation(platform, assay, num_samples, input_dict)
    # Run flow
    subprocess.run(["python3", f"flow/designs/{platform}/{assay}/{assay}.py"])
    # Optimize design
    ratio_dict, length_dict = conc_ratio(input_dict)
    len_list, layer_list, pitch_list, turn_list, chan_vol, reg_vol = init_mix(num_samples, length_dict)
    error_list, opt_time, max_x = min_error(0, len_list, layer_list, pitch_list, turn_list, error_condition, assay, num_samples, 0, platform, length_dict, 100, start_time, error_list_stored, 0)
    # Append verilog file
    # subprocess.run(f"cat flow/designs/src/{assay}/{assay}.v", shell=True)
    return error_list, opt_time, max_x, chan_vol, reg_vol, io_loc


# Function for replacing serpentine information in specified file(s)
def grab_info(filename, info, delimiter, index):
    # Read and modify each line of a file
    with open(filename, "r") as f:
        lines = f.readlines()
    for line in lines:
        if info in line:
            split_line = line.split(delimiter)
            return split_line[index]

def max_mean_med(filename, info, delimiter1, delimiter2, delimiter4, index1, index2, index3, index4):
    # Read file 
    val_list = []
    connect_list = []
    with open(filename, "r") as f:
        lines = f.readlines()
    for line in lines:
        if info in line:
            splt1 = line.split(delimiter1)[index1]
            splt3 = line.split(delimiter1)[index3]
            splt2 = splt1.split(delimiter2)[index2]
            splt4 = splt3.split(delimiter4)[index4]
            val_list.append(float(splt2))
            connect_list.append(splt4)
    # Determine max value and connection
    max_val = max(val_list)
    connect = connect_list[val_list.index(max_val)]
    # Determine mean value
    sum = 0
    for i in range(len(val_list)):
        sum += val_list[i]
    mean_val = sum / len(val_list)
    # Determine median value
    val_list.sort()
    if len(val_list) % 2 == 1:
        med_val = val_list[len(val_list) // 2]
    else:
        med_val = (val_list[len(val_list) // 2] + val_list[len(val_list) // 2 - 1]) / 2
    return max_val, connect, mean_val, med_val


if __name__ == "__main__":
    # create csv file for storing design metrics
    today = date.today().strftime(f"%Y_%m_%d")
    filename = f'{assay}_{today}.csv'
    with open(filename, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
        '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
        # Record start time
        start_time = time.time()
        # Generate error_list_stored
        error_list_stored = store_design(num_samples)
        # Run design process
        error_list, total_time_opt, max_x, chan_vol, reg_vol, io_loc = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
        # Record end time
        end_time = time.time()
        total_time = end_time - start_time
        # total_time_opt = opt_time_end
        min = total_time // 60
        sec = total_time % 60
        print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
        # Data to be added to csv file
        rows = [[] for _ in range(num_samples+1)]

        die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
        design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
        percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
        total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
        max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
            
        rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
        for j in range(1, len(rows)):
            rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
        k = 0
        for key in input_dict.keys():
            # rows[k].append(io_loc[k])
            rows[k].append(input_dict[key])
            rows[k].append(error_list[k] * 100)
            rows[k].append(chan_vol[k])
            rows[k].append(reg_vol[k])
            # if k == len(io_loc) - 2:
            #     rows[k+1].append(io_loc[k+1])
            k += 1
        with open(filename, mode='a', newline='') as file:
            writer = csv.writer(file)
            writer.writerows(rows)
