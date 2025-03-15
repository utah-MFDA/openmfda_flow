if {![info exists standalone] || $standalone} {
  # Read lef
  read_lef $::env(TECH_LEF)
  read_lef $::env(SC_LEF)
  if {[info exist ::env(ADDITIONAL_LEFS)]} {
    foreach lef $::env(ADDITIONAL_LEFS) {
      read_lef $lef
    }
  }

  # Read liberty files
  foreach libFile $::env(LIB_FILES) {
    read_liberty $libFile
  }

  # Read verilog
  read_verilog $::env(RESULTS_DIR)/$::env(DESIGN_NICKNAME).v

  link_design $::env(DESIGN_NAME)
  read_sdc $::env(RESULTS_DIR)/$::env(DESIGN_NICKNAME).sdc
  if [file exists $::env(PLATFORM_DIR)/derate.tcl] {
    source $::env(PLATFORM_DIR)/derate.tcl
  }
  set num_instances [llength [get_cells -hier *]]
  puts "number instances in verilog is $num_instances"
} else {
  puts "Starting floorplan"
}

# Initialize floorplan using ICeWall FOOTPRINT
# ----------------------------------------------------------------------------

if {[info exists ::env(FOOTPRINT)]} {

  ICeWall load_footprint $env(FOOTPRINT)

  initialize_floorplan \
    -die_area  [ICeWall get_die_area] \
    -core_area [ICeWall get_core_area] \
    -sites      $::env(PLACE_SITE)

  ICeWall init_footprint $env(SIG_MAP_FILE)


# Initialize floorplan using CORE_UTILIZATION
# ----------------------------------------------------------------------------
} elseif {[info exists ::env(CORE_UTILIZATION)] && $::env(CORE_UTILIZATION) != "" } {
  initialize_floorplan -utilization $::env(CORE_UTILIZATION) \
                       -aspect_ratio $::env(CORE_ASPECT_RATIO) \
                       -core_space $::env(CORE_MARGIN) \
                       -site $::env(PLACE_SITE)

# Initialize floorplan using DIE_AREA/CORE_AREA
# ----------------------------------------------------------------------------
} else {
  initialize_floorplan -die_area $::env(DIE_AREA) \
                       -core_area $::env(CORE_AREA) \
                       -site $::env(PLACE_SITE)
}

if { [info exists ::env(MAKE_TRACKS)] } {
  source $::env(MAKE_TRACKS)
} else {
  source $::env(PLATFORM_DIR)/make_tracks.tcl
}

if {[info exists ::env(FOOTPRINT_TCL)]} {
  source $::env(FOOTPRINT_TCL)
  initialize_padring
}

if { [info exists ::env(POST_FLOORPLAN_TCL)] } {
  source $::env(POST_FLOORPLAN_TCL)
}

if {![info exists standalone] || $standalone} {
  # write output
  write_def $::env(RESULTS_DIR)/1_1_floorplan.def
  write_verilog $::env(RESULTS_DIR)/1_floorplan.v
  write_sdc $::env(RESULTS_DIR)/1_floorplan.sdc
}
