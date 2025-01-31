import pcbnew
import os
import wx
import subprocess
from pathlib import Path
import opendbpy as odb
from .def_to_pcbnew import DefToPcbnew
from .pcbnew_to_verilog import PcbnewToVerilog
from .opendb_helpers import load_db

def flow_root():
    if "OPENMFDA_FLOW_ROOT" in os.environ:
        return os.environ["OPENMFDA_FLOW_ROOT"]
    else:
        #return "/app/opt/openmfda/flow"
        return "/home/snelgrov/openmfda/flow"

def lef_from_env():
    root = flow_root()
    tlef_files = [f"{root}/platforms/h.r.3.3/lef/h.r.3.3.tlef"]
    lef_files = [f"{root}/platforms/h.r.3.3/lef/h.r.3.3_merged.lef",
                 f"{root}/platforms/h.r.3.3/lef/h.r.3.3_pads.lef"]
    return tlef_files, lef_files

def gen_cmd(design, config, results, args):
    base_cmd = ["make", "-C", flow_root(),
                "TIME_CMD=",
                f"DESIGN={design}", f"DESIGN_CONFIG={config}",
                f"LOG_DIR={results}",  f"OBJECTS_DIR={results}",
                f"REPORTS_DIR={results}", f"RESULTS_DIR={results}"]
    return base_cmd + args

class SubprocDialog(wx.Dialog):
    """
    A dialog that logs subprocess call
    """

    def __init__(self, cmd, *args, **kw):
        super(SubprocDialog, self).__init__(style=wx.DEFAULT_DIALOG_STYLE|wx.RESIZE_BORDER|wx.MAXIMIZE_BOX, *args, **kw)
        self.cmd = cmd
        panel = wx.Panel(self)
        self.log = wx.TextCtrl(panel, style=wx.TE_MULTILINE | wx.TE_WORDWRAP | wx.TE_READONLY)
        self.proc = None
        start_btn = wx.Button(panel, label='Start')
        start_btn.Bind(wx.EVT_BUTTON, self.start)
        halt_btn = wx.Button(panel, label='Halt')
        halt_btn.Bind(wx.EVT_BUTTON, self.halt)


        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.log, 1, wx.ALL|wx.EXPAND, 5)
        sizer.Add(start_btn, 0, wx.ALL, 5)
        sizer.Add(halt_btn, 0, wx.ALL, 5)
        panel.SetSizer(sizer)

    def halt(self, event):
        if self.proc:
            self.proc.terminate()

    def start(self, event):
        self.proc = subprocess.Popen(self.cmd,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

        while True:
            wx.Yield()
            line = self.proc.stdout.readline()
            if line:
                self.log.write(line)
            else:
                break
        self.proc.wait()
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
        board = pcbnew.GetBoard()
        print("****************************************************************")
        filename = Path(board.GetFileName())
        directory = filename.parent
        design = filename.stem
        PcbnewToVerilog(board, design, directory).export()
        cmd = gen_cmd(design, directory / "config.mk", directory / "results", ["pnr"])
        sub = SubprocDialog(cmd, None, title="OpenMFDA Place and Route")
        sub.ShowModal()

        def_file = str(directory / "results" / "4_final.def")
        tlef_files, lef_files = lef_from_env()
        db = load_db(def_file, tlef_files, lef_files)

        board = pcbnew.GetBoard()
        for tr in board.GetTracks():
            board.Remove(tr)

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
        self.proc = None

    def Run(self):
        board = pcbnew.GetBoard()
        filename = Path(board.GetFileName())
        directory = filename.parent
        scad_file = directory / "results" / (filename.stem + ".scad")
        design = filename.stem
        cmd = gen_cmd(design, directory / "config.mk", directory / "results", ["scad"])
        sub = SubprocDialog(cmd, None, title="OpenMFDA")
        sub.ShowModal()
        if self.proc is None or (self.proc is not None and self.proc.poll() is not None):
            cmd = ["openscad", str(scad_file)]
            print(cmd)
            self.proc = subprocess.Popen(cmd)

class ExportPlugin(pcbnew.ActionPlugin):
    def defaults(self):
        self.name = "OpenMFDA Slice"
        self.category = "A descriptive category name"
        self.description = "A description of the plugin and what it does"
        self.show_toolbar_button = True
        self.icon_file_name = os.path.join(os.path.dirname(__file__), 'icon.png')

    def Run(self):
        print("****************************************************************")
        board = pcbnew.GetBoard()
        filename = Path(board.GetFileName())
        directory = filename.parent
        design = filename.stem
        cmd = gen_cmd(design, directory / "config.mk", directory / "results", ["render"])
        sub = SubprocDialog(cmd, None, title="OpenMFDA Render")
        sub.ShowModal()
