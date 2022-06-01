# Shell setup for make
SHELL      	= /bin/bash
.SHELLFLAGS	= -o pipefail -c

# Design name
export DESIGN = test
DESIGN_VARIANT = base

# Design Parameters
DEF_FILE		= $(OR_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)/4_final.def
WCHAN_VAL 		= 14
XYCHAN_VAL 		= 14
HCHAN_VAL 		= 10
PX_VAL 			= 0.0076
LAYER_VAL		= 0.01
BOT_LAYER_VAL	= 75
XBULK_VAL		= 2550
YBULK_VAL		= 1600
ZBULK_VAL		= 230
LEF_SCALE_VAL	= 1000
RES_VAL			= 120

# SCAD script arguments
SCAD_ARGS =\
			--design "$(DESIGN)" --def_file "$(DEF_FILE)" --results_dir "$(RESULTS_DIR)" \
			--wchan_val $(WCHAN_VAL) --xychan_val $(XYCHAN_VAL) --hchan_val $(HCHAN_VAL) \
			--px_val $(PX_VAL) --layer_val $(LAYER_VAL) --bot_layer_val $(BOT_LAYER_VAL) \
			--xbulk_val $(XBULK_VAL) --ybulk_val $(YBULK_VAL) --zbulk_val $(ZBULK_VAL)   \
			--lef_scale_val $(LEF_SCALE_VAL) --res_val $(RES_VAL)

# Default target when invoking without specific target.
.DEFAULT_GOAL := all

# OpenROAD place and route
or_pnr:
	cd $(OPENROAD_FLOW_DIR) && $(MAKE) 

or_nuke:
	cd $(OPENROAD_FLOW_DIR) && $(MAKE) nuke

# SCAD pnr
scad_pnr:
	python3 python/scad_pnr.py $(SCAD_ARGS)

scad_clean:
	rm -rf results

# ALL
all: or_pnr scad_pnr
clean_all: or_nuke scad_clean