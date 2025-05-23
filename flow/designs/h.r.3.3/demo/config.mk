export DESIGN_NAME     	= demo
export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/demo.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc
export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/io_constraints.tcl
export SIMULATION_CONFIG= ./designs/$(PLATFORM)/$(DESIGN_NAME)/simulation.config

export TECH_LEF = ./designs/src/$(DESIGN_NAME)/h.r.3.3.demo.tlef
SCAD_ARGS += --dimm_file "$(DIMM_FILE)" 
