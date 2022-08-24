export DESIGN_NAME     	= pcr
export DESIGN_SUB_NAME	= pcr_spread_io
export FLOW_VARIANT		= spread_io
export PLATFORM    		= mfda

export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/pcr.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_SUB_NAME)/constraint.sdc

# export DIE_AREA    	 	= 0 0 2225 1275
# export CORE_AREA   	 	= 325 325 2225 1275

export DIE_AREA    	 	= 0 0 2550 1600
export CORE_AREA   	 	= 0 0 2550 1600

export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_SUB_NAME)/io_constraints.tcl