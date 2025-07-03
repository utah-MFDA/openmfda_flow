puts "******************************** Placing IO pads"

make_io_sites -horizontal_site IO_SIDE \
    -vertical_site IO_TOP \
    -corner_site IO_CORNER \
    -offset 0 \
    -rotation_vertical R90

# THESE MUST HAVE NO SPACES AROUND THE PORT NAME
place_pad -master pinhole_320px_0 -row IO_WEST -location 1120 {pinholes\[1\].out\[0\].hole}
place_pad -master pinhole_320px_0 -row IO_WEST -location 640 {pinholes\[0\].in\[1\].hole}
place_pad -master pinhole_320px_0 -row IO_WEST -location 960 {pinholes\[0\].in\[0\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 320 {pinholes\[0\].in\[2\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 640 {pinholes\[1\].in\[1\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 800 {pinholes\[1\].in\[2\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 960 {pinholes\[0\].out\[1\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 1120 {pinholes\[0\].out\[2\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 1760  {pinholes\[1\].out\[2\].hole}
place_pad -master pinhole_320px_0 -row IO_NORTH -location 1920 {pinholes\[1\].out\[3\].hole}
place_pad -master pinhole_320px_0 -row IO_EAST -location 960 {pinholes\[1\].in\[0\].hole}
place_pad -master pinhole_320px_0 -row IO_EAST -location 800 {pinholes\[0\].out\[3\].hole}
place_pad -master pinhole_320px_0 -row IO_SOUTH -location 480  {pinholes\[1\].out\[1\].hole}
place_pad -master pinhole_320px_0 -row IO_SOUTH -location 640 {pinholes\[0\].out\[0\].hole}

# place_pad -master pinhole_320px_0 -row IO_WEST -location 1030 {pinholes\[0\].in\[0\].hole}
# place_pad -master pinhole_320px_0 -row IO_WEST -location 1170 {pinholes\[0\].in\[1\].hole}

# place_pad -master pinhole_320px_0 -row IO_NORTH -location 470 {pinholes\[1\].in\[0\].hole}
# place_pad -master pinhole_320px_0 -row IO_NORTH -location 610 {pinholes\[1\].in\[1\].hole}
# place_pad -master pinhole_320px_0 -row IO_NORTH -location 750 {pinholes\[1\].in\[2\].hole}
# place_pad -master pinhole_320px_0 -row IO_NORTH -location 890 {pinholes\[0\].out\[0\].hole}
# place_pad -master pinhole_320px_0 -row IO_NORTH -location 1030 {pinholes\[0\].out\[1\].hole}
# place_pad -master pinhole_320px_0 -row IO_NORTH -location 1170 {pinholes\[0\].out\[2\].hole}
# place_pad -master pinhole_320px_0 -row IO_NORTH -location 1450 {pinholes\[1\].out\[0\].hole}plaplace_pad -master pinhole_320px_0 -row IO_NORTH -location 1590 {pinholes\[0\].in\[2\].hole}
# place_pad -master pinhole_320px_0 -row IO_NORTH -location 1730  {pinholes\[1\].out\[2\].hole}
# place_pad -master pinhole_320px_0 -row IO_NORTH -location 1870 {pinholes\[1\].out\[3\].hole}

# place_pad -master pinhole_320px_0 -row IO_EAST -location 1030 {pinholes\[0\].out\[3\].hole}
# place_pad -master pinhole_320px_0 -row IO_SOUTH -location 470  {pinholes\[1\].out\[1\].hole}


place_io_terminals pinhole*/pad

remove_io_rows

make_io_sites -horizontal_site FLUSH_SIDE \
    -vertical_site FLUSH_TOP \
    -corner_site FLUSH_CORNER \
    -offset 0 \
    -rotation_vertical R90

place_pad -master flush_hole_0 -row IO_SOUTH -location 1000  {flush\[0\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1050  {flush\[1\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1100  {flush\[2\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1150  {flush\[3\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1200  {flush\[4\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1250  {flush\[5\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1300  {flush\[6\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1350  {flush\[7\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1400  {flush\[8\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1450  {flush\[9\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1500  {flush\[10\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1550  {flush\[11\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1600  {flush\[12\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1650  {flush\[13\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1700  {flush\[14\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1750  {flush\[15\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1800  {flush\[16\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1850  {flush\[17\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1900  {flush\[18\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 1950  {flush\[19\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 2000  {flush\[20\].hole}
place_pad -master flush_hole_0 -row IO_SOUTH -location 2050  {flush\[21\].hole}

place_io_terminals flush*/pad
remove_io_rows

puts "******************************** Finished placing IO pads"
