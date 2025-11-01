import wx

try:
    from .plugins import PnRPlugin, PreviewPlugin, ExportPlugin
    PnRPlugin().register()
    PreviewPlugin().register()
    ExportPlugin().register()
except Exception as e:
    wx.LogMessage("Failed to load plugin")
    wx.LogMessage(str(e))
