# place_bondpad -bond master [-offset {x y}] [-rotation rotation] ioinsts
# place_corners [-ring_index index] master
# place_endcaps
# # Simplified
# [-corner master] [-edge_corner master]
# [-endcap masters]
# [-endcap_horizontal masters]  [-endcap_vertical master]
# [-prefix prefix]

# # Full options
# [-left_top_corner master] [-right_top_corner master] [-left_bottom_corner master] [-right_bottom_corner master]
# [-left_top_edge master] [-right_top_edge master] [-left_bottom_edge master] [-right_bottom_edge master]
# [-left_edge master]  [-right_edge master]
# [-top_edge masters]  [-bottom_edge masters]

# place_inst -name inst_name   (-origin xy_origin | -location xy_location)  [-orientation orientation]  [-cell library_cell]  [-status status]
# place_io_fill -row row_name [-permit_overlaps masters] masters
# place_io_terminals inst_terms [-allow_non_top_layer]
# place_macro -macro_name macro_name -location location [-orientation orientation]
# [-exact] [-allow_overlap]

# place_pad [-master master] -row row_name -location x_or_y_offset -mirror name
# place_pads -row row_name pads
# place_pin [-pin_name pin_name] [-layer layer] [-location location]
# [-pin_size pin_size] [-force_to_die_boundary] [-placed_status]

# place_pins [-hor_layers h_layers] [-ver_layers v_layers] [-random_seed seed]
# [-random] [-corner_avoidance distance] [-min_distance min_dist]
# [-min_distance_in_tracks] [-exclude region] [-group_pins pin_list]
# [-annealing] [-write_pin_placement file_name]

place_inst -name interconnect -origin { 960 570 } -orient R0 -status FIRM
# place_pin -pin_name ctrl_a[9] -layer met10 -location { 960 840 } -pin_size {20 20}
# place_pin -pin_name ctrl_s[1] -layer met10 -location { 960 750 } -pin_size {20 20}
# # place_pin -pin_name in1_a -layer met10 -location { 960 660 } -pin_size {20 20}
# # place_pin -pin_name in1_b -layer met10 -location { 960 570 } -pin_size {20 20}
# place_pin -pin_name ctrl_a[2] -layer met10 -location { 1050 930 } -pin_size {20 20}
# place_pin -pin_name ctrl_a[10] -layer met10 -location { 1050 840 } -pin_size {20 20}
# place_pin -pin_name ctrl_s[2] -layer met10 -location { 1050 750 } -pin_size {20 20}
# # place_pin -pin_name in2_a -layer met10 -location { 1050 660 } -pin_size {20 20}
# # place_pin -pin_name in2_b -layer met10 -location { 1050 570 } -pin_size {20 20}
# place_pin -pin_name ctrl_a[3] -layer met10 -location { 1140 930 } -pin_size {20 20}
# place_pin -pin_name ctrl_a[11] -layer met10 -location { 1140 840 } -pin_size {20 20}
# place_pin -pin_name ctrl_s[3] -layer met10 -location { 1140 750 } -pin_size {20 20}
# # place_pin -pin_name in3_a -layer met10 -location { 1140 660 } -pin_size {20 20}
# # place_pin -pin_name in3_b -layer met10 -location { 1140 570 } -pin_size {20 20}
# place_pin -pin_name ctrl_a[4] -layer met10 -location { 1230 930 } -pin_size {20 20}
# place_pin -pin_name ctrl_a[12] -layer met10 -location { 1230 840 } -pin_size {20 20}
# place_pin -pin_name ctrl_s[0] -layer met10 -location { 1230 750 } -pin_size {20 20}
# # place_pin -pin_name out1_a -layer met10 -location { 1230 660 } -pin_size {20 20}
# # place_pin -pin_name out1_b -layer met10 -location { 1230 570 } -pin_size {20 20}
# place_pin -pin_name ctrl_a[5] -layer met10 -location { 1320 930 } -pin_size {20 20}
# # place_pin -pin_name ctrl_a[13] -layer met10 -location { 1320 840 } -pin_size {20 20}
# place_pin -pin_name pump_b[0] -layer met10 -location { 1320 750 } -pin_size {20 20}
# # place_pin -pin_name out2_a -layer met10 -location { 1320 660 } -pin_size {20 20}
# # place_pin -pin_name out2_b -layer met10 -location { 1320 570 } -pin_size {20 20}
# place_pin -pin_name ctrl_a[6] -layer met10 -location { 1410 930 } -pin_size {20 20}
# place_pin -pin_name pump_a[1] -layer met10 -location { 1410 840 } -pin_size {20 20}
# place_pin -pin_name pump_a[0] -layer met10 -location { 1410 750 } -pin_size {20 20}
# # place_pin -pin_name out3_a -layer met10 -location { 1410 660 } -pin_size {20 20}
# # place_pin -pin_name out3_b -layer met10 -location { 1410 570 } -pin_size {20 20}
# place_pin -pin_name ctrl_a[7] -layer met10 -location { 1500 930 } -pin_size {20 20}
# place_pin -pin_name pump_a[2] -layer met10 -location { 1500 840 } -pin_size {20 20}
# # place_pin -pin_name out4_a -layer met10 -location { 1500 660 } -pin_size {20 20}
# # place_pin -pin_name out4_b -layer met10 -location { 1500 570 } -pin_size {20 20}
# place_pin -pin_name ctrl_a[8] -layer met10 -location { 1590 930 } -pin_size {20 20}
# place_pin -pin_name pump_b[1] -layer met10 -location { 1590 840 } -pin_size {20 20}
