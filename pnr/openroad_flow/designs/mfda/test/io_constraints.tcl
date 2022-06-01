# FUNCTIONALITY
# set_io_pin_constraint -direction <direction> \
                        -pin_names <names> \
                        -region <edge:interval>

#set_io_pin_constraint -direction input -region top:*
#set_io_pin_constraint -direction output -region bottom:*
set_io_pin_constraint -pin_names a_fluid -region left:*
set_io_pin_constraint -pin_names b_fluid -region left:*
set_io_pin_constraint -pin_names out_fluid -region right:*
#set_io_pin_constraint -pin_names in_air_1 -region top:*
#set_io_pin_constraint -pin_names in_air_2 -region top:*
#set_io_pin_constraint -pin_names in_air_3 -region top:*
#set_io_pin_constraint -pin_names in_air_4 -region top:*
#set_io_pin_constraint -pin_names out_air_1 -region bottom:*
#set_io_pin_constraint -pin_names out_air_2 -region bottom:*
#set_io_pin_constraint -pin_names out_air_3 -region bottom:*
#set_io_pin_constraint -pin_names out_air_4 -region bottom:*
