# FUNCTIONALITY
# set_io_pin_constraint -direction <direction> \
                        -pin_names <names> \
                        -region <edge:interval>

#set_io_pin_constraint -direction input -region top:*
#set_io_pin_constraint -direction output -region bottom:*
set_io_pin_constraint -pin_names a_fluid -region left:650-750
set_io_pin_constraint -pin_names b_fluid -region left:850-950
set_io_pin_constraint -pin_names out_fluid -region right:700-900