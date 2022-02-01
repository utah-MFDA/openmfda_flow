export DESIGN_NAME = test
export PLATFORM    = mfda

export VERILOG_FILES = ./designs/src/$(DESIGN_NICKNAME)/test.v
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc
export ABC_AREA      = 1

# Adders degrade GCD
export ADDER_MAP_FILE :=

# These values must be multiples of placement site
export DIE_AREA    = 0 0 2520 1536
export CORE_AREA   = 48 48 2472 1488

# IR drop estimation supply net name to be analyzed and supply voltage variable
# For multiple nets: PWR_NETS_VOLTAGES  = "VDD1 1.8 VDD2 1.2"
# export PWR_NETS_VOLTAGES  = "VDD 1.8"
# export GND_NETS_VOLTAGES  = "VSS 0.0"
