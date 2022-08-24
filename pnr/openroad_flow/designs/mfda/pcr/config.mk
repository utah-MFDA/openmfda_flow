export DESIGN_NAME     	= pcr
export PLATFORM    		= mfda

export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/pcr.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# export DIE_AREA    	 	= 0 0 2225 1275
# export CORE_AREA   	 	= 325 325 2225 1275

export DIE_AREA    	 	= 0 0 2550 1600
export CORE_AREA   	 	= 0 0 2350 1400

export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl