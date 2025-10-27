import shutil
import os
import wx
from pathlib import Path
import requests
import subprocess
import tempfile

class RequestDialog(wx.Dialog):
    """
    A dialog that logs an http file post
    """

    def __init__(self, filename, route, suffix, *args, **kw):
        super(RequestDialog, self).__init__(style=wx.DEFAULT_DIALOG_STYLE|wx.RESIZE_BORDER|wx.MAXIMIZE_BOX, *args, **kw)
        panel = wx.Panel(self)
        self.log = wx.TextCtrl(panel, style=wx.TE_MULTILINE | wx.TE_WORDWRAP | wx.TE_READONLY)
        self.hostname= wx.TextCtrl(panel)
        self.filename = filename
        self.route = route
        self.suffix = suffix
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
        self.response.close()

    def start(self, event):
        files = {'input_file': open(self.filename, 'rb')}
        self.response = requests.post(f"{self.server}/{route}", stream=True, files=files)
        while True:
            wx.Yield()
            line = self.response.readline()
            if line:
                self.log.write(line)
            else:
                break
        try:
            redirect = self.request.headers["Location"]
            filename = tempfile.mktemp(suffix=suffix)
            results = requests.get(redirect, stream=True)
            with open(filename, 'wb') as fd:
                for chunk in results.iter_content(chunk_size=128):
                    wx.Yield()
                    fd.write(chunk)
            self.results = filename
        except:
            wx.MessageBox("Routing file fetch failed.")

class PnRPlugin(pcbnew.ActionPlugin):
    def defaults(self):
        self.name = "OpenMFDA Place and Route"
        self.category = "A descriptive category name"
        self.description = "A description of the plugin and what it dose"
        self.show_toolbar_button = True
        self.icon_file_name = os.path.join(os.path.dirname(__file__), 'icon.png')

    def Run(self):
        board = pcbnew.GetBoard()
        filename = board.GetFileName()
        board.Save(filename)
        try:
            sub = RequestDialog(filename, "/route", "kicad_pcb", None, title="OpenMFDA")
            sub.ShowModal()
            pcbnew.Load(sub.results)
            pcbnew.Refresh()
        except:
            wx.MessageBox("Routing file fetch failed.")



class PreviewPlugin(pcbnew.ActionPlugin):
    def defaults(self):
        self.name = "OpenMFDA Render"
        self.category = "A descriptive category name"
        self.description = "A description of the plugin and what it does"
        self.show_toolbar_button = True
        self.icon_file_name = os.path.join(os.path.dirname(__file__), 'icon.png')
        self.proc = None
        self.SCAD_CMD = "openroad"

    def Run(self):
        board = pcbnew.GetBoard()
        filename = board.GetFileName()
        board.Save(filename)
        try:
            sub = RequestDialog(filename, "/render", "scad", None, title="OpenMFDA")
            sub.ShowModal()
            filename = Path(board.GetFileName())
            directory = filename.parent
            scad = directory / f"{filename.stem}.scad"
            shutil.copy(sub.results, scad)
            if self.proc is None or (self.proc is not None and self.proc.poll() is not None):
                cmd = [self.SCAD_CMD, scad]
                self.proc = subprocess.Popen(cmd)
        except:
            wx.MessageBox("Routing file fetch failed.")
