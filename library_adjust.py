import subprocess, os, glob, math, re

# # platform/printer name
# while True:
#     try:
#         platform_name = str((input("New platform name: ")))
#         break 
#     except ValueError:
#         print("Error: Please enter valid platform name.")
platform_name = "e.c.l"
# platform_name = "test.1.1"
# design name
design_name = "test_ecl"
# design_name = f"test_{platform_name}"

# # keep platform?
# while True:
#     keep_plat = str((input("Keep platform following design creation? [y/n]: "))).lower().strip()
#     if keep_plat in ['y', 'n']:
#        break 
#     else:
#         print(f"Error: Please enter y or n.")
# # keep_plat = "y"

# # pixel value, mm/px
# while True:
#     try:  
#         px_val = float(input("xy resolution or px size (mm): "))
#         break
#     except ValueError:
#         print("Error: Please enter a valid px size.")
px_val = 22e-3
# px_val = 10e-3

# # layer height 
# while True:
#     try:  
#         layer = float(input("Layer height (mm): "))
#         break
#     except ValueError:
#         print("Error: Please enter a valid layer height.")
layer = 10e-3

# # channel cross-section in mm
# while True:
#     try:  
#         chan_w_mm = float(input("Desired channel width (mm): "))
#         break
#     except ValueError:
#         print("Error: Please enter a valid channel width.")
chan_w_mm = 200e-3
# chan_w_mm = 100e-3
# while True:
#     try:  
#         chan_h_mm = float(input("Desired channel height (mm): "))
#         break
#     except ValueError:
#         print("Error: Please enter a valid channel height.")
chan_h_mm = 200e-3
# chan_h_mm = 100e-3

# channel cross-section in px 
chan_w = int(chan_w_mm / px_val)
chan_h = int(chan_h_mm / layer)
# chan_w = 14
# chan_h = 10

# layer per via
lpv = chan_h * 2 
# lpv = chan_h 

# # xbulk_val in mm
# while True:
#     try:  
#         xbulk_val_mm = int(input("Print size in x (mm): "))
#         break
#     except ValueError:
#         print("Error: Please enter a valid print size dimension in x.")
xbulk_val_mm = 75

# # ybulk_val in mm
# while True:
#     try:  
#         ybulk_val_mm = int(input("Print size in y (mm): "))
#         break
#     except ValueError:
#         print("Error: Please enter a valid print size dimension in y.")
ybulk_val_mm = 25

# # zbulk_val in mm - divide by px_val or layer
# while True:
#     try:  
#         zbulk_val_mm = int(input("Print size in z (mm): "))
#         break
#     except ValueError:
#         print("Error: Please enter a valid print size dimension in z.")
zbulk_val_mm = 15

# xbulk_val in px
xbulk_val = int(xbulk_val_mm / px_val)

# ybulk_val in px
ybulk_val = int(ybulk_val_mm / px_val)

# zbulk_val in px - divide by layer height
zbulk_val = int(zbulk_val_mm / layer)


# Function for replacing component information in specified file(s)
def edit_file(filename, parameter, new_value, sub_num):
    # regex string assignment based on file type/needs
    if sub_num == 0:
        sub_str = rf"({parameter})+\s*=\s*\d+(\.\d+)?"
    elif sub_num == 1:
        sub_str = rf"({parameter})+\s*=[\s*0]*\s*\d+(\.\d+)?\s*\d+(\.\d+)?"
    elif sub_num == 2:
        sub_str = rf"({parameter})\s*\d+(\.\d+)?\s*\d+(\.\d+)?\s*\d+(\.\d+)?"
    elif sub_num == 3:
        sub_str = rf"({parameter})\s*\d+(\.\d+)?"
    elif sub_num == 4:
        sub_str = rf"({parameter})+\s*=\s*[a-z].*"
    elif sub_num == 5:
        sub_str = rf"({parameter})\s*[a-z]*+_+[a-z]*"
    elif sub_num == 6:
        sub_str = rf"({parameter})+\s*=\s*\"[a-z].*"
    else:
        sub_str = rf"({parameter})+\s*=\s*.?(\/[a-z]*)*\$\(DESIGN_NAME\)\/[a-z]*_[a-z]*.v"
        
    # regex string
    re_str = re.compile(sub_str)

    # find parameter of interest in file and replace with new value
    ifile = open(filename, 'r').read()
    result = re_str.findall(ifile)
    ifile = re_str.sub(f"{parameter} {new_value}", ifile)
    with open(filename, "w") as f:
        f.writelines(ifile)


# CREATE TEMPORARY PLATFORM 
# Copy over temporary platform and rename 
subprocess.run(f"cp -r flow/platforms/e.c.l flow/platforms/{platform_name}", shell=True)
# Edit platform name in config.mk 
edit_file(f"flow/platforms/{platform_name}/config.mk", "PLATFORM_NAME", f"= {platform_name}", 4)
# Rename e.c.l_merged.lef for new platform 
subprocess.run(f"mv flow/platforms/{platform_name}/pdk/Components/e.c.l_merged.lef flow/platforms/{platform_name}/pdk/Components/{platform_name}_merged.lef", shell=True)
# Remove broken lef/e.c.l_merged.lef and add new symbolic link to {platform_name}_merged.lef
subprocess.run(f"rm flow/platforms/{platform_name}/lef/e.c.l_merged.lef", shell=True)
subprocess.run(f"cp flow/platforms/{platform_name}/pdk/Components/{platform_name}_merged.lef flow/platforms/{platform_name}/lef/{platform_name}_merged.lef", shell=True)
# Rename lef/e.c.l.tlef
subprocess.run(f"mv flow/platforms/{platform_name}/lef/e.c.l.tlef flow/platforms/{platform_name}/lef/{platform_name}.tlef", shell=True)
# Rename lib/e.c.l.lib
subprocess.run(f"mv flow/platforms/{platform_name}/lib/e.c.l.lib flow/platforms/{platform_name}/lib/{platform_name}.lib", shell=True)
# Rename KIT_NAME in pdk/Components/Makefile
edit_file(f"flow/platforms/{platform_name}/pdk/Components/Makefile", "KIT_NAME", f"= {platform_name}", 4)
# Rename pdk/scad_lib/e.c.l_merged.scad
subprocess.run(f"mv flow/platforms/{platform_name}/pdk/scad_lib/e.c.l_merged.scad flow/platforms/{platform_name}/pdk/scad_lib/{platform_name}_merged.scad", shell=True)
# Reanme KIT_NAME in pdk/Makefile 
edit_file(f"flow/platforms/{platform_name}/pdk/Makefile", "KIT_NAME", f"= {platform_name}", 4)


# CREATE TEST DESIGN FOR TEMPORARY PLATFORM 
# Make design directory for new platform 
subprocess.run(f"mkdir flow/designs/{platform_name}", shell=True)
# Copy test design to new platform and rename
subprocess.run(f"cp -r flow/designs/e.c.l/test_ecl flow/designs/{platform_name}/test_{platform_name}", shell=True)
# Rename DESIGN_NAME in config.mk
edit_file(f"flow/designs/{platform_name}/test_{platform_name}/config.mk", "DESIGN_NAME", f"= test_{platform_name}", 4)
# Rename VERILOG_FILES in config.mk
edit_file(f"flow/designs/{platform_name}/test_{platform_name}/config.mk", "VERILOG_FILES", f"= ./designs/src/$(DESIGN_NAME)/test_{platform_name}.v", 7)
# Rename current_design in constraint.sdc
edit_file(f"flow/designs/{platform_name}/test_{platform_name}/constraint.sdc", "current_design", f" test_{platform_name}", 5)
# Rename test_{platform_name}.py filename
subprocess.run(f"mv flow/designs/{platform_name}/test_{platform_name}/test_ecl.py flow/designs/{platform_name}/test_{platform_name}/test_{platform_name}.py", shell=True)
# Rename proj.verilog_file
edit_file(f"flow/designs/{platform_name}/test_{platform_name}/test_{platform_name}.py", "proj.verilog_file", f"= \"test_{platform_name}.v\"", 6)
# Rename proj.design_name
edit_file(f"flow/designs/{platform_name}/test_{platform_name}/test_{platform_name}.py", "proj.design_name", f"= \"test_{platform_name}\"", 6)
# Rename proj.platform 
edit_file(f"flow/designs/{platform_name}/test_{platform_name}/test_{platform_name}.py", "proj.platform", f"= \"{platform_name}\"", 6)
# Create design directory in src directory 
subprocess.run(f"mkdir flow/designs/src/test_{platform_name}", shell=True)
# Copy test design Verilog file and rename
subprocess.run(f"cp -r flow/designs/src/test_ecl/test_ecl.v flow/designs/src/test_{platform_name}/test_{platform_name}.v", shell=True)
# Rename module name in design.v file 
edit_file(f"flow/designs/src/test_{platform_name}/test_{platform_name}.v", "module", f"test_{platform_name}", 5)


# MODIFY config.mk WITH NEW PRINTER SPECS
# PX_VAL in platform config.mk 
edit_file(f"flow/platforms/{platform_name}/config.mk", "PX_VAL", f"= {px_val}", 0)
# LAYER_VAL in platform config.mk 
edit_file(f"flow/platforms/{platform_name}/config.mk", " LAYER_VAL", f"= {layer}", 0)
# LPV_VAL in platform config.mk 
edit_file(f"flow/platforms/{platform_name}/config.mk", "LPV_VAL", f"= {lpv}", 0)
# XBULK_VAL in platform conifg.mk 
edit_file(f"flow/platforms/{platform_name}/config.mk", "XBULK_VAL", f"= {xbulk_val}", 0)
# YBULK_VAL in platform config.mk 
edit_file(f"flow/platforms/{platform_name}/config.mk", "YBULK_VAL", f"= {ybulk_val}", 0)
# ZBULK_VAL in platform config.mk 
edit_file(f"flow/platforms/{platform_name}/config.mk", "ZBULK_VAL", f"= {zbulk_val}", 0)
# DIE_AREA in platform config.mk 
edit_file(f"flow/platforms/{platform_name}/config.mk", "DIE_AREA", f"= 0 0 {xbulk_val} {ybulk_val}", 1)
# CORE_AREA in platform config.mk 
edit_file(f"flow/platforms/{platform_name}/config.mk", "CORE_AREA", f"= 0 0 {xbulk_val} {ybulk_val}", 1)
# --io_size in platform config.mk 
edit_file(f"flow/platforms/{platform_name}/config.mk", "--io_size", f"{chan_w} {chan_w}", 2)
# --routing_size in platform config.mk 
edit_file(f"flow/platforms/{platform_name}/config.mk", "--routing_size", f"{chan_w} {chan_w} {chan_h}", 2)


# MODIFY scad_header.scad
# px
edit_file(f"flow/platforms/{platform_name}/pdk/py_scripts/scad_header.scad", "px", f"= {px_val}", 0)
# layer
edit_file(f"flow/platforms/{platform_name}/pdk/py_scripts/scad_header.scad", "layer", f"= {layer}", 0)
# lpv
edit_file(f"flow/platforms/{platform_name}/pdk/py_scripts/scad_header.scad", "lpv", f"= {lpv}", 0)


# MODIFY INDIVIDUAL SCAD FILES 
# all scad files 
files = glob.glob(f"flow/platforms/{platform_name}/pdk/Components/*/*/*.scad", recursive=True)

for file in files:
    # px
    edit_file(file, "px", f"= {px_val}", 0)
    # layer
    edit_file(file, "layer", f"= {layer}", 0)
    # chan_h 
    edit_file(file, "hchan", f"= {chan_h}", 0)
    edit_file(file, "chan_h", f"= {chan_h}", 0)
    # chan_w 
    edit_file(file, "Wchan", f"= {chan_w}", 0)
    edit_file(file, "chan_w", f"= {chan_w}", 0)
    # lpv 
    edit_file(file, "lpv", f"= {lpv}", 0)
    # dwn_chan_h
    edit_file(file, "dwn_chan_h", f"= {chan_h}", 0)
    # dwn_chan_w
    edit_file(file, "dwn_chan_w", f"= {chan_w}", 0)
    # port_chan_h
    edit_file(file, "port_chan_h", f"= {chan_h}", 0)
    # port_chan_w
    edit_file(file, "port_chan_w", f"= {chan_w}", 0)

# lef() module and unconnected geometry 


# MODIFY lef_scad_config.scad
# lpv 
edit_file(f"flow/platforms/{platform_name}/pdk/scad_include/lef_scad_config.scad", '"lpv",', lpv, 3)
# px 
edit_file(f"flow/platforms/{platform_name}/pdk/scad_include/lef_scad_config.scad", '"px",', px_val, 3)
# layer 
edit_file(f"flow/platforms/{platform_name}/pdk/scad_include/lef_scad_config.scad", '"layer",', layer, 3)
# via_w 
edit_file(f"flow/platforms/{platform_name}/pdk/scad_include/lef_scad_config.scad", '"via_w",', chan_w, 3)


# MODIFY LEF FILES
# make scad_2_lef in pdk/Components 
subprocess.run(f"cd flow/platforms/{platform_name}/pdk/Components && make scad_2_lef", shell=True)
# make build_lef in pdk/Components 
subprocess.run(f"cd flow/platforms/{platform_name}/pdk/Components && make build_lef", shell=True)
# make build_scad in pdk/Components 
subprocess.run(f"cd flow/platforms/{platform_name}/pdk/Components && make build_scad", shell=True)
# make build_scad in pdk 
subprocess.run(f"cd flow/platforms/{platform_name}/pdk && make build_scad", shell=True)

# MODIFY INDIVIDUAL VA FILES 
# all .va files 
files = glob.glob(f"flow/platforms/{platform_name}/pdk/Components/*/*/*.va", recursive=True)

for file in files:
    # px 
    edit_file(file, "pixel_size", f"= {px_val*10**3}", 0)
    # layer
    edit_file(file, "layer_height", f"= {layer*10**3}", 0)
    # chan_h 
    edit_file(file, "ch_height_layers", f"= {chan_h}", 0)
    # chan_w
    edit_file(file, "ch_width_pixels", f"= {chan_w}", 0)
    # lpv 
    edit_file(file, "lpv", f"= {lpv}", 0)
    if "diffmix_25px_" in file:
        # ADJUSTED L1-L3 VALUES BASED ON PIXEL SIZE - 0
        edit_file(file, "LENGTH1", f"= {round(0.19 * px_val / (7.6e-3), 3)}", 0)
        edit_file(file, "LENGTH2", f"= {round(0.269 * px_val / (7.6e-3), 3)}", 0)  
        edit_file(file, "LENGTH3", f"= {round(0.19 * px_val / (7.6e-3), 3)}", 0)   


# RUN MAKE BUILD_VA
# make build_va in pdk/Components 
subprocess.run(f"cd flow/platforms/{platform_name}/pdk/Components && make build_va", shell=True)
# make build_va in pdk/Components 
subprocess.run(f"cd flow/platforms/{platform_name}/pdk/Components && make build_va", shell=True)


# # DESIGN
# # update io_constraints_all.tcl file with proper port locations based on chip dimensions 
# # calculate port locations 
# center_x = xbulk_val / 2
# center_y = ybulk_val / 2
# x_coord_ls = []
# for i in range(8):
#     if i == 0:
#         val = center_x - 315
#     else:
#         val = x_coord_ls[-1] + 90
#     x_coord_ls.append(val)
# y_coord_ls = []
# for i in range(4):
#     if i == 0:
#         val = center_y - 135
#     else:
#         val = y_coord_ls[-1] + 90
#     y_coord_ls.append(val)

# # Create io_constraints_all.tcl file for design chip area 
# directory = f'flow/designs/{platform_name}/{design_name}'
# filename = f'io_constraints_all.tcl'
# filepath = os.path.join(directory, filename)
# os.makedirs(directory, exist_ok=True)
# with open(filepath, 'w') as f:
#     f.write(f"""# FUNCTIONALITY
# # set_io_pin_constraint   -direction <direction>      \\
# #                         -pin_names <names>          \\
# #                         -region <edge:interval>     \

# #
# # place_pin   -pin_name <pin_name>        \\
# #             -layer <layer>              \\
# #             -location <{{x y}}>           \\
# #             -pin_size <{{width height}}>

# # center x {center_x} y {center_y}

# place_pin -pin_name solna -layer met9 -location {{{x_coord_ls[0]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# #place_pin -pin_name soln2 -layer met9 -location {{{x_coord_ls[1]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# place_pin -pin_name solnb -layer met9 -location {{{x_coord_ls[2]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_14 -layer met9 -location {{{x_coord_ls[3]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# place_pin -pin_name solnc -layer met9 -location {{{x_coord_ls[4]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_16 -layer met9 -location {{{x_coord_ls[5]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# place_pin -pin_name solnd -layer met9 -location {{{x_coord_ls[6]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_18 -layer met9 -location {{{x_coord_ls[7]} {y_coord_ls[3]}}} -pin_size {{1 1}}

# #place_pin -pin_name soln2 -layer met9 -location {{{x_coord_ls[0]} {y_coord_ls[2]}}} -pin_size {{1 1}}
# place_pin -pin_name solne -layer met9 -location {{{x_coord_ls[1]} {y_coord_ls[2]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_23 -layer met9 -location {{{x_coord_ls[2]} {y_coord_ls[2]}}} -pin_size {{1 1}}
# place_pin -pin_name solnf -layer met9 -location {{{x_coord_ls[3]} {y_coord_ls[2]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_25 -layer met9 -location {{{x_coord_ls[4]} {y_coord_ls[2]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_26 -layer met9 -location {{{x_coord_ls[5]} {y_coord_ls[2]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_27 -layer met9 -location {{{x_coord_ls[6]} {y_coord_ls[2]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_28 -layer met9 -location {{{x_coord_ls[7]} {y_coord_ls[2]}}} -pin_size {{1 1}}

# #place_pin -pin_name soln3 -layer met9 -location {{{x_coord_ls[0]} {y_coord_ls[1]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_32 -layer met9 -location {{{x_coord_ls[1]} {y_coord_ls[1]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_33 -layer met9 -location {{{x_coord_ls[2]} {y_coord_ls[1]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_34 -layer met9 -location {{{x_coord_ls[3]} {y_coord_ls[1]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_35 -layer met9 -location {{{x_coord_ls[4]} {y_coord_ls[1]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_36 -layer met9 -location {{{x_coord_ls[5]} {y_coord_ls[1]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_37 -layer met9 -location {{{x_coord_ls[6]} {y_coord_ls[1]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_38 -layer met9 -location {{{x_coord_ls[7]} {y_coord_ls[1]}}} -pin_size {{1 1}}

# #place_pin -pin_name out -layer met9 -location {{{x_coord_ls[0]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_42 -layer met9 -location {{{x_coord_ls[1]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_43 -layer met9 -location {{{x_coord_ls[2]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_44 -layer met9 -location {{{x_coord_ls[3]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_45 -layer met9 -location {{{x_coord_ls[4]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_46 -layer met9 -location {{{x_coord_ls[5]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# #place_pin -pin_name pin_47 -layer met9 -location {{{x_coord_ls[6]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# place_pin -pin_name out -layer met9 -location {{{x_coord_ls[7]} {y_coord_ls[0]}}} -pin_size {{1 1}}
#     """)

# # edit io_constraints.tcl for test design
# directory = f'flow/designs/{platform_name}/{design_name}'
# filename = f'io_constraints.tcl'
# filepath = os.path.join(directory, filename)
# os.makedirs(directory, exist_ok=True)
# with open(filepath, 'w') as f:
#     f.write(f"""# FUNCTIONALITY
# # set_io_pin_constraint   -direction <direction>      \\
# #                         -pin_names <names>          \\
# #                         -region <edge:interval>     \

# #
# # place_pin   -pin_name <pin_name>        \\
# #             -layer <layer>              \\
# #             -location <{{x y}}>           \\
# #             -pin_size <{{width height}}>

# # center x {center_x} y {center_y}

# place_pin -pin_name soln1 -layer met9 -location {{{x_coord_ls[0]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# place_pin -pin_name soln2 -layer met9 -location {{{x_coord_ls[1]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# place_pin -pin_name soln3 -layer met9 -location {{{x_coord_ls[2]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# place_pin -pin_name in_air1 -layer met9 -location {{{x_coord_ls[3]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# place_pin -pin_name in_air2 -layer met9 -location {{{x_coord_ls[4]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# place_pin -pin_name in_air3 -layer met9 -location {{{x_coord_ls[5]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# place_pin -pin_name in_air4 -layer met9 -location {{{x_coord_ls[6]} {y_coord_ls[3]}}} -pin_size {{1 1}}
# place_pin -pin_name in_air5 -layer met9 -location {{{x_coord_ls[7]} {y_coord_ls[3]}}} -pin_size {{1 1}}

# place_pin -pin_name in_air6 -layer met9 -location {{{x_coord_ls[0]} {y_coord_ls[2]}}} -pin_size {{1 1}}
# place_pin -pin_name pn_i1 -layer met9 -location {{{x_coord_ls[1]} {y_coord_ls[2]}}} -pin_size {{1 1}}

# place_pin -pin_name pn_i2 -layer met9 -location {{{x_coord_ls[6]} {y_coord_ls[1]}}} -pin_size {{1 1}}
# place_pin -pin_name pn_o1 -layer met9 -location {{{x_coord_ls[7]} {y_coord_ls[1]}}} -pin_size {{1 1}}

# place_pin -pin_name pn_o2 -layer met9 -location {{{x_coord_ls[0]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# place_pin -pin_name out_air1 -layer met9 -location {{{x_coord_ls[1]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# place_pin -pin_name out_air2 -layer met9 -location {{{x_coord_ls[2]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# place_pin -pin_name out_air3 -layer met9 -location {{{x_coord_ls[3]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# place_pin -pin_name out_air4 -layer met9 -location {{{x_coord_ls[4]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# place_pin -pin_name out_air5 -layer met9 -location {{{x_coord_ls[5]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# place_pin -pin_name out_air6 -layer met9 -location {{{x_coord_ls[6]} {y_coord_ls[0]}}} -pin_size {{1 1}}
# place_pin -pin_name out -layer met9 -location {{{x_coord_ls[7]} {y_coord_ls[0]}}} -pin_size {{1 1}}
#     """)

# # run test_ecl.py design 
# subprocess.run(["python3", f"flow/designs/{platform_name}/{design_name}/{design_name}.py"])

# # remove temporary platform when finished, if desired
# if keep_plat == "n":
#     subprocess.run(f"rm -rf flow/platforms/{platform_name}", shell=True)