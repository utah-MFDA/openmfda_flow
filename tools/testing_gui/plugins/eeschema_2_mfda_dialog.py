
import os
import sys
import wx
import subprocess

import eeschema_to_verilog as ee2v

class ImportSchematicDialog(wx.Dialog):

    def __init__(self, eeschema_file, openmfda_flow_loc, *args, **kw):
        super(ImportSchematicDialog, self).__init__(
            style=wx.DEFAULT_DIALOG_STYLE |
            wx.RESIZE_BORDER | wx.MAXIMIZE_BOX,
            *args, **kw
        )
        
        self.design_name = ''
        
        if eeschema_file is None:
            self.eeschema_file = ''
        elif isinstance(eeschema_file, str):
            self.eeschema_file = eeschema_file
        else:
            raise ValueError('Expecting string for eeschema_file')

        pnl = wx.Panel(self)

        dialog_txt = wx.StaticText(pnl, label="Import design")
        
        select_design_btn = wx.Button(pnl, label="Select schematic")
        select_design_btn.Bind(
            wx.EVT_BUTTON, self.select_eeschema
        )

        eeschema_sttxt = wx.StaticText(pnl, label="Input file:")
        self.eeschema_file_txt = wx.TextCtrl(
            pnl,
            style=wx.TE_DONTWRAP | wx.TE_READONLY
        )
        self.eeschema_file_txt.WriteText(
            self.eeschema_file
        )

        design_sttxt = wx.StaticText(pnl, label="Output location:")
        design_location_txt = wx.TextCtrl(pnl,
                                          style=wx.TE_DONTWRAP | wx.TE_READONLY
                                          )
        design_location_txt.WriteText(
            os.path.abspath(
                os.path.abspath(openmfda_flow_loc) + '/design/src'
            )
        )

        input_sttxt = wx.StaticText(pnl, label="Design name (edit):")
        self.input_txt = wx.TextCtrl(pnl)

        accept_btn = wx.Button(pnl, label="Export")
        accept_btn.Bind(wx.EVT_BUTTON, self.write_verilog)

        vert_sizer = wx.BoxSizer(wx.VERTICAL)

        vert_sizer.Add(dialog_txt, 0, wx.ALIGN_CENTER_HORIZONTAL | wx.ALL, 7)
        vert_sizer.Add(select_design_btn, 0, wx.ALL, 7)
        vert_sizer.Add(eeschema_sttxt, 0, wx.ALL, 7)
        vert_sizer.Add(self.eeschema_file_txt, 0, wx.EXPAND | wx.ALL, 7)
        vert_sizer.Add(design_sttxt, 0, wx.ALL, 7)
        vert_sizer.Add(design_location_txt, 0, wx.EXPAND | wx.ALL, 7)
        vert_sizer.Add(input_sttxt, 0, wx.ALL, 7)
        vert_sizer.Add(self.input_txt, 0, wx.EXPAND | wx.ALL, 7)
        vert_sizer.Add(accept_btn, 0, wx.ALL, 7)

        pnl.SetSizer(vert_sizer)

        self.SetInitialSize(wx.Size(650, 400))
        
    
    def export_eeschema(self, ee_file, design, out_loc):
        sch = ee2v.Schematic().from_file(ee_file)
        ext = ee2v.EeschemaToVerilog(sch, design)
        ext.extract()
        ext.print_verilog()

    def select_eeschema(self, event):
        with wx.FileDialog(
            self,
            "Open eeschema file",
            wildcard="*.kicad_sch",
            style=wx.DD_DEFAULT_STYLE
            | wx.DD_DIR_MUST_EXIST
        ) as eeschema_dialog:
            if eeschema_dialog.ShowModal() == wx.ID_CANCEL:
                return     # the user changed their mind
            eeschema_path = eeschema_dialog.GetPaths()[0]

            try:
                if os.path.isfile(eeschema_path):
                    self.eeschema_file = eeschema_path
                    self.design_name = os.path.basename(eeschema_path.replace('.kicad_sch', ''))
            except IOError:
                wx.LogError("Cannot open file '%s'." % newfile)
                
        self.refresh_eeschema_txt()
        self.refresh_design_name_txt()

        # dialog ask for name
        # print(self.mfda_home)
        # sub = DesignNameDialog(
            # eeschema_path,
            # self.mfda_home,
            # None,
            # title="Export design to OPENMFDA")
        # sub.ShowModal()

        # export verilog code
        self.export_eeschema(
            eeschema_path,
            "test_design",
            self.mfda_home,
        )
        
        # move flushing ports to module ports

        # write config files
        
    def refresh_eeschema_txt(self, event=None):
        self.eeschema_file_txt.WriteText(
            self.eeschema_file
        )
    
    def refresh_design_name_txt(self, event=None):
        self.input_txt.WriteText(self.design_name)
        
    def get_platforms(self): 
        self.design_list_box = wx.ListBox(
            panel,
            style=wx.LB_SINGLE,
            choices=designs)

    def write_verilog(self, event):
        if self.eeschema_file is not None or self.eeschema_file != '':
            # get design name
            #self.export_eeschema()
            pass
        self.Close()