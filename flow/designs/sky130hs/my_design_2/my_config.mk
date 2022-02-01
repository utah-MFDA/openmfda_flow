export DESIGN_NAME = my_design_2
export PLATFORM    = sky130hs

export VERILOG_FILES = ./designs/src/$(DESIGN_NICKNAME)/my_design_2.v
export SDC_FILE      = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/my_sdc.sdc
export ABC_AREA      = 1

# Adders degrade GCD
export ADDER_MAP_FILE :=

# These values must be multiples of placement site
export DIE_AREA    = 0 0 280 280
export CORE_AREA   = 40 40 240 240
# export DIE_AREA    = 0 0 50.805 33.009
# export CORE_AREA   = 9.996 10.08 49.00 32.000

# IR drop estimation supply net name to be analyzed and supply voltage variable
# For multiple nets: PWR_NETS_VOLTAGES  = "VDD1 1.8 VDD2 1.2"
export PWR_NETS_VOLTAGES  = "VDD 1.8"
export GND_NETS_VOLTAGES  = "VSS 0.0"
