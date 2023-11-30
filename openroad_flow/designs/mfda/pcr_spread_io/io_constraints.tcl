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

place_pin -pin_name r_primer -layer met4 -location {225 1400} -pin_size {1 1}
place_pin -pin_name f_primer -layer met4 -location {525 1400} -pin_size {1 1}
place_pin -pin_name in_air0 -layer met4 -location {825 1400} -pin_size {1 1}
place_pin -pin_name in_air1 -layer met4 -location {1125 1400} -pin_size {1 1}
# place_pin -pin_name pin_15 -layer met4 -location {1425 1400} -pin_size {1 1}
# place_pin -pin_name pin_16 -layer met4 -location {1725 1400} -pin_size {1 1}
# place_pin -pin_name pin_17 -layer met4 -location {2025 1400} -pin_size {1 1}
# place_pin -pin_name pin_18 -layer met4 -location {2325 1400} -pin_size {1 1}

place_pin -pin_name evagr -layer met4 -location {225 1000} -pin_size {1 1}
# place_pin -pin_name pin_22 -layer met4 -location {525 1000} -pin_size {1 1}
# place_pin -pin_name pin_23 -layer met4 -location {825 1000} -pin_size {1 1}
# place_pin -pin_name pin_24 -layer met4 -location {1125 1000} -pin_size {1 1}
# place_pin -pin_name pin_25 -layer met4 -location {1425 1000} -pin_size {1 1}
# place_pin -pin_name pin_26 -layer met4 -location {1725 1000} -pin_size {1 1}
# place_pin -pin_name pin_27 -layer met4 -location {2025 1000} -pin_size {1 1}
# place_pin -pin_name pin_28 -layer met4 -location {2325 1000} -pin_size {1 1}

place_pin -pin_name h20 -layer met4 -location {225 600} -pin_size {1 1}
# place_pin -pin_name pin_32 -layer met4 -location {525 600} -pin_size {1 1}
# place_pin -pin_name pin_33 -layer met4 -location {825 600} -pin_size {1 1}
# place_pin -pin_name pin_34 -layer met4 -location {1125 600} -pin_size {1 1}
# place_pin -pin_name pin_35 -layer met4 -location {1425 600} -pin_size {1 1}
# place_pin -pin_name pin_36 -layer met4 -location {1725 600} -pin_size {1 1}
# place_pin -pin_name pin_37 -layer met4 -location {2025 600} -pin_size {1 1}
# place_pin -pin_name pin_38 -layer met4 -location {2325 600} -pin_size {1 1}

place_pin -pin_name taq -layer met4 -location {225 200} -pin_size {1 1}
# place_pin -pin_name pin_42 -layer met4 -location {525 200} -pin_size {1 1}
place_pin -pin_name out_air0 -layer met4 -location {825 200} -pin_size {1 1}
place_pin -pin_name out_air1 -layer met4 -location {1125 200} -pin_size {1 1}
place_pin -pin_name dna -layer met4 -location {1425 200} -pin_size {1 1}
# place_pin -pin_name pin_46 -layer met4 -location {1725 200} -pin_size {1 1}
# place_pin -pin_name pin_47 -layer met4 -location {2025 200} -pin_size {1 1}
place_pin -pin_name o -layer met4 -location {2325 200} -pin_size {1 1}