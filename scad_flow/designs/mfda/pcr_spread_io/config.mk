#------------------------------------------------------------------------------
# DESIGN NAMES
#------------------------------------------------------------------------------
# platform name from OpenROAD flow
export PLATFORM = mfda
# design name from OpenROAD flow
export DESIGN = pcr
# design variant from OpenROAD flow
export DESIGN_VARIANT = spread_io

#------------------------------------------------------------------------------
# DESIGN PARAMETERS
#------------------------------------------------------------------------------s
# Path to the def file form OpenROAD flow
DEF_FILE		= $(OR_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)/4_final.def
# Path to results dir
DESIGN_RESULTS	= $(RESULTS_DIR)/$(PLATFORM)/$(DESIGN)/$(DESIGN_VARIANT)
# mm/px value
PX_VAL 			= 0.0076
# mm/layer value
LAYER_VAL		= 0.01
# layer number for the bottom layer
BOT_LAYER_VAL	= 75
# layers/via value
LPV_VAL			= 20
# bulk x value in pixels
XBULK_VAL		= 2550
# bulk y value in pixels
YBULK_VAL		= 1600
# bulk z value in layers
ZBULK_VAL		= 230
# chip min and max x values in pixels
# XCHIP_VALS		= 325 2225
XCHIP_VALS		= 0 2550
# chip min and max y values in pixels	
# YCHIP_VALS		= 325 1275
YCHIP_VALS		= 0 1600
# scale the .def file uses for dimensions
DEF_SCALE_VAL	= 1000
# PNR pitch of platform
PITCH 			= 25
# render smoothness in scad render
RES_VAL			= 120
# optional - path to route dimensions specifications
# DIMM_FILE		= $(SCAD_FLOW_DESIGN_DIR)/$(PLATFORM)/$(DESIGN)/dimm.csv

# SCAD script arguments
SCAD_ARGS =\
			--platform "$(PLATFORM)" --design "$(DESIGN)" --def_file "$(DEF_FILE)" --results_dir "$(DESIGN_RESULTS)" 	\
			--px $(PX_VAL) --layer $(LAYER_VAL) --bottom_layer $(BOT_LAYER_VAL) --lpv $(LPV_VAL) --xbulk $(XBULK_VAL)	\
			--ybulk $(YBULK_VAL) --zbulk $(ZBULK_VAL) --xchip $(XCHIP_VALS) --ychip $(YCHIP_VALS)						\
			--def_scale $(DEF_SCALE_VAL) --pitch $(PITCH) --res $(RES_VAL)
			
ifdef DIMM_FILE
SCAD_ARGS +=\
			--dimm_file "$(DIMM_FILE)"
endif