import wx
import subprocess
class HelloFrame(wx.Frame):
    """
    A Frame that says Hello World
    """

    def __init__(self, *args, **kw):
        super(HelloFrame, self).__init__(*args, **kw)

        panel = wx.Panel(self)
        self.log = wx.TextCtrl(panel, style=wx.TE_MULTILINE | wx.TE_WORDWRAP | wx.TE_READONLY)

        ping_btn = wx.Button(panel, label='Ping')
        ping_btn.Bind(wx.EVT_BUTTON, self.start)


        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.log, 1, wx.ALL|wx.EXPAND, 5)
        sizer.Add(ping_btn, 0, wx.ALL, 5)
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

    def OnExit(self, event):
        """Close the frame, terminating the application."""
        self.Close(True)


    def OnHello(self, event):
        """Say hello to the user."""
        wx.MessageBox("Hello again from wxPython")


    def OnAbout(self, event):
        """Display an About Dialog"""
        wx.MessageBox("This is a wxPython Hello World sample",
                      "About Hello World 2",
                      wx.OK|wx.ICON_INFORMATION)


if __name__ == '__main__':
    # When this module is run (not imported) then create the app, the
    # frame, show it, and start the event loop.
    app = wx.App()
    frm = HelloFrame(None, title='Hello World 2')
    frm.Show()
    app.MainLoop()
