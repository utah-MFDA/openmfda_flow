export DESIGN_NAME     	= ChIP4
export VERILOG_FILES 	= ./designs/src/$(DESIGN_NAME)/ChIP4.v ./designs/src/$(DESIGN_NAME)/ChIP.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc
export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/io_constraints.tcl
export SIMULATION_CONFIG      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/simulation.config
