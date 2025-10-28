puts "******************************** Placing IO pads"

make_io_sites -horizontal_site IO_SIDE \
    -vertical_site IO_TOP \
    -corner_site IO_CORNER \
    -offset 0 \
    -rotation_vertical R90

# THESE MUST HAVE NO SPACES AROUND THE PORT NAME

place_pad -master pinhole_320px_0 -row IO_WEST -location 320 {pinholes\[0\].in\[0\].hole}
place_pad -master pinhole_320px_0 -row IO_WEST -location 480 {pinholes\[1\].in\[0\].hole}
place_pad -master pinhole_320px_0 -row IO_WEST -location 640 {pinholes\[0\].in\[1\].hole}
place_pad -master pinhole_320px_0 -row IO_WEST -location 800 {pinholes\[1\].in\[1\].hole}
place_pad -master pinhole_320px_0 -row IO_WEST -location 960 {pinholes\[0\].in\[2\].hole}
place_pad -master pinhole_320px_0 -row IO_WEST -location 1120 {pinholes\[1\].in\[2\].hole}

place_pad -master pinhole_320px_0 -row IO_NORTH -location 480 {pinholes\[0\].out\[0\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 640 {pinholes\[1\].out\[0\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 960 {pinholes\[0\].out\[1\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 1120  {pinholes\[1\].out\[1\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 1440 {pinholes\[0\].out\[2\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 1600  {pinholes\[1\].out\[2\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 1760 {pinholes\[0\].out\[3\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 1920 {pinholes\[1\].out\[3\].hole}


place_pad -master flush_hole_0 -row IO_SOUTH -location 330  {flush\[0\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 450  {flush\[1\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 570  {flush\[2\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 690  {flush\[3\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 810  {flush\[4\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 930  {flush\[5\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1050  {flush\[6\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1170  {flush\[7\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1290  {flush\[8\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1410  {flush\[9\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1530  {flush\[10\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1650  {flush\[11\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1770  {flush\[12\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1890  {flush\[13\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 2010  {flush\[14\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 2130  {flush\[15\].hole}
place_pad -master flush_hole_0 -row IO_EAST -location 560  {flush\[16\].hole}
place_pad -master flush_hole_0 -row IO_EAST -location 640  {flush\[17\].hole}
place_pad -master flush_hole_0 -row IO_EAST -location 720  {flush\[18\].hole}
place_pad -master flush_hole_0 -row IO_EAST -location 800  {flush\[19\].hole}
place_pad -master flush_hole_0 -row IO_EAST -location 880  {flush\[20\].hole}
place_pad -master flush_hole_0 -row IO_EAST -location 960  {flush\[21\].hole}

place_io_terminals pinhole*/pad
place_io_terminals flush*/pad

remove_io_rows

place_inst -name interconnect -origin { 960 570 } -orient R0 -status FIRM
puts "******************************** Finished placing IO pads"
