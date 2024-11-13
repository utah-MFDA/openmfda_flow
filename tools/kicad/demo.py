import wx
import subprocess
import os

class MainFrame(wx.Frame):
    def __init__(self, *args, **kw):
        super(CommandMonitorFrame, self).__init__(*args, **kw)
        panel = wx.Panel(self)
        self.export_button = wx.Button(panel, label='Export')
        self.run_button = wx.Button(panel, label='Export and Run Flow')
        self.cancel_btn = wx.Button(panel, label='Cancel')
        self.cancel_btn.Bind(wx.EVT_BUTTON, self.cancel)
        self.flow_dir = wx.DirPickerCtrl(panel, message="Select the OpenMFDA Flow directory")
        if "OPENMFDA_FLOW_DIR" in os.environ:
            self.flow_dir.SetInitialDirectory(os.getenv("OPENMFDA_FLOW_DIR"))
        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.flow_dir, 0, wxALL, 5)
        sizer.Add(self.export_btn, 0, wx.ALL, 5)
        sizer.Add(self.run_btn, 0, wx.ALL, 5)
        sizer.Add(self.cancel_btn, 0, wx.ALL, 5)
        panel.SetSizer(sizer)

    def export(self, event):
        flow = self.flow_dir.GetPath()
        write_verilog()
        create_other_files()

    def run(self, event):
        self.export(event)
        # open run dialog
        # if successful:
        #     load file

class CommandMonitorFrame(wx.Frame):
    """
    A Frame that says Hello World
    """

    def __init__(self, *args, **kw):
        super(CommandMonitorFrame, self).__init__(*args, **kw)

        panel = wx.Panel(self)
        self.log = wx.TextCtrl(panel, style=wx.TE_MULTILINE | wx.TE_WORDWRAP | wx.TE_READONLY)

        self.cancel_btn = wx.Button(panel, label='Cancel')
        self.cancel_btn.Bind(wx.EVT_BUTTON, self.cancel)
        self.cancel_btn.Disable()

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.log, 1, wx.ALL|wx.EXPAND, 5)
        sizer.Add(self.cancel_btn, 0, wx.ALL, 5)
        panel.SetSizer(sizer)

    def start(self, command):
        self.proc = subprocess.Popen(command,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

        while True:
            line = self.proc.stdout.readline()
            wx.Yield()
            if line == "":
                break
            else:
                self.log.write(line)
        self.proc.wait()

    def cancel(self, event):
        self.proc.kill()
        self.start_btn.Enable()
        self.cancel_btn.Disable()

    def OnExit(self, event):
        """Close the frame, terminating the application."""
        self.Close(True)

if __name__ == '__main__':
    # When this module is run (not imported) then create the app, the
    # frame, show it, and start the event loop.
    app = wx.App()
    frm = HelloFrame(None, title='Process')
    frm.Show()

    app.MainLoop()
