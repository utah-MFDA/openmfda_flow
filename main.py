# main.py
from file_generation import file_generation, conc_ratio
from design_automation import min_error, init_mix, con_results
import subprocess, time, random, csv


# Collect platform information
# try:
#     correct = True
#     while correct:
#         correct = False
#         platform_num = int(input(f"What 3D printer platform are you using?\n1) h.r.3.3\n2)\n3)\nPlatform number: "))
#         if platform_num == 1:
#             platform = "h.r.3.3"
#         elif platform_num == 2:
#             platform = "n/a"
#         elif platform_num == 3:
#             platform = "n/a"
#         else:
#             correct = True
# except ValueError:
#     print("Error: Please enter a valid platform number.")
platform = "h.r.3.3"

# Define assay name
# assay = (str(input("What is the name of your assay?\n")).lower()).replace(" ", "")
# assay = "ethyl"
# assay = "caffeine"
# assay = "cocaine"
# assay = "calcium"
# assay = "albumin"
# assay = "salicylic_acid"
# assay = "nitrite"
# assay = "ketone"
# assay = "five_samples_v1"
# assay = "four_samples_v1"
# assay = "four_samples_v2"

# Collect number of samples/reagents 
# while True:
#     try:  
#         num_samples = int(input(f"How many samples and reagents are part of {assay}?\n"))
#         break
#     except ValueError:
#         print("Error: Please enter a valid integer.")
# num_samples = 3
# num_samples = 4
# num_samples = 2
# num_samples = 5

# Define dictionary for storing sample/reagent data
input_dict = {}

# Collect sample/reagent name(s) and concentration(s)
# for i in range(0, num_samples):
#     if i == 0:
#         name = str(input("What is the name of the first sample/reagent?\n"))
#     else:
#         name = str(input("What is the name of the next sample/reagent?\n"))
#     while True:
#         try:  
#             concentration = float(input(f"What is the concentration of {name} [uL]?\n")) * 10**(-6)
#             break
#         except ValueError:
#             print("Error: Please enter a valid concentration value.")
#     input_dict[name] = concentration
# input_dict = {"sample":4*10**(-6), "R1":210*10**(-6), "R2":90*10**(-6)}
# input_dict = {"sample":3*10**(-6), "R1":162*10**(-6), "R2":162*10**(-6)}
# input_dict = {"sample":9*10**(-6), "R1":130*10**(-6), "R2":55*10**(-6)}
# input_dict = {"sample":2*10**(-6), "R1":25*10**(-6), "H2O":225*10**(-6)}
# input_dict = {"sample":6*10**(-6), "R1":215*10**(-6), "R2":25*10**(-6), "H2O":10*10**(-6)}
# input_dict = {"sample":3*10**(-6), "R1":150*10**(-6), "R2":75*10**(-6), "H2O":10*10**(-6)}
# input_dict = {"sample":100*10**(-6), "R1":50*10**(-6), "R2":50*10**(-6)}
# input_dict = {"sample":5*10**(-6), "R1":195*10**(-6)}
# input_dict = {"sample":100*10**(-6), "R1":75*10**(-6), "R2":50*10**(-6), "R3":25*10**(-6), "R4":10*10**(-6)}
# input_dict = {"sample":5*10**(-6), "R1":100*10**(-6), "R2":100*10**(-6), "H2O":10*10**(-6)}
# input_dict = {"sample":50*10**(-6), "R1":100*10**(-6), "R2":100*10**(-6), "H2O":50*10**(-6)}


# Collect maximum acceptable error 
# while True:
#     try:  
#         error_condition = float(input(f"What is the maximum acceptable error between expected and evaluated concentration values [%]?\n"))
#         break
#     except ValueError:
#         print("Error: Please enter a valid percentage.")
error_condition = 1

# Best design after 30 min. 
def store_design(num_samples):
    error_list_stored = [100 for _ in range(num_samples)]
    return error_list_stored

# Main flow process
def main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored):
    # Generate necessary files
    file_generation(platform, assay, num_samples, input_dict)
    # Run flow
    subprocess.run(["python3", f"flow/designs/{platform}/{assay}/{assay}.py"])
    print(con_results(assay)[0])
    # Optimize design
    ratio_dict, length_dict = conc_ratio(input_dict, num_samples)
    len_list, layer_list, pitch_list, turn_list, chan_vol, reg_vol = init_mix(num_samples, length_dict)
    error_list, opt_time, max_x = min_error(0, len_list, layer_list, pitch_list, turn_list, error_condition, assay, num_samples, 0, platform, length_dict, 100, start_time, error_list_stored, 0)
    # Append verilog file
    # subprocess.run(f"cat flow/designs/src/{assay}/{assay}.v", shell=True)
    return error_list, opt_time, max_x, chan_vol, reg_vol


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
    # assay_ls = ["ethyl", "caffeine", "cocaine", "calcium", "albumin", "salicylic_acid", "nitrite", "ketone"]
    # num_samples_ls = [3, 3, 3, 3, 4, 4, 3, 2]
    # input_dict_ls = [{"sample":4*10**(-6), "R1":210*10**(-6), "R2":90*10**(-6)}, {"sample":3*10**(-6), "R1":162*10**(-6), "R2":162*10**(-6)},
    # {"sample":9*10**(-6), "R1":130*10**(-6), "R2":55*10**(-6)},
    # {"sample":2*10**(-6), "R1":25*10**(-6), "H2O":225*10**(-6)},
    # {"sample":6*10**(-6), "R1":215*10**(-6), "R2":25*10**(-6), "H2O":10*10**(-6)},
    # {"sample":3*10**(-6), "R1":150*10**(-6), "R2":75*10**(-6), "H2O":10*10**(-6)},
    # {"sample":100*10**(-6), "R1":50*10**(-6), "R2":50*10**(-6)},
    # {"sample":5*10**(-6), "R1":195*10**(-6)}]
    # while len(assay_ls) != 0:
    #     assay = assay_ls.pop()
    #     num_samples = num_samples_ls.pop()
    #     input_dict = input_dict_ls.pop()
    #     filename = f'{assay}_25_04_11.csv'
    #     with open(filename, mode='w', newline='') as file:
    #         writer = csv.writer(file)
    #         writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #         '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
        # # Record start time
        # start_time = time.time()
        # # Generate error_list_stored
        # error_list_stored = store_design(num_samples)
        # # Run design process
        # error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
        # # Record end time
        # end_time = time.time()
        # total_time = end_time - start_time
        # # total_time_opt = opt_time_end
        # min = total_time // 60
        # sec = total_time % 60
        # print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
    #     # Data to be added to csv file
    #     rows = [[] for _ in range(num_samples)]

    #     die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
    #     design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
    #     percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
    #     total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
    #     max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
            
    #     rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
    #     for j in range(1, len(rows)):
    #         rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
    #     k = 0
    #     for key in input_dict.keys():
    #         rows[k].append(input_dict[key])
    #         rows[k].append(error_list[k] * 100)
    #         rows[k].append(chan_vol[k])
    #         rows[k].append(reg_vol[k])
    #         k += 1
    #     with open(filename, mode='a', newline='') as file:
    #         writer = csv.writer(file)
    #         writer.writerows(rows)
        
    # filename = 'two_samples_25_04_09.csv'
    # with open(filename, mode='w', newline='') as file:
    #     writer = csv.writer(file)
    #     writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #     '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
    # # 2 samples
    # assay = "two_samples"
    # num_samples = 2
    # designs = {
    #     "design1": {
    #         "input_dict": {
    #             "R1" : 100, 
    #             "R2" : 100
    #         }
    #     },
    #     "design2": {
    #         "input_dict": {
    #             "R1" : 50, 
    #             "R2" : 100
    #         }
    #     },
    #     "design3": {
    #         "input_dict": {
    #             "R1" : 5, 
    #             "R2" : 100
    #         }
    #     }
    # }

    # for key1 in designs:
    #     for key2 in designs[key1]:
    #         input_dict = designs[key1][key2]
            # # Record start time
            # start_time = time.time()
            # # Generate error_list_stored
            # error_list_stored = store_design(num_samples)
            # # Run design process
            # error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
            # # Record end time
            # end_time = time.time()
            # total_time = end_time - start_time
            # # total_time_opt = opt_time_end
            # min = total_time // 60
            # sec = total_time % 60
            # print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
            # # Data to be added to csv file
            # rows = [[] for _ in range(num_samples)]

            # die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
            # design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
            # percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
            # total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
            # max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
                
            # rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
            # for j in range(1, len(rows)):
            #     rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
            # k = 0
            # for key in input_dict.keys():
            #     rows[k].append(input_dict[key])
            #     rows[k].append(error_list[k] * 100)
            #     rows[k].append(chan_vol[k])
            #     rows[k].append(reg_vol[k])
            #     k += 1
            # with open(filename, mode='a', newline='') as file:
            #     writer = csv.writer(file)
            #     writer.writerows(rows)
    
    
    # filename = 'three_samples_25_04_09.csv'
    # with open(filename, mode='w', newline='') as file:
    #     writer = csv.writer(file)
    #     writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #     '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
    # # 3 samples
    # assay = "three_samples"
    # num_samples = 3
    # designs = {
    #     "design1": {
    #         "input_dict": {
    #             "R1" : 100, 
    #             "R2" : 100,
    #             "R3" : 100
    #         }
    #     },
    #     "design2": {
    #         "input_dict": {
    #             "R1" : 50, 
    #             "R2" : 100,
    #             "R3" : 100
    #         }
    #     },
    #     "design3": {
    #         "input_dict": {
    #             "R1" : random.randint(1, 25), 
    #             "R2" : random.randint(25, 100),
    #             "R3" : random.randint(100, 250)
    #         }
    #     },
    #     "design4": {
    #         "input_dict": {
    #             "R1" : 5, 
    #             "R2" : random.randint(10, 50),
    #             "R3" : random.randint(200, 250)
    #         }
    #     }
    # }

    # for key1 in designs:
    #     for key2 in designs[key1]:
    #         input_dict = designs[key1][key2]
            # # Record start time
            # start_time = time.time()
            # # Generate error_list_stored
            # error_list_stored = store_design(num_samples)
            # # Run design process
            # error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
            # # Record end time
            # end_time = time.time()
            # total_time = end_time - start_time
            # # total_time_opt = opt_time_end
            # min = total_time // 60
            # sec = total_time % 60
            # print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
            # # Data to be added to csv file
            # rows = [[] for _ in range(num_samples)]

            # die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
            # design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
            # percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
            # total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
            # max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
                
            # rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
            # for j in range(1, len(rows)):
            #     rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
            # k = 0
            # for key in input_dict.keys():
            #     rows[k].append(input_dict[key])
            #     rows[k].append(error_list[k] * 100)
            #     rows[k].append(chan_vol[k])
            #     rows[k].append(reg_vol[k])
            #     k += 1
            # with open(filename, mode='a', newline='') as file:
            #     writer = csv.writer(file)
            #     writer.writerows(rows)
    

    # filename = 'four_samples_25_04_09.csv'
    # with open(filename, mode='w', newline='') as file:
    #     writer = csv.writer(file)
    #     writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #     '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
    # # 4 samples
    # assay = "four_samples"
    # num_samples = 4
    # designs = {
    #     "design1": {
    #         "input_dict": {
    #             "R1" : 100, 
    #             "R2" : 100,
    #             "R3" : 100,
    #             "R4" : 100
    #         }
    #     },
    #     "design2": {
    #         "input_dict": {
    #             "R1" : 50, 
    #             "R2" : 100,
    #             "R3" : 100,
    #             "R4" : 100
    #         }
    #     },
    #     "design3": {
    #         "input_dict": {
    #             "R1" : random.randint(1, 25), 
    #             "R2" : random.randint(25, 100),
    #             "R3" : random.randint(25, 100),
    #             "R4" : random.randint(100, 250)
    #         }
    #     },
    #     "design4": {
    #         "input_dict": {
    #             "R1" : 5, 
    #             "R2" : random.randint(10, 50),
    #             "R3" : random.randint(50, 100),
    #             "R4" : random.randint(200, 250)
    #         }
    #     }
    # }

    # for key1 in designs:
    #     for key2 in designs[key1]:
    #         input_dict = designs[key1][key2]
            # # Record start time
            # start_time = time.time()
            # # Generate error_list_stored
            # error_list_stored = store_design(num_samples)
            # # Run design process
            # error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
            # # Record end time
            # end_time = time.time()
            # total_time = end_time - start_time
            # # total_time_opt = opt_time_end
            # min = total_time // 60
            # sec = total_time % 60
            # print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
            # # Data to be added to csv file
            # rows = [[] for _ in range(num_samples)]

            # die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
            # design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
            # percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
            # total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
            # max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
                
            # rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
            # for j in range(1, len(rows)):
            #     rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
            # k = 0
            # for key in input_dict.keys():
            #     rows[k].append(input_dict[key])
            #     rows[k].append(error_list[k] * 100)
            #     rows[k].append(chan_vol[k])
            #     rows[k].append(reg_vol[k])
            #     k += 1
            # with open(filename, mode='a', newline='') as file:
            #     writer = csv.writer(file)
            #     writer.writerows(rows)

    # filename = 'five_samples_25_04_16.csv'
    # with open(filename, mode='w', newline='') as file:
    #     writer = csv.writer(file)
    #     writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #     '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
    # # 5 samples
    # assay = "five_samples"
    # num_samples = 5
    # designs = {
    #     "design1": {
    #         "input_dict": {
    #             "R1" : 5, 
    #             "R2" : 10,
    #             "R3" : 83,
    #             "R4" : 61,
    #             "R5" : 230
    #         }
    #     },
        # "design1": {
        #     "input_dict": {
        #         "R1" : 100, 
        #         "R2" : 100,
        #         "R3" : 100,
        #         "R4" : 100,
        #         "R5" : 100
        #     }
        # },
    #     "design2": {
    #         "input_dict": {
    #             "R1" : 50, 
    #             "R2" : 100,
    #             "R3" : 100,
    #             "R4" : 100,
    #             "R5" : 100
    #         }
    #     },
    #     "design3": {
    #         "input_dict": {
    #             "R1" : random.randint(1, 25), 
    #             "R2" : random.randint(25, 100),
    #             "R3" : random.randint(25, 100),
    #             "R4" : random.randint(100, 250),
    #             "R5" : random.randint(100, 250)
    #         }
    #     },
    #     "design4": {
    #         "input_dict": {
    #             "R1" : 5, 
    #             "R2" : random.randint(10, 50),
    #             "R3" : random.randint(50, 100),
    #             "R4" : random.randint(50, 100),
    #             "R5" : random.randint(200, 250)
    #         }
    #     }
    # }
    # for key1 in designs:
    #     for key2 in designs[key1]:
    #         input_dict = designs[key1][key2]
    #         # Record start time
    #         start_time = time.time()
    #         # Generate error_list_stored
    #         error_list_stored = store_design(num_samples)
    #         # Run design process
    #         error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
    #         # Record end time
    #         end_time = time.time()
    #         total_time = end_time - start_time
    #         # total_time_opt = opt_time_end
    #         min = total_time // 60
    #         sec = total_time % 60
    #         print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
    #         # Data to be added to csv file
    #         rows = [[] for _ in range(num_samples)]

    #         die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
    #         design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
    #         percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
    #         total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
    #         max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
                
    #         rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
    #         for j in range(1, len(rows)):
    #             rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
    #         k = 0
    #         for key in input_dict.keys():
    #             rows[k].append(input_dict[key])
    #             rows[k].append(error_list[k] * 100)
    #             rows[k].append(chan_vol[k])
    #             rows[k].append(reg_vol[k])
    #             k += 1
    #         with open(filename, mode='a', newline='') as file:
    #             writer = csv.writer(file)
    #             writer.writerows(rows)
    
    # filename = 'six_samples_25_04_09.csv'
    # with open(filename, mode='w', newline='') as file:
    #     writer = csv.writer(file)
    #     writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #     '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
    # # 6 samples
    # assay = "six_samples"
    # num_samples = 6
    # designs = {
    #     "design1": {
    #         "input_dict": {
    #             "R1" : 100, 
    #             "R2" : 100,
    #             "R3" : 100,
    #             "R4" : 100,
    #             "R5" : 100,
    #             "R6" : 100
    #         }
    #     },
    #     "design2": {
    #         "input_dict": {
    #             "R1" : 50, 
    #             "R2" : 100,
    #             "R3" : 100,
    #             "R4" : 100,
    #             "R5" : 100,
    #             "R6" : 100
    #         }
    #     },
    #     "design3": {
    #         "input_dict": {
    #             "R1" : random.randint(1, 25), 
    #             "R2" : random.randint(25, 100),
    #             "R3" : random.randint(25, 100),
    #             "R4" : random.randint(25, 100),
    #             "R5" : random.randint(100, 250),
    #             "R6" : random.randint(100, 250)
    #         }
    #     },
    #     "design4": {
    #         "input_dict": {
    #             "R1" : 5, 
    #             "R2" : random.randint(10, 50),
    #             "R3" : random.randint(50, 100),
    #             "R4" : random.randint(50, 100),
    #             "R5" : random.randint(50, 100),
    #             "R6" : random.randint(200, 250)
    #         }
    #     }
    # }
    # for key1 in designs:
    #     for key2 in designs[key1]:
    #         input_dict = designs[key1][key2]
            # # Record start time
            # start_time = time.time()
            # # Generate error_list_stored
            # error_list_stored = store_design(num_samples)
            # # Run design process
            # error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
            # # Record end time
            # end_time = time.time()
            # total_time = end_time - start_time
            # # total_time_opt = opt_time_end
            # min = total_time // 60
            # sec = total_time % 60
            # print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
            # # Data to be added to csv file
            # rows = [[] for _ in range(num_samples)]

            # die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
            # design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
            # percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
            # total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
            # max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
                
            # rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
            # for j in range(1, len(rows)):
            #     rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
            # k = 0
            # for key in input_dict.keys():
            #     rows[k].append(input_dict[key])
            #     rows[k].append(error_list[k] * 100)
            #     rows[k].append(chan_vol[k])
            #     rows[k].append(reg_vol[k])
            #     k += 1
            # with open(filename, mode='a', newline='') as file:
            #     writer = csv.writer(file)
            #     writer.writerows(rows)

    # filename = 'seven_samples_25_04_14.csv'
    # with open(filename, mode='w', newline='') as file:
    #     writer = csv.writer(file)
    #     writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #     '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
    # # 7 samples
    # assay = "seven_samples"
    # num_samples = 7
    # designs = {
    #     "design1": {
    #         "input_dict": {
    #             "R1" : 100, 
    #             "R2" : 100,
    #             "R3" : 100,
    #             "R4" : 100,
    #             "R5" : 100,
    #             "R6" : 100,
    #             "R7" : 100
    #         }
    #     },
    #     "design2": {
    #         "input_dict": {
    #             "R1" : 50, 
    #             "R2" : 100,
    #             "R3" : 100,
    #             "R4" : 100,
    #             "R5" : 100,
    #             "R6" : 100,
    #             "R7" : 100
    #         }
    #     },
    #     "design3": {
    #         "input_dict": {
    #             "R1" : random.randint(1, 25), 
    #             "R2" : random.randint(25, 100),
    #             "R3" : random.randint(25, 100),
    #             "R4" : random.randint(25, 100),
    #             "R5" : random.randint(100, 250),
    #             "R6" : random.randint(100, 250),
    #             "R7" : random.randint(100, 250)
    #         }
    #     },
    #     "design4": {
    #         "input_dict": {
    #             "R1" : 5, 
    #             "R2" : random.randint(10, 50),
    #             "R3" : random.randint(50, 100),
    #             "R4" : random.randint(50, 100),
    #             "R5" : random.randint(50, 100),
    #             "R6" : random.randint(50, 100),
    #             "R7" : random.randint(200, 250)
    #         }
    #     }
    # }
    # for key1 in designs:
    #     for key2 in designs[key1]:
    #         input_dict = designs[key1][key2]
    #         # Record start time
    #         start_time = time.time()
    #         # Generate error_list_stored
    #         error_list_stored = store_design(num_samples)
    #         # Run design process
    #         error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
    #         # Record end time
    #         end_time = time.time()
    #         total_time = end_time - start_time
    #         # total_time_opt = opt_time_end
    #         min = total_time // 60
    #         sec = total_time % 60
    #         print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
    #         # Data to be added to csv file
    #         rows = [[] for _ in range(num_samples)]

    #         die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
    #         design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
    #         percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
    #         total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
    #         max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
                
    #         rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
    #         for j in range(1, len(rows)):
    #             rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
    #         k = 0
    #         for key in input_dict.keys():
    #             rows[k].append(input_dict[key])
    #             rows[k].append(error_list[k] * 100)
    #             rows[k].append(chan_vol[k])
    #             rows[k].append(reg_vol[k])
    #             k += 1
    #         with open(filename, mode='a', newline='') as file:
    #             writer = csv.writer(file)
    #             writer.writerows(rows)

    # filename = 'eight_samples_25_04_15.csv'
    # with open(filename, mode='w', newline='') as file:
    #     writer = csv.writer(file)
    #     writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #     '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
    # # 8 samples
    # assay = "eight_samples"
    # num_samples = 8
    # designs = {
        # "design1": {
        #     "input_dict": {
        #         "R1" : 100, 
        #         "R2" : 100,
        #         "R3" : 100,
        #         "R4" : 100,
        #         "R5" : 100,
        #         "R6" : 100,
        #         "R7" : 100,
        #         "R8" : 100
        #     }
        # },
    #     "design2": {
    #         "input_dict": {
    #             "R1" : 50, 
    #             "R2" : 100,
    #             "R3" : 100,
    #             "R4" : 100,
    #             "R5" : 100,
    #             "R6" : 100,
    #             "R7" : 100,
    #             "R8" : 100
    #         }
    #     },
    #     "design3": {
    #         "input_dict": {
    #             "R1" : random.randint(1, 25), 
    #             "R2" : random.randint(25, 100),
    #             "R3" : random.randint(25, 100),
    #             "R4" : random.randint(25, 100),
    #             "R5" : random.randint(25, 100),
    #             "R6" : random.randint(100, 250),
    #             "R7" : random.randint(100, 250),
    #             "R8" : random.randint(100, 250)
    #         }
    #     },
    #     "design4": {
    #         "input_dict": {
    #             "R1" : 5, 
    #             "R2" : random.randint(10, 50),
    #             "R3" : random.randint(50, 100),
    #             "R4" : random.randint(50, 100),
    #             "R5" : random.randint(50, 100),
    #             "R6" : random.randint(50, 100),
    #             "R7" : random.randint(200, 250),
    #             "R8" : random.randint(200, 250)
    #         }
    #     }
    # }
    # for key1 in designs:
    #     for key2 in designs[key1]:
    #         input_dict = designs[key1][key2]
    #         # Record start time
    #         start_time = time.time()
    #         # Generate error_list_stored
    #         error_list_stored = store_design(num_samples)
    #         # Run design process
    #         error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
    #         # Record end time
    #         end_time = time.time()
    #         total_time = end_time - start_time
    #         # total_time_opt = opt_time_end
    #         min = total_time // 60
    #         sec = total_time % 60
    #         print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
    #         # Data to be added to csv file
    #         rows = [[] for _ in range(num_samples)]

    #         die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
    #         design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
    #         percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
    #         total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
    #         max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
                
    #         rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
    #         for j in range(1, len(rows)):
    #             rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
    #         k = 0
    #         for key in input_dict.keys():
    #             rows[k].append(input_dict[key])
    #             rows[k].append(error_list[k] * 100)
    #             rows[k].append(chan_vol[k])
    #             rows[k].append(reg_vol[k])
    #             k += 1
    #         with open(filename, mode='a', newline='') as file:
    #             writer = csv.writer(file)
    #             writer.writerows(rows)

 
    # filename = 'nine_samples_25_04_15.csv'
    # with open(filename, mode='w', newline='') as file:
    #     writer = csv.writer(file)
    #     writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #     '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
    # # 9 samples
    # assay = "nine_samples"
    # num_samples = 9
    # designs = {
        # "design1": {
        #     "input_dict": {
        #         "R1" : 100, 
        #         "R2" : 100,
        #         "R3" : 100,
        #         "R4" : 100,
        #         "R5" : 100,
        #         "R6" : 100,
        #         "R7" : 100,
        #         "R8" : 100,
        #         "R9" : 100
        #     }
        # },
        # "design2": {
        #     "input_dict": {
        #         "R1" : 50, 
        #         "R2" : 100,
        #         "R3" : 100,
        #         "R4" : 100,
        #         "R5" : 100,
        #         "R6" : 100,
        #         "R7" : 100,
        #         "R8" : 100,
        #         "R9" : 100
        #     }
        # },
        # "design3": {
        #     "input_dict": {
        #         "R1" : random.randint(1, 25), 
        #         "R2" : random.randint(25, 100),
        #         "R3" : random.randint(25, 100),
        #         "R4" : random.randint(25, 100),
        #         "R5" : random.randint(25, 100),
        #         "R6" : random.randint(100, 250),
        #         "R7" : random.randint(100, 250),
        #         "R8" : random.randint(100, 250),
        #         "R9" : random.randint(100, 250)
        #     }
        # },
    #     "design4": {
    #         "input_dict": {
    #             "R1" : 5, 
    #             "R2" : random.randint(10, 50),
    #             "R3" : random.randint(50, 100),
    #             "R4" : random.randint(50, 100),
    #             "R5" : random.randint(50, 100),
    #             "R6" : random.randint(50, 100),
    #             "R7" : random.randint(50, 100),
    #             "R8" : random.randint(200, 250),
    #             "R9" : random.randint(200, 250)
    #         }
    #     }
    # }
    # for key1 in designs:
    #     for key2 in designs[key1]:
    #         input_dict = designs[key1][key2]
    #         # Record start time
    #         start_time = time.time()
    #         # Generate error_list_stored
    #         error_list_stored = store_design(num_samples)
    #         # Run design process
    #         error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
    #         # Record end time
    #         end_time = time.time()
    #         total_time = end_time - start_time
    #         # total_time_opt = opt_time_end
    #         min = total_time // 60
    #         sec = total_time % 60
    #         print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
    #         # Data to be added to csv file
    #         rows = [[] for _ in range(num_samples)]

    #         die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
    #         design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
    #         percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
    #         total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
    #         max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
                
    #         rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
    #         for j in range(1, len(rows)):
    #             rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
    #         k = 0
    #         for key in input_dict.keys():
    #             rows[k].append(input_dict[key])
    #             rows[k].append(error_list[k] * 100)
    #             rows[k].append(chan_vol[k])
    #             rows[k].append(reg_vol[k])
    #             k += 1
    #         with open(filename, mode='a', newline='') as file:
    #             writer = csv.writer(file)
    #             writer.writerows(rows)

    # filename = 'ten_samples_25_04_17.csv'
    # with open(filename, mode='w', newline='') as file:
    #     writer = csv.writer(file)
    #     writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #     '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]','Channel Volume [mL]', 'Required Volume [mL]'])
    # # 10 samples
    # assay = "ten_samples"
    # num_samples = 10
    # designs = {
        # "design1": {
        #     "input_dict": {
        #         "R1" : 100, 
        #         "R2" : 100,
        #         "R3" : 100,
        #         "R4" : 100,
        #         "R5" : 100,
        #         "R6" : 100,
        #         "R7" : 100,
        #         "R8" : 100,
        #         "R9" : 100,
        #         "R10" : 100
        #     }
        # },
        # "design2": {
        #     "input_dict": {
        #         "R1" : 50, 
        #         "R2" : 100,
        #         "R3" : 100,
        #         "R4" : 100,
        #         "R5" : 100,
        #         "R6" : 100,
        #         "R7" : 100,
        #         "R8" : 100,
        #         "R9" : 100,
        #         "R10" : 100
        #     }
        # },
    #     "design3": {
    #         "input_dict": {
    #             "R1" : random.randint(1, 25), 
    #             "R2" : random.randint(25, 100),
    #             "R3" : random.randint(25, 100),
    #             "R4" : random.randint(25, 100),
    #             "R5" : random.randint(25, 100),
    #             "R6" : random.randint(25, 100),
    #             "R7" : random.randint(100, 250),
    #             "R8" : random.randint(100, 250),
    #             "R9" : random.randint(100, 250),
    #             "R10" : random.randint(100, 250)
    #         }
    #     },
    #     "design4": {
    #         "input_dict": {
    #             "R1" : 5, 
    #             "R2" : random.randint(10, 50),
    #             "R3" : random.randint(50, 100),
    #             "R4" : random.randint(50, 100),
    #             "R5" : random.randint(50, 100),
    #             "R6" : random.randint(50, 100),
    #             "R7" : random.randint(50, 100),
    #             "R8" : random.randint(50, 100),
    #             "R9" : random.randint(200, 250),
    #             "R10" : random.randint(200, 250)
    #         }
    #     }
    # }
    # for key1 in designs:
    #     for key2 in designs[key1]:
    #         input_dict = designs[key1][key2]
    #         # Record start time
    #         start_time = time.time()
    #         # Generate error_list_stored
    #         error_list_stored = store_design(num_samples)
    #         # Run design process
    #         error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
    #         # Record end time
    #         end_time = time.time()
    #         total_time = end_time - start_time
    #         # total_time_opt = opt_time_end
    #         min = total_time // 60
    #         sec = total_time % 60
    #         print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
    #         # Data to be added to csv file
    #         rows = [[] for _ in range(num_samples)]

    #         die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
    #         design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
    #         percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
    #         total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
    #         max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
                
    #         rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
    #         for j in range(1, len(rows)):
    #             rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
    #         k = 0
    #         for key in input_dict.keys():
    #             rows[k].append(input_dict[key])
    #             rows[k].append(error_list[k] * 100)
    #             rows[k].append(chan_vol[k])
    #             rows[k].append(reg_vol[k])
    #             k += 1
    #         with open(filename, mode='a', newline='') as file:
    #             writer = csv.writer(file)
    #             writer.writerows(rows)


    ### RESUME
    filename = 'eleven_samples_25_04_18.csv'
    # with open(filename, mode='w', newline='') as file:
    #     writer = csv.writer(file)
    #     writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #     '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
    # 11 samples
    assay = "eleven_samples"
    num_samples = 11
    designs = {
        # "design1": {
        #     "input_dict": {
        #         "R1" : 100, 
        #         "R2" : 100,
        #         "R3" : 100,
        #         "R4" : 100,
        #         "R5" : 100,
        #         "R6" : 100,
        #         "R7" : 100,
        #         "R8" : 100,
        #         "R9" : 100,
        #         "R10" : 100,
        #         "R11" : 100
        #     }
        # },
        # "design2": {
        #     "input_dict": {
        #         "R1" : 50, 
        #         "R2" : 100,
        #         "R3" : 100,
        #         "R4" : 100,
        #         "R5" : 100,
        #         "R6" : 100,
        #         "R7" : 100,
        #         "R8" : 100,
        #         "R9" : 100,
        #         "R10" : 100,
        #         "R11" : 100
        #     }
        # },
        "design3": {
            "input_dict": {
                "R1" : random.randint(1, 25), 
                "R2" : random.randint(25, 100),
                "R3" : random.randint(25, 100),
                "R4" : random.randint(25, 100),
                "R5" : random.randint(25, 100),
                "R6" : random.randint(25, 100),
                "R7" : random.randint(100, 250),
                "R8" : random.randint(100, 250),
                "R9" : random.randint(100, 250),
                "R10" : random.randint(100, 250),
                "R11" : random.randint(100, 250)
            }
        },
        "design4": {
            "input_dict": {
                "R1" : 5, 
                "R2" : random.randint(10, 50),
                "R3" : random.randint(50, 100),
                "R4" : random.randint(50, 100),
                "R5" : random.randint(50, 100),
                "R6" : random.randint(50, 100),
                "R7" : random.randint(50, 100),
                "R8" : random.randint(50, 100),
                "R9" : random.randint(200, 250),
                "R10" : random.randint(200, 250),
                "R11" : random.randint(200, 250)
            }
        }
    }
    for key1 in designs:
        for key2 in designs[key1]:
            input_dict = designs[key1][key2]
            # Record start time
            start_time = time.time()
            # Generate error_list_stored
            error_list_stored = store_design(num_samples)
            # Run design process
            error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
            # Record end time
            end_time = time.time()
            total_time = end_time - start_time
            # total_time_opt = opt_time_end
            min = total_time // 60
            sec = total_time % 60
            print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
            # Data to be added to csv file
            rows = [[] for _ in range(num_samples)]

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
                rows[k].append(input_dict[key])
                rows[k].append(error_list[k] * 100)
                rows[k].append(chan_vol[k])
                rows[k].append(reg_vol[k])
                k += 1
            with open(filename, mode='a', newline='') as file:
                writer = csv.writer(file)
                writer.writerows(rows)
    
    # filename = 'twelve_samples_25_04_10.csv'
    # with open(filename, mode='w', newline='') as file:
    #     writer = csv.writer(file)
    #     writer.writerow(['Name', 'Number of Samples', 'Runtime [s]', 'Time to Best Design [s]', 'Die Area', 'Design Area',
    #     '% Area Utilization', 'Maximum X Coordinate', 'Total Wire Length', 'Max Wire Length', 'Max Wire Location', 'Mean Wire Length', 'Median Wire Length', 'Concentrations', 'Concentration Error [%]', 'Channel Volume [mL]', 'Required Volume [mL]'])
    # # 12 samples
    # assay = "twelve_samples"
    # num_samples = 12
    # designs = {
    #     "design1": {
    #         "input_dict": {
    #             "R1" : 100, 
    #             "R2" : 100,
    #             "R3" : 100,
    #             "R4" : 100,
    #             "R5" : 100,
    #             "R6" : 100,
    #             "R7" : 100,
    #             "R8" : 100,
    #             "R9" : 100,
    #             "R10" : 100,
    #             "R11" : 100,
    #             "R12" : 100
    #         }
    #     },
    #     "design2": {
    #         "input_dict": {
    #             "R1" : 50, 
    #             "R2" : 100,
    #             "R3" : 100,
    #             "R4" : 100,
    #             "R5" : 100,
    #             "R6" : 100,
    #             "R7" : 100,
    #             "R8" : 100,
    #             "R9" : 100,
    #             "R10" : 100,
    #             "R11" : 100,
    #             "R12" : 100
    #         }
    #     },
    #     "design3": {
    #         "input_dict": {
    #             "R1" : random.randint(1, 25), 
    #             "R2" : random.randint(25, 100),
    #             "R3" : random.randint(25, 100),
    #             "R4" : random.randint(25, 100),
    #             "R5" : random.randint(25, 100),
    #             "R6" : random.randint(25, 100),
    #             "R7" : random.randint(100, 250),
    #             "R8" : random.randint(100, 250),
    #             "R9" : random.randint(100, 250),
    #             "R10" : random.randint(100, 250),
    #             "R11" : random.randint(100, 250),
    #             "R12" : random.randint(100, 250)
    #         }
    #     },
    #     "design4": {
    #         "input_dict": {
    #             "R1" : 5, 
    #             "R2" : random.randint(10, 50),
    #             "R3" : random.randint(50, 100),
    #             "R4" : random.randint(50, 100),
    #             "R5" : random.randint(50, 100),
    #             "R6" : random.randint(50, 100),
    #             "R7" : random.randint(50, 100),
    #             "R8" : random.randint(50, 100),
    #             "R9" : random.randint(200, 250),
    #             "R10" : random.randint(200, 250),
    #             "R11" : random.randint(200, 250),
    #             "R12" : random.randint(200, 250)
    #         }
    #     }
    # }
    # for key1 in designs:
    #     for key2 in designs[key1]:
    #         input_dict = designs[key1][key2]
            # # Record start time
            # start_time = time.time()
            # # Generate error_list_stored
            # error_list_stored = store_design(num_samples)
            # # Run design process
            # error_list, total_time_opt, max_x, chan_vol, reg_vol = main(assay, platform, num_samples, input_dict, error_condition, start_time, error_list_stored)
            # # Record end time
            # end_time = time.time()
            # total_time = end_time - start_time
            # # total_time_opt = opt_time_end
            # min = total_time // 60
            # sec = total_time % 60
            # print(f"Your design was generated in {min} min and {round(sec, 4)} s.\n")
            # # Data to be added to csv file
            # rows = [[] for _ in range(num_samples)]

            # die_area = grab_info("flow/platforms/h.r.3.3/config.mk", "CORE_AREA", "=", -1) 
            # design_area = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 2) 
            # percent_utilization = grab_info(f"flow/logs/{assay}/base/4_report.log", "Design area", " ", 4) 
            # total_wire_length = grab_info(f"flow/logs/{assay}/base/3_2_TritonRoute.log", "Total wire length", "=", -1) 
            # max_wire_length, wire_connect, mean_wire_length, median_wire_length = max_mean_med(f"flow/results/{assay}/base/{assay}_length.csv", "{", ":", "}", ",", -1, 0, 0, 1)
                
            # rows[0] = [assay, num_samples, total_time, total_time_opt, die_area, design_area, percent_utilization, max_x, total_wire_length, max_wire_length, wire_connect, mean_wire_length, median_wire_length]
            # for j in range(1, len(rows)):
            #     rows[j] = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
            # k = 0
            # for key in input_dict.keys():
            #     rows[k].append(input_dict[key])
            #     rows[k].append(error_list[k] * 100)
            #     rows[k].append(chan_vol[k])
            #     rows[k].append(reg_vol[k])
            #     k += 1
            # with open(filename, mode='a', newline='') as file:
            #     writer = csv.writer(file)
            #     writer.writerows(rows)
    