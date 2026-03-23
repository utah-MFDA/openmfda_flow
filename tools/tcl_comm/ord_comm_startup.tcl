
# load nessary packages
source $::env(ORD_COMM_DIR)/snit.tcl
source $::env(ORD_COMM_DIR)/comm.tcl

package require comm

set id [::comm::comm self]

# write id to file
set fd [open $::env(ORD_COMM_DIR)/ord_id_file.txt w]
puts $fd $id
close $fd

# start event loop and listen
proc stop_server {} {set ::forever 1}
vwait forever
