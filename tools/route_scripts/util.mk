
PYTHON3 ?= python3

THIS_DIR_FROM_FLOW = ../tools/route_scripts
FIX_PY_SCRIPT = $(THIS_DIR_FROM_FLOW)/routing_fix_main.py

FIX_DEF ?=

FIX_SCAD ?=

ifneq ($(FIX_DEF),)
OUT_FIX_DEF = $(patsubst %.def,%_fix.def,$(FIX_DEF))

OUT_FIX_SCAD = $(patsubst %.def,%_fixbase.scad,$(FIX_DEF))

OPT_FIX_ARGS ?=

ifneq ($(ADDITIONAL_LEFS),)
OPT_FIX_ARGS += --additional_lefs $(ADDITIONAL_LEFS)
endif

ifeq ($(PLATFORM),h.r.3.3)
PLATFORM_CONF_JSON ?= $(THIS_DIR_FROM_FLOW)/testing_files/h.r.3.3.techlef.config.json
endif

OPT_FIX_ARGS += --grid_size 84 52 10
OPT_FIX_ARGS += --def_scale 1000

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

ifneq ($(OUT_FIX_SCAD),)

ifneq ($(SCAD_INCLUDE_FILES),)
SCAD_INCLUDE_FILES += $(SCAD_LIB)/polychannel_v2.scad $(SCAD_LIB)/lef_helper.scad $(SCAD_LIB)/lef_scad_config.scad
else
SCAD_INCLUDE_FILES = $(SCAD_LIB)/polychannel_v2.scad $(SCAD_LIB)/lef_helper.scad $(SCAD_LIB)/lef_scad_config.scad
endif

ifneq ($(PCELL_MERGE_LEF),)
SCAD_ARGS += --pcell $(SCAD_PCELL)
endif

$(OUT_FIX_SCAD)_fixbase.scad: $(FIX_DEF) $(LIBRARY_DEPS)
	mkdir -p "$(RESULTS_DIR)"
	$(TIME_CMD) python3 $(SCAD_SCRIPT) $(SCAD_ARGS) \
		--def_file $< \
        --design ${DESIGN} \
				--scad_out_file $(RESULTS_DIR)/$(FIX_SCAD)_base.scad \
				--scad_include $(SCAD_INCLUDE_FILES) \
		--results_dir "$(RESULTS_DIR)" 2>&1 | tee $@.log
	cp $(RESULTS_DIR)/$(FIX_SCAD)_fixbase.scad $(RESULTS_DIR)/4_final.scad
endif # OUT_FIX_SCAD

fix_route: $(OUT_FIX_DEF)

fix_render: $(OUT_FIX_SCAD)
