export DESIGN_NAME     	= smart_toilet
export PLATFORM    		= mfda

export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/smart_toilet.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export DIE_AREA    	 	= 0 0 2550 1600
export CORE_AREA   	 	= 0 0 2550 1600

export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl