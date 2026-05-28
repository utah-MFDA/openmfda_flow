
import wx
import os
import sys

plugins_dir = os.path.abspath(os.path.dirname(
    __file__) + '/../plugins/')
if os.path.exists(plugins_dir):
    sys.path.append(plugins_dir)
    # fmt: off
    import pnr_dialog
    import render_dialog
    import slice_dialog
    from openmfda_cmd_gen import gen_cmd
    # fmt: on
else:
    raise ValueError(f'Dirctory "{plugins_dir}" does not exist for import')


class SetDesignDialog(wx.Dialog):

    def __init__(self, designs, *args, **kw):

        super(SetDesignDialog, self).__init__(
            *args,
            **kw)

        panel = wx.Panel(self)

        self.set_design = ''
        self.design_list_box = wx.ListBox(
            panel,
            style=wx.LB_SINGLE,
            choices=designs)

        select_btn = wx.Button(panel, wx.ID_OK, label='Select Design')
        # select_btn.Bind(wx.EVT_BUTTON, wx.ID_OK)

        sizer = wx.BoxSizer(wx.VERTICAL)

        sizer.Add(self.design_list_box)
        sizer.Add(select_btn)

        panel.SetSizer(sizer)

        self.SetSizerAndFit(panel)

    def return_design(self, event):
        # if self.design_list_box.GetSelection():
        # print(design)
        pass


class TestSubprocDialog(wx.Dialog):
    """
    A dialog that tests the plugin dialogs
    """

    def __init__(self, cmd, *args, **kw):
        super(TestSubprocDialog, self).__init__(
            style=wx.DEFAULT_DIALOG_STYLE | wx.RESIZE_BORDER | wx.MAXIMIZE_BOX,
            *args,
            **kw)

        self.selected_design = ''
        self.selected_platform = ''
        self.design_variant = 'base'
        self.config = None

        if "OPENMFDA_FLOW_ROOT" in os.environ:
            if os.path.exists(f'{os.environ["OPENMFDA_FLOW_ROOT"]}/results'):
                self.omfda_results = f'{os.environ["OPENMFDA_FLOW_ROOT"]}/results'
            if os.path.exists(f'{os.environ["OPENMFDA_FLOW_ROOT"]}/platforms'):
                self.omfda_platform = f'{os.environ["OPENMFDA_FLOW_ROOT"]}/platforms'
            if os.path.exists(f'{os.environ["OPENMFDA_FLOW_ROOT"]}/logs'):
                self.omfda_log = f'{os.environ["OPENMFDA_FLOW_ROOT"]}/logs'

        panel = wx.Panel(self)

        # set_design_btn = wx.Button(panel, label='Set design')
        # set_design_btn.Bind(wx.EVT_BUTTON, self.set_design)

        if "OPENMFDA_FLOW_ROOT" in os.environ:
            designs = self.get_designs_from_root(
                f"{os.environ['OPENMFDA_FLOW_ROOT']}/designs"
            )
            self.design_list_box = wx.ListBox(
                panel,
                style=wx.LB_SINGLE,
                choices=['/'.join(a) for a in designs]
            )
        else:
            designs = []

        pnr_btn = wx.Button(panel, label='PnR test')
        pnr_btn.Bind(wx.EVT_BUTTON, self.pnr_test)

        render_btn = wx.Button(panel, label='Render test')
        render_btn.Bind(wx.EVT_BUTTON, self.render_test)

        slice_btn = wx.Button(panel, label='Slice test')
        slice_btn.Bind(wx.EVT_BUTTON, self.slice_test)

        sizer = wx.BoxSizer(wx.VERTICAL)

        # sizer.Add(set_design_btn, 0, wx.ALL, 6)
        if len(designs) > 0:
            sizer.Add(self.design_list_box, 0, wx.ALL, 6)
        sizer.Add(pnr_btn, 0, wx.ALL, 6)
        sizer.Add(render_btn, 0, wx.ALL, 6)
        sizer.Add(slice_btn, 0, wx.ALL, 6)
        panel.SetSizer(sizer)

        self.SetInitialSize(wx.Size(350, 400))

    def pnr_test(self, event):
        self.set_design()
        sub = pnr_dialog.PnRSubprocDialog(
            gen_cmd(
                design=self.selected_design,
                config=f"{os.environ['OPENMFDA_FLOW_ROOT']}/designs/{self.selected_platform}/{self.selected_design}/config.mk",
                results=f"{self.omfda_results}/{self.selected_design}/{self.design_variant}",
                args=['pnr']
            ), None, title='OpenMFDA Place and Routing')
        sub.ShowModal()

    def render_test(self, event):
        self.set_design()
        sub = render_dialog.RenderSubprocDialog(
            gen_cmd(
                design=self.selected_design,
                config=f"{os.environ['OPENMFDA_FLOW_ROOT']}/designs/{self.selected_platform}/{self.selected_design}/config.mk",
                results=f"{self.omfda_results}/{self.selected_design}/{self.design_variant}",
                args=['scad']
            ),
            f"{self.omfda_results}/{self.selected_design}/{self.design_variant}/{self.selected_design}_base.scad",
            None,
            title='OpenMFDA Render')
        sub.ShowModal()

    def slice_test(self, event):
        self.set_design()
        sub = slice_dialog.SliceSubprocDialog(
            gen_cmd(
                design=self.selected_design,
                config=f"{os.environ['OPENMFDA_FLOW_ROOT']}/designs/{self.selected_platform}/{self.selected_design}/config.mk",
                results=f"{self.omfda_results}/{self.selected_design}/{self.design_variant}",
                args=['render']
            ),
            gen_cmd(
                design=self.selected_design,
                config=f"{os.environ['OPENMFDA_FLOW_ROOT']}/designs/{self.selected_platform}/{self.selected_design}/config.mk",
                results=f"{self.omfda_results}/{self.selected_design}/{self.design_variant}",
                args=['slice']
            ), None, title='OpenMFDA Slicing')
        sub.ShowModal()

    def get_designs_from_root(self, design_dir):

        def has_config(plat_dir, des_dir):
            return os.path.exists(f"{design_dir}/{plat_dir}/{des_dir}/config.mk")

        def has_io(plat_dir, des_dir):
            return os.path.exists(f"{design_dir}/{plat_dir}/{des_dir}/io_constraints.tcl")

        # get platform dir
        # skip src
        platform_dirs = os.listdir(design_dir)
        verified_plat = []
        verified_designs = []
        for pf in platform_dirs:
            if pf == 'src':
                continue
            pf_dir = f"{design_dir}/{pf}"
            if os.path.isdir(pf_dir):
                verified_plat.append(pf)
                # get designs
                for df in os.listdir(pf_dir):
                    df_dir = f"{pf_dir}/{df}"
                    if os.path.isdir(df_dir):
                        if has_config(pf, df) and has_io(pf, df):
                            verified_designs.append([pf, df])
                        else:
                            print(
                                f'Unable to find config and io for design "{df}"')

        return verified_designs

    def set_design(self):
        de = self.design_list_box.GetString(
            self.design_list_box.GetSelection()
        )
        print(de)
        self.selected_platform = de.split('/')[0]
        self.selected_design = de.split('/')[1]

    def set_design_othDialog(self, event):
        if "OPENMFDA_FLOW_ROOT" in os.environ:
            designs = self.get_designs_from_root(
                os.environ["OPENMFDA_FLOW_ROOT"] + '/designs')

            design_ind = None
            sub = SetDesignDialog(['/'.join(a) for a in designs], None)
            sub.ShowModal()
            if sub == wx.ID_OK:
                print(sub.design_list_box.GetSelection())
                design_ind = sub.design_list_box.GetSelection()
            print(design_ind)
            sub.Destroy()

            if design_ind is not None:
                self.set_design = designs[design_ind][1]


def start_app_dialog():
    app = wx.App()
    sub = TestSubprocDialog('', None)
    sub.ShowModal()


start_app_dialog()
