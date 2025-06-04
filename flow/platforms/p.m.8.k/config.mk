# MFDA Process Config

#-----------------------------------------------------
# Tech/Libs
# ----------------------------------------------------
export GENERAL_MAP_FILE = $(PLATFORM_DIR)/lib/common.v

ifeq ($(BUILD_PDK_LIBRARY),)
# General distribution files
export GDS_FILES = $(sort $(wildcard $(PLATFORM_DIR)/gds/*.gds)) \
                      $(ADDITIONAL_GDS)
export TECH_LEF = $(PLATFORM_DIR)/lef/p.m.8.k.tlef
export SC_LEF = $(PLATFORM_DIR)/lef/p.m.8.k_merged.lef

export LIB_FILES = $(PLATFORM_DIR)/lib/p.m.8.k.lib \
                     $(ADDITIONAL_LIBS)
#export SCAD_COMPONENT_LIBRARY = $(PLATFORM_DIR)/scad/components.scad
export SCAD_COMPONENT_LIBRARY = $(PLATFORM_DIR)/pdk/scad_lib/p.m.8.k_merged.scad
export SCAD_ROUTING_LIBRARY = $(PLATFORM_DIR)/scad/routing.scad
export XYCE_LIB = $(PLATFORM_DIR)/pdk/Components/verilogA_build/.libs/MFXyce.so

else
# Locally built distribution files
#ROOT_DIR=$(PLATFORM_DIR)/pdk/Components
ROOT_DIR=$(PLATFORM_DIR)/pdk
include $(PLATFORM_DIR)/pdk/Componets/Makefile
export LIBRARY_DEPS = $(SC_LEF) $(TECH_LEF) $(LIB_FILES) $(SCAD_COMPONENT_LIBRARY) $(SCAD_ROUTING_LIBRARY) $(GDS_FILES) $(XYCE_LIB)
endif

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
export DIE_AREA    	 	= 0 0 3409 1136
export CORE_AREA   	 	= 0 0 3409 1136

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

# export SCAD_DESIGN_INCLUDE=$(PLATFORM_DIR)/pdk/Components/scad_use/lef_helper.scad \
# 									 $(PLATFORM_DIR)/pdk/Components/scad_use/lef_scad_config.scad \
# 									 $(PLATFORM_DIR)/pdk/Components/scad_use/polychannel_v2.scad

export SCAD_DESIGN_INCLUDE = $(PLATFORM_DIR)/pdk/scad_include/polychannel_v2.scad \
                             $(PLATFORM_DIR)/pdk/scad_include/lef_scad_config.scad \
														 $(PLATFORM_DIR)/pdk/scad_include/lef_helper.scad

#------------------------------------------------------------------------------
# PRINTER PARAMETERS
#------------------------------------------------------------------------------s
# mm/px value
export PX_VAL 			= 0.022
# mm/layer value
export LAYER_VAL		= 0.01
# layer number for the bottom layer
export BOT_LAYER_VAL	= 75
# layers/via value
export LPV_VAL			= 40
# bulk x value in pixels
# value for entire print volume = 7500
# value for galss slide: 75 mm
export XBULK_VAL		= 3409
# bulk y value in pixels
# value for entire print volume = 3272
# value for galss slide: 25 mm
export YBULK_VAL		= 1136
# bulk z value in layers
# value for entire print volume = 8181
# realistic value: 15 mm
export ZBULK_VAL		= 681
# chip min and max x values in pixels
export XCHIP_VALS		= 325 2225
# chip min and max y values in pixels
export YCHIP_VALS		= 325 1275
# render smoothness in scad render
export RES_VAL			= 120
export PITCH            = 30

export SCAD_LIB ?= $(PLATFORM_DIR)/pdk/scad_lib

# Default SCAD script arguments
SCAD_ARGS = --component_file ${SCAD_COMPONENT_LIBRARY} \
			--routing_file ${SCAD_ROUTING_LIBRARY} --scad_include $(SCAD_DESIGN_INCLUDE) \
			--lef_file ${SC_LEF} ${ADDITIONAL_LEFS} --tlef_file ${TECH_LEF} \
            --platform "$(PLATFORM)" \
            --px $(PX_VAL) --layer $(LAYER_VAL) --bottom_layer $(BOT_LAYER_VAL) --lpv $(LPV_VAL) --xbulk $(XBULK_VAL) \
            --ybulk $(YBULK_VAL) --zbulk $(ZBULK_VAL) --xchip $(XCHIP_VALS) --ychip $(YCHIP_VALS) \
            --pitch $(PITCH) --res $(RES_VAL) \
            --io_size 9 9 --routing_size 9 16
