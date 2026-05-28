




NETLIST_FILE      = three_input_mixer.v
SIMULATION_CONFIG = simulation.config
SIMULATION_DIR    = ./

# .xlsx format
#LENGTH_FILE = None


DOCKER            ?= TRUE
DOCKER_IMAGE      ?= 
DOCKER_CONTAINER  ?= 


SIM_ARGS = --netlist $() --sim_file $() --sim_dir $(SIMULATION_DIR) --lib $() --cir_config $()

ifdef LENGTH_FILE
    SIM_ARGS += --length_file $(LENGTH_FILE)
else
    SIM_ARGS += --pre_route True
endif
