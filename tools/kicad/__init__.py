import wx

try:
    from .server_plugins import PnRPlugin, PreviewPlugin
    PnRPlugin().register()
    PreviewPlugin().register()
except Exception as e:
    wx.LogMessage("Failed to load plugin")
    wx.LogMessage(str(e))
