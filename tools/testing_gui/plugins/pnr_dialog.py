import os
import sys
import wx
import subprocess

import eeschema_to_verilog as ee2v


class PnRSubprocDialog(wx.Dialog):
    """
    A dialog that logs subprocess call
    """

    def __init__(self, cmd, *args, **kw):
        super(PnRSubprocDialog, self).__init__(style=wx.DEFAULT_DIALOG_STYLE |
                                               wx.RESIZE_BORDER | wx.MAXIMIZE_BOX, *args, **kw)
        self.cmd = cmd
        panel = wx.Panel(self)
        self.log = wx.TextCtrl(
            panel,
            style=wx.TE_MULTILINE | wx.TE_WORDWRAP | wx.TE_READONLY
        )
        self.proc = None
        self.mfda_home = None
        self.mfda_pnr_docker = "Test"

        convert_eeschema_btn = wx.Button(
            panel, label="Convert eeschema into OpenMFDA")
        convert_eeschema_btn.Bind(wx.EVT_BUTTON, self.convert_eeschema)

        mfda_home_btn = wx.Button(panel, label="Set OpenMFDA home")
        mfda_home_btn.Bind(wx.EVT_BUTTON, self.set_mfda_home)
        self.mfda_home_text = wx.TextCtrl(
            panel,
            style=wx.TE_DONTWRAP | wx.TE_READONLY)
        if "OPENMFDA_FLOW_ROOT" in os.environ:
            self.mfda_home = str(os.path.abspath(
                os.environ["OPENMFDA_FLOW_ROOT"]))
            self.mfda_home_text.WriteText(
                self.mfda_home
            )

        self.rebuildAll_chkbx = wx.CheckBox(panel, label='Rebuild all files')
        self.docker_run_chkbx = wx.CheckBox(panel, label='Run with docker')
        self.docker_run_chkbx.Bind(wx.EVT_CHECKBOX, self.display_docker)
        self.mfda_pnr_docker_text = wx.TextCtrl(
            panel,
            style=wx.TE_DONTWRAP | wx.TE_READONLY)
        self.mfda_pnr_docker_text.WriteText(
            self.mfda_pnr_docker
        )
        self.mfda_pnr_docker_text.Disable()
        self.set_container_btn = wx.Button(panel, label="Set PNR Docker")
        self.set_container_btn.Bind(wx.EVT_BUTTON, self.set_mfda_pnr_docker)
        self.set_container_btn.Disable()

        start_btn = wx.Button(panel, label='Start')
        start_btn.Bind(wx.EVT_BUTTON, self.start)
        halt_btn = wx.Button(panel, label='Halt')
        halt_btn.Bind(wx.EVT_BUTTON, self.halt)

        # Sizer begin
        sizer_vert_main = wx.BoxSizer(wx.VERTICAL)

        sizer_vert_main.Add(convert_eeschema_btn, 0, wx.ALL, 7)
        sizer_vert_main.Add(mfda_home_btn, 0, wx.ALL, 7)
        sizer_vert_main.Add(self.mfda_home_text, 0, wx.EXPAND | wx.ALL, 7)
        sizer_vert_main.Add(self.rebuildAll_chkbx, 0, 0, 7)
        sizer_vert_main.Add(self.docker_run_chkbx, 0, 0, 7)
        sizer_vert_main.Add(self.mfda_pnr_docker_text,
                            0, wx.EXPAND | wx.ALL, 7)
        sizer_vert_main.Add(self.set_container_btn, 0, wx.ALL, 7)
        sizer_vert_main.Add(start_btn, 0, wx.ALL, 7)
        sizer_vert_main.Add(halt_btn, 0, wx.ALL, 7)
        # sizer_v_main.Add(wx.TextCtrl(), 0, wx.ALL, 7) # log text
        sizer_vert_main.Add(self.log, 1, wx.ALL | wx.EXPAND, 7)

        panel.SetSizer(sizer_vert_main)

        self.SetInitialSize(wx.Size(650, 750))

    def halt(self, event):
        if self.proc:
            self.proc.terminate()

    def start(self, event):
        cmd_B = ['-B'] if self.rebuildAll_chkbx.IsChecked() else []
        self.log.write(' '.join(self.cmd)+'\n')
        self.proc = subprocess.Popen(
            self.cmd + cmd_B,
            stdout=subprocess.PIPE, stderr=subprocess.STDOUT
        )

        while True:
            wx.Yield()
            line = self.proc.stdout.readline()
            if line:
                self.log.write(line)
            else:
                break
        self.proc.wait()
        wx.MessageBox("Done.")

    def display_docker(self, event):
        if self.docker_run_chkbx.IsChecked():
            self.mfda_pnr_docker_text.Enable()
            self.set_container_btn.Enable()
        else:
            self.mfda_pnr_docker_text.Disable()
            self.set_container_btn.Disable()
        # set elements visible true

    def export_eeschema(self, ee_file, design, out_loc):
        sch = ee2v.Schematic().from_file(ee_file)
        ext = ee2v.EeschemaToVerilog(sch, design)
        ext.extract()
        ext.print_verilog()

    def convert_eeschema(self, event):
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
                    # load schematic
                    sch = ee2v.Schematic().from_file(eeschema_path)
            except IOError:
                wx.LogError("Cannot open file '%s'." % newfile)

        # dialog ask for name
        print(self.mfda_home)
        sub = DesignNameDialog(
            eeschema_path,
            self.mfda_home,
            None,
            title="Export design to OPENMFDA")
        sub.ShowModal()

        # export verilog code
        self.export_eeschema(
            eeschema_path,
            "test_design",
            self.mfda_home,
        )
        
        # move flushing ports to module ports

        # write config files


    def set_mfda_home(self, event):

        # otherwise ask the user what new file to open
        with wx.DirDialog(
            self,
            "Open XYZ file",
            style=wx.DD_DEFAULT_STYLE
            | wx.DD_DIR_MUST_EXIST
        ) as fileDialog:

            if fileDialog.ShowModal() == wx.ID_CANCEL:
                return     # the user changed their mind

            # Proceed loading the file chosen by the user
            pathname = fileDialog.GetPath()
            try:
                if os.path.isdir(pathname):
                    # probably show check if valid
                    self.mfda_home = pathname
                    self.mfda_home_text.SetValue(pathname)
                    os.environ["OPENMFDA_FLOW_ROOT"] = os.path.abspath(
                        pathname
                    )
                    return
                else:
                    return

            except IOError:
                wx.LogError("Cannot open file '%s'." % newfile)

    def set_mfda_pnr_docker(self, event):
        pass


class DesignNameDialog(wx.Dialog):

    def __init__(self, eeschema_file, openmfda_flow_loc, *args, **kw):

        super(DesignNameDialog, self).__init__(
            style=wx.DEFAULT_DIALOG_STYLE |
            wx.RESIZE_BORDER | wx.MAXIMIZE_BOX,
            *args, **kw
        )

        pnl = wx.Panel(self)

        dialog_txt = wx.StaticText(pnl, label="Input design name")

        eeschema_sttxt = wx.StaticText(pnl, label="Input file:")
        eeschema_file_txt = wx.TextCtrl(pnl,
                                        style=wx.TE_DONTWRAP | wx.TE_READONLY
                                        )
        eeschema_file_txt.WriteText(
            eeschema_file
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

        input_sttxt = wx.StaticText(pnl, label="Design name:")
        input_txt = wx.TextCtrl(pnl)

        accept_btn = wx.Button(pnl, label="Export")
        accept_btn.Bind(wx.EVT_BUTTON, self.write_verilog)

        vert_sizer = wx.BoxSizer(wx.VERTICAL)

        vert_sizer.Add(dialog_txt, 0, wx.ALIGN_CENTER_HORIZONTAL | wx.ALL, 7)
        vert_sizer.Add(eeschema_sttxt, 0, wx.ALL, 7)
        vert_sizer.Add(eeschema_file_txt, 0, wx.EXPAND | wx.ALL, 7)
        vert_sizer.Add(design_sttxt, 0, wx.ALL, 7)
        vert_sizer.Add(design_location_txt, 0, wx.EXPAND | wx.ALL, 7)
        vert_sizer.Add(input_sttxt, 0, wx.ALL, 7)
        vert_sizer.Add(input_txt, 0, wx.EXPAND | wx.ALL, 7)
        vert_sizer.Add(accept_btn, 0, wx.ALL, 7)

        pnl.SetSizer(vert_sizer)

        self.SetInitialSize(wx.Size(650, 350))
        
    def get_platforms(self): 
        self.design_list_box = wx.ListBox(
            panel,
            style=wx.LB_SINGLE,
            choices=designs)

    def write_verilog(self, event):
        DesignNameDialog.Close(self)


class PnRPlugin_test():
    def defaults(self):
        self.name = "OpenMFDA Place and Route"
        self.category = "A descriptive category name"
        self.description = "A description of the plugin and what it does"
        self.show_toolbar_button = True
        self.icon_file_name = os.path.join(
            os.path.dirname(__file__), 'icon.png')

    def Run(self):
        self.defaults()
        sub = PnRSubprocDialog('', None, title=self.name)
        sub.ShowModal()


def test_pnr_dialog():
    PnRPlugin_test().Run()


if __name__ == "__main__":
    app = wx.App()
    test_pnr_dialog()
