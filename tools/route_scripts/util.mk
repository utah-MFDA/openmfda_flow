
PYTHON3 ?= python3

ifneq ($(FLOW_HOME),)
THIS_DIR_FROM_FLOW = $(realpath $(FLOW_HOME)/../tools/route_scripts)
endif
ifneq ($(FLOW_DIR),)
THIS_DIR_FROM_FLOW = $(realpath $(FLOW_DIR)/../tools/route_scripts)
endif

FIX_PY_SCRIPT = $(THIS_DIR_FROM_FLOW)/routing_fix_main.py

FIX_DEF ?=

FIX_SCAD ?=

# --------------------------------
#  run if FIX_DEF is nonblank
ifneq ($(strip $(FIX_DEF)),)
OUT_FIX_DEF = $(patsubst %.def,%_fix.def,$(FIX_DEF))

OUT_FIX_SCAD = $(patsubst %.def,%_fixbase.scad,$(FIX_DEF))

OPT_FIX_ARGS ?=

# --------------------------------
#  include additional LEF files
ifneq ($(ADDITIONAL_LEFS),)
OPT_FIX_ARGS += --additional_lefs $(ADDITIONAL_LEFS)
endif

ifeq ($(PLATFORM),h.r.3.3)
PLATFORM_CONF_JSON ?= $(THIS_DIR_FROM_FLOW)/testing_files/h.r.3.3.techlef.config.json
endif

# --------------------------------
#  manual definition of the routing grid
ifeq ($(strip $(FIX_GRID_SIZE)),)
OPT_FIX_ARGS += --grid_size 88 52 10
else
OPT_FIX_ARGS += --grid_size $(FIX_GRID_SIZE)
endif

OPT_FIX_ARGS += --def_scale 1000

# run fix def
$(OUT_FIX_DEF): $(FIX_DEF)
	$(PYTHON3) $(FIX_PY_SCRIPT) \
		--def_file $(FIX_DEF) \
		--design_name $(DESIGN_NAME) \
		--platform_conf $(PLATFORM_CONF_JSON) \
		--src_lef $(SC_LEF) \
		--output_def $(OUT_FIX_DEF) \
		$(OPT_FIX_ARGS)

# parser.add_argument('--def_file', required=True)
# parser.add_argument('--design_name', required=True)
# parser.add_argument('--platform_conf', required=True)
# parser.add_argument('--src_lef', required=True)
# parser.add_argument('--additional_lefs', nargs='+')
#
# parser.add_argument('--output_def')
# parser.add_argument('--grid_size', nargs=3)
# parser.add_argument('--def_scale', type=int)
# parser.add_argument('--write_polyroute',
#                     action='store_true', default=False)

endif
# of if FIX_DEF

ifneq ($(OUT_FIX_SCAD),)


# --------------------------------
# add additional scad files
SCAD_LIB ?= $(PLATFORM_DIR)/pdk/scad_lib

ifneq ($(SCAD_INCLUDE_FILES),)
SCAD_INCLUDE_FILES += $(SCAD_LIB)/polychannel_v2.scad $(SCAD_LIB)/lef_helper.scad $(SCAD_LIB)/lef_scad_config.scad
else
SCAD_INCLUDE_FILES = $(SCAD_LIB)/polychannel_v2.scad $(SCAD_LIB)/lef_helper.scad $(SCAD_LIB)/lef_scad_config.scad
endif

ifneq ($(PCELL_MERGE_LEF),)
SCAD_ARGS += --pcell $(SCAD_PCELL)
endif

# run generate scad of fixed device
$(OUT_FIX_SCAD): $(OUT_FIX_DEF) $(LIBRARY_DEPS)
	mkdir -p "$(RESULTS_DIR)"
	$(TIME_CMD) python3 $(SCAD_SCRIPT) $(SCAD_ARGS) \
		--def_file $< \
        --design ${DESIGN_NAME} \
				--scad_out_file $(OUT_FIX_SCAD) \
				--scad_include $(SCAD_INCLUDE_FILES) \
		--results_dir "$(RESULTS_DIR)" 2>&1 | tee $@.log
	cp $(OUT_FIX_SCAD) $(RESULTS_DIR)/4_final_fix.scad

endif # OUT_FIX_SCAD

fix_route: $(OUT_FIX_DEF)
	echo $(OUT_FIX_DEF)

fix_render: $(OUT_FIX_SCAD)
