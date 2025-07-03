puts "******************************** Placing IO pads"

make_io_sites -horizontal_site IO_SIDE \
    -vertical_site IO_TOP \
    -corner_site IO_CORNER \
    -offset 0 \
    -rotation_vertical R90

# THESE MUST HAVE NO SPACES AROUND THE PORT NAME
place_pad -master pinhole_320px_1 -row IO_WEST -location 320 {pinholes\[1\].out\[0\].hole}
place_pad -master pinhole_320px_0 -row IO_WEST -location 640 {pinholes\[0\].in\[1\].hole}
place_pad -master pinhole_320px_0 -row IO_WEST -location 960 {pinholes\[0\].in\[0\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 320 {pinholes\[0\].in\[2\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 640 {pinholes\[1\].in\[1\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 800 {pinholes\[1\].in\[2\].hole}
place_pad -master pinhole_320px_0 -row IO_EAST -location 960 {pinholes\[1\].in\[0\].hole}
place_pad -master pinhole_320px_1 -row IO_NORTH -location 1120 {pinholes\[0\].out\[2\].hole}
place_pad -master pinhole_320px_1 -row IO_NORTH -location 1760  {pinholes\[1\].out\[2\].hole}
place_pad -master pinhole_320px_1 -row IO_NORTH -location 1920 {pinholes\[1\].out\[3\].hole}
place_pad -master pinhole_320px_1 -row IO_NORTH -location 960 {pinholes\[0\].out\[1\].hole}
place_pad -master pinhole_320px_1 -row IO_EAST -location 800 {pinholes\[0\].out\[3\].hole}
place_pad -master pinhole_320px_1 -row IO_SOUTH -location 480  {pinholes\[1\].out\[1\].hole}
place_pad -master pinhole_320px_1 -row IO_SOUTH -location 640 {pinholes\[0\].out\[0\].hole}

place_pad -master flush_hole_0 -row IO_SOUTH -location 960  {flush\[0\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1000  {flush\[1\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1040  {flush\[2\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1080  {flush\[3\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1120  {flush\[4\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1160  {flush\[5\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1200  {flush\[6\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1240  {flush\[7\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1280  {flush\[8\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1320  {flush\[9\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1360  {flush\[10\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1400  {flush\[11\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1440  {flush\[12\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1480  {flush\[13\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1520  {flush\[14\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1560  {flush\[15\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1600  {flush\[16\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1640  {flush\[17\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1680  {flush\[18\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1720  {flush\[19\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1760  {flush\[20\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1800  {flush\[21\].hole}

place_io_terminals pinhole*/pad
place_io_terminals flush*/pad

remove_io_rows

place_inst -name interconnect -origin { 960 570 } -orient R0 -status FIRM
puts "******************************** Finished placing IO pads"
