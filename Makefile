LAYER_HEIGHT = 1
# Shell setup for make
SHELL      	= /bin/bash

.SHELLFLAGS	= -o pipefail -c

# Default target when invoking without specific target.
.DEFAULT_GOAL := all

# Design platform and name to explore
PLATFORM ?= mfda_30px
DESIGN ?= smart_toilet

OPENROAD_FLOW_DIR ?= openroad_flow
XYCE_FLOW_DIR ?= xyce_flow
SCAD_FLOW_DIR ?= scad_flow

export SCAD_DIR ?= ${SCAD_FLOW_DIR}/scad
export SCAD_FLOW_DESIGN_DIR ?= ${SCAD_FLOW_DIR}/designs

# This does not change the output directory in openroad.
OR_RESULTS = ${OPENROAD_FLOW_DIR}/results
XYCE_RESULTS = $(XYCE_FLOW_DIR)/results
SCAD_RESULTS = ${SCAD_FLOW_DIR}/results

# Import the SCAD configuration
include $(SCAD_FLOW_DESIGN_DIR)/$(PLATFORM)/$(DESIGN)/config.mk

DESIGN_CONFIG = ./designs/${PLATFORM}/${DESIGN}/config.mk

# relative to openroad make
export GLOBAL_PLACEMENT_ARGS_PATH = ./designs/$(PLATFORM)/$(DESIGN)/global_place_args.tcl

# OpenROAD place and route
pnr: $(OR_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)/4_final.def

designs/$(PLATFORM)/$(DESIGN)/$(DESIGN).v:

designs/$(PLATFORM)/$(DESIGN)/$(DESIGN)_configure.py:

OR_DESIGN_P = openroad_flow/designs/$(PLATFORM)/$(DESIGN)
OR_PRE = $(OR_DESIGN_P)/config.mk $(OR_DESIGN_P)/constraint.sdc $(OR_DESIGN_P)/global_place_args.tcl $(OR_DESIGN_P)/io_constraints.tcl

#$(OR_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)/4_final.def: designs/$(PLATFORM)/$(DESIGN)/$(DESIGN).v designs/$(PLATFORM)/$(DESIGN)/$(DESIGN)_configure.py 
$(OR_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)/4_final.def: designs/$(PLATFORM)/$(DESIGN)/$(DESIGN).v $(OR_PRE) #designs/$(PLATFORM)/$(DESIGN)/$(DESIGN)_configure.py 
	cd $(OPENROAD_FLOW_DIR) && $(MAKE)

or_nuke:
	cd $(OPENROAD_FLOW_DIR) && $(MAKE) nuke

simulate: $(XYCE_RESULTS)/$(PLATFORM)/$(DESIGN)/$(DESIGN)_xyceOut.csv

FINAL_V=$(OR_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)/4_final.v

$(XYCE_RESULTS)/$(PLATFORM)/$(DESIGN)/$(DESIGN)_xyceOut.csv: $(FINAL_V) $(XYCE_FLOW_DIR)/designs/$(PLATFORM)/$(DESIGN)/simulation.config
	#cp designs/$(PLATFORM)/$(DESIGN)/$(DESIGN).v $(XYCE_FLOW_DIR)/designs/$(PLATFORM)/$(DESIGN)/$(DESIGN).v
	cp $< $(XYCE_FLOW_DIR)/designs/$(PLATFORM)/$(DESIGN)/$(DESIGN).v
	$(TIME_CMD) python3 $(XYCE_FLOW_DIR)/runMFDASim.py $(XYCE_ARGS) \
		--design $(DESIGN) \
		--sim_config $(XYCE_FLOW_DIR)/designs/$(PLATFORM)/$(DESIGN)/simulation.config \
		--netlist $(DESIGN).v \
		--sim_dir $(XYCE_FLOW_DIR)/designs/$(PLATFORM)/$(DESIGN) \
		--output_dir $(XYCE_FLOW_DIR)/results/$(PLATFORM)/$(DESIGN) \
		--length_file $(SCAD_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)/$(DESIGN)_length.csv \
		--cir_config $(XYCE_FLOW_DIR)/V2Va_Parser/VMF_xyce.mfsp \
		--lib $(XYCE_FLOW_DIR)/stdCellLib/StandardCellLibrary.csv \
		--local_xyce True \
		--eval_result True ## comment if no evals

$(XYCE_FLOW_DIR)/designs/$(PLATFORM)/$(DESIGN)/$(DESIGN).v:

$(XYCE_FLOW_DIR)/designs/$(PLATFORM)/$(DESIGN)/simulation.config:

# SCAD pnr
render: ${SCAD_RESULTS}/${DESIGN}/${DESIGN_VARIANT}/${DESIGN}.scad

${SCAD_RESULTS}/${DESIGN}/${DESIGN_VARIANT}/${DESIGN}.scad: $(OR_RESULTS)/$(DESIGN)/$(DESIGN_VARIANT)/4_final.def
	#$(TIME_CMD) python3 $(SCAD_FLOW_DIR)/scad_pnr.py $(SCAD_ARGS) 
	$(TIME_CMD) python3 $(SCAD_FLOW_DIR)/generator_v2.py $(SCAD_ARGS) \
		--def_file $< \
		--tlef openroad_flow/platforms/$(PLATFORM)/lef/$(PLATFORM).tlef \
		--design "$(DESIGN)" \
		--results_dir "$(SCAD_RESULTS)/${DESIGN}/${DESIGN_VARIANT}"

scad_clean:
	rm -rf $(SCAD_RESULTS)

${DESIGN}.${PLATFORM}.zip: ${SCAD_RESULTS}/${DESIGN}/${DESIGN_VARIANT}/${DESIGN}.stl ${SCAD_RESULTS}/${DESIGN}/$(DESIGN_VARIANT)/${DESIGN}.slices
	7z a -tzip $@ ${OR_RESULTS} ${SCAD_RESULTS}

include $(wildcard *.deps)

%.stl: %.scad ${SCAD_RESULTS}/${DESIGN}/$(DESIGN_VARIANT)/${DESIGN}.slices
	openscad -m make -o $@ -d $@.deps $<

slice: ${SCAD_RESULTS}/${DESIGN}/$(DESIGN_VARIANT)/${DESIGN}.slices

%.slices: %.stl
	xvfb-run python3 tools/slicer/pyqt5/app_qt.py $< ${LAYER_HEIGHT} $@

# ALL
all: ${DESIGN}.${PLATFORM}.zip

clean: or_nuke scad_clean

.PHONY: clean all scad_clean render or_nuke pnr

HR_3_3_GITURL = https://github.com/utah-MFDA/h.r.3.3_pdk
HR_3_3_LOCDIR = .h.r.3.3_pdk

update_lib_h_r_3_3:
	git clone $(HR_3_3_GITURL).git $(HR_3_3_LOCDIR)
	cd $(HR_3_3_LOCDIR)/Components/ && make build_lef
	cd $(HR_3_3_LOCDIR)/Components/ && make build_scad
	# create LEF backup and cp new library
	cp openroad_flow/platforms/h.r.3.3/lef/h.r.3.3_merged.lef openroad_flow/platforms/h.r.3.3/lef/h.r.3.3_merged.lef.backup
	cp $(HR_3_3_LOCDIR)/Components/HR3.3_merged.lef openroad_flow/platforms/h.r.3.3/lef/h.r.3.3_merged.lef
	# create SCAD backup and cp new library
	cp scad_flow/scad/h.r.3.3/components_05052022.scad scad_flow/scad/h.r.3.3/components_05052022.scad.backup
	cp $(HR_3_3_LOCDIR)/Components/scad_build/HR3.3_merged.scad scad_flow/scad/h.r.3.3/components_05052022.scad

clean_h_r_3_3:
	rm -rf $(HR_3_3_LOCDIR)
