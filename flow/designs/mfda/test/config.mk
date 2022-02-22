export DESIGN_NAME = test
export PLATFORM    = mfda

export VERILOG_FILES = ./designs/src/$(DESIGN_NICKNAME)/test.v
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export DIE_AREA    = 0 0 102.4 64
export CORE_AREA   = 1.024 1 101.376 63

export IO_CONSTRAINTS = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/io_constraints.tcl