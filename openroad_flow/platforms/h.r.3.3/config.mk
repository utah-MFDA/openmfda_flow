# MFDA Process Config

#-----------------------------------------------------
# Tech/Libs
# ----------------------------------------------------
export TECH_LEF = $(PLATFORM_DIR)/lef/h.r.3.3.tlef
export SC_LEF = $(PLATFORM_DIR)/lef/h.r.3.3_merged.lef

export LIB_FILES = $(PLATFORM_DIR)/lib/h.r.3.3.lib \
                     $(ADDITIONAL_LIBS)
export GDS_FILES = $(sort $(wildcard $(PLATFORM_DIR)/gds/*.gds)) \
                     $(ADDITIONAL_GDS)
export GENERAL_MAP_FILE = $(PLATFORM_DIR)/lib/common.v

# # Dont use cells to ease congestion
# # Specify at least one filler cell if none
# export DONT_USE_CELLS =

#--------------------------------------------------------
# Floorplan
# -------------------------------------------------------

# Placement site for core cells
# This can be found in the technology lef
export PLACE_SITE = CoreSite

# IO Placer pin layers
export IO_PLACER_H = met3
export IO_PLACER_V = met2

# defaults specified here, override in local file as needed
export DIE_AREA    	 	= 0 0 2550 1590
export CORE_AREA   	 	= 0 0 2550 1590

#---------------------------------------------------------
# Place
# --------------------------------------------------------

export PLACE_PINS_ARGS = -min_distance 5 -min_distance_in_tracks

# Cell padding in SITE widths to ease rout-ability.  Applied to both sides
export CELL_PAD_IN_SITES_GLOBAL_PLACEMENT ?= 0
export CELL_PAD_IN_SITES_DETAIL_PLACEMENT ?= 0

export PLACE_DENSITY ?= 1

# ---------------------------------------------------------
#  Route
# ---------------------------------------------------------

# FastRoute options
export MIN_ROUTING_LAYER = met1
export MAX_ROUTING_LAYER = met8

# Define fastRoute tcl
export FASTROUTE_TCL = $(PLATFORM_DIR)/fastroute.tcl

# KLayout technology file
export KLAYOUT_TECH_FILE = $(PLATFORM_DIR)/$(PLATFORM).lyt

#------------------------------------------------------------------------------
# PRINTER PARAMETERS
#------------------------------------------------------------------------------s
# mm/px value
export PX_VAL 			= 0.0076
# mm/layer value
export LAYER_VAL		= 0.01
# layer number for the bottom layer
export BOT_LAYER_VAL	= 75
# layers/via value
export LPV_VAL			= 20
# bulk x value in pixels
export XBULK_VAL		= 2550
# bulk y value in pixels
export YBULK_VAL		= 1600
# bulk z value in layers
export ZBULK_VAL		= 230
# chip min and max x values in pixels
export XCHIP_VALS		= 325 2225
# chip min and max y values in pixels
export YCHIP_VALS		= 325 1275
# render smoothness in scad render
export RES_VAL			= 120
export PITCH            = 30
# Default SCAD script arguments
SCAD_ARGS = --lef_file ${SC_LEF} --tlef_file ${TECH_LEF} \
            --platform "$(PLATFORM)" \
            --px $(PX_VAL) --layer $(LAYER_VAL) --bottom_layer $(BOT_LAYER_VAL) --lpv $(LPV_VAL) --xbulk $(XBULK_VAL) \
            --ybulk $(YBULK_VAL) --zbulk $(ZBULK_VAL) --xchip $(XCHIP_VALS) --ychip $(YCHIP_VALS) \
            --pitch $(PITCH) --res $(RES_VAL)
