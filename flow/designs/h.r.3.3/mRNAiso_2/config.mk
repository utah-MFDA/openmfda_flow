export DESIGN_NAME     	= mRNAiso_2

export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/mRNAiso_2.v ./designs/src/$(DESIGN_NICKNAME)/mRNAiso.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export DIE_AREA    	 	= 0 0 2550 1590
export CORE_AREA   	 	= 0 0 2550 1590

export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl
