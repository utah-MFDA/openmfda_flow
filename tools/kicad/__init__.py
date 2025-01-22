import pcbnew
import os
import wx
import subprocess
from pathlib import Path
# I commented these out and dropped in locally because it was caching the python import.
# from .pcbnew_to_verilog import PcbnewToVerilog
# import .config_generator as config
import opendbpy as odb

def wire_iter(wire):
    dec = odb.dbWireDecoder()
    dec.begin(wire)
    opcode = dec.next()
    while opcode != odb.dbWireDecoder.END_DECODE:
        layer = dec.getLayer()
        if opcode == odb.dbWireDecoder.BTERM:
            term = dec.getBTerm()
            yield (opcode, layer, (term,))
        elif opcode == odb.dbWireDecoder.ITERM:
            term = dec.getITerm()
            yield (opcode, layer, (term,))
        elif opcode == odb.dbWireDecoder.JUNCTION:
            wire_type = dec.getWireType()
            jid = dec.getJunctionId()
            jval = dec.getJunctionValue()
            yield (opcode, layer, (wire_type, jid, jval))
        elif opcode == odb.dbWireDecoder.PATH or opcode == odb.dbWireDecoder.VWIRE or opcode == odb.dbWireDecoder.SHORT:
            wire_type = dec.getWireType()
            yield (opcode, layer, (wire_type,))
        elif opcode == odb.dbWireDecoder.POINT_EXT:
            point = dec.getPoint_ext()
            yield (opcode, layer, (point,))
        elif opcode == odb.dbWireDecoder.POINT:
            point = dec.getPoint()
            yield (opcode, layer, (point,))
        elif opcode == odb.dbWireDecoder.RECT:
            rect = dec.getRect()
            yield (opcode, layer, (rect,))
        elif opcode == odb.dbWireDecoder.RULE:
            rule = dec.getRule()
            yield (opcode, layer, (rule,))
        elif opcode == odb.dbWireDecoder.TECH_VIA:
            via = dec.getTechVia()
            yield (opcode, layer, (via,))
        elif opcode == odb.dbWireDecoder.VIA:
            via = dec.getVia()
            yield (opcode, layer, (via,))
        else:
            raise ValueError()
        opcode = dec.next()

def segment_iter(wire):
    last = None
    for (opcode, layer, vals) in wire_iter(wire):
        if opcode == odb.dbWireDecoder.PATH or opcode == odb.dbWireDecoder.VWIRE or opcode == odb.dbWireDecoder.SHORT:
            last = None
        elif opcode == odb.dbWireDecoder.POINT_EXT:
            (point,) = vals
            if last is not None:
                yield (layer, last, point)
            last = point
        elif opcode == odb.dbWireDecoder.POINT:
            ((x,y),) = vals
            width = layer.getWidth()
            # By default, no extension means half the width.
            ext = int(width / 2)
            point = (x, y, ext)
            if last is not None:
                yield (layer, last, point)
            last = point
        elif opcode == odb.dbWireDecoder.TECH_VIA:
            (via,) = vals
            if last is not None:
                yield (layer, last, via)
            last = via
        elif opcode == odb.dbWireDecoder.VIA:
            (via,) = vals
            if last is not None:
                yield (layer, last, via)
            last = via # TODO squash multilayer vias
        else:
            raise NotImplemented


class DefToPcbnew:
    def __init__(self, db, board):
        self.db = db
        self.board = board
        self.layer_map = {}
        self.net_map = {}
        self._extract_layers()

    def scale(self, i):
        # Kicad stores sizes in nanometers, just fixed scale for integer math.
        # scaling to 0.1mm per pixel
        return i * 100

    def _extract_layers(self):
        layers = self.db.getTech().getLayers()
        num_layers = self.db.getTech().getRoutingLayerCount()
        i = -1
        for layer in self.db.getTech().getLayers():
            if layer.getType() == "ROUTING":
                i += 1
                if i == 0:
                    name = (i, "B.Cu")
                elif i == (num_layers - 1):
                    name = (i, "F.Cu")
                else:
                    name = (i, f"In{num_layers - i - 1}.Cu")
                self.layer_map[layer.getName()] = name
        # self.board.SetCopperLayerCount(i+1)
        # GetLayerName(aLayer)
        # GetLayerID(self, aLayerName):
        # SetLayerName(self, aLayer, aLayerName)
        # GetStandardLayerName(aLayerId):
        # SetLayerDescr(self, aIndex, aLayer)
        # GetLayerType(self, aLayer)
        # SetLayerType(self, aLayer, aLayerType):
        # Stackup is optional, may need to set

    def place(self):
        block = self.db.getChip().getBlock()
        for comp in block.getInsts():
            master = comp.getMaster()
            x, y = map(self.scale, comp.getLocation())
            if "R90" in comp.getOrient():
                angle = 90.0
            elif "R180" in comp.getOrient():
                angle = 180.0
            elif "R270" in comp.getOrient():
                angle = 270.0
            else:
                angle = 0.0
            mirror_y = "MY" in comp.getOrient()
            mirror_x = "MX" in comp.getOrient()
            mx, my = map(self.scale, master.getOrigin())
            # need to figure out what this does to the offsets, for now assume macro origin always 0,0
            assert mx == 0 and my == 0
            name = comp.getConstName()
            module = master.getConstName()
            print("placing", name, module, x/1000000, y/1000000, angle)
            for foot in self.board.GetFootprints():
                # O(n**2), fix later
                if foot.GetReference() == name:
                    # foot.SetLayerAndFlip()
                    # foot.IsFlipped()
                    # foot.Flip()
                    # foot.GetSide() number 0 or 31
                    if (mirror_y or mirror_x) and not foot.IsFlipped():
                        foot.Flip(foot.GetCenter(), True)
                    if not mirror_y and not mirror_x and foot.IsFlipped():
                        foot.Flip(foot.GetCenter(), False)
                    foot.SetX(x)
                    foot.SetY(y)
                    foot.SetOrientationDegrees(angle)
                    # foot.NeedsPlaced()
                    # foot.IsPlaced()
                    foot.SetIsPlaced(True)
                    foot.SetNeedsPlaced(False)
                    pcbnew.Refresh()

    def route(self):
        block = self.db.getChip().getBlock()
        nets = block.getNets()
        for net in nets:
            if net.getWire() is None:
                continue
            for (layer, start, end) in segment_iter(net.getWire()):
                width = self.scale(layer.getWidth())
                sx, sy, sext = map(self.scale, start)
                knet = self.board.FindNet(net.getName())
                if type(end) == odb.dbTechVia or type(end) == odb.dbVia:
                    start_id, start_name = self.layer_map[end.getBottomLayer().getName()]
                    end_id, end_name = self.layer_map[end.getTopLayer().getName()]
                    layers = [start_id, end_id]
                    print("routing net", net.getName(), "via at ", sx/1000000, sy/1000000, "width", width/1000000, "layers", start_name, end_name)
                    via = pcbnew.PCB_VIA(self.board)
                    via.SetX(sx)
                    via.SetY(sy)
                    via.SetWidth(width)
                    # todo layers
                    via.SetNetCode(knet.GetNetCode())
                    self.board.Add(via)
                else:
                    # If the track has an extension beyond the end point
                    ex, ey, eext = map(self.scale, end)
                    if ex == sx:
                        sy -= sext
                        ey += eext
                    elif ey == sy:
                        sy -= sext
                        ey += eext
                    track = pcbnew.PCB_TRACK(self.board)
                    layer_id, layer_name = self.layer_map[layer.getName()]
                    print("routing net", net.getName(), "trace from", sx/1000000, sy/1000000, "to", ex/1000000, ey/1000000, "width", width/1000000)
                    track.SetEndX(ex)
                    track.SetEndY(ey)
                    track.SetX(sx)
                    track.SetY(sy)
                    track.SetWidth(width)
                    track.SetLayer(layer_id)
                    track.SetNetCode(knet.GetNetCode())

                    self.board.Add(track)

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

    def __init__(self, cmd, *args, **kw):
        super(SubprocFrame, self).__init__(*args, **kw)
        self.cmd = cmd
        panel = wx.Panel(self)
        self.log = wx.TextCtrl(panel, style=wx.TE_MULTILINE | wx.TE_WORDWRAP | wx.TE_READONLY)

        start_btn = wx.Button(panel, label='Start')
        start_btn.Bind(wx.EVT_BUTTON, self.start)


        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.log, 1, wx.ALL|wx.EXPAND, 5)
        sizer.Add(start_btn, 0, wx.ALL, 5)
        panel.SetSizer(sizer)

    def start(self, event):
        proc = subprocess.Popen(self.cmd,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

        while True:
            wx.Yield()
            line = proc.stdout.readline()
            if line:
                self.log.write(line)
            else:
                break
        proc.wait()
        wx.MessageBox("Done.")

class ExportFrame(wx.Frame):
    def __init__(self, *args, **kw):
        super(ExportFrame, self).__init__(*args, **kw)
        panel = wx.Panel(self)
        self.board = pcbnew.GetBoard()

        run_btn = wx.Button(panel, label='Run')
        run_btn.Bind(wx.EVT_BUTTON, self.start)

class PnRPlugin(pcbnew.ActionPlugin):
    def defaults(self):
        self.name = "OpenMFDA Place and Route"
        self.category = "A descriptive category name"
        self.description = "A description of the plugin and what it does"
        self.show_toolbar_button = True
        self.icon_file_name = os.path.join(os.path.dirname(__file__), 'icon.png')

    def Run(self):
        print("****************************************************************")
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
        flow = "~/nas/mfda/openmfda/flow"
        cmd = ["make", "-C", flow,
               f"DESIGN={design}", "TIME_CMD=", f"DESIGN_CONFIG={directory}/config.mk",
               f"LOG_DIR={directory}/results",  f"OBJECTS_DIR={directory}/results",
               f"REPORTS_DIR={directory}/results", f"RESULTS_DIR={directory}/results",
               "pnr"]
        sub = SubprocFrame(cmd, None, title="OpenMFDA")
        sub.Show()
        def_file = "/home/snelgrov/test_design/simple/results/4_final.def"
        tlef_files = ["/home/snelgrov/nas/mfda/openmfda/flow/platforms/h.r.3.3/lef/h.r.3.3.tlef"]
        lef_files = ["/home/snelgrov/nas/mfda/openmfda/flow/platforms/h.r.3.3/lef/h.r.3.3_merged.lef",
                     "/home/snelgrov/nas/mfda/openmfda/flow/platforms/h.r.3.3/lef/h.r.3.3_pads.lef"]
        db = odb.dbDatabase.create()
        for tlef_file in tlef_files:
            odb.read_lef(db, tlef_file)
        for lef_file in lef_files:
            odb.read_lef(db, lef_file)
        odb.read_def(db, def_file)
        board = pcbnew.GetBoard()
        d = DefToPcbnew(db, board)
        d.place()
        d.route()
        pcbnew.Refresh()

class PreviewPlugin(pcbnew.ActionPlugin):
    def defaults(self):
        self.name = "OpenMFDA Render"
        self.category = "A descriptive category name"
        self.description = "A description of the plugin and what it does"
        self.show_toolbar_button = True
        self.icon_file_name = os.path.join(os.path.dirname(__file__), 'icon.png')

    def Run(self):
        print("****************************************************************")
        frm = ExportFrame(None, title="OpenMFDA Place and Route")
        frm.Show()

class ExportPlugin(pcbnew.ActionPlugin):
    def defaults(self):
        self.name = "OpenMFDA Slice"
        self.category = "A descriptive category name"
        self.description = "A description of the plugin and what it does"
        self.show_toolbar_button = True
        self.icon_file_name = os.path.join(os.path.dirname(__file__), 'icon.png')

    def Run(self):
        print("****************************************************************")
        frm = ExportFrame(None, title="OpenMFDA Place and Route")
        frm.Show()

PnRPlugin().register() # Instantiate and register to Pcbnew
