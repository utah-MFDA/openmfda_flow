import json, os


device_name = "multiplex_test"
platform= "h.r.3.3x2"

with open('multiplex_design_automation/multiplex.json', 'r') as file:
    design = json.load(file)

num_assays = len(design.keys())
assay_ls = list(design.keys())


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

# Function to assign samples to solution numbers
def solution_dict(length_dict):
    soln_dict = {}
    i = 1
    for key in length_dict.keys():
        soln_dict[key] = f"soln{i}"
        i += 1
    return soln_dict


# Function to create simulation.config and eval.config
def sim_eval_files(device_name, platform, assay_ls):
    input_str = ""
    chem_str = ""
    eval_str = ""
    for assay in assay_ls:
        soln_dict = solution_dict(design[assay]["length_dict"])
        ratio_dict = solution_dict(design[assay]["ratio_dict"])
        for key in soln_dict.keys():
            input_str += f"input\t{soln_dict[key]}\tpressurePump\tpressure=100k\n"
            chem_str += f"chem\t{key}\t{soln_dict[key]}\t1\n"
            eval_str += f"eval\t{key}\t0\tout\t{round(int(ratio_dict[key])*10**3, 5)}m\n"
    # Create simulation.config
    directory = f'flow/designs/{platform}/{device_name}'
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



conc_ratio(design, assay_ls, num_assays)
print("design", design)
# print("ratio_dict", ratio_dict)
sim_eval_files(device_name, platform, assay_ls)


# soln_dict = solution_dict(length_dict)
# print("soln_dict", soln_dict)


    

    