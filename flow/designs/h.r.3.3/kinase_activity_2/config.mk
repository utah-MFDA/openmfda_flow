export DESIGN_NAME     	= kinase_activity_2

export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/kinase_activity_2.v ./designs/src/$(DESIGN_NICKNAME)/kinase_activity.v ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/pad_wrapper.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc
export FOOTPRINT_TCL = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/pads.tcl
export MACRO_PLACE_TCL = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/macro.tcl
export DIE_AREA    	 	= 0 0 2560 1600
export CORE_AREA   	 	= 0 0 2550 1590
