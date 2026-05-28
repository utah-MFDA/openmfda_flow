export DESIGN_NAME     	= demoPCell
export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/demoPCell.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc
export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/io_constraints.tcl
export SIMULATION_CONFIG= ./designs/$(PLATFORM)/$(DESIGN_NAME)/simulation.config
SCAD_ARGS += --dimm_file "$(DIMM_FILE)" 
export XYCE_WL_GRAPH = ./$(RESULTS_DIR)/$(DESIGN_NAME)_route_nets.json

export GLOBAL_PLACEMENT_ARGS = -skip_nesterov_place

export BUILD_PDK_LIBRARY ?= T
include $(FLOW_HOME)/../tools/p_cell_generator/util.mk

gen_pcells: $(PCELL_MERGE_LEF)
