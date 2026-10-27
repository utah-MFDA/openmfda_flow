if {![info exists standalone] || $standalone} {
  # Read lef
  read_lef $::env(TECH_LEF)
  read_lef $::env(SC_LEF)
  if {[info exists ::env(ADDITIONAL_LEFS)]} {
    foreach lef $::env(ADDITIONAL_LEFS) {
      read_lef $lef
    }
  }

  # Read liberty files
  foreach libFile $::env(LIB_FILES) {
    read_liberty $libFile
  }

  # Read design files
  read_def $::env(RESULTS_DIR)/2_2_place_iop.def
  read_sdc $::env(RESULTS_DIR)/1_floorplan.sdc
  if [file exists $::env(PLATFORM_DIR)/derate.tcl] {
    source $::env(PLATFORM_DIR)/derate.tcl
  }
} else {
  puts "Starting detailed placement"
}

source $::env(PLATFORM_DIR)/setRC.tcl

set_placement_padding -global \
    -left $::env(CELL_PAD_IN_SITES_DETAIL_PLACEMENT) \
    -right $::env(CELL_PAD_IN_SITES_DETAIL_PLACEMENT)
detailed_placement
optimize_mirroring
#utl::info FLW 12 "Placement violations [check_placement -verbose]."

estimate_parasitics -placement

source $::env(SCRIPTS_DIR)/report_metrics.tcl
report_metrics "detailed place"

if {![info exists standalone] || $standalone} {
  # write output
  write_def $::env(RESULTS_DIR)/2_3_place_dp.def
  write_def $::env(RESULTS_DIR)/2_place.def
  exit
}

source ./scripts/global_route.tcl
read_guide $::env(RESULTS_DIR)/route.guide

# detailed_route
set_thread_count $::env(NUM_CORES)

set additional_args ""
if { ![info exists ::env(USE_WXL)]} {
    #append additional_args " -guide $::env(RESULTS_DIR)/route.guide"
    read_guides $::env(RESULTS_DIR)/route.guide
}
if { [info exists ::env(dbProcessNode)]} {
  append additional_args " -db_process_node $::env(dbProcessNode)"
}
if { [info exists ::env(OR_SEED)]} {
  append additional_args " -or_seed $::env(OR_SEED)"
}
if { [info exists ::env(OR_K)]} {
  append additional_args " -or_k $::env(OR_K)"
}

if { [info exists ::env(MIN_ROUTING_LAYER)]} {
  append additional_args " -bottom_routing_layer $::env(MIN_ROUTING_LAYER)"
}
if { [info exists ::env(MAX_ROUTING_LAYER)]} {
  append additional_args " -top_routing_layer $::env(MAX_ROUTING_LAYER)"
}
if { [info exists ::env(VIA_IN_PIN_MIN_LAYER)]} {
  append additional_args " -droute_via_in_pin_bottom_layer_num $::env(VIA_IN_PIN_MIN_LAYER)"
}
if { [info exists ::env(VIA_IN_PIN_MAX_LAYER)]} {
  append additional_args " -droute_via_in_pin_top_layer_num $::env(VIA_IN_PIN_MAX_LAYER)"
}

# change file names for SCAD regeneration
detailed_route -output_drc $::env(REPORTS_DIR)/3_route_drc_1.rpt \
               -output_guide $::env(RESULTS_DIR)/output_guide_1.mod \
               -output_maze $::env(RESULTS_DIR)/maze_1.log \
               -droute_end_iter 2 \
               -verbose 1 \
               {*}$additional_args

report_wire_length -net {*} \
                   -file $env(RESULTS_DIR)/wire_length.csv \
                   -verbose

write_def $::env(RESULTS_DIR)/3_route_1.def