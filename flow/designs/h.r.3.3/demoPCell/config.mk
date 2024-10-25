export DESIGN_NAME     	= demoPCell
export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/demoPCell.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc
export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/io_constraints.tcl
export SIMULATION_CONFIG= ./designs/$(PLATFORM)/$(DESIGN_NAME)/simulation.config
SCAD_ARGS += --dimm_file "$(DIMM_FILE)" 
export XYCE_WL_GRAPH = ./$(RESULTS_DIR)/$(DESIGN_NAME)_route_nets.json
