
#------------------------------------------------------------------------------
# PRINTER PARAMETERS
#------------------------------------------------------------------------------
# mm/px value

export PX_VAL 			= 0.0076

# mm/layer value
export LAYER_VAL		= 0.01

# layer number for the bottom layer
# 	generally number of layers spacing between bottom of device to 
# 	internal geometeries
export BOT_LAYER_VAL	= 75

# layers/via value
export LPV_VAL			= 20

export PRINTER_PX_RES = 2560 1950

# bulk x value in pixels
export XBULK_VAL		= 2550

# bulk y value in pixels
export YBULK_VAL		= 1600

# bulk z value in layers
# 	This includes the BOT_LAYERS_VAL
export ZBULK_VAL		= 270

# render smoothness in scad render
# 	high value means rounded edges are smoother (more lines per rotation)
# 	increasing this value will additionally impact render time.
export RES_VAL			= 120

# spacing of placement area from edge (pixels)
export EDGE_PADDING = 60

export NUM_OF_ROUTING_LAYERS = 8

# FastRoute options
export MIN_ROUTING_LAYER = met1
export MAX_ROUTING_LAYER = met8

