import sys
import os
import shutil
import subprocess

#sys.path.insert(0,os.path.dirname(os.path.realpath(__file__)))
#from openmfda_class import OpenMFDA
# path for python file


def default_pin_names():
    return [[{'name':f"pin_{i}_{j}", 'layer':'met9'} for i in range(0,8)] for j in range(0,4)]

def generate_config(input_file, design_name, pins=None, platform="mfda_30px", global_place_args={}, 
                    design_dir=False, platform_config=None):
    dir_path = os.path.dirname(
            os.path.normpath(
                os.path.realpath(__file__)+'/../../'))  
    if design_dir:
        input_file = f'{dir_path}/designs/{platform}/{design_name}/'+input_file
    else:
        pass

    print("project_root_dir: "+os.path.dirname(input_file))

    verilog_name = os.path.basename(input_file)
    verilog_filename =   f"{dir_path}/openroad_flow/designs/src/{design_name}/{verilog_name}"
    sdc_filename =       f"{dir_path}/openroad_flow/designs/{platform}/{design_name}/constraint.sdc"
    io_filename =        f"{dir_path}/openroad_flow/designs/{platform}/{design_name}/io_constraints.tcl"
    make_filename =      f"{dir_path}/openroad_flow/designs/{platform}/{design_name}/config.mk"
    scad_make_filename = f"{dir_path}/scad_flow/designs/{platform}/{design_name}/config.mk"
    scad_dimm_filename = f"{dir_path}/scad_flow/designs/{platform}/{design_name}/dimm.csv"

    gp_args_filename =   f"{dir_path}/openroad_flow/designs/{platform}/{design_name}/global_place_args.tcl"

    os.makedirs(f"{dir_path}/openroad_flow/designs/{platform}/{design_name}", exist_ok=True)
    os.makedirs(f"{dir_path}/openroad_flow/designs/{platform}/{design_name}", exist_ok=True)
    os.makedirs(f"{dir_path}/openroad_flow/designs/src/{design_name}", exist_ok=True)
    os.makedirs(f"{dir_path}/scad_flow/designs/{platform}/{design_name}", exist_ok=True)
    print("Copy design netlist")
    shutil.copy(input_file, verilog_filename)
    if pins is None:
        pin_names = default_pin_names()
    print("Writing pin constraints")
    pin_names = [[x['name'] for x in r] for r in pins]
    pin_layers = [[x['layer'] for x in r] for r in pins]
    write_pin_constraints(io_filename, pin_names, pin_layers)
    print("Writing SDC constraints")
    write_sdc_constraints(sdc_filename, top_name=design_name)
    print("Writing global place configuration")
    write_replace_args(gp_args_filename, global_place_args)
    print("Writing makefile configuration")
    if platform_config==None:
        write_make_config(make_filename, verilog_name, design_name, platform=platform)
    elif isinstance(platform_config, dict):
        write_make_config(make_filename, verilog_name, design_name, platform=platform, platform_dict=platform_config)
    #elif isinstance(plaform_config, openmfda_class.OpenMFDA.Platform):
    #    write_make_config(make_filename, verilog_name, design_name, platform=platform, platform_class=platform_config)
    else:
        raise ValueError("platform_config is not a valid input")
    print("Writing SCAD configuration")
    if platform_config==None:
        write_scad_make(scad_make_filename, design_name, platform=platform)
    elif isinstance(platform_config, dict):
        write_scad_make(scad_make_filename, design_name, platform=platform, platform_dict=platform_config)
    #elif isinstance(plaform_config, openmfda_class.OpenMFDA.Platform):
    #    write_scad_make(scad_make_filename, design_name, platform=platform, platform_class=platform_config)
    else:
        raise ValueError("platform_config is not a valid input")
    print("Done")

def run_flow(design_name, platform="mfda_30px", stdout=False, make_arg='all'):
    subprocess.run(["pwd"],
                   stdout=None, stderr=None, check=True)
    if isinstance(make_arg, str):
        make_arg=[make_arg]
    dir_path = os.path.dirname(
        os.path.normpath(os.path.realpath(__file__)+'/../..'))
    for arg in make_arg:
        run_cmd = f"cd {dir_path} && make {arg} -e DESIGN={design_name} -e PLATFORM={platform}"
        print(run_cmd)
        subprocess.run(run_cmd,
                    stdout=None, stderr=None, shell=True, check=True)
    # todo make archive

################ Generate pin constraints ################
def write_pin_constraints(io_filename, pin_names, layer):
    with open(io_filename, "w") as f:
        for j, x in enumerate([960, 1050, 1140, 1230, 1320, 1410, 1500, 1590]):
            for i, y in enumerate([930, 840, 750, 660]):
                if pin_names[i][j]:
                    print(f"place_pin -pin_name {pin_names[i][j]} -layer {layer[i][j]} -location {{ {x} {y} }} -pin_size {{1 1}}", file=f)

################ SDC constraints ################
def write_sdc_constraints(sdc_filename, top_name="top"):
    with open(sdc_filename, "w") as f:
        print("current_design {top_name}", file=f)

################ config.mk ################
def write_make_config(make_filename, verilog_name, design_name, platform="mfda_30px", platform_dict=None, platform_class=None):
    if platform_dict is not None and platform_class is not None:
        raise ValueError("Cannot pass both platform_disc and platform class")
    elif platform_dict is not None:
        die_area = platform_dict['die_area']
        core_area= platform_dict['core_site']
    elif platform_class is not None:
        die_area = platform_class.get_die_area_mk()
        core_area= platform_class.get_die_area_mk()
    else:
        die_area ='0 0 2550 1590'
        core_area='0 0 2550 1590'
    with open(make_filename, "w") as f:
        print(f"""export DESIGN_NAME     	= {design_name}
export PLATFORM    		= {platform}

export VERILOG_FILES 	= ./designs/src/{design_name}/{verilog_name}
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export DIE_AREA    	 	= {die_area}
export CORE_AREA   	 	= {core_area}

export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl""", file=f)

################ SCAD files ################
def write_scad_make(scad_make_filename, design_name, dimm_file=None, platform="mfda_30px", platform_dict=None):
    #if platform_dict is not None and platform_class is not None:
        #raise ValueError("Cannot pass both platform_disc and platform class")
    if platform_dict is not None:
        if 'xbulk' in platform_dict:
            xbulk = platform_dict['xbulk']
            xchip = '0 '+str(platform_dict['xbulk'])
        else:
            xbulk = platform_dict['Die_area'][2]
            xchip = '0 '+str(platform_dict['Die_area'][2])
        if 'ybulk' in platform_dict:
            ybulk = platform_dict['ybulk']
            ychip = '0 '+str(platform_dict['ybulk'])
        else:
            ybulk = platform_dict['Die_area'][3]
            ychip = '0 '+str(platform_dict['Die_area'][3])
        zbulk = platform_dict['zbulk']
        
    #elif platform_class is not None:
        #xbulk = platform_class.get_xbulk()
        #ybulk = platform_class.get_ybulk()
        #zbulk = platform_class.get_zbulk()
        #xchip = platform_class.get_xchip()
        #ychip = platform_class.get_ychip()
    else:
        xbulk = 2550
        ybulk = 1590
        zbulk = 280
        xchip = '0 2550'
        ychip = '0 1590'
    with open(scad_make_filename, "w") as f:
        print(f"""
#------------------------------------------------------------------------------
# DESIGN NAMES
#------------------------------------------------------------------------------
# platform name from OpenROAD flow
export PLATFORM = {platform}
# design name from OpenROAD flow
export DESIGN = {design_name}
# design variant from OpenROAD flow
export DESIGN_VARIANT = base

#------------------------------------------------------------------------------
# DESIGN PARAMETERS
#------------------------------------------------------------------------------s
# Path to the def file form OpenROAD flow
DEF_FILE		= $(OR_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)/4_final.def
RESULT_OUT              = $(SCAD_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)
# mm/px value
PX_VAL 			= 0.0076
# mm/layer value
LAYER_VAL		= 0.01
# layer number for the bottom layer
BOT_LAYER_VAL	= 20
# layers/via value
LPV_VAL			= 20
# bulk x value in pixels
XBULK_VAL		= {xbulk}
# bulk y value in pixels
YBULK_VAL		= {ybulk}
# bulk z value in layers
ZBULK_VAL		= {zbulk}
# chip min and max x values in pixels
XCHIP_VALS		= {xchip}
# chip min and max y values in pixels
YCHIP_VALS		= {ychip}
# scale the .def file uses for dimensions
DEF_SCALE_VAL	= 1000
# PNR pitch of platform
PITCH 			= 30
# render smoothness in scad render
RES_VAL			= 120
# optional - path to route dimensions specifications

# SCAD script arguments
SCAD_ARGS =\\
			--platform "$(PLATFORM)" --design "$(DESIGN)" --def_file "$(DEF_FILE)" --results_dir "$(RESULT_OUT)" 	\\
			--px $(PX_VAL) --layer $(LAYER_VAL) --bottom_layer $(BOT_LAYER_VAL) --lpv $(LPV_VAL) --xbulk $(XBULK_VAL)	\\
			--ybulk $(YBULK_VAL) --zbulk $(ZBULK_VAL) --xchip $(XCHIP_VALS) --ychip $(YCHIP_VALS)			        \\
			--def_scale $(DEF_SCALE_VAL) --pitch $(PITCH) --res $(RES_VAL)""", file=f)
        if dimm_file:
            print(f"DIMM_FILE = {dimm_file}", file=f)
        print(f"""
ifdef DIMM_FILE
SCAD_ARGS +=\
			--dimm_file "$(DIMM_FILE)"
endif""", file=f)
        
def check_replace_args(replace_arg):
    if 'bin' in replace_arg:
        
        replace_arg['bin'] = str(replace_arg['bin'])
    else:
        replace_arg['bin'] = '24'
        
    if 'density' in replace_arg:
        
        replace_arg['density'] = str(replace_arg['density'])
    else:
        replace_arg['density'] = '0.95'

    if 'init_density_coef' in replace_arg:

        replace_arg['init_density_coef'] = str(replace_arg['init_density_coef'])
    else:
        replace_arg['init_density_coef'] = '8e-5'

    if 'init_wire_coef' in replace_arg:
        
        replace_arg['init_wire_coef'] = str(replace_arg['init_wire_coef'])
    else:
        replace_arg['init_wire_coef'] = '0.25'

    if 'max_phi' in replace_arg:
        
        replace_arg['max_phi'] = str(replace_arg['max_phi']) 
    else:
        replace_arg['max_phi'] = '1.04'

    if 'min_phi' in replace_arg:
        
        replace_arg['min_phi'] = str(replace_arg['min_phi'])
    else:
        replace_arg['min_phi'] = '0.95'

    if 'overflow' in replace_arg:
        if float(replace_arg['overflow']) < 0:
            print("WARNING: overflow set below 0! Set overflow = 0.1")
            replace_arg['overflow'] = 0.1

        replace_arg['overflow'] = str(replace_arg['overflow'])
    else:
        replace_arg['overflow'] = '0.1'

    if 'init_place_max_iter' in replace_arg:
        pass
    else:
        replace_arg['init_place_max_iter'] = '20'

    if 'fanout' in replace_arg:
        if int(replace_arg['fanout']) < 1:
            print('WARNING: fanout set below 1! Set fanout = 1')
            replace_arg['fanout'] = 1

        replace_arg['fanout'] = str(replace_arg['fanout'])
    else:
        replace_arg['fanout'] = '20'

    
        

def write_replace_args(replace_args_filename, replace_arg={}):
    if replace_arg == None:
        print("WARNING: replace_arg set to None! Set to empty dictionary")
    
    check_replace_args(replace_arg)
    bs = '/'
    fb = '{'
    bb = '}'
    
    with open(replace_args_filename, "w") as f:        
        print(f"""
# does not work
set skip_initial_placement 0

# does not work
set incremental 0

# Set bin grid's counts. Default: Defined by internal algorithm. [64,128,256,512,..., int]
set bin_grid_count {replace_arg['bin']}

# density is set differently
set density {replace_arg['density']}

# Set initial density penalty. Default: 8e-5 [1e-6 - 1e6, float]
set init_density_penalty {replace_arg['init_density_coef']}

# Set initial wirelength coefficient. Default: 0.25 [unlimited, float]
set init_wirelength_coef {replace_arg['init_wire_coef']}

# Set pcof_min(µ_k Lower Bound). Default: 0.95 [0.95-1.05, float]
set min_phi_coef {replace_arg['min_phi']}

# Set pcof_max(µ_k Upper Bound). Default: 1.05 [1.00-1.20, float]
set max_phi_coef {replace_arg['max_phi']}

# Set target overflow for termination condition. Default: 0.1 [0-1, float]
set overflow {replace_arg['overflow']}

# Set maximum iterations in initial place. Default: 20 [0-, int]
set initial_place_max_iter {replace_arg['init_place_max_iter']}

# Set net escape condition in initial place when 'fanout >= initial_place_max_fanout'. Default: 200 [1-, int]
set initial_place_max_fanout {replace_arg['fanout']}

set global_place_args {fb}{bb}

if {fb}$skip_initial_placement{bb} {fb}
	set global_place_args "$global_place_args -skip_initial_place"
{bb}

if {fb}$incremental{bb} {fb}
	set global_place_args "$global_place_args -incremental"
{bb}




set global_place_args "$global_place_args {bs}
    -bin_grid_count $bin_grid_count {bs}
    -init_density_penalty $init_density_penalty {bs}
    -init_wirelength_coef $init_wirelength_coef {bs}
    -min_phi_coef $min_phi_coef {bs}
    -max_phi_coef $max_phi_coef {bs}
    -overflow $overflow {bs}
    -initial_place_max_iter $initial_place_max_iter {bs}
    -initial_place_max_fanout $initial_place_max_fanout"

puts $global_place_args
 
#set ::env(GLOBAL_PLACEMENT_ARGS)
""", file=f)

        
# ################ dimm csv file ################
# def write_dimm_file(scad_dimm_filename, wires):
#     with open(scad_dimm_filename, "w") as f:
#         for e in graph.edges:
#             print(graph.edges[e]["wire"],",20,20,15", sep="", file=f)
if __name__ == "__main__":
    verilog_file = "demo.v"
    design_name = "demo"
    platform = "mfda_30px"
    pins = [[None for i in range(0,8)] for j in range(0,4)]
    pins[0][1] = "soln1"
    pins[0][2] = "soln2"
    pins[0][3] = "soln3"
    pins[3][6] = "out"
    generate_config(verilog_file, design_name, pin_names=pins, platform=platform)
    run_flow(design_name, platform=platform)