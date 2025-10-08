import sys
import os

def write_makefile(filename, design):
    with open(filename, "w") as f:
        print(f"""ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

export DESIGN_NAME     	= {design}

export VERILOG_FILES 	= $(ROOT_DIR)/{design}.v
export SDC_FILE      	= $(ROOT_DIR)/constraint.sdc
export FOOTPRINT_TCL = $(ROOT_DIR)/pads.tcl
export DIE_AREA    	 	= 0 0 2560 1600
export CORE_AREA   	 	= 0 0 2550 1590
""", file=f)

def write_pads(filename, pinholes, bumps):
    spots = ([("IO_WEST", offset) for offset in range(140, 1600, 140)] +
             [("IO_NORTH", offset) for offset in range(330, 2560-330, 140)] +
             [("IO_EAST", offset) for offset in range(1400, 0, -140)])

    with open(filename, "w") as f:
        print(f"""make_io_sites -horizontal_site IO_SIDE \
    -vertical_site IO_TOP \
    -corner_site IO_CORNER \
    -offset 0 \
    -rotation_vertical R90""", file=f)
        for pinhole, (side, location) in zip(pinholes, spots):
            print(f"place_pad -row {side} -location {location} {{ {pinhole} }}", file=f)
        print(f"""make_io_bump_array -bump interconnect \
    -rows 4 \
    -columns 8 \
    -pitch {{ 90 90 }} \
    -origin {{ 960 660 }}""", file=f)
        for nets, row in enumerate(bumps):
             for net, column in enumerate(row):
                 print(f"assign_io_bump -net {column} BUMP_{row}_{column}", file=f)
        print("place_io_terminals pinhole*/pad", file=f)
        print("place_io_terminals ic.interconnect*/pad", file=f)
        print("remove_io_rows", file=f)

def write_sdc_constraints(filename, top_name="top"):
    with open(filename, "w") as f:
        print(f"current_design {top_name}", file=f)
