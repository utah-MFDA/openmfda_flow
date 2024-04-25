
# Shell setup for make
SHELL      	= /bin/bash

.SHELLFLAGS	= -o pipefail -c

# Default target when invoking without specific target.
.DEFAULT_GOAL := all

PYTHON_CMD = python3 ./runMFDASim.py

DESIGN    ?=  demo
PLATFORM  ?=  mfda_30px

VERILOG_F = $(DESIGN).v

LIB        = ./testing/StandardCellLibrary.csv
CIR_CONFIG = ./V2Va_Parser/VMF_xyce.mfsp
LENGTH_FILE= ./testing_local/smart_toilet_test_config/smart_toilet_lengths.xlsx

OUTPUT_DIR = ./results/${PLATFORM}/${DESIGN}'


simulate_old:
	$(PYTHON_CMD) --netlist $(VERILOG_F) \
		--sim_dir ./designs/$(PLATFORM)/$(DESIGN) \
		--lib ./stdCellLib/StandardCellLibrary.csv \
		--cir_config ./V2Va_Parser/VMF_xyce.mfsp \
		--length_file ./designs/$(PLATFORM)/$(DESIGN)/$(DESIGN)_lengths.xlsx \
		--local_xyce True \
		--output_dir ./results/$(PLATFORM)/$(DESIGN) \
		--eval_result True

simulate:
	$(PYTHON_CMD) --netlist $(VERILOG_F) \
		--design $(DESIGN) \
		--sim_config ./designs/$(PLATFORM)/$(DESIGN)/simulation.config \
		--sim_dir ./designs/$(PLATFORM)/$(DESIGN) \
		--lib ./stdCellLib/StandardCellLibrary.csv \
		--cir_config ./V2Va_Parser/VMF_xyce.mfsp \
		--length_file ./designs/$(PLATFORM)/$(DESIGN)/$(DESIGN)_lengths.xlsx \
		--local_xyce True \
		--output_dir ./results/$(PLATFORM)/$(DESIGN) \
		--eval_result True

all: simulate
