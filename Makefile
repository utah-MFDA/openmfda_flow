
OPENROAD_EXE := openroad
KLAYOUT_CMD := klayout
TIME_CMD :=  time
export
# Shell setup for make
SHELL      	= /bin/bash

.SHELLFLAGS	= -o pipefail -c

# Default target when invoking without specific target.
.DEFAULT_GOAL:= all

# Design platform and name to explore
PLATFORM = mfda_30px
DESIGN = smart_toilet

OPENROAD_FLOW_DIR ?= openroad_flow
SCAD_FLOW_DIR ?= scad_flow

export SCAD_DIR ?= ${SCAD_FLOW_DIR}/scad
export SCAD_FLOW_DESIGN_DIR ?= ${SCAD_FLOW_DIR}/designs

# This does not change the output directory in openroad.
OR_RESULTS = ${OPENROAD_FLOW_DIR}/results
SCAD_RESULTS = ${SCAD_FLOW_DIR}/results

# Import the SCAD configuration
include $(SCAD_FLOW_DESIGN_DIR)/$(PLATFORM)/$(DESIGN)/config.mk

DESIGN_CONFIG = ./designs/${PLATFORM}/${DESIGN}/config.mk

# OpenROAD place and route
or_pnr:
	$(MAKE) -C  $(OPENROAD_FLOW_DIR)

or_nuke:
	cd $(OPENROAD_FLOW_DIR) && $(MAKE) nuke

# SCAD pnr
scad_pnr:
	$(TIME_CMD) python3 $(SCAD_FLOW_DIR)/scad_pnr.py $(SCAD_ARGS)

scad_clean:
	rm -rf $(RESULTS_DIR)

# XYCE Run 
# Here we need to include the commands to run XYCE- I need to work on this with #Brady

${DESIGN}.${PLATFORM}.zip: or_pnr scad_pnr
	7z a -tzip ${OR_RESULTS} ${SCAD_RESULTS}

include $(wildcard *.deps)

%.stl: %.scad
	openscad -m make -o $@ -d $@.deps $<

# ALL
all: or_pnr scad_pnr ${DESIGN}.${PLATFORM}.zip
clean: or_nuke scad_clean

.PHONY: clean all scad_clean scad_pnr or_nuke or_pnr
