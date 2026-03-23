make_io_sites -horizontal_site IO_SIDE \
    -vertical_site IO_TOP \
    -corner_site IO_CORNER \
    -offset 0 \
    -rotation_vertical R90

# THESE MUST HAVE NO SPACES AROUND THE PORT NAME
place_pad -master pinhole_325px_0 -row IO_WEST -location 1030 {pinhole1}
place_pad -master pinhole_325px_0 -row IO_WEST -location 1170 {pinhole2}
place_pad -master pinhole_325px_0 -row IO_NORTH -location 330 {pinhole3}
place_pad -master pinhole_325px_0 -row IO_NORTH -location 470 {pinhole4}
place_pad -master pinhole_325px_0 -row IO_NORTH -location 610 {pinhole5}
place_pad -master pinhole_325px_0 -row IO_NORTH -location 750 {pinhole6}
place_pad -master pinhole_325px_0 -row IO_NORTH -location 890 {pinhole7}
place_pad -master pinhole_325px_0 -row IO_NORTH -location 1030 {pinhole8}
place_pad -master pinhole_325px_0 -row IO_NORTH -location 1170 {pinhole9}
place_pad -master pinhole_325px_0 -row IO_EAST -location 1030 {pinhole10}
place_pad -master pinhole_325px_0 -row IO_NORTH -location 1450 {pinhole11}
place_pad -master pinhole_325px_0 -row IO_NORTH -location 1590 {pinhole12}
place_pad -master pinhole_325px_0 -row IO_NORTH -location 1730 {pinhole13}
place_pad -master pinhole_325px_0 -row IO_NORTH -location 1870 {pinhole14}

place_io_terminals pinhole*/pad

remove_io_rows
