export DESIGN_NAME     	= kinase_activity_2

export VERILOG_FILES 	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/flattened.v ./designs/src/$(DESIGN_NICKNAME)/kinase_activity.v ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/pad_wrapper.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc
export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/pins.tcl
export FOOTPRINT_TCL = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/pads.tcl
export MACRO_PLACE_TCL = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/macro.tcl
export DIE_AREA    	 	= 0 0 2560 1600
export CORE_AREA   	 	= 320 40 2220 1560
