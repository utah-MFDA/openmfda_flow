import os
import wx
import subprocess


class RenderSubprocDialog(wx.Dialog):
    """
    A dialog that logs subprocess call
    """

    def __init__(self, cmd, scad_file, *args, **kw):
        super(RenderSubprocDialog, self).__init__(style=wx.DEFAULT_DIALOG_STYLE |
                                                  wx.RESIZE_BORDER | wx.MAXIMIZE_BOX, *args, **kw)
        self.cmd = cmd
        panel = wx.Panel(self)
        self.log = wx.TextCtrl(
            panel,
            style=wx.TE_MULTILINE | wx.TE_WORDWRAP | wx.TE_READONLY
        )
        self.proc = None
        self.mfda_home = None
        self.render_file = scad_file

        start_btn = wx.Button(panel, label='Run OpenSCAD')
        start_btn.Bind(wx.EVT_BUTTON, self.start)
        halt_btn = wx.Button(panel, label='Halt')
        halt_btn.Bind(wx.EVT_BUTTON, self.halt)

        self.mfda_home_text = wx.TextCtrl(
            panel,
            style=wx.TE_DONTWRAP | wx.TE_READONLY)
        if "OPENMFDA_FLOW_ROOT" in os.environ:
            self.mfda_home_text.SetValue(os.environ["OPENMFDA_FLOW_ROOT"])
        elif "OPENMFDA_ROOT" in os.environ:
            self.mfda_home_text.SetValue(os.environ["OPENMFDA_ROOT"])
        else:
            pass
        mfda_home_btn = wx.Button(panel, label="Set OpenMFDA home")
        mfda_home_btn.Bind(wx.EVT_BUTTON, self.set_mfda_home)

        sizer_v_main = wx.BoxSizer(wx.VERTICAL)

        sizer_v_main.Add(mfda_home_btn, 0, wx.ALL, 7)
        sizer_v_main.Add(self.mfda_home_text, 0, wx.EXPAND | wx.ALL, 7)
        sizer_v_main.Add(start_btn, 0, wx.ALL, 7)
        sizer_v_main.Add(halt_btn, 0, wx.ALL, 7)
        sizer_v_main.Add(self.log, 1, wx.ALL | wx.EXPAND, 7)

        panel.SetSizer(sizer_v_main)

    def halt(self, event):
        if self.proc:
            self.proc.terminate()

    def start(self, event):
        # self.log.write('WD:'+os.path.abspath(self.mfda_home)+'\n')
        self.log.write(' '.join(self.cmd))
        self.proc = subprocess.Popen(
            self.cmd,
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
        self.run_openscad(None)
        # wx.MessageBox("Done.")

    def run_openscad(self, event):
        openscad_cmd = ['openscad', self.render_file]
        self.log.write(' '.join(openscad_cmd))
        subprocess.Popen(
            openscad_cmd,
            stdout=subprocess.PIPE, stderr=subprocess.STDOUT
        )

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


class RenderPlugin_test():
    def defaults(self):
        self.name = "OpenMFDA Render"
        self.category = "A descriptive category name"
        self.description = "A description of the plugin and what it does"
        self.show_toolbar_button = True
        self.icon_file_name = os.path.join(
            os.path.dirname(__file__), 'icon.png')

    def Generate_cmd(self):
        return ['openscad']

    def Run(self):
        self.defaults()
        sub = RenderSubprocDialog(
            self.Generate_cmd(),
            None,
            title=self.name)
        sub.ShowModal()


def test_render_dialog():
    RenderPlugin_test().Run()


if __name__ == "__main__":
    app = wx.App()
    test_render_dialog()
