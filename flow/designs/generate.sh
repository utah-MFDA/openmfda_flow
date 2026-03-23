met=$1
cp -r h.r.3.3 h.r.3.3_met${met}
sed -i "s/-layer met9/-layer met${met}/" h.r.3.3_met${met}/*/io_constraints.tcl
