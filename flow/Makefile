# ==============================================================================
# Uncomment or add the design to run
# ==============================================================================
PLATFORM ?= h.r.3.3
export DESIGN ?= demo

OPENROAD_EXE ?= openroad
KLAYOUT_CMD ?= klayout
YOSYS_CMD ?= yosys
OPENSCAD ?= openscad
#export SCAD_SCRIPT ?= ../tools/scad_render/scad_pnr.py
export SCAD_SCRIPT ?= ../tools/scad_render/generator_v2.py
export BUILD_PDK_LIBRARY ?=

# Add design configure paths here
DESIGN_CONFIG ?= ./designs/${PLATFORM}/${DESIGN}/config.mk

# Global setting for Floorplan
export PLACE_PINS_ARGS ?=

# If we are running headless use offscreen rendering for save_image
ifndef DISPLAY
export QT_QPA_PLATFORM ?= offscreen
endif

# Global override Floorplan
# export CORE_UTILIZATION := 30
# export CORE_ASPECT_RATIO := 1
# export CORE_MARGIN := 4

# ==============================================================================
#  ____  _____ _____ _   _ ____
# / ___|| ____|_   _| | | |  _ \
# \___ \|  _|   | | | | | | |_) |
#  ___) | |___  | | | |_| |  __/
# |____/|_____| |_|  \___/|_|
#
# ==============================================================================

#-------------------------------------------------------------------------------
# Default target when invoking without specific target.
.DEFAULT_GOAL := render

#-------------------------------------------------------------------------------
# Proper way to initiate SHELL for make
SHELL          = /bin/bash
.SHELLFLAGS    = -o pipefail -c

#-------------------------------------------------------------------------------
# Setup the flow directory
# - Setup in environment but can be changed here if running Makefile standalone
#   from root Makefile (pnr/Makefile)
export FLOW_HOME ?= .
export GLOBAL_PLACEMENT_ARGS = -skip_nesterov_place
#-------------------------------------------------------------------------------
# Setup variables to point to other location for the following sub directory
# - designs - default is under current directory
# - platforms - default is under current directory
# - work home - default is current directory
# - utils, scripts, test - default is under current directory
export DESIGN_HOME   ?= $(FLOW_HOME)/designs
export PLATFORM_HOME ?= $(FLOW_HOME)/platforms
export WORK_HOME     ?= .

export UTILS_DIR     ?= $(FLOW_HOME)/util
export SCRIPTS_DIR   ?= $(FLOW_HOME)/scripts
export TEST_DIR      ?= $(FLOW_HOME)/test

export CUSTOM_SCRIPTS_DIR ?= $(FLOW_HOME)/scripts_custom
export CUSTOM_TCL_DIR ?= $(FLOW_HOME)/scripts_custom

#-------------------------------------------------------------------------------

ifneq ($(wildcard $(PLATFORM_HOME)/$(PLATFORM)),)
  export PLATFORM_DIR = $(PLATFORM_HOME)/$(PLATFORM)
else ifneq ($(wildcard ../../$(PLATFORM)),)
  export PLATFORM_DIR = ../../$(PLATFORM)
else
  $(error [ERROR][FLOW] Platform '$(PLATFORM)' not found.)
endif

$(info [INFO][FLOW] Using platform directory $(PLATFORM_DIR))
include $(PLATFORM_DIR)/config.mk

# Include design and platform configuration
include $(DESIGN_CONFIG)

export FLOW_VARIANT ?= base

# Setup working directories
export DESIGN_NICKNAME ?= $(DESIGN_NAME)

export DESIGN_DIR  = $(dir $(DESIGN_CONFIG))
export LOG_DIR     = $(WORK_HOME)/logs/$(DESIGN_NICKNAME)/$(FLOW_VARIANT)
export OBJECTS_DIR = $(WORK_HOME)/objects/$(DESIGN_NICKNAME)/$(FLOW_VARIANT)
export REPORTS_DIR = $(WORK_HOME)/reports/$(DESIGN_NICKNAME)/$(FLOW_VARIANT)
export RESULTS_DIR = $(WORK_HOME)/results/$(DESIGN_NICKNAME)/$(FLOW_VARIANT)

ifdef BLOCKS
  $(info [INFO][FLOW] Invoked hierarchical flow.)
  $(foreach block,$(BLOCKS),$(info Block ${block} needs to be hardened.))
  $(foreach block,$(BLOCKS),$(eval BLOCK_CONFIGS += ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/$(block)/config.mk))
  $(foreach block,$(BLOCKS),$(eval BLOCK_LEFS += ./results/$(PLATFORM)/$(DESIGN_NICKNAME)_$(block)/$(FLOW_VARIANT)/${block}.lef))
  $(foreach block,$(BLOCKS),$(eval BLOCK_GDS += ./results/$(PLATFORM)/$(DESIGN_NICKNAME)_$(block)/$(FLOW_VARIANT)/6_final.gds))
  export ADDITIONAL_LEFS += $(BLOCK_LEFS)
  export ADDITIONAL_GDS += $(BLOCK_GDS)
  export GDS_FILES += $(BLOCK_GDS)
endif

#-------------------------------------------------------------------------------
ifeq (, $(strip $(NPROC)))
  # Linux (utility program)
  NPROC := $(shell nproc 2>/dev/null)

  ifeq (, $(strip $(NPROC)))
    # Linux (generic)
    NPROC := $(shell grep -c ^processor /proc/cpuinfo 2>/dev/null)
  endif
  ifeq (, $(strip $(NPROC)))
    # BSD (at least FreeBSD and Mac OSX)
    NPROC := $(shell sysctl -n hw.ncpu 2>/dev/null)
  endif
  ifeq (, $(strip $(NPROC)))
    # Fallback
    NPROC := 1
  endif
endif
export NUM_CORES := $(NPROC)

#-------------------------------------------------------------------------------
XVFB_CMD=xvfb-run
# setup all commands used within this flow
TIME_CMD=/usr/bin/time --verbose
# TIME_TEST = $(shell $(TIME_CMD) echo foo 2>/dev/null)
# ifeq (, $(strip $(TIME_TEST)))
#   TIME_CMD = time
# endif

# The following determine the executable location for each tool used by this flow.
# Priority is given to
#       1 user include path to the executable prior to running make
#       2 user explicit set with variable in Makefile or command line
OPENROAD_EXE            ?= $(shell command -v openroad)
OPENROAD_ARGS            = -no_init $(OR_ARGS)
OPENROAD_CMD             = $(OPENROAD_EXE) -exit $(OPENROAD_ARGS)
OPENROAD_NO_EXIT_CMD     = $(OPENROAD_EXE) $(OPENROAD_ARGS)
OPENROAD_GUI_CMD         = $(OPENROAD_EXE) -gui $(OR_ARGS)
XYCE_CMD                = Xyce
KLAYOUT_CMD             ?= $(shell command -v klayout)

#-------------------------------------------------------------------------------
WRAPPED_LEFS = $(foreach lef,$(notdir $(WRAP_LEFS)),$(OBJECTS_DIR)/lef/$(lef:.lef=_mod.lef))
WRAPPED_LIBS = $(foreach lib,$(notdir $(WRAP_LIBS)),$(OBJECTS_DIR)/$(lib:.lib=_mod.lib))
export ADDITIONAL_LEFS += $(WRAPPED_LEFS) $(WRAP_LEFS)
export LIB_FILES += $(WRAP_LIBS) $(WRAPPED_LIBS)

export DONT_USE_LIBS   = $(addprefix $(OBJECTS_DIR)/lib/, $(notdir $(LIB_FILES)))
export DONT_USE_SC_LIB ?= $(OBJECTS_DIR)/lib/$(notdir $(firstword $(LIB_FILES)))

# Stream system used for final result (GDS is default): GDS, GSDII, GDS2, OASIS, or OAS
STREAM_SYSTEM ?= GDS
ifneq ($(findstring GDS,$(shell echo $(STREAM_SYSTEM) | tr '[:lower:]' '[:upper:]')),)
	export STREAM_SYSTEM_EXT := gds
	GDSOAS_FILES = $(GDS_FILES)
	ADDITIONAL_GDSOAS = $(ADDITIONAL_GDS)
	SEAL_GDSOAS = $(SEAL_GDS)
else
	export STREAM_SYSTEM_EXT := oas
	GDSOAS_FILES = $(OAS_FILES)
	ADDITIONAL_GDSOAS = $(ADDITIONAL_OAS)
	SEAL_GDSOAS = $(SEAL_OAS)
endif
export WRAPPED_GDSOAS = $(foreach lef,$(notdir $(WRAP_LEFS)),$(OBJECTS_DIR)/$(lef:.lef=_mod.$(STREAM_SYSTEM_EXT)))


# Targets to harden Blocks in case of hierarchical flow is triggered
build_macros: $(BLOCK_LEFS)

$(foreach block,$(BLOCKS),$(eval ./results/$(PLATFORM)/$(DESIGN_NICKNAME)_$(block)/$(FLOW_VARIANT)/${block}.lef: ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/${block}/config.mk))
$(foreach block,$(BLOCKS),$(eval ./results/$(PLATFORM)/$(DESIGN_NICKNAME)_$(block)/$(FLOW_VARIANT)/6_final.gds: ./results/$(PLATFORM)/$(DESIGN_NICKNAME)_$(block)/$(FLOW_VARIANT)/${block}.lef))

$(BLOCK_LEFS):
	$(MAKE) DESIGN_CONFIG=$< generate_abstract

# Utility to print tool version information
#-------------------------------------------------------------------------------
.PHONY: versions.txt
versions.txt:
	@echo openroad `$(OPENROAD_EXE) -version` >> $@
	@$(KLAYOUT_CMD) -zz -v >> $@

# Pre-process KLayout tech
# ==============================================================================
$(OBJECTS_DIR)/klayout_tech.lef: $(TECH_LEF)
	@mkdir -p $(OBJECTS_DIR)
	sed '/OR_DEFAULT/d' $< > $@

$(OBJECTS_DIR)/klayout.lyt: $(KLAYOUT_TECH_FILE) $(OBJECTS_DIR)/klayout_tech.lef
	sed 's,<lef-files>.*</lef-files>,$(foreach file, $(OBJECTS_DIR)/klayout_tech.lef $(SC_LEF) $(ADDITIONAL_LEFS),<lef-files>$(abspath $(file))</lef-files>),g' $< > $@

$(OBJECTS_DIR)/klayout_wrap.lyt: $(KLAYOUT_TECH_FILE) $(OBJECTS_DIR)/klayout_tech.lef
	sed 's,<lef-files>.*</lef-files>,$(foreach file, $(OBJECTS_DIR)/klayout_tech.lef $(WRAP_LEFS),<lef-files>$(abspath $(file))</lef-files>),g' $< > $@

# Create Macro wrappers (if necessary)
# ==============================================================================
WRAP_CFG = $(PLATFORM_DIR)/wrapper.cfg

export TCLLIBPATH := util/cell-veneer $(TCLLIBPATH)
$(WRAPPED_LEFS):
	mkdir -p $(OBJECTS_DIR)/lef $(OBJECTS_DIR)/def
	util/cell-veneer/wrap.tcl -cfg $(WRAP_CFG) -macro $(filter %$(notdir $(@:_mod.lef=.lef)),$(WRAP_LEFS))
	mv $(notdir $@) $@
	mv $(notdir $(@:lef=def)) $(dir $@)../def/$(notdir $(@:lef=def))

$(WRAPPED_LIBS):
	mkdir -p $(OBJECTS_DIR)/lib
	sed 's/library(\(.*\))/library(\1_mod)/g' $(filter %$(notdir $(@:_mod.lib=.lib)),$(WRAP_LIBS)) | sed 's/cell(\(.*\))/cell(\1_mod)/g' > $@

#include ../tools/verilog_preparser/Makefile
#include $(FLOW_HOME)/../tools/p_cell_generator/util.mk

#.PHONY: gen_pcells
#gen_pcells: $(PCELL_MERGE_LEF)
# ==============================================================================
#  _     ___ ____  ____      _    ______   __
# | |   |_ _| __ )|  _ \    / \  |  _ \ \ / /
# | |    | ||  _ \| |_) |  / _ \ | |_) \ V /
# | |___ | || |_) |  _ <  / ___ \|  _ < | |
# |_____|___|____/|_| \_\/_/   \_\_| \_\|_|
# ==============================================================================
# Platform configuration may export these targets
library: $(LIBRARY_DEPS)

# ==============================================================================
#  ______   ___   _ _____ _   _ _____ ____ ___ ____
# / ___\ \ / / \ | |_   _| | | | ____/ ___|_ _/ ___|
# \___ \\ V /|  \| | | | | |_| |  _| \___ \| |\___ \
#  ___) || | | |\  | | | |  _  | |___ ___) | | ___) |
# |____/ |_| |_| \_| |_| |_| |_|_____|____/___|____/
#
.PHONY: synth
synth: versions.txt \
       $(RESULTS_DIR)/1_synth.v \
       $(RESULTS_DIR)/1_synth.sdc

.PHONY: synth-report
synth-report: synth
	$(UNSET_AND_MAKE) do-synth-report

.PHONY: do-synth-report
do-synth-report:
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/synth_metrics.tcl) 2>&1 | tee -a $(LOG_DIR)/1_1_yosys.log

# ==============================================================================
.PHONY: clean_synth
clean_synth:
	rm -rf $(RESULTS_DIR)/1_synth.v $(RESULTS_DIR)/1_synth.sdc
	rm -rf $(RESULTS_DIR)/$(DESIGN_NAME).v $(RESULTS_DIR)/$(DESIGN_NAME).sdc
SYNTH_SCRIPT ?= $(SCRIPTS_DIR)/synth_basic.tcl
$(SYNTH_STOP_MODULE_SCRIPT):
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	($(TIME_CMD) $(YOSYS_CMD) $(YOSYS_FLAGS) -c $(HIER_REPORT_SCRIPT)) 2>&1 | tee $(LOG_DIR)/1_0_yosys_hier_report.log

$(RESULTS_DIR)/1_synth.v: $(VERILOG_FILES)
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	($(TIME_CMD) $(YOSYS_CMD) $(YOSYS_FLAGS) -c $(SYNTH_SCRIPT)) 2>&1 | tee $(LOG_DIR)/1_synth.log

# Initialize
#-------------------------------------------------------------------------------
$(RESULTS_DIR)/$(DESIGN_NAME).v: $(RESULTS_DIR)/1_synth.v
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	cp $< $@

$(RESULTS_DIR)/1_synth.sdc: $(SDC_FILE)
	cp $< $@

$(RESULTS_DIR)/$(DESIGN_NAME).sdc: $(SDC_FILE)
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	cp $< $@


# ==============================================================================
#  _____ _     ___   ___  ____  ____  _        _    _   _
# |  ___| |   / _ \ / _ \|  _ \|  _ \| |      / \  | \ | |
# | |_  | |  | | | | | | | |_) | |_) | |     / _ \ |  \| |
# |  _| | |__| |_| | |_| |  _ <|  __/| |___ / ___ \| |\  |
# |_|   |_____\___/ \___/|_| \_\_|   |_____/_/   \_\_| \_|
#
floorplan: $(RESULTS_DIR)/1_floorplan.def
# ==============================================================================


# STEP 1: Translate verilog to def
#-------------------------------------------------------------------------------
$(RESULTS_DIR)/1_1_floorplan.def: $(RESULTS_DIR)/$(DESIGN_NAME).v $(RESULTS_DIR)/$(DESIGN_NAME).sdc $(TECH_LEF) $(SC_LEF) $(ADDITIONAL_LEFS) $(FOOTPRINT) $(SIG_MAP_FILE) $(FOOTPRINT_TCL)
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/floorplan.tcl -metrics $(LOG_DIR)/1_1_floorplan.json) 2>&1 | tee $(LOG_DIR)/1_1_floorplan.log

# STEP 2: IO Placement (random)
#-------------------------------------------------------------------------------
$(RESULTS_DIR)/1_2_floorplan_io.def: $(RESULTS_DIR)/1_1_floorplan.def $(IO_CONSTRAINTS)
ifndef IS_CHIP
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/io_placement_random.tcl -metrics $(LOG_DIR)/1_2_floorplan_io.json) 2>&1 | tee $(LOG_DIR)/1_2_floorplan_io.log
else
	cp $< $@
endif

# STEP 3: Macro Placement
#-------------------------------------------------------------------------------
$(RESULTS_DIR)/1_3_floorplan_macro.def: $(RESULTS_DIR)/1_2_floorplan_io.def $(RESULTS_DIR)/$(DESIGN_NAME).v $(RESULTS_DIR)/$(DESIGN_NAME).sdc $(MACRO_PLACEMENT)
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/macro_place.tcl -metrics $(LOG_DIR)/1_3_mplace.json) 2>&1 | tee $(LOG_DIR)/1_3_mplace.log

$(RESULTS_DIR)/1_floorplan.def: $(RESULTS_DIR)/1_3_floorplan_macro.def
	cp $< $@

$(RESULTS_DIR)/1_floorplan.sdc: $(RESULTS_DIR)/1_synth.sdc
	cp $< $@
clean_floorplan:
	rm -f $(RESULTS_DIR)/1_*floorplan*.def $(RESULTS_DIR)/1_floorplan.sdc $(RESULTS_DIR)/1_floorplan.v
	rm -f $(REPORTS_DIR)/1_*
	rm -f $(LOG_DIR)/1_*

# ==============================================================================
#  ____  _        _    ____ _____
# |  _ \| |      / \  / ___| ____|
# | |_) | |     / _ \| |   |  _|
# |  __/| |___ / ___ \ |___| |___
# |_|   |_____/_/   \_\____|_____|
#
.PHONY: replace
replace: $(RESULTS_DIR)/2_1_place_gp.def
.PHONY: place
place: $(RESULTS_DIR)/2_place.def \
	   $(RESULTS_DIR)/2_place.sdc
# ==============================================================================
ifndef $(GLOBAL_PLACEMENT_ARGS_FILE)
$(GLOBAL_PLACEMENT_ARGS_FILE):
endif

# STEP 1: Global placement + IO placement (not random)
GLOBAL_PLACE_SCRIPT ?= $(SCRIPTS_DIR)/global_place.tcl
#-------------------------------------------------------------------------------
$(RESULTS_DIR)/2_1_place_gp.def: $(RESULTS_DIR)/1_floorplan.def $(RESULTS_DIR)/1_floorplan.sdc $(LIB_FILES) $(GLOBAL_PLACEMENT_ARGS_FILE)
	($(TIME_CMD) $(OPENROAD_CMD) $(GLOBAL_PLACE_SCRIPT) -metrics $(LOG_DIR)/2_1_place_gp.json) 2>&1 | tee $(LOG_DIR)/2_1_place_gp.log

# STEP 2: IO placement (non-random)
#-------------------------------------------------------------------------------
$(RESULTS_DIR)/2_2_place_iop.def: $(RESULTS_DIR)/2_1_place_gp.def $(IO_CONSTRAINTS)
ifndef IS_CHIP
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/io_placement.tcl -metrics $(LOG_DIR)/2_2_place_iop.json) 2>&1 | tee $(LOG_DIR)/2_2_place_iop.log
else
	cp $< $@
endif

# STEP 3: Detail placement
#-------------------------------------------------------------------------------
$(RESULTS_DIR)/2_3_place_dp.def: $(RESULTS_DIR)/2_2_place_iop.def
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/detail_place.tcl -metrics $(LOG_DIR)/2_3_opendp.json) 2>&1 | tee $(LOG_DIR)/2_3_opendp.log

$(RESULTS_DIR)/2_place.def: $(RESULTS_DIR)/2_3_place_dp.def
	cp $< $@

$(RESULTS_DIR)/2_place.sdc: $(RESULTS_DIR)/1_floorplan.sdc
	cp $< $@

# Clean Targets
#-------------------------------------------------------------------------------
clean_place:
	rm -f $(RESULTS_DIR)/2_*place*.def
	rm -f $(RESULTS_DIR)/2_place.sdc
	rm -f $(REPORTS_DIR)/2_*
	rm -f $(LOG_DIR)/2_*

# ==============================================================================
#  ____   ___  _   _ _____ ___ _   _  ____
# |  _ \ / _ \| | | |_   _|_ _| \ | |/ ___|
# | |_) | | | | | | | | |  | ||  \| | |  _
# |  _ <| |_| | |_| | | |  | || |\  | |_| |
# |_| \_\\___/ \___/  |_| |___|_| \_|\____|
#
route: $(RESULTS_DIR)/3_route.def \
       $(RESULTS_DIR)/3_route.sdc
# ==============================================================================
# rereplace_test:
# 	($(TIME_CMD) $(OPENROAD_CMD) $(CUSTOM_SCRIPTS_DIR)/read_def.tcl)

reroute:
	$(TIME_CMD) $(OPENROAD_CMD) $(CUSTOM_SCRIPTS_DIR)/reroute.tcl

# STEP 1: Run global route
#-------------------------------------------------------------------------------
$(RESULTS_DIR)/route.guide: $(RESULTS_DIR)/2_place.def $(RESULTS_DIR)/2_place.sdc $(FASTROUTE_TCL) $(PRE_GLOBAL_ROUTE)
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/global_route.tcl -metrics $(LOG_DIR)/3_1_fastroute.json) 2>&1 | tee $(LOG_DIR)/3_1_fastroute.log

# STEP 2: Run detailed route
#-------------------------------------------------------------------------------
ifeq ($(USE_WXL),)
$(RESULTS_DIR)/3_route.def: $(RESULTS_DIR)/route.guide
endif
$(RESULTS_DIR)/3_route.def: $(RESULTS_DIR)/2_place.def
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/detail_route.tcl -metrics $(LOG_DIR)/3_2_TritonRoute.json) 2>&1 | tee $(LOG_DIR)/3_2_TritonRoute.log

$(RESULTS_DIR)/3_route.sdc: $(RESULTS_DIR)/2_place.sdc
	cp $< $@

clean_route:
	rm -rf output*/ results*.out.dmp layer_*.mps
	rm -rf *.gdid *.log *.met *.sav *.res.dmp
	rm -rf $(RESULTS_DIR)/route.guide $(RESULTS_DIR)/output_guide.mod
	rm -rf $(RESULTS_DIR)/3_route.def $(RESULTS_DIR)/3_route.sdc
	rm -f  $(REPORTS_DIR)/3_*
	rm -f  $(LOG_DIR)/3_*

klayout_tr_rpt: $(RESULTS_DIR)/3_route.def $(OBJECTS_DIR)/klayout.lyt
	$(KLAYOUT_CMD) -rd in_drc="$(REPORTS_DIR)/3_route_drc.rpt" \
	        -rd in_def="$<" \
	        -rd tech_file=$(OBJECTS_DIR)/klayout.lyt \
	        -rm $(UTILS_DIR)/viewDrc.py

klayout_guides: $(RESULTS_DIR)/3_route.def $(OBJECTS_DIR)/klayout.lyt
	$(KLAYOUT_CMD) -rd in_guide="$(RESULTS_DIR)/route.guide" \
	        -rd in_def="$<" \
	        -rd net_name=$(GUIDE_NET) \
	        -rd tech_file=$(OBJECTS_DIR)/klayout.lyt \
	        -rm $(UTILS_DIR)/viewGuide.py

# ==============================================================================
#  _____ ___ _   _ ___ ____  _   _ ___ _   _  ____
# |  ___|_ _| \ | |_ _/ ___|| | | |_ _| \ | |/ ___|
# | |_   | ||  \| || |\___ \| |_| || ||  \| | |  _
# |  _|  | || |\  || | ___) |  _  || || |\  | |_| |
# |_|   |___|_| \_|___|____/|_| |_|___|_| \_|\____|
#
finish: $(LOG_DIR)/4_report.log \
        $(RESULTS_DIR)/4_final.v \
        $(RESULTS_DIR)/4_final.sdc \
        $(4_FINAL_FILE)
pnr: finish
# ==============================================================================
4_FINAL_FILE = $(RESULTS_DIR)/4_final.$(STREAM_SYSTEM_EXT)
ifneq ($(USE_FILL),)
$(RESULTS_DIR)/4_1_fill.def: $(RESULTS_DIR)/3_route.def $(FILL_CONFIG)
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/density_fill.tcl -metrics $(LOG_DIR)/4_density_fill.json) 2>&1 | tee $(LOG_DIR)/4_density_fill.log
else
$(RESULTS_DIR)/4_1_fill.def: $(RESULTS_DIR)/3_route.def
	cp $< $@
endif

$(RESULTS_DIR)/4_1_fill.sdc: $(RESULTS_DIR)/3_route.sdc
	cp $< $@

$(RESULTS_DIR)/4_final.sdc: $(RESULTS_DIR)/3_route.sdc
	cp $< $@

# This is segfaulting during garbage collection after verilog file is written.
$(LOG_DIR)/4_report.log: $(RESULTS_DIR)/4_1_fill.def $(RESULTS_DIR)/4_1_fill.sdc
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/final_report.tcl -metrics $(LOG_DIR)/4_report.json || true) 2>&1 | tee $(LOG_DIR)/4_report.log

$(RESULTS_DIR)/4_final.def: $(LOG_DIR)/4_report.log

generate_abstract: $(RESULTS_DIR)/4_final.gds $(RESULTS_DIR)/4_final.def  $(RESULTS_DIR)/4_final.v
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/generate_abstract.tcl -metrics $(LOG_DIR)/generate_abstract.json) 2>&1 | tee $(LOG_DIR)/generate_abstract.log

# Merge wrapped macros using Klayout
#-------------------------------------------------------------------------------
$(WRAPPED_GDSOAS): $(OBJECTS_DIR)/klayout_wrap.lyt $(WRAPPED_LEFS)
	($(TIME_CMD) $(KLAYOUT_CMD) -zz -rd design_name=$(basename $(notdir $@)) \
	        -rd in_def=$(OBJECTS_DIR)/def/$(notdir $(@:$(STREAM_SYSTEM_EXT)=def)) \
	        -rd in_files="$(ADDITIONAL_GDSOAS)" \
	        -rd config_file=$(FILL_CONFIG) \
	        -rd seal_file="" \
	        -rd out_file=$@ \
	        -rd tech_file=$(OBJECTS_DIR)/klayout_wrap.lyt \
	        -rm $(UTILS_DIR)/def2stream.py) 2>&1 | tee $(LOG_DIR)/6_merge_$(basename $(notdir $@)).log

# Merge GDS using Klayout
#-------------------------------------------------------------------------------
4_1_MERGED_FILE = $(RESULTS_DIR)/4_1_merged.$(STREAM_SYSTEM_EXT)
$(4_1_MERGED_FILE): $(RESULTS_DIR)/4_final.def $(OBJECTS_DIR)/klayout.lyt $(GDSOAS_FILES) $(WRAPPED_GDSOAS) $(SEAL_GDSOAS)
	($(TIME_CMD) stdbuf -o L $(KLAYOUT_CMD) -zz -rd design_name=$(DESIGN_NAME) \
	        -rd in_def=$< \
	        -rd in_files="$(GDSOAS_FILES) $(WRAPPED_GDSOAS)" \
	        -rd config_file=$(FILL_CONFIG) \
	        -rd seal_file="$(SEAL_GDSOAS)" \
	        -rd out_file=$@ \
	        -rd tech_file=$(OBJECTS_DIR)/klayout.lyt \
	        -rm $(UTILS_DIR)/def2stream.py) 2>&1 | tee $(LOG_DIR)/4_1_merge.log

$(RESULTS_DIR)/4_final.v: $(LOG_DIR)/4_report.log

$(4_FINAL_FILE): $(4_1_MERGED_FILE)
	cp $^ $@

drc: $(REPORTS_DIR)/4_drc.lyrdb

$(REPORTS_DIR)/4_drc.lyrdb: $(6_FINAL_FILE) $(KLAYOUT_DRC_FILE)
ifneq ($(KLAYOUT_DRC_FILE),)
	($(TIME_CMD) $(KLAYOUT_CMD) -zz -rd in_gds="$<" \
	        -rd report_file=$(abspath $@) \
	        -r $(KLAYOUT_DRC_FILE)) 2>&1 | tee $(LOG_DIR)/4_drc.log
	# Hacky way of getting DRV count (don't error on no matches)
	grep -c "<value>" $@ > $(REPORTS_DIR)/4_drc_count.rpt || [[ $$? == 1 ]]
else
	echo "DRC not supported on this platform" > $@
endif

$(RESULTS_DIR)/4_final.cdl: $(RESULTS_DIR)/4_final.v
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/cdl.tcl) 2>&1 | tee $(LOG_DIR)/4_cdl.log

$(OBJECTS_DIR)/4_final_concat.cdl: $(RESULTS_DIR)/4_final.cdl $(CDL_FILE)
	cat $^ > $@

lvs: $(RESULTS_DIR)/4_lvs.lvsdb

$(RESULTS_DIR)/4_lvs.lvsdb: $(4_FINAL_FILE) $(KLAYOUT_LVS_FILE) $(OBJECTS_DIR)/4_final_concat.cdl
ifneq ($(KLAYOUT_LVS_FILE),)
	($(TIME_CMD) $(KLAYOUT_CMD) -b -rd in_gds="$<" \
	        -rd cdl_file=$(abspath $(OBJECTS_DIR)/4_final_concat.cdl) \
	        -rd report_file=$(abspath $@) \
	        -r $(KLAYOUT_LVS_FILE)) 2>&1 | tee $(LOG_DIR)/4_lvs.log
else
	echo "LVS not supported on this platform" > $@
endif

clean_finish:
	rm -rf $(RESULTS_DIR)/4_*.gds $(RESULTS_DIR)/4_*.oas $(RESULTS_DIR)/4_*.def $(RESULTS_DIR)/4_*.v $(RESULTS_DIR)/4_*.sdc
	rm -rf $(REPORTS_DIR)/4_*.rpt
	rm -f  $(LOG_DIR)/4_*

# ==============================================================================
#  ____ ___ __  __ _   _ _        _  _____ ___ ___  _   _
# / ___|_ _|  \/  | | | | |      / \|_   _|_ _/ _ \| \ | |
# \___ \| || |\/| | | | | |     / _ \ | |  | | | | |  \| |
#  ___) | || |  | | |_| | |___ / ___ \| |  | | |_| | |\  |
# |____/___|_|  |_|\___/|_____/_/   \_\_| |___\___/|_| \_|
# ==============================================================================
SIMULATION_SCRIPT = ../tools/simulation/runMFDASim.py
LENGTH_FILE       = $(RESULTS_DIR)/$(DESIGN)_length.csv
XYCE_RUN_CONFIG   = $(RESULTS_DIR)/xyce_run.config

.PHONY: simulate clean_simulate
simulate: $(RESULTS_DIR)/simulation/$(DESIGN_NICKNAME)_xyceOut.csv
clean_simulate:
	rm -rf $(RESULTS_DIR)/xyceOut.csv
	rm -rf $(RESULTS_DIR)/simulation
	rm -rf $(RESULTS_DIR)/simulation.log
	rm -rf $(RESULTS_DIR)/xyce_run.config

ifneq ($(SIMULATION_CONFIG),)
$(XYCE_RUN_CONFIG): $(XYCE_LIB)
	echo '{"xyce_command":"$(XYCE_CMD)", "library_files":["$(XYCE_LIB)"]}' > $@

$(RESULTS_DIR)/simulation/$(DESIGN_NICKNAME)_xyceOut.csv: $(RESULTS_DIR)/4_final.scad $(RESULTS_DIR)/4_final.v $(RESULTS_DIR)/1_synth.v $(SIMULATION_CONFIG) $(RESULTS_DIR)/xyce_run.config
	mkdir -p $(RESULTS_DIR)/simulation
	$(TIME_CMD) python3 $(SIMULATION_SCRIPT) \
		$(SIMULATION_ARGS) $(XYCE_SCRIPT_ARGS) \
		--netlist $(RESULTS_DIR)/4_final.v \
		--sim_config $(SIMULATION_CONFIG) \
		--design $(DESIGN) \
		--sim_dir $(RESULTS_DIR)/simulation \
		--cir_config ../tools/simulation/V2Va_Parser/VMF_template.mfsp \
		--local_xyce \
		--xyce_run_config $(XYCE_RUN_CONFIG) \
		--length_file $(LENGTH_FILE) \
		--lib ../tools/simulation/stdCellLib/StandardCellLibrary.csv 2>&1 | tee $(RESULTS_DIR)/simulation.log

# cp $(RESULTS_DIR)/Chem_Eval.csv Chem_Eval_base.csv

# --output_dir $(RESULTS_DIR) \
# --length_file $(RESULTS_DIR)/$(DESIGN)_lengths.csv
endif

# ==============================================================================
#  ____   ____    _    ____
# / ___| / ___|  / \  |  _ \
# \___ \| |     / _ \ | | | |
#  ___) | |___ / ___ \| |_| |
# |____/ \____/_/   \_\____/
.PHONY: scad render slice zip
scad: $(RESULTS_DIR)/4_final.scad
render: $(RESULTS_DIR)/4_final.stl
slice: $(RESULTS_DIR)/$(DESIGN).slices
zip: $(RESULTS_DIR)/$(DESIGN).$(PLATFORM).zip
# ==============================================================================
# $(TIME_CMD) python3 ../../generator_v2/generator_v2.py $(SCAD_ARGS) \

#$(RESULTS_DIR)/$(DESIGN).scad: $(RESULTS_DIR)/4_final.def $(LIBRARY_DEPS)
$(RESULTS_DIR)/4_final.scad: $(RESULTS_DIR)/4_final.def $(LIBRARY_DEPS)
	mkdir -p "$(RESULTS_DIR)"
	$(TIME_CMD) python3 $(SCAD_SCRIPT) $(SCAD_ARGS) \
		--def_file $< \
        --design ${DESIGN} \
				--scad_out_file $(RESULTS_DIR)/$(DESIGN)_base.scad \
		--results_dir "$(RESULTS_DIR)" 2>&1 | tee $@.log
	cp $(RESULTS_DIR)/$(DESIGN)_base.scad $(RESULTS_DIR)/4_final.scad

				#--scad_out_file $(RESULTS_DIR)/$(DESIGN)_base.scad \
# $(RESULTS_DIR)/5_scad.scad: $(RESULTS_DIR)/$(DESIGN).scad
# 	cp $^ $@

%.stl: %.scad
	$(TIME_CMD) $(OPENSCAD) -m make -o $@ -d $@.deps $< 2>&1 | tee $(LOG_DIR)/5_2_stl_render.log

%.slices: %.stl
	$(TIME_CMD) $(XBUF) python3 ../tools/slicer/pyqt5/app_qt.py $< ${LAYER_VAL} $@ 2>&1 | tee $(LOG_DIR)/5_3_slicer.log

${RESULTS_DIR}/${DESIGN}.${PLATFORM}.zip: ${RESULTS_DIR}/${DESIGN}.slices
	7z a -tzip $@ ${RESULTS_DIR}

clean_render:
	rm -rf $(RESULTS_DIR)/${DESIGN}.slices $(RESULTS_DIR)/${DESIGN}.stl
	rm -rf $(RESULTS_DIR)/*.scad
	rm -rf $(RESULTS_DIR)/${DESIGN}_lengths.csv
	rm -rf $(RESULTS_DIR)/wire_length.csv
	rm -rf $(RESULTS_DIR)/${DESIGN}.scad.log

clean_zip:
	rm -rf ${RESULTS_DIR}/${DESIGN}.${PLATFORM}.zip

# ==============================================================================
#  __  __ ___ ____   ____
# |  \/  |_ _/ ___| / ___|
# | |\/| || |\___ \| |
# | |  | || | ___) | |___
# |_|  |_|___|____/ \____|
#
# ==============================================================================

all: $(SDC_FILE) $(WRAPPED_LIBS) $(DONT_USE_LIBS) $(OBJECTS_DIR)/klayout.lyt $(WRAPPED_GDSOAS)
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	($(TIME_CMD) $(OPENROAD_CMD) $(SCRIPTS_DIR)/run_all.tcl -metrics $(LOG_DIR)/run_all.json) 2>&1 | tee $(LOG_DIR)/run_all.log

clean:
	@echo
	@echo "Make clean disabled."
	@echo "Use make clean_all or clean individual steps:"
	@echo "  clean_synth clean_floorplan clean_place clean_cts clean_route clean_render clean_zip clean_finish"
	@echo

clean_metadata:

clean_all: clean_synth clean_floorplan clean_place clean_route clean_finish clean_metadata clean_render clean_zip
	rm -rf $(OBJECTS_DIR)

nuke: clean_test clean_issues
	rm -rf ./results ./logs ./reports ./objects
	rm -rf layer_*.mps macrocell.list *best.plt *_pdn.def dummy.guide
	rm -rf *.rpt *.rpt.old *.def.v pin_dumper.log
	rm -rf versions.txt


# DEF/GDS/OAS viewer shortcuts
#-------------------------------------------------------------------------------
RESULTS_DEF = $(notdir $(sort $(wildcard $(RESULTS_DIR)/*.def)))
RESULTS_GDS = $(notdir $(sort $(wildcard $(RESULTS_DIR)/*.gds)))
RESULTS_OAS = $(notdir $(sort $(wildcard $(RESULTS_DIR)/*.oas)))
$(foreach file,$(RESULTS_DEF) $(RESULTS_GDS) $(RESULTS_OAS),klayout_$(file)): klayout_%: $(OBJECTS_DIR)/klayout.lyt
	$(KLAYOUT_CMD) -nn $(OBJECTS_DIR)/klayout.lyt $(RESULTS_DIR)/$*

gui_final: gui_4_final.def

$(foreach file,$(RESULTS_DEF),gui_$(file)): gui_%:
	DEF_FILE=$(RESULTS_DIR)/$* $(OPENROAD_GUI_CMD) $(SCRIPTS_DIR)/gui.tcl

# Utilities
#-------------------------------------------------------------------------------
# include $(UTILS_DIR)/utils.mk
#export PRIVATE_DIR = ../../private_tool_scripts
#include $(PRIVATE_DIR)/private.mk
