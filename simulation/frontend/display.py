
import tkinter as tk
from tkinter import filedialog
from tkinter import ttk

import matplotlib
import matplotlib.pyplot as plt

matplotlib.use('TkAgg')
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg, NavigationToolbar2Tk
from matplotlib.figure import Figure

import pandas as pd

import docker

import configparser

## local imports
import sys, os
sys.path.insert(1, os.getcwd())
import runMFDASim

class GraphPage(tk.Frame):

    def __init__(self, parent):
        tk.Frame.__init__(self, parent)
        self.title_label = tk.Label(self, text="Graph Page Example")
        self.title_label.pack()
        #self.pack()

    def add_mpl_figure(self, fig):
        self.fig = fig
        self.mpl_canvas = FigureCanvasTkAgg(fig, self)
        self.mpl_canvas.draw()
        self.mpl_canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=True)

        self.toolbar = NavigationToolbar2Tk(self.mpl_canvas, self)
        self.toolbar.update()
        self.mpl_canvas._tkcanvas.pack(side=tk.TOP, fill=tk.BOTH, expand=True)

    def update_mpl_figure(self, x, y, label=None):
        self.fig.update_plot_data(x, y, label=label)
        self.mpl_canvas.draw()

    def add_plot_to_figure(self, x, y, label=None):
        self.fig.add_plot_data(x, y, label=label)

    def draw(self):
        self.mpl_canvas.draw()

    def clear(self):
        self.fig.clear_plots()


class MPLGraph(Figure):

    def __init__(self):
        Figure.__init__(self, figsize=(5, 5), dpi=100)
        self.plot = self.add_subplot(111)
        self.plot.plot([1, 2, 3, 4, 5, 6, 7], [4, 3, 5, 0, 2, 0, 6])

    def update_plot_data(self, x, y, label=None):
        self.plot.clear()
        self.add_plot_to_figure(x, y, label=label)

    def add_plot_data(self, x, y, label):
        if label == None:
            self.plot.plot(x, y)
        else:
            self.plot.plot(x, y, label=label)

    def clear_plots(self):
        self.plot.clear()

class tkTable(ttk.Treeview):
    
    #anchor = []

    def __init__(self,
                 parent,
                 width,
                 height,
                 #bg='#AC99F2'
                 ):
        ttk.Treeview.__init__(
            self, 
            parent, 
            #width=width, 
            #height=height
            )
        self.width = width
        self.height= height
        #self.pack()


    def import_data(self, data, index_colunm=True):
        
        if isinstance(pd.DataFrame):
            
            self.num_columns=len(list(data))
            if index_colunm:
                self.num_columns += 1

            column_width=int(self.width/self.num_columns)

            for c in list(data):
                self.column(c, anchor=tk.CENTER, width=column_width)
                self.heading(c, text=c, anchor=tk.CENTER)

            self.num_rows = 0
            for row in data.itterows():
                row = list(row)

                self.insert(parent='', index='end', iid=self.num_rows,
                                  values=row)
                self.num_rows += 1
            




    def add_column(coln, data=None):
        pass

    def add_row(row, data):
        pass


def get_docker_containers():
    client = docker.from_env()
    return [d.name for d in client.containers.list()]

# need some kind of global var for this
def refreshProjects():
    pass

def refreshProjects(proj_file):
    
    proj_dir = {}

    for f1 in os.listdir(proj_file):
        _f1 = proj_file+"/"+f1
        if os.path.isdir(_f1):
            proj_dir[f1] = {} 

            proj_dir[f1]['base'] = _f1

            validateNetListFile(proj_file, f1, proj_dir)

            validateOpenROADsrc(proj_file, f1, proj_dir)

            validateOpenSCADsrc(proj_file, f1, proj_dir)

            validateXycescr(proj_file, f1, proj_dir)

            getXyceFiles(proj_file, f1, proj_dir)

    return proj_dir

def refreshProjectOptions(config, optionmenu, optionVar):
    
    if not isinstance(optionmenu, tk.OptionMenu):
        return
    
    optionmenu['menu'].delete('0',tk.END)

    if 'projects' in config and len(config['projects']) > 0:
        optionmenu.configure(state='active')
        for proj in config['projects']:
            optionmenu['menu'].add_command(label=proj, command=tk._setit(optionVar, proj))

    else:
        optionmenu.configure(state='disabled')

def searchForFileExt(wd, ext, baseDir=True):
    fileList = []
    for f in os.listdir(wd):
        f = wd+"/"+f
        if os.path.isdir(f):
            fileList += searchForFileExt(wd+"/"+f, ext)
        if os.path.isfile(f):
            f_ext = f.split(".")[-1]
            if f_ext == ext:
                if not baseDir:
                    fileList += [os.path.basename(f)]
                else:
                    fileList += [f]

    return fileList

def validateNetListFile(wd, proj_name, proj_config):
    proj_wd = wd+"/"+proj_name

    if os.path.isfile(proj_wd+"/"+proj_name+".v"):
        return True
    return False

def validateOpenROADsrc(wd, proj_name, proj_config):
    pass

def validateOpenSCADsrc(wd, proj_name, proj_config):
    pass

def validateXycescr(wd, proj_name, proj_config):
    
    proj_wd = wd+"/"+proj_name
    proj = proj_config[proj_name]

    #check for results folder
    results_dir = proj_wd+ \
                   "/results"
    
    if (os.path.isdir(results_dir)):
        proj['results'] = results_dir

    #check for spice folder
    spice_dir = proj_wd+ \
                   "/spiceFiles"
    
    if (os.path.isdir(spice_dir)):
        proj['spiceFiles'] = spice_dir

    # check devices file
    devices_file = proj_wd+ \
                   "/devices.csv"
    
    if os.path.isfile(devices_file):
        proj['devices'] = devices_file

    # chech spec file
    spec_file = proj_wd+ \
                   "/"+proj_name+"_spec.csv"

    if os.path.isfile(spec_file):
        proj['spec'] = spec_file

    # check time file
    time_file = proj_wd+ \
                   "/simTime.csv"
    
    if os.path.isfile(time_file):
        proj['time'] = time_file

    #os.path.isfile(time_file)
    # check veirlog file
    verilog_file = proj_wd+ \
                    "/"+proj_name+".v"
    
    if os.path.isfile(verilog_file):
        proj['netlist'] = verilog_file       

    #if os.path.isfile()

def getXyceFiles(wd, proj_name, proj_config):

    proj_wd = wd+"/"+proj_name
    proj = proj_config[proj_name]

    results_ext = "prn"
    # inspect results dir
    if 'results' in proj:
        results_files = searchForFileExt(
            proj["results"], 
            results_ext,
            baseDir=False)
        proj["result_files"] = results_files

    spice_ext = "cir"
    # inspect spiceFiles dir
    if 'spiceFiles' in proj:
        spice_files = searchForFileExt(
            proj["spiceFiles"], 
            spice_ext,
            baseDir=False)
        proj["spice_files"] = spice_files

def getProjectDirectory():
    pass

def selectSimulationDockerImage():
    pass

def selectPnrDockerImage():
    pass


## Option Menu callback
"""
For config the project files are under
    config["projects"][$proj]["result_files"]
"""
def refreshProjectWidgets(config, optionVar, listboxVarPrn, listboxVarCir, verilogStatVar):
    updateListBox(config, optionVar, listboxVarPrn, listboxVarCir)
    updateVerilogStat(config, optionVar, verilogStatVar)

def updateVerilogStat(config, optionVar, verilogVar):
    selectProj = optionVar.get()
    if 'netlist' in config['projects'][selectProj]:
        verilogVar.set("Verilog netlist detected")
    else:
        verilogVar.set("Verilog netlist not detected!")

def updateListBox(config, optionVar, listboxVarPrn, listboxVarCir):
    #if not isinstance(listboxVar, tk.Variable): 
    #    print("wrong list type")
    #    return


    selectProj = optionVar.get()
    if selectProj in config['projects']:
        if 'result_files' in config['projects'][selectProj]: 
            listboxVarPrn.set(config['projects'][selectProj]['result_files'])

    if selectProj in config['projects']:
        if 'result_files' in config['projects'][selectProj]: 
            listboxVarCir.set(config['projects'][selectProj]['spice_files'])
            
                

## Listbox plot the selected file

def updatePlot_from_list(project, selectedFile, config, plotframe, selectedPlots):

    project = project.get() 
    if (project in config['projects'] and  
        'result_files' in config['projects'][project]):
        if selectedFile in config['projects'][project]['result_files']:
            rFile = "/".join([
                config['projects'][project]['results'],
                selectedFile    
            ])

            rData = runMFDASim.load_xyce_results(
                config['projects'][project]['results'],
                [selectedFile]
                )[0]
            
            # returns column names
            rDataKeys = list(rData)[1:]

            plotframe.clear()
            for k in rDataKeys:
                if k in selectedPlots:
                    plotframe.add_plot_to_figure(rData["TIME"], rData[k], label=k)
            plotframe.draw()

def updatePlot_variables(project, selectedFile, config, plotNodeVar):
    project = project.get() 
    if (project in config['projects'] and  
        'result_files' in config['projects'][project]):
        if selectedFile in config['projects'][project]['result_files']:
            rFile = "/".join([
                config['projects'][project]['results'],
                selectedFile    
            ])

            rData = runMFDASim.load_xyce_results(
                config['projects'][project]['results'],
                [selectedFile]
                )[0]
            
            # returns column names
            # removes TIME
            rDataKeys = list(rData)[1:]

            plotNodeVar.set(rDataKeys)

def updatePlot():
    pass

####################################################################
## Button things

def callback_b1():
    folder_selected = filedialog.askdirectory()

def callback_b1(config, optionmenu, optionVar):
    config["project_dir"].set(filedialog.askdirectory())

    config["projects"] = refreshProjects(config["project_dir"].get())

    refreshProjectOptions(config, optionmenu, optionVar)

##################################
## Simulation buttons

def check_config(proj_config):
    return True


def callback_sim_button(config, optionVar):
    selectProj = optionVar.get()
    if check_config(config['projects'][selectProj]):
        proj_config = config['projects'][selectProj]
        runMFDASim.runSimulation(
            verilogFile=proj_config['netlist'],
            workDir=proj_config['base'], 
            libraryFile='',
            cirConfigFile='',
            preRouteSim=False,
            dockerContainer=None,
            dockerWD=None,
            xyceFiles="spiceList",
            convert_v=True)
    else:
        print("Incomplete project file")

def callback_convert_verilog_button():
    pass


def load_frame_1_proj_selection():
    pass

def main():

    

    ##################################
    # windows definitions
    w1 = tk.Tk()
    w1.resizable(False, False)
    w1.title("MFDA Application")

    ##################################
    # Main window frames
    f_main = tk.Frame(w1, height=400, width=800)
    f1 = tk.Frame(f_main)
    f_err = tk.Frame(f_main)

    f1.grid(column=0, row=0)
    f_err.grid(column=0, row=1)
    
    sub_f1 = tk.Frame(f1) # for sim selection
    sub_f1.grid(column=0, row=0)
    
    sub_f2 = tk.Frame(f1) # for ploting
    sub_f2.grid(column=2, row=0)
    
    sub_f3 = tk.Frame(sub_f1) # for node list
    sub_f3.grid(column=1, row=3, rowspan=3, sticky=tk.NW)

    ##################################
    # load configs
    config_file = "./frontend/config.ini"
    app_config = configparser.ConfigParser().read(config_file)
    app_config = tk.Variable(w1, app_config)


    #### configurations importation
    prog_config = {}
    prog_config['project_dir'] = tk.StringVar(w1, "project directory")
    
    ##################################
    #### Directory selection
    l1_dir = tk.Label(
        sub_f1,
        #text="test text",
        textvariable=prog_config['project_dir'],
        height=2,
        width=50,
        justify='left',
        anchor='nw'
    )
    proj_label_pad=10
    l1_dir.grid(column=0, row=0, sticky=tk.W, padx=proj_label_pad, columnspan=2)
    #l1_dir.pack(ipadx=10, ipady=10)

    listboxProjVarPrn = tk.Variable()

    lb1_proj= tk.Listbox(
        sub_f1,
        listvariable=listboxProjVarPrn,
        #command=lambda: updatePlot(
        #    projectVar,
        #    lb1_proj.curselection(),
        #    prog_config, 
        #    fig),
        height=16,
        width=40,
        selectmode=tk.EXTENDED,
        exportselection=0
    )
    lb1_proj.grid(column=0, row=3)
    
    # list simulation files
    listboxProjVarCir = tk.Variable()

    lb2_proj= tk.Listbox(
        sub_f1,
        listvariable=listboxProjVarCir,
        #command=lambda: updatePlot(
        #    projectVar,
        #    lb1_proj.curselection(),
        #    prog_config, 
        #    fig),
        height=5,
        width=40,
        selectmode=tk.EXTENDED
    )
    lb2_proj.grid(column=0, row=5)

    sub_f1_sim_but = tk.Frame(sub_f1)
    sub_f1_sim_but.grid(column=0, row=4)

    b5_simulate = tk.Button(
        sub_f1_sim_but,
        text=" Run Simulation "
    )
    b5_simulate.grid(column=1, row=0)

    b6_convert_verilog = tk.Button(
        sub_f1_sim_but,
        text=" Convert Verilog "
    )
    b6_convert_verilog.grid(column=0, row=0)

    l3_string = tk.StringVar(w1)
    l3_string.set("Verilog detected: ----- ")
    #l3_string.trace_add('write', lambda *args:)
    l3_verilog_stat=tk.Label(
        sub_f1_sim_but,
        textvariable=l3_string,
        justify='left',
        anchor='w'
    )
    l3_verilog_stat.grid(column=0, columnspan=2, row=1, sticky=tk.W)

    projectVar = tk.StringVar(w1)
    projectVar.set("Project List")
    #projectVar.trace_add('wirte', lambda *args: print(projectVar.get()))
    projectVar.trace_add(
        'write', 
        lambda *args: refreshProjectWidgets(prog_config, projectVar, listboxProjVarPrn, listboxProjVarCir, l3_string
        ))

    #projectVarCir = tk.StringVar(w1)
    #projectVarCir.trace_add('write', lambda *args: updateListBox(prog_config, projectVarCir, listboxProjVarCir))

    sub_f1_proj_but = tk.Frame(sub_f1)
    sub_f1_proj_but.grid(column=0, row=2, sticky=tk.W, padx=proj_label_pad, columnspan=2)

    om1_proj = tk.OptionMenu(
    #om2_docker = tk.Listbox(
        sub_f1_proj_but,
        projectVar,
        " ",
        command=lambda: updateListBox(prog_config, projectVar, listboxProjVarPrn)
        #height=1,
        #width=25
    )
    om1_proj.grid(column=0, row=0)
    om1_proj.configure(state="disabled")


    b1_dir = tk.Button(
            sub_f1, 
            text="Projects", 
            command=lambda: callback_b1(prog_config, om1_proj, projectVar))
    b1_dir.grid(column=0, row=1, sticky=tk.W, padx=proj_label_pad, columnspan=2)
    #b1_dir.pack(ipadx=10, ipady=10)

    # select button
    b4_select = tk.Button(
        sub_f1_proj_but,
        text="Select",
        command=lambda: updatePlot_variables(
            projectVar,
            listboxProjVarPrn.get()[lb1_proj.curselection()[0]],
            prog_config, 
            #fig,
            listboxNodeVar
        ),
    )
    b4_select.grid(column=1, row=0, sticky=tk.E)


    
    ##################################
    ######
    ## Docker buttons
    l2_docker = tk.Label(
        sub_f2,
        text="Docker container status: --------"
    )
    l2_docker.grid(column=0, row=1)
    
    docker_container_list = get_docker_containers()
    dockerVar = tk.StringVar(w1)
    dockerVar.set("container")

    om2_docker = tk.OptionMenu(
    #om2_docker = tk.Listbox(
        sub_f2, 
        dockerVar,
        *docker_container_list
    )
    om2_docker.grid(column=0, row=0)

    sub_f2_dock = tk.Frame(sub_f2)
    sub_f2_dock.grid(column=0, row=2)

    # start container
    b2_docker_start = tk.Button(
        sub_f2_dock,
        text="Start",
    )
    b2_docker_start.grid(column=0, row=0)

    # stop container
    b2_docker_stop  = tk.Button(
        sub_f2_dock,
        text="Stop",
    )
    b2_docker_stop.grid(column=1, row=0)

    ##################################
    ######
    # Figure
    fig = MPLGraph()

    graph_page = GraphPage(sub_f2)
    graph_page.add_mpl_figure(fig)
    graph_page.grid(column=0, row=3)
    #column=1

    #sub_f3_add_remove = tk.Frame(sub_f3)
    # add button
    #b_node_add = tk.Button(
    #    sub_f3_add_remove,
    #    text="add"
    #)
    # remove button
    #b_node_remove = tk.Button(
    #    sub_f3_add_remove,
    #    text="remove"
    #)
    #b_node_add.grid(column=0, row=0)
    #b_node_remove.grid(column=1, row=0)
    #
    #sub_f3_add_remove.grid(column=0, row=1)

    # plot button
    b3_plot = tk.Button(
        sub_f3,
        text="Plot",
        command=lambda: updatePlot_from_list(
            projectVar,
            listboxProjVarPrn.get()[lb1_proj.curselection()[0]],
            prog_config, 
            #fig,
            graph_page,
            listboxNodeVar.get()
        ),
    )
    b3_plot.grid(column=0, row=3)

    listboxNodeVar = tk.Variable()

    lb3_node= tk.Listbox(
        sub_f3,
        listvariable=listboxNodeVar,
        #command=lambda: updatePlot(
        #    projectVar,
        #    lb1_proj.curselection(),
        #    prog_config, 
        #    fig),
        height=28,
        width=16,
        selectmode=tk.MULTIPLE,
        #selectmode='multiple',
        exportselection=0
    )
    lb3_node.grid(column=0, row=0)


    ##################################
    #### error frame

    #debug_hide_label=tk.Label(
    #    f_err,
    #    text="Hide debug"
    #)
    

    debug_label=tk.Label(
        f_err,
        text="Test Text",
        justify='left',
        anchor='nw',
        width=130,
        height=10,
        bg='#A9A9A9'
    )
    debug_hide_label=tk.Button(
        f_err,
        text="Hide debug",
        command=debug_label.grid_remove()
    )

    debug_hide_label.grid(column=0, row=0, sticky=tk.W)
    debug_label.grid(column=0, row=1, sticky=tk.NW)

    err_table = tkTable(
        f_err, 
        #title="Evaluation Frame",
        height=10,
        width=130
        )
    err_table.grid(column=0, row=2)

    f_main.pack()
    w1.mainloop()






if __name__ == "__main__":
    
    
    main()