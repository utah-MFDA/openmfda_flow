export DESIGN_NAME = my_design
export PLATFORM    = sky130hs

export VERILOG_FILES = ./designs/src/$(DESIGN_NICKNAME)/my_design.v
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/my_sdc.sdc
export ABC_AREA      = 1

# Adders degrade GCD
export ADDER_MAP_FILE :=

# These values must be multiples of placement site
# export DIE_AREA    = 0 0 279.96 280.128
# export CORE_AREA   = 9.996 10.08 269.964 270.048
export DIE_AREA    = 0 0 96 96.57
export CORE_AREA   = 9.120 9.990 86.88 86.58

# IR drop estimation supply net name to be analyzed and supply voltage variable
# For multiple nets: PWR_NETS_VOLTAGES  = "VDD1 1.8 VDD2 1.2"
export PWR_NETS_VOLTAGES  = "VDD 1.8"
export GND_NETS_VOLTAGES  = "VSS 0.0"
