import wx
import os.path

try:
    from . import KiCadVerilog
except:
    import KiCadVerilog

import webbrowser

class RoutePluginDialog(wx.Dialog):
    def __init__(self, parent=None):
        wx.Dialog.__init__(self, parent, title='Create panelized board')
        self.Bind(wx.EVT_CLOSE, self.OnCancel, id=self.GetId())

        # Create a panel
        panel = wx.Panel(self)

class KVApp(wx.App):
    def OnInit(self):
        self.dialog = KVUI(None, wx.ID_ANY, "")
        self.SetTopWindow(self.dialog)
        self.dialog.ShowModal()
        self.dialog.Destroy()
        return True


def launch():
    kvapp = KVApp(0)
    kvapp.MainLoop()
# end wxGlade
