export DESIGN_NAME     	= route_test
export PLATFORM    		= mfda

export VERILOG_FILES 	= ./designs/src/$(DESIGN_NICKNAME)/route_test.v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export DIE_AREA    	 	= 325 325 2225 1275
export CORE_AREA   	 	= 325 325 2225 1275

export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl