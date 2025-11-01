import pcbnew
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
        super(RequestDialog, self).__init__(style=wx.DEFAULT_DIALOG_STYLE|wx.RESIZE_BORDER|wx.MAXIMIZE, *args, **kw)
        panel = wx.Panel(self)
        self.log = wx.TextCtrl(panel, style=wx.TE_MULTILINE | wx.TE_WORDWRAP | wx.TE_READONLY)
        self.hostname= wx.TextCtrl(panel)
        self.hostname.SetValue("http://lnissrv4.eng.utah.edu:8080")
        self.filename = filename
        self.path = route
        self.suffix = suffix
        start_btn = wx.Button(panel, label='Start')
        start_btn.Bind(wx.EVT_BUTTON, self.start)
        halt_btn = wx.Button(panel, label='Halt')
        halt_btn.Bind(wx.EVT_BUTTON, self.halt)


        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.log, 1, wx.ALL|wx.EXPAND, 5)
        sizer.Add(self.hostname, 0, wx.ALL|wx.EXPAND, 5)
        sizer.Add(start_btn, 0, wx.ALL, 5)
        sizer.Add(halt_btn, 0, wx.ALL, 5)
        panel.SetSizer(sizer)

    def halt(self, event):
        self.response.close()

    def start(self, event):
        files = {'input_file': open(self.filename, 'rb')}
        server = self.hostname.GetValue()
        self.response = requests.post(f"{server}/{self.path}", stream=True, files=files)
        while True:
            wx.Yield()
            line = self.response.raw.readline()
            if line:
                self.log.write(line)
            else:
                break
        try:
            redirect = self.response.headers["Location"]
            filename = tempfile.mktemp(suffix=self.suffix)
            response = requests.get(f"{server}{redirect}", stream=True)
            wx.MessageBox(f"Requested {response.url}")
            if response.status_code == requests.codes.ok:
                with open(filename, 'wb') as fd:
                    for chunk in response.iter_content(chunk_size=128):
                        wx.Yield()
                        fd.write(chunk)
                wx.MessageBox(f"Transfer finished {filename}")
                self.results = filename
            else:
                response.raise_for_status()
        except:
            wx.MessageBox("Routing file fetch failed.")
            raise

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
            sub = RequestDialog(filename, "/route", ".kicad_pcb", None, title="OpenMFDA")
            sub.ShowModal()
            result = sub.results
            self.import_board(result)
            pcbnew.Refresh()
        except:
            wx.MessageBox("Rendering file failed.")

    def import_board(self, path):
        target = pcbnew.GetBoard()
        source = pcbnew.LoadBoard(path)
        self.place(source, target)
        self.route(source, target)
        pcbnew.Refresh()

    def place(self, source, target):
        for component in source.GetFootprints():
            angle = component.GetOrientationDegrees()
            x = component.GetX()
            y = component.GetY()
            flip = component.IsFlipped()
            name = component.GetReference()
            for foot in target.GetFootprints():
                # O(n**2), fix later
                if foot.GetReference() == name:
                    # reset everything, flipping is stateful.
                    if foot.IsFlipped():
                        foot.Flip(foot.GetPosition(), False)
                    foot.SetOrientationDegrees(0)

                    if flip:
                        foot.Flip(foot.GetPosition(), False)
                    foot.SetOrientationDegrees(angle)
                    foot.SetX(x)
                    foot.SetY(y)
                    foot.SetIsPlaced(True)
                    foot.SetNeedsPlaced(False)
            pcbnew.Refresh()


    def route(self, source, target):
        for track in target.GetTracks():
            target.Remove(track)
        pcbnew.Refresh()
        for track in source.GetTracks():
            target.Add(track.Duplicate())

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
