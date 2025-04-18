DISTRIB_V = 0.0.0

export DESIGN_NAME     	= smart_toilet

export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/smart_toilet.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl

export TECH_LEF = ./platforms/$(PLATFORM)/lef/$(PLATFORM)_$(DISTRIB_V).tlef
export SC_LEF =  ./platforms/$(PLATFORM)/lef/$(PLATFORM)_merged_$(DISTRIB_V).lef

export GLOBAL_PLACEMENT_ARGS_FILE = ./designs/$(PLATFORM)/$(DESIGN)/global_place_args.tcl
#export GLOBAL_PLACEMENT_ARGS_PATH = $(FLOW_HOME)/designs/$(PLATFORM)/$(DESIGN)/global_place_args.tcl

export SIMULATION_CONFIG = ./designs/$(PLATFORM)/$(DESIGN)/simulation.config

SCAD_LIB = $(PLATFORM_DIR)/pdk/scad_lib

SCAD_INCLUDE_FILES = $(SCAD_LIB)/polychannel_v2.scad $(SCAD_LIB)/lef_helper.scad $(SCAD_LIB)/lef_scad_config.scad
