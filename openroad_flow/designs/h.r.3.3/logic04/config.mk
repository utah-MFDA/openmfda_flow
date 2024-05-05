export DESIGN_NAME     	= logic04
export PLATFORM    		= h.r.3.3

export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/logic04.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export DIE_AREA    	 	= 0 0 2550 1590
export CORE_AREA   	 	= 0 0 2550 1590

export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl
