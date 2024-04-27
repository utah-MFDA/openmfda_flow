yosys -import

if {[info exist ::env(GENERAL_MAP_FILE)]} {
  read_verilog $::env(GENERAL_MAP_FILE)
}

foreach file $::env(VERILOG_FILES) {
  read_verilog -sv $file
}

tee -o $::env(REPORTS_DIR)/synth_base.txt stat
flatten
hierarchy -top $::env(DESIGN)
tee -o $::env(REPORTS_DIR)/synth_stat.txt stat
write_verilog -noattr -noexpr -nohex -nodec $::env(RESULTS_DIR)/1_0_yosys.v
