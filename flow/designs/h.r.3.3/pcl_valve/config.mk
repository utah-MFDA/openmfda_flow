
DISTRIB_V = 0.0.2

export DESIGN_NAME      = pcl_valve
export PLATFORM         = h.r.3.3

export VERILOG_FILES    = ./designs/src/$(DESIGN_NICKNAME)/$(DESIGN_NAME).v
export SDC_FILE         = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export IO_CONSTRAINTS   = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl

export TECH_LEF = ./platforms/$(PLATFORM)/lef/$(PLATFORM)_$(DISTRIB_V).tlef
export SC_LEF =  ./platforms/$(PLATFORM)/lef/$(PLATFORM)_merged_$(DISTRIB_V).lef


export SIMULATION_CONFIG = ./designs/$(PLATFORM)/$(DESIGN)/simulation.config

SCAD_COMPONENT_LIBRARY = $(SCAD_LIB)/h.r.3.3_merged.scad

SCAD_LIB = $(PLATFORM_DIR)/pdk/scad_lib

export PCELL_FROM_PDK = T
include $(FLOW_HOME)/../tools/p_cell_generator/util.mk

.FORCE:
mk_pcell:
	#mkdir -p $(RESULTS_DIR)
	python3 $(P_CELL_SCRIPT) \
			--netlist $(VERILOG_FILES) \
			--orig_lef $(ORIG_LEF) \
			--out_lef $(PCELL_MERGE_LEF) \
			--pcell_lef $(PCELL_LEF) \
			--out_lef_csv $(RESULTS_DIR)/preparse.csv \
			--conversion_file_dir $(RESULTS_DIR)
 
ADDITIONAL_LEFS += $(PCELL_MERGE_LEF)

#SCAD_INCLUDE_FILES = $(SCAD_LIB)/polychannel_v2.scad $(SCAD_LIB)/lef_helper.scad $(SCAD_LIB)/lef_scad_config.scad
