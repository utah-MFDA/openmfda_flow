import itertools
import pcbnew

pads = ["h.r.3.3:pinhole_325px_0", "h.r.3.3:interconnect_4x8"]

class PcbnewToVerilog:
    def __init__(self, board, design, directory):
        self.design = design
        self.board = board
        self.directory = directory

    def write_verilog(self):
        with open(self.directory / (self.design + ".v"), "w") as outfile:
            print(f"module {self.design} (", file=outfile)
            ios = []
            for foot in self.board.GetFootprints():
                if foot.HasField("Footprint") and foot.GetFieldText("Footprint") == "h.r.3.3:interconnect_4x8":
                    for pad in foot.Pads():
                        direction = pad.GetPinType()
                        if "no_connect" in direction:
                            continue
                        if direction == "input" or direction == "power_in":
                            dir = "input"
                        elif direction == "output" or direction == "power_out":
                            dir = "output"
                        else:
                            dir = "inout"
                        # Space after name matters!
                        ios.append(f"{dir} \\{pad.GetNetname()} ")
            print(*ios, sep=",\n\t", file=outfile)
            print(");", file=outfile)
            for net, item in self.board.GetNetsByName().items():
                net = str(net)
                if len(net) and "unconnected" not in net:
                    print(f"\twire \\{net} ;", file=outfile) # Space after the name is important here!
            for foot in self.board.GetFootprints():
                if not foot.HasField("Footprint"):
                    continue
                module = foot.GetFieldText("Footprint").replace("h.r.3.3:", "")
                if module == "interconnect_4x8":
                    continue
                name = foot.GetReference()
                # Space after the name is important here!
                print(f"\t\\{module} \\{name} (", file=outfile)
                # Space after the name is important here!
                print(*[f"\t\t.\\{pad.GetPinFunction()} (\\{pad.GetNetname()} )" for pad in foot.Pads() if len(str(pad.GetNetname()))], sep=",\n", file=outfile)
                print("\t);", file=outfile)
            print("endmodule", file=outfile)

    def write_makefile(self):
        with open(self.directory / "config.mk", "w") as f:
            print(f"""ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

export DESIGN_NAME     	= {self.design}

export VERILOG_FILES 	= $(ROOT_DIR)/{self.design}.v
export SDC_FILE      	= $(ROOT_DIR)/constraints.sdc
export FOOTPRINT_TCL = $(ROOT_DIR)/pads.tcl
export MACRO_PLACE_TCL = $(ROOT_DIR)/macros.tcl
export DIE_AREA    	 	= 0 0 2560 1600
export CORE_AREA   	 	= 0 0 2550 1590
""", file=f)

    # Also see DefToPcbnew.convert_location for the reverse calculation.
    def convert_location(self, footprint):
        x = int((footprint.GetX() - 32000000) / 100000)
        y = int((160000000 - footprint.GetY() + 32000000) / 100000)
        # May need to lookup width from the footprint LEF master instead.
        b = footprint.GetBoundingBox()
        h = int(b.GetHeight() / 100000)
        w = int(b.GetWidth()  / 100000)
        print(x, y, h, w)
        degree = int(footprint.GetOrientationDegrees())
        if footprint.IsFlipped():
            if degree == 0:
                return ("FS", x + h, y)
            elif degree == 90:
                return ("FW", x, y)
            elif degree == 180:
                return ("FN", x - w, y)
            elif degree == -90 or degree == 270:
                return ("FE", x - h, y + w)
            else:
                raise ValueError(f"Unsupported orientation angle {degree}.")
        else:
            if degree == 0:
                return ("N", x, y)
            elif degree == 90:
                return ("W", x - h, y)
            elif degree == 180:
                return ("S", x - w, y + h)
            elif degree == -90 or degree == 270:
                return ("E", x, y + w)
            else:
                raise ValueError(f"Unsupported orientation angle {degree}.")

    def write_macros(self):
        with open(self.directory / "macros.tcl", "w") as f:
            for footprint in self.board.GetFootprints():
                if not footprint.HasField("Footprint"):
                    continue
                name = footprint.GetFieldByName("Footprint").GetText()
                if footprint.IsLocked() and name not in pads:
                    name = footprint.GetReference()
                    orientation, x, y = self.convert_location(footprint)
                    print(f"place_inst -name {name} -location {{ {x} {y} }} -orientation {orientation} -status FIRM", file=f)

    def write_pads(self):
        pinholes = [footprint.GetReference()
                    for footprint in self.board.GetFootprints()
                    if footprint.HasField("Footprint") and footprint.GetFieldByName("Footprint").GetText() == "h.r.3.3:pinhole_325px_0"]

        bumps = [[None for i in  range(0,4)] for x in range(0,8)]
        for footprint in self.board.GetFootprints():
            if not footprint.HasField("Footprint"):
                continue
            if footprint.GetFieldByName("Footprint").GetText() != "h.r.3.3:interconnect_4x8":
                continue
            for pad in footprint.Pads():
                # if pad.GetNetname().startswith("unconnected"):
                #     continue
                pin = int(pad.GetName()) - 1
                bumps[pin // 4][pin % 4] = pad.GetNetname()

        spots = ([("IO_NORTH", offset) for offset in range(330, 2560-330, 140)] +
                 [("IO_WEST", offset) for offset in range(330, 1600 - 330, 140)] +
                 [("IO_EAST", offset) for offset in range(1600-330, 330, -140)])
        with open(self.directory / "pads.tcl", "w") as f:
            print(f"""make_io_sites -horizontal_site IO_SIDE \\
        -vertical_site IO_TOP \\
        -corner_site IO_CORNER \\
        -offset 0 \\
        -rotation_vertical R90""", file=f)
            for pinhole, (side, location) in zip(pinholes, spots):
                print(f"""place_pad -master pinhole_325px_0 -row {side} -location {location} {{{pinhole}}}""", file=f)
            pitch_x = 90
            pitch_y = 90
            origin_x = 960
            origin_y = 660
            width = 40
            height = 40
            layer = "met10"
            for column, nets in enumerate(bumps):
                 for row, net in enumerate(nets):
                     if net is not None and "unconnected" not in net:
                         y = row * pitch_y + origin_y
                         x = column * pitch_x + origin_x
                         print(f"""place_pin -pin_name {net} -layer {layer} -location {{ {x} {y} }} -pin_size {{ {width} {height} }}""", file=f)
            print("place_io_terminals */pad", file=f)
            print("remove_io_rows", file=f)

    def write_sdc_constraints(self):
        with open(self.directory / "constraints.sdc", "w") as f:
            print(f"current_design {self.design}", file=f)

    def export(self):
        self.write_verilog()
        self.write_makefile()
        self.write_macros()
        self.write_pads()
        self.write_sdc_constraints()

if __name__ == "__main__":
    import sys
    brd = pcbnew.LoadBoard(sys.argv[1])
    design = sys.argv[2]
    directory = sys.argv[3]
    ext = PcbnewToVerilog(brd, design, directory)
    ext.export()
