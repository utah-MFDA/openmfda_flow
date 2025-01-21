import pcbnew
import os
import wx
import subprocess
from pathlib import Path
# I commented these out and dropped in locally because it was caching the python import.
# from .pcbnew_to_verilog import PcbnewToVerilog
# import .config_generator as config
class PcbnewToVerilog:
    def __init__(self, board, design):
        self.design = design
        self.board = board

    def print_verilog(self, outfile):
        print(f"module {self.design} (", file=outfile)
        ios = []
        for foot in self.board.GetFootprints():
            if foot.GetFieldText("Footprint") == "h.r.3.3:interconnect_4x8":
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


def write_makefile(filename, design):
    with open(filename, "w") as f:
        print(f"""ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

export DESIGN_NAME     	= {design}

export VERILOG_FILES 	= $(ROOT_DIR)/{design}.v
export SDC_FILE      	= $(ROOT_DIR)/constraints.sdc
export FOOTPRINT_TCL = $(ROOT_DIR)/pads.tcl
export DIE_AREA    	 	= 0 0 2560 1600
export CORE_AREA   	 	= 0 0 2550 1590
""", file=f)

def write_pads(filename, pinholes, bumps):
    spots = ([("IO_NORTH", offset) for offset in range(330, 2560-330, 140)] +
             [("IO_WEST", offset) for offset in range(330, 1600 - 330, 140)] +
             [("IO_EAST", offset) for offset in range(1600-330, 330, -140)])

    with open(filename, "w") as f:
        print(f"""make_io_sites -horizontal_site IO_SIDE \\
    -vertical_site IO_TOP \\
    -corner_site IO_CORNER \\
    -offset 0 \\
    -rotation_vertical R90""", file=f)
        for pinhole, (side, location) in zip(pinholes, spots):
            print(f"""place_pad -master pinhole_325px_met5 -row {side} -location {location} {{{pinhole}}}""", file=f)
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

def write_sdc_constraints(filename, top_name="top"):
    with open(filename, "w") as f:
        print(f"current_design {top_name}", file=f)

class SubprocFrame(wx.Frame):
    """
    A Frame that says Hello World
    """

    def __init__(self, *args, **kw):
        super(SubprocFrame, self).__init__(*args, **kw)

        panel = wx.Panel(self)
        self.log = wx.TextCtrl(panel, style=wx.TE_MULTILINE | wx.TE_WORDWRAP | wx.TE_READONLY)

        start_btn = wx.Button(panel, label='Start')
        start_btn.Bind(wx.EVT_BUTTON, self.start)


        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.log, 1, wx.ALL|wx.EXPAND, 5)
        sizer.Add(start_btn, 0, wx.ALL, 5)
        panel.SetSizer(sizer)

    def start(self, event):
        command = ["tail", "-f", "test.txt"]
        proc = subprocess.Popen(command,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

        while True:
            line = proc.stdout.readline()
            wx.Yield()
            if line == "":
                break
            else:
                self.log.write(line)
        proc.wait()

class ExportFrame(wx.Frame):
    def __init__(self, *args, **kw):
        super(ExportFrame, self).__init__(*args, **kw)
        panel = wx.Panel(self)
        self.board = pcbnew.GetBoard()

        run_btn = wx.Button(panel, label='Run')
        run_btn.Bind(wx.EVT_BUTTON, self.start)
        self.start("foo")

    def start(self, event):
        # from .pcbnew_to_verilog import PcbnewToVerilog
        # from .config_generator import write_sdc_constraints, write_makefile, write_pads
        filename = Path(self.board.GetFileName())
        directory = filename.parent
        output = directory / (filename.stem + ".v")
        design = filename.stem
        exporter = PcbnewToVerilog(self.board, design)
        with open(output, "w") as f:
            exporter.print_verilog(f)
        write_sdc_constraints(directory / "constraints.sdc", top_name=design)
        write_makefile(directory / "config.mk", design)
        pinholes = [footprint.GetReference()
                    for footprint in self.board.GetFootprints()
                    if footprint.GetFieldByName("Footprint").GetText() == "h.r.3.3:pinhole_325px_met5"]

        bumps = [[None for i in  range(0,4)] for x in range(0,8)]
        for footprint in self.board.GetFootprints():
            if footprint.GetFieldByName("Footprint").GetText() != "h.r.3.3:interconnect_4x8":
                continue
            for pad in footprint.Pads():
                # if pad.GetNetname().startswith("unconnected"):
                #     continue
                pin = int(pad.GetName()) - 1
                bumps[pin // 4][pin % 4] = pad.GetNetname()
        write_pads(directory / "pads.tcl", pinholes, bumps)
        wx.MessageBox("Done.")

class OpenMFDAPlugin(pcbnew.ActionPlugin):
    def defaults(self):
        self.name = "MFDA"
        self.category = "A descriptive category name"
        self.description = "A description of the plugin and what it does"
        self.show_toolbar_button = True
        self.icon_file_name = os.path.join(os.path.dirname(__file__), 'icon.png')

    def Run(self):
        frm = ExportFrame(None, title="OpenMFDA flow")
        frm.Show()

OpenMFDAPlugin().register() # Instantiate and register to Pcbnew
