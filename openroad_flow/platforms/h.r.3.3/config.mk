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
