
PYTHON3 ?= python3

FIX_PY_SCRIPT = routing_fix_main.py

ifdef $(FIX_DEF)
OUT_FIX_DEF = $(patsubst %.def,%_fix.def,$(FIX_DEF))

OPT_FIX_ARGS ?=

ifneq ($(ADDITIONAL_LEFS),)
OPT_FIX_ARGS += --additional_lefs $(ADDITIONAL_LEFS)
endif

ifeq ($(PLATFORM),h.r.3.3)
PLATFORM_CONF_JSON ?= testing_files/h.r.3.3.techlef.config.json
endif

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

fix_route: $(OUT_FIX_DEF)
