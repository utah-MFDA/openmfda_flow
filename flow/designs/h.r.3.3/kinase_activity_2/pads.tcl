# make_fake_io_site -name IO_LOW -width 300 -height 204
# make_fake_io_site -name IO_MID -width 1 -height 200
# make_fake_io_site -name IO_HIGH -width 1 -height 200

# make_fake_io_site -name IO_SIDE -width 1 -height 200
# make_fake_io_site -name IO_TOP -width 1 -height 200
# make_fake_io_site -name IO_CORNER -width 200 -height 204

make_io_sites -horizontal_site IO_SIDE \
    -vertical_site IO_TOP \
    -corner_site IO_CORNER \
    -offset 0 \
    -rotation_vertical R90

place_pad -row IO_WEST -location 1030 {pinhole1}
place_pad -row IO_WEST -location 1170 {pinhole2}
place_pad -row IO_NORTH -location 330 {pinhole3}
place_pad -row IO_NORTH -location 470 {pinhole4}
place_pad -row IO_NORTH -location 610 {pinhole5}
place_pad -row IO_NORTH -location 750 {pinhole6}
place_pad -row IO_NORTH -location 890 {pinhole7}
place_pad -row IO_NORTH -location 1030 {pinhole8}
place_pad -row IO_NORTH -location 1170 {pinhole9}
place_pad -row IO_EAST -location 1030 {pinhole10}
place_pad -row IO_NORTH -location 1450 {pinhole11}
place_pad -row IO_NORTH -location 1590 {pinhole12}
place_pad -row IO_NORTH -location 1730 {pinhole13}
place_pad -row IO_NORTH -location 1870 {pinhole14}

# set iofill {sky130_ef_io__com_bus_slice_20um
#             sky130_ef_io__com_bus_slice_10um
#             sky130_ef_io__com_bus_slice_5um
#             sky130_ef_io__com_bus_slice_1um}
# place_io_fill -row IO_WEST {*}$iofille

make_io_bump_array -bump interconnect \
    -rows 4 \
    -columns 8 \
    -pitch { 90 90 } \
    -origin { 960 660 }

assign_io_bump -net c1 BUMP_0_0
assign_io_bump -net c9 BUMP_0_1
assign_io_bump -net s1 BUMP_0_2
assign_io_bump -net c2 BUMP_1_0
assign_io_bump -net c10 BUMP_1_1
assign_io_bump -net s2 BUMP_1_2
assign_io_bump -net c3 BUMP_2_0
assign_io_bump -net c11 BUMP_2_1
assign_io_bump -net s3 BUMP_2_2
assign_io_bump -net c4 BUMP_3_0
assign_io_bump -net c12 BUMP_3_1
assign_io_bump -net s4 BUMP_3_2
assign_io_bump -net c5 BUMP_4_0
assign_io_bump -net c13 BUMP_4_1
assign_io_bump -net p4 BUMP_4_2
assign_io_bump -net c6 BUMP_5_0
assign_io_bump -net p1 BUMP_5_1
assign_io_bump -net p5 BUMP_5_2
assign_io_bump -net c7 BUMP_6_0
assign_io_bump -net p2 BUMP_6_1
assign_io_bump -net c8 BUMP_7_0
assign_io_bump -net p3 BUMP_7_1

place_io_terminals pinhole*/pad
place_io_terminals ic.interconnect*/pad

remove_io_rows
