
DISTRIB_V = 0.0.2

export DESIGN_NAME      = reservoir_demo
export PLATFORM         = h.r.3.3

export VERILOG_FILES    = ./designs/src/$(DESIGN_NICKNAME)/$(DESIGN_NAME).v
export SDC_FILE         = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# export DIE_AREA                 = 0 0 2550 1590
# export CORE_AREA                = 0 0 2550 1590

export IO_CONSTRAINTS   = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl

export TECH_LEF = ./platforms/$(PLATFORM)/lef/$(PLATFORM)_$(DISTRIB_V).tlef
export SC_LEF =  ./platforms/$(PLATFORM)/lef/$(PLATFORM)_merged_$(DISTRIB_V).lef

export SIMULATION_CONFIG = ./designs/$(PLATFORM)/$(DESIGN)/simulation.config

SCAD_LIB = $(PLATFORM_DIR)/pdk/scad_lib

SCAD_COMPONENT_LIBRARY = $(SCAD_LIB)/h.r.3.3_merged.scad

SCAD_INCLUDE_FILES = $(SCAD_LIB)/polychannel_v2.scad $(SCAD_LIB)/lef_helper.scad $(SCAD_LIB)/lef_scad_config.scad
