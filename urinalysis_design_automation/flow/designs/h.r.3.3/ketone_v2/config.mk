export DESIGN_NAME     	= ketone_v2
export VERILOG_FILES 	= ./designs/src/$(DESIGN_NAME)/$(DESIGN_NAME).v
export SDC_FILE      	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc
export IO_CONSTRAINTS	= ./designs/$(PLATFORM)/$(DESIGN_NAME)/io_constraints.tcl
export SIMULATION_CONFIG= ./designs/$(PLATFORM)/$(DESIGN_NAME)/simulation.config
SCAD_ARGS += --dimm_file "$(DIMM_FILE)" 
SCAD_LIB = $(PLATFORM_DIR)/pdk/scad_lib
export XYCE_WL_GRAPH = ./$(RESULTS_DIR)/$(DESIGN_NAME)_route_nets.json

export GLOBAL_PLACEMENT_ARGS = -skip_nesterov_place

export BUILD_PDK_LIBRARY ?= T
include $(FLOW_HOME)/../tools/p_cell_generator/util.mk

# export XYCE_LIB = $(PLATFORM_DIR)/pdk/Components/verilogA_build/.libs/MFXyce.so

# For updating routing, SCAD rendering, and simulation following .def file modification
SCAD_DEF = 3_route_1.def
#SCAD_DEF = 3_route.def

run_tcl_script: $(PCELL_MERGE_LEF)
	$(OPENROAD_CMD) ./scripts/update_design.tcl
	make re_render
	make re_simulate

export ADDITIONAL_LEFS += $(PCELL_MERGE_LEF)

gen_pcells: $(PCELL_MERGE_LEF)
re_render: $(RESULTS_DIR)/$(DESIGN)_reroute.scad
re_simulate: $(RESULTS_DIR)/xyceOut_1.csv

LENGTH_FILE_REROUTE = $(RESULTS_DIR)/7_$(DESIGN)_length.csv
ROUTE_MAP_OUT_REROUTE = $(RESULTS_DIR)/7_$(DESIGN)_route_nets.json

$(RESULTS_DIR)/$(DESIGN)_reroute.scad: $(RESULTS_DIR)/$(SCAD_DEF) $(LIBRARY_DEPS)
	mkdir -p "$(RESULTS_DIR)"
	$(TIME_CMD) python3 $(SCAD_SCRIPT) $(SCAD_ARGS) \
		--def_file $< \
        --design $(DESIGN) \
		--length_out $(LENGTH_FILE_REROUTE) \
		--route_map_out $(ROUTE_MAP_OUT_REROUTE) \
		--scad_out_file $(RESULTS_DIR)/$(DESIGN)_reroute.scad \
		--results_dir "$(RESULTS_DIR)" 2>&1 | tee $@.log

$(RESULTS_DIR)/xyceOut_1.csv: $(RESULTS_DIR)/$(DESIGN)_reroute.scad $(SIMULATION_CONFIG) $(RESULTS_DIR)/xyce_run.config
	mkdir -p $(RESULTS_DIR)/simulation
	$(TIME_CMD) python3 $(SIMULATION_SCRIPT) \
		$(SIMULATION_ARGS) \
		--output_dir $(RESULTS_DIR) \
		--netlist $(VERILOG_FILES) \
		--sim_config $(SIMULATION_CONFIG) \
		--design $(DESIGN) \
		--sim_dir $(RESULTS_DIR)/simulation \
		--cir_config ../tools/simulation/V2Va_Parser/VMF_template.mfsp \
		--local_xyce \
		--xyce_run_config $(RESULTS_DIR)/xyce_run.config \
		--length_file $(LENGTH_FILE_REROUTE) \
        --pcell_file $(RESULTS_DIR)/pcell_out_xyce \
--lib ../tools/simulation/stdCellLib/StandardCellLibrary.csv 2>&1 | tee $(RESULTS_DIR)/simulation.log
        