# MFDA Process Config

#-----------------------------------------------------
# Tech/Libs
# ----------------------------------------------------
export GENERAL_MAP_FILE = $(PLATFORM_DIR)/lib/common.v

ifeq ($(BUILD_PDK_LIBRARY),)
# General distribution files
# gds files are not required
# export GDS_FILES = $(sort $(wildcard $(PLATFORM_DIR)/gds/*.gds)) \
                      # $(ADDITIONAL_GDS)
export TECH_LEF ?= $(PLATFORM_DIR)/lef/h.r.3.3.tlef
export SC_LEF ?= $(PLATFORM_DIR)/lef/h.r.3.3_merged.lef

# lib file is not required
#export LIB_FILES = $(PLATFORM_DIR)/lib/h.r.3.3.lib \
                     #$(ADDITIONAL_LIBS)
export SCAD_COMPONENT_LIBRARY = $(PLATFORM_DIR)/pdk/scad_lib/h.r.3.3_merged.scad
export SCAD_ROUTING_LIBRARY = $(PLATFORM_DIR)/scad/routing.scad
else
# Locally built distribution files
ROOT_DIR=$(PLATFORM_DIR)/pdk
include $(PLATFORM_DIR)/pdk/Componets/Makefile
export LIBRARY_DEPS = $(SC_LEF) $(TECH_LEF) $(LIB_FILES) $(SCAD_COMPONENT_LIBRARY) $(SCAD_ROUTING_LIBRARY) $(GDS_FILES) $(XYCE_LIB)
endif

########### Not used but needed for scad rendering definitions
# chip min and max x values in pixels
export XCHIP_VALS		= 325 2225
# chip min and max y values in pixels
export YCHIP_VALS		= 325 1275

export PITCH        = 30

include $(PLATFORM_DIR)/config_3dp.mk

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
#export DIE_AREA    	 	= 0 0 2550 1600
export DIE_AREA    	 	?= 0 0 $(XBULK_VAL) $(YBULK_VAL)
#export CORE_AREA   	 	= 0 0 2550 1600
# does arithmetic in make throuh shell call
CORE_X1 = $(shell echo $$(( 0 + $(EDGE_PADDING) )))
CORE_X2 = $(shell echo $$(( $(XBULK_VAL) - $(EDGE_PADDING) )))
CORE_Y1 = $(shell echo $$(( 0 + $(EDGE_PADDING) )))
CORE_Y2 = $(shell echo $$(( $(YBULK_VAL) - $(EDGE_PADDING) )))

export CORE_AREA   	 	?= $(CORE_X1) $(CORE_Y1) $(CORE_X2) $(CORE_Y2)

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
#   moved to config_3dp.mk
export MIN_ROUTING_LAYER ?= met1
export MAX_ROUTING_LAYER ?= met8

# Define fastRoute tcl
export FASTROUTE_TCL = $(PLATFORM_DIR)/fastroute.tcl

# KLayout technology file
export KLAYOUT_TECH_FILE = $(PLATFORM_DIR)/$(PLATFORM).lyt

# Default SCAD script arguments
ifeq ($(abspath $(SCAD_SCRIPT)),$(abspath ../tools/scad_render/generator_v2.py))
SCAD_ARGS += --component_file ${SCAD_COMPONENT_LIBRARY} \
			--routing_file ${SCAD_ROUTING_LIBRARY} --scad_include $(SCAD_DESIGN_INCLUDE) \
			--lef_file ${SC_LEF} ${ADDITIONAL_LEFS} --tlef_file ${TECH_LEF} \
            --platform "$(PLATFORM)" \
            --px $(PX_VAL) --layer $(LAYER_VAL) --bottom_layer $(BOT_LAYER_VAL) --lpv $(LPV_VAL) --xbulk $(XBULK_VAL) \
            --ybulk $(YBULK_VAL) --zbulk $(ZBULK_VAL) --xchip $(XCHIP_VALS) --ychip $(YCHIP_VALS) \
            --pitch $(PITCH) --res $(RES_VAL)
else
SCAD_ARGS += --component_file ${SCAD_COMPONENT_LIBRARY} \
			--routing_file ${SCAD_ROUTING_LIBRARY} \
			--lef_file ${SC_LEF} ${ADDITIONAL_LEFS} --tlef_file ${TECH_LEF} \
            --platform "$(PLATFORM)" \
            --px $(PX_VAL) --layer $(LAYER_VAL) --bottom_layer $(BOT_LAYER_VAL) --lpv $(LPV_VAL) --xbulk $(XBULK_VAL) \
            --ybulk $(YBULK_VAL) --zbulk $(ZBULK_VAL) --xchip $(XCHIP_VALS) --ychip $(YCHIP_VALS) \
            --pitch $(PITCH) --res $(RES_VAL)
endif
