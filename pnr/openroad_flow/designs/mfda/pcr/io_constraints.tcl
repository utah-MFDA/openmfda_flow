# FUNCTIONALITY
# set_io_pin_constraint -direction <direction> \
                        -pin_names <names> \
                        -region <edge:interval>

# set_io_pin_constraint -pin_names f_primer -region top:325-475
# set_io_pin_constraint -pin_names r_primer -region left:975-1275
# set_io_pin_constraint -pin_names {evagr h20 taq} -region left:*
# set_io_pin_constraint -pin_names {in_air0 in_air1} -region top:*
# set_io_pin_constraint -pin_names {out_air0 out_air1 dna} -region bottom:*
# set_io_pin_constraint -pin_name o -region right:*

place_pin -pin_name r_primer -layer met4 -location {925 950} -pin_size {1 1}
place_pin -pin_name f_primer -layer met4 -location {1025 950} -pin_size {1 1}
place_pin -pin_name in_air0 -layer met4 -location {1125 950} -pin_size {1 1}
place_pin -pin_name in_air1 -layer met4 -location {1225 950} -pin_size {1 1}
# place_pin -pin_name pin_15 -layer met4 -location {1325 950} -pin_size {1 1}
# place_pin -pin_name pin_16 -layer met4 -location {1425 950} -pin_size {1 1}
# place_pin -pin_name pin_17 -layer met4 -location {1525 950} -pin_size {1 1}
# place_pin -pin_name pin_18 -layer met4 -location {1625 950} -pin_size {1 1}

place_pin -pin_name evagr -layer met4 -location {925 850} -pin_size {1 1}
# place_pin -pin_name pin_22 -layer met4 -location {1025 850} -pin_size {1 1}
# place_pin -pin_name pin_23 -layer met4 -location {1125 850} -pin_size {1 1}
# place_pin -pin_name pin_24 -layer met4 -location {1225 850} -pin_size {1 1}
# place_pin -pin_name pin_25 -layer met4 -location {1325 850} -pin_size {1 1}
# place_pin -pin_name pin_26 -layer met4 -location {1425 850} -pin_size {1 1}
# place_pin -pin_name pin_27 -layer met4 -location {1525 850} -pin_size {1 1}
# place_pin -pin_name pin_28 -layer met4 -location {1625 850} -pin_size {1 1}

place_pin -pin_name h20 -layer met4 -location {925 750} -pin_size {1 1}
# place_pin -pin_name pin_32 -layer met4 -location {1025 750} -pin_size {1 1}
# place_pin -pin_name pin_33 -layer met4 -location {1125 750} -pin_size {1 1}
# place_pin -pin_name pin_34 -layer met4 -location {1225 750} -pin_size {1 1}
# place_pin -pin_name pin_35 -layer met4 -location {1325 750} -pin_size {1 1}
# place_pin -pin_name pin_36 -layer met4 -location {1425 750} -pin_size {1 1}
# place_pin -pin_name pin_37 -layer met4 -location {1525 750} -pin_size {1 1}
# place_pin -pin_name pin_38 -layer met4 -location {1625 750} -pin_size {1 1}

place_pin -pin_name taq -layer met4 -location {925 650} -pin_size {1 1}
# place_pin -pin_name pin_42 -layer met4 -location {1025 650} -pin_size {1 1}
place_pin -pin_name out_air0 -layer met4 -location {1125 650} -pin_size {1 1}
place_pin -pin_name out_air1 -layer met4 -location {1225 650} -pin_size {1 1}
place_pin -pin_name dna -layer met4 -location {1325 650} -pin_size {1 1}
# place_pin -pin_name pin_46 -layer met4 -location {1425 650} -pin_size {1 1}
# place_pin -pin_name pin_47 -layer met4 -location {1525 650} -pin_size {1 1}
place_pin -pin_name o -layer met4 -location {1625 650} -pin_size {1 1}