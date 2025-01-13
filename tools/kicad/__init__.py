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
        print(f"module {self.design} ();", file=outfile)
        for net, item in self.board.GetNetsByName().items():
            if len(str(net)):
                print(f"\twire \\{net} ;", file=outfile) # Space after the name is important here!
        for foot in self.board.GetFootprints():
            module = foot.GetFieldText("Footprint").replace("h.r.3.3:", "")
            name = foot.GetReference()
            # Space after the name is important here!
            print(f"\t\\{module} \\{name} (", file=outfile)
            # Space after the name is important here!
            print(*[f"\t\t.\\{pad.GetName()} (\\{pad.GetNetname()} )" for pad in foot.Pads() if len(str(pad.GetNetname()))], sep=",\n", file=outfile)
            print("\t);", file=outfile)
        print("endmodule", file=outfile)


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
        print(f"""make_io_sites -horizontal_site IO_SIDE \\
    -vertical_site IO_TOP \\
    -corner_site IO_CORNER \\
    -offset 0 \\
    -rotation_vertical R90""", file=f)
        for pinhole, (side, location) in zip(pinholes, spots):
            print(f"place_pad -row {side} -location {location} {{ {pinhole} }}", file=f)
        print(f"""make_io_bump_array -bump interconnect \\
    -rows 4 \\
    -columns 8 \\
    -pitch {{ 90 90 }} \\
    -origin {{ 960 660 }}""", file=f)
        for row, nets in enumerate(bumps):
             for column, net in enumerate(nets):
                 if net is not None:
                     print(f"assign_io_bump -net {net} BUMP_{row}_{column}", file=f)
        print("place_io_terminals pinhole*/pad", file=f)
        print("place_io_terminals ic.interconnect*/pad", file=f)
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
                    if footprint.GetValue() == "h.r.3.3:pinhole_325px_met1"]

        bumps = [["foo" for i in  range(0,8)] for x in range(0,4)]
        # for footprint in self.board.GetFootprints():
        #     if footprint.GetValue() != "h.r.3.3:flushing_interface_4x8"]:
        #         continue
        #     for pad in footprint.Pads():
        #          pin = int(pad.GetName())
        #          bumps[pin // 4][pin % 8] = pad.GetNetName()
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
