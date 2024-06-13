export DESIGN_NAME     	= demo

export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/demo.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export DIE_AREA    	 	= 0 0 2400 1440
export CORE_AREA   	 	= 0 0 2400 1440

export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl
export SIMULATION_CONFIG = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/simulation.config
