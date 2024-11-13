import wx
import pcbnew
from def_to_pcbnew import DefToPcb
from pcbnew_to_verilog import PcbToVerilog
import subprocess

class FreeroutingPlugin(pcbnew.ActionPlugin):
    def __init__(self):
        wx.Frame.__init__(self, parent, wx.NewId(), 'Logging')

        self.log_window = wx.LogWindow(self, 'Log Window', bShow=True)

        box_sizer = wx.BoxSizer(orient=wx.VERTICAL)
        show_log_button = wx.Button(self, wx.NewId(), 'Show Log')
        show_log_button.Bind(wx.EVT_BUTTON, self._show_log)

        log_message_button = wx.Button(self, wx.NewId(), 'Log Message')
        log_message_button.Bind(wx.EVT_BUTTON, self._log_message)

        box_sizer.AddMany((show_log_button, log_message_button))
        self.SetSizer(box_sizer)
        self.Fit()
        self.log = wx.TextCtrl(panel, style=wx.TE_MULTILINE)
        self.Bind(wx.EVT_CLOSE, self._on_close)

    def launch(self):
        design = "TODO"
        platform = "h.r.3.3"
        verilog = "foo.txt"
        # output = PcbToVerilog(pcbnew.GetBoard(), design)
        # with open(verilog, "w") as outfile:
        #     output.print_verilog(outfile)
        # command = ["make",
        #            "-e", f"DESIGN={design_name}",
        #            "-e", f"PLATFORM={platform}"]
        command = ["cat", "/usr/share/dict/README"]
        proc = subprocess.Popen(command,
                                stdout=PIPE, stderr=PIPE,
                                check=True)
        wait = wx.BusyCursor()
        while True:
            line = proc.stdout.readline()
            wx.Yield()
            if line.strip() == "":
                pass
            else:
                print line.strip()
            if not line: break

            line = proc.stderr.readline()
            wx.Yield()
            if line.strip() == "":
                pass
            else:
                print line.strip()
            if not line: break

        proc.wait()

    def _show_log(self, event):
        self.log_window.Show()

    def _on_close(self, event):
        self.log_window.this.disown()
        wx.Log.SetActiveTarget(None)
        event.Skip()

 if __name__ == '__main__':
    app = wx.PySimpleApp()
    dlg = MainWindow()
    dlg.Show()
    app.MainLoop()
