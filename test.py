import json, os


device_name = "multiplex_test"
platform= "h.r.3.3x2"

with open('multiplex_design_automation/multiplex.json', 'r') as file:
    design = json.load(file)

num_assays = len(design.keys())
assay_ls = list(design.keys())

# print("design: ", design)
# print("assay_ls: ", assay_ls)
# print("input_dict", design[assay_ls[0]]["num_samples"])

# Function to create io_constraints.tcl
def io_file(device_name, platform, design, assay_ls, num_assays):
    pin_str = ""
    f1_i = 960
    f2_i = 660
    f1_o = 960
    f2_o = 930
    k = 1
    for i in range(num_assays):   
        # logic to account for all assays drawing from single sample solution line
        if i == 0:
            soln_num = design[assay_ls[i]]["num_samples"]
        else:
            soln_num = design[assay_ls[i]]["num_samples"] - 1
        for j in range(soln_num):
            pin_str += f"place_pin -pin_name soln{k} -layer met9 -location" + " { " + str(f1_i) + " " + str(f2_i) +" } -pin_size {1 1}" + f"\n"
            f1_i += 90
            f2_i += 90
            k += 1
            if j == soln_num-1:
                f1_i -= j*90
                f2_i = 660
        pin_str += f"place_pin -pin_name out{i+1} -layer met9 -location" + " { " + str(f1_o) + " " + str(f2_o) +" } -pin_size {1 1}" + f"\n\n"
        f1_o += 90
    directory = f'flow/designs/{platform}/{device_name}'
    ###
    filename = 'io_constraints_test.tcl'
    filepath = os.path.join(directory, filename)
    os.makedirs(directory, exist_ok=True)
    with open(filepath, 'w') as file:
        file.write(f"{pin_str}")

io_file(device_name, platform, design, assay_ls, num_assays)

# # Function to create io_constraints.tcl
# def io_file(assay, platform, num_samples):
#     # str for keeping track of selected pin locations
#     pin_select = []
#     # all pin possibilities 
#     pin_dict = {"1": "{960 930}", "2": "{1050 930}", "3": "{1140 930}", "4": "{1230 930}", "5": "{1320 930}", "6": "{1410 930}", "7": "{1500 930}", "8": "{1590 930}",
#     "9": "{960 840}", "10": "{1050 840}", "11": "{1140 840}", "12": "{1230 840}", "13": "{1320 840}", "14": "{1410 840}", "15": "{1500 840}", "16": "{1590 840}",
#     "17": "{960 750}", "18": "{1050 750}", "19": "{1140 750}", "20": "{1230 750}", "21": "{1320 750}", "22": "{1410 750}", "23": "{1500 750}", "24": "{1590 750}",
#     "25": "{960 660}", "26": "{1050 660}", "27": "{1140 660}", "28": "{1230 660}", "29": "{1320 660}", "30": "{1410 660}", "31": "{1500 660}", "32": "{1590 660}"}
#     pin_str = ""
#     for i in range(num_samples):
#         pin_loc = random.choice(list(pin_dict.items()))
#         pin_select.append(pin_loc[1])
#         pin_str += f"place_pin -pin_name soln{i+1} -layer met9 -location " + pin_loc[1] + " -pin_size {1 1}" + f"\n"
#         del pin_dict[pin_loc[0]]
#     pin_loc = random.choice(list(pin_dict.items()))[1]
#     pin_select.append(pin_loc)
#     pin_str += "place_pin -pin_name out -layer met9 -location " + pin_loc + " -pin_size {1 1}"
#     directory = f'flow/designs/{platform}/{assay}'
#     filename = 'io_constraints.tcl'
#     filepath = os.path.join(directory, filename)
#     os.makedirs(directory, exist_ok=True)
#     with open(filepath, 'w') as file:
#         file.write(f"{pin_str}")
#     return pin_select
    

    