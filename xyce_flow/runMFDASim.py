
import argparse
import os
import shutil
import subprocess

import docker
import tarfile
import json

import pandas as pd
import matplotlib.pyplot as plt

# local imports
#from V2Va_Parser import Verilog2Xyce


from SimulationXyce import SimulationXyce

"""
Required inputs

- docker image (or) docker container name
- netlist location
- specification location


Steps
- convert to xyce netlist (.cir)
- upload to docker image
- wait for image to complete sim (or) get error
- pull completed file
- evaluate to spec

"""
   

# returns the date and time as a string for files
def timeString():
    from datetime import datetime
    return str(datetime.now()) \
        .replace(":","") \
        .replace(" ","") \
        .split(".")[0]


# ----------------------------------------------------
# main exec
# ----------------------------------------------------
"""
verilogFile
    - Verilog netlist
workDir
    - local directory for other files
libraryFile
    - file for list of components
cirConfig
    - 
preRouteSim
    -
dockerContainer
    - simulation docker container name
dockerWD
    - working directory for simulation
xyceFiles
    - location for xyce files to be generated
"""
def runSimulation(
        design,
        verilogFile,
        sim_config, 
        workDir, 
        libraryFile,
        isLocalXyce,
        cirConfigFile=None,
        length_file=None,
        preRouteSim=False,
        dockerContainer=None,
        dockerWD=None,
        #verilog_2_xyce_extras_loc="spiceFiles",
        verilog_2_xyce_extras_loc=None,
        verilog_2_xyce_relative=True,
        #xyceFiles="spiceList",
        convert_v=True,
        output_dir=None,
        pcell_file=None,
        extra_args={}):

    if verilogFile[-2:] == '.v':
        design_name = verilogFile[:-2]
    else:
        raise ValueError("Netlist is not a valid file, must be .v, \ninput file: "+str(verilogFile))
    
    # hard coded simulation directory in docker image


    #sim_config     = workDir+"/simulation.config"

    ###### extra argument handling #####
    
    # default definitions
    _main_plot_results = False
    #xyceFiles = 'spiceList' 
    xyceFiles = 'spice_files.csv' 
    
    if ('plot' in extra_args) and (extra_args['plot'].lower() in ['true', '1']):
        _main_plot_results = True
    else:
        _main_plot_results = False
    
    # Checks local_xyce value
    if (isLocalXyce.lower() in ['true', '1']):
        _local_xyce = True
        _noarchive = True # no docker archive created
        convert_basename = False
        if 'xyce_run_config' in extra_args:
            _xyce_run_config=extra_args['xyce_run_config']
        else:
            _xyce_run_config=None
    elif (isLocalXyce.lower() in ['false', '0']):
        _local_xyce = False
        _noarchive = False
        convert_basename = True
    else:
        raise InputError("--local_xyce much be false or true (0 or 1)")

    #if (('eval_file' in extra_args) and (extra_args['eval_file'] is not None)) or \
        #(('eval_result' in extra_args) and (extra_args['eval_result'].lower() in ['true', '1'])):
        #_eval_file = True
    #else:
        #_eval_file = False

    if ('eval_result' in extra_args) and (extra_args['eval_result'].lower() in ['true', '1']):
        _eval_file = True
    else:
        _eval_file = False

    #####

    # Convert to cir from v
    if convert_v:
        """
        verilogFile,
        sim_config,
        wd, 
        libFile, 
        configFile,
        length_file=None,
        preRouteSim=False, 
        overwrite=False
        """
        arcName = convertToCir_from_config(
            design      =design,
            verilogFile =verilogFile,
            sim_config  =sim_config,
            wd          =workDir, 
            libFile     =libraryFile, 
            configFile  =cirConfigFile,
            length_file =length_file,
            preRouteSim =preRouteSim,
            noarchive   =_noarchive,
            gen_output_dir=verilog_2_xyce_extras_loc,
            basename_only=convert_basename,
            pcell_file  =pcell_file,
            )


    
    if _local_xyce:
        #simRunComm     = "python3 "+docker_PyWD+"/xyceRun.py --list "+xyceFiles
        if verilog_2_xyce_relative:
            result_wd = workDir
            #result_wd = f"{workDir}/{verilog_2_xyce_extras_loc}"
        else:
            result_wd = verilog_2_xyce_extras_loc

        runLocalXyce(xyce_files = xyceFiles, workDir=result_wd, config_file=_xyce_run_config)

        #results_prn_wd = result_wd+'/results'
        results_prn_wd = result_wd#+'/results'
        load_wd   = ''
        nodes_dir = ''

    else:
        
        docker_PyWD    = "/mfda_simulation/xyce_docker_server"
        #docker_PyWD    = "xyce_run"
        simRunComm     = "python3 "+docker_PyWD+"/xyceRun.py --list "+xyceFiles
        

        # default result directory
        result_wd = workDir+"/"+os.path.basename(arcName).replace('.tar','')
        result_wd = workDir+"/results"

        simRunComm     += " --workdir "+dockerWD+'/'+os.path.basename(arcName).replace('.tar','')

        # transfer files to docker image
        pushCir2Docker(arcName, dockerContainer, dockerWD)

        # wait for simulator
        runRemoteXyce(
            simStartComm=simRunComm, 
            dockerContainer=dockerContainer, 
            simDockerPyWD=dockerWD)
    
        # move old results directory
        if os.path.isdir(result_wd):
            # create tar file
            old_result_path = result_wd+"_old"
            if not os.path.isdir(old_result_path):
                os.makedirs(old_result_path)
            result_old_tar = old_result_path+"/result_"+timeString()+".tar"
            #result_old_tar = result_wd+"_old/result_"+timeString()+".tar"
            r_tar = tarfile.open(result_old_tar, 'x')
            r_tar.add(result_wd)
            # remove old results
            shutil.rmtree(result_wd)
            

        # load extracted data
        pullFromDocker(targetDirectory=result_wd,
                    dockerContainer=dockerContainer,
                    simDockerWD=dockerWD+'/'+os.path.basename(arcName).replace('.tar',''),
                    # overwrite pervious tar
                    OR_fileExists=True)
        

        results_prn_wd = result_wd+"/results"

        if verilog_2_xyce_extras_loc != None:
            workDir = workDir+'/'+verilog_2_xyce_extras_loc

        nodes_dir = results_prn_wd+'/../'
        load_wd   = results_prn_wd

    # generate report
    #rfiles    = pd.read_csv(workDir+"/spiceFiles/spiceList")["OutputFile"]
    #chem_list = pd.read_csv(workDir+"/spiceFiles/spiceList")["Chemical"]

    rfiles    = pd.read_csv(workDir+"/spice_files.csv")["OutputFile"]
    chem_list = pd.read_csv(workDir+"/spice_files.csv")["Chemical"]


    for i, f in enumerate(rfiles):
        rfiles[i] = f#+".prn"

    print("Result files")
    print(rfiles)

    print("Chemical list")
    print(chem_list)

    df = load_xyce_results(load_wd, nodes_dir, rfiles, chem_list)

    # export to csv
    if isinstance(df, list):
        pass
    elif isinstance(df, pd.DataFrame):
        csv_out = results_prn_wd+"/"+design_name+'_xyceOut.csv'
        print("Writing results to "+csv_out)
        df.to_csv(csv_out)
    else:
        throw()

    if _eval_file:
        #def evaluate_results(ev_file, wd, results_dir, design_name, sim_obj=None)
        evaluate_results(
            #ev_file=extra_args['eval_file'], 
            sim_file=sim_config,
            wd=workDir, 
            results_dir=results_prn_wd, 
            design_name=design_name)
        if output_dir is not None:
            print("Moving eval to "+output_dir)
            shutil.move(results_prn_wd+'/Chem_Eval.csv', f'{output_dir}/Chem_Eval.csv')

    if _main_plot_results:    
        plot_xyce_results_list(df)

    if output_dir is not None:
        print("Moving results to "+output_dir)
        os.makedirs(output_dir,exist_ok=True)
        shutil.move(csv_out, output_dir+'/'+os.path.basename(csv_out))

def parseMFDAFile(mfda_file):
    
    iFile = open(mfda_file, "r")

    xyceSimObj = SimulationXyce()

    for line in iFile:

        lineWSSplit = ' '.join(line.lstrip().split())

        lineKey = lineWSSplit[0]
        lineArgs = lineWSSplit[1:]

        if lineKey == "NETLIST" and lineArgs[0] == "file":
            xyceSimObj.addNetlistFile(lineArgs[1])
        elif lineKey == "inlet":
            xyceSimObj.addInlet(lineArgs[0], lineArgs[1:])
        elif lineKey == "eval":
            xyceSimObj.addEval(lineArgs[0], lineArgs[1:])
        elif lineKey == "dev":
            xyceSimObj
        
        pass

def convertToCir(verilogFile, wd, libFile, configFile, preRouteSim, overwrite=False, xyce_local=False):

    # locate nessary files
    files = getSimFiles(verilogFile, wd)

    Verilog2Xyce.Verilog2Xyce_from_csv(
        inputVerilogFile=files['verilogFile'],
        configFile=configFile,
        solnFile=files['specFile'],
        remoteTestPath="",
        libraryFile=libFile,
        devFile=files["devFile"],
        length_file=files["lengthFile"],
        timeFile=files["timeFile"],
        preRouteSim=preRouteSim,
        outputVerilogFile=None,
        runScipt=True)
    
    # create archive
    if not xyce_local:
        arcNameBase = files['verilogFile'][:-2]+"_xyce"

        xyceTar, arcName = createXyceArchive(arcNameBase, Overwrite=overwrite)

        srcDir = wd+"/spiceFiles"
        xyceTar.add(srcDir, arcname=os.path.basename(srcDir.replace("spiceFiles",arcName.replace('.tar',''))))

        xyceTar.close()

        print("--------------------")
        print("created archive: " + arcName)
        print("--------------------")

        return arcName

    else:
        return None

def convertToCir_from_config(
        design,
        verilogFile,
        sim_config,
        wd, 
        libFile, 
        configFile=None,
        length_file=None,
        preRouteSim=False, 
        overwrite=False,
        noarchive=False,
        gen_output_dir=None,
        basename_only=False,
        pcell_file=None):


    from writeSpice import generate_cir_main
    
    if gen_output_dir==None:
        of = f"{wd}/{design}"
    else:
        os.makedirs(f"{wd}/{gen_output_dir}", exist_ok=True)
        of = f"{wd}/{gen_output_dir}/{design}"

    generate_cir_main(
        design=design,
        verilog_file=f'{wd}/{verilogFile}',
        config_file=sim_config,
        length_file=length_file,
        out_file=of,
        basename_only=basename_only,
        pcell_file=None,
    )
    # locate nessary files
    #files = getSimFiles(verilogFile, wd)
    
    vFile = wd+"/"+verilogFile
    
    if length_file is None:
        len_file = wd+"/"+verilogFile[:-2]+"_lengths.xlsx"
    else:
        len_file = length_file
    
    # create Sim class
    _sim = SimulationXyce()
    _sim.parse_config_file(sim_config)
    

    #Verilog2Xyce.Verilog2Xyce_from_config(
    #    inputVerilogFile  = vFile,
    #    configFile        = configFile,
    #    solnInputList     = _sim.getInputChemList(),
    #    #simEvalList       = _sim.getEvaluation(),
    #    remoteTestPath    = "",
    #    libraryFile       = libFile,
    #    devList           = _sim.getDeviceList(),
    #    length_file       = len_file,
    #    simTimesList      = _sim.getSimulationTimes(),
    #    simProbeList      = _sim.getProbeList(),
    #    preRouteSim       = preRouteSim,
    #    outputVerilogFile = None,
    #    runScipt          = True)
    
    if noarchive:
        return None

    # create archive
    arcNameBase = vFile[:-2]+"_xyce"

    xyceTar, arcName = createXyceArchive(arcNameBase, Overwrite=overwrite)

    srcDir = wd+"/spiceFiles"
    xyceTar.add(srcDir, arcname=os.path.basename(srcDir.replace("spiceFiles",arcName.replace('.tar',''))))

    xyceTar.close()

    print("--------------------")
    print("created archive: " + arcName)
    print("--------------------")

    return arcName

def createXyceArchive(arcName, Overwrite=True, attempt=0):
    newName = arcName+"_"+str(attempt)+".tar"
    try:
        xyceTar = tarfile.open(newName, 'x')
        return xyceTar, newName
    except FileExistsError:
        if Overwrite:
            os.remove(newName)
            xyceTar = tarfile.open(newName, 'x')
            return xyceTar, newName
        else:
            return createXyceArchive(arcName, attempt=attempt+1)

def getSimFiles(verilogFile, wd):

    files = {}
    files['verilogFile']=wd+"/"+verilogFile
    # locate necessary files
    files['specFile']  = wd+"/"+verilogFile[:-2]+"_spec.csv"
    files['lengthFile']= wd+"/"+verilogFile[:-2]+"_lengths.xlsx"
    files['devFile']   = wd+"/devices.csv"
    files['timeFile']  = wd+"/simTime.csv"

    return files

def pushCir2Docker(simArchive, dockerContainer, dockerWD):

    client = docker.from_env()

    # check for running image
    is_docker_container_running(client, dockerContainer)
    
    # create archive
    #tarfile.open()

    xyceContainer = client.containers.get(dockerContainer)

    with open(simArchive, 'rb') as fd:
        ok = xyceContainer.put_archive(dockerWD, data=fd)
        if not ok:
            raise Exception('Put file failed')
        else:
            print("Files transfer success")

def runRemoteXyce(simStartComm, dockerContainer, simDockerPyWD):
    
    client = docker.from_env()

    # check for running image
    is_docker_container_running(client, dockerContainer)

    xyceContainer = client.containers.get(dockerContainer)

    print("------------------------------")
    print("send command: "+simStartComm)
    print("to directory: " + dockerContainer+":"+simDockerPyWD )

    _, stream = xyceContainer.exec_run(cmd=simStartComm, 
                                       workdir=simDockerPyWD, 
                                       stream=True,
                                       #stream=False,
                                       )
    for data in stream:
        print(data.decode())


local_file_path = os.path.dirname(os.path.realpath(__file__))

def runLocalXyce(xyce_files, workDir, xyce_run_location=f'{local_file_path}/xyce_run', 
                 config_file=None):

    simRunComm = "python3 "+xyce_run_location+"/xyceRun.py "+\
        "--list "+f'{workDir}/{xyce_files}'+" "\
        "--workdir "+'./'+" "
        #"--workdir "+workDir+" "
        #"--no_result_dir"
    if config_file is not None:
        simRunComm += " --config "+config_file

    print('Running xyce locally as: '+simRunComm)
    
    subprocess.run(simRunComm.split())


    


def pullFromDocker(targetDirectory, dockerContainer, simDockerWD, OR_fileExists=False):

    client = docker.from_env()

    is_docker_container_running(client, dockerContainer)

    xyceContainer = client.containers.get(dockerContainer)

    if not os.path.exists(targetDirectory):
        os.makedirs(targetDirectory)
    else:
        pass # directory exists
    
    targetFileAbs = targetDirectory+'/result.tar'

    try:
        f = open(targetFileAbs, 'xb')
    except FileExistsError:
        if OR_fileExists:
            f = open(targetFileAbs, 'wb')
        else:
            attempt = 0
            while True:
                try:
                    targetFileAbs = targetDirectory+'/result'+attempt+'.tar'
                    f = open(targetFileAbs, 'xb')
                    break
                except FileExistsError:
                    attempt += 1
                
    bits, stat = xyceContainer.get_archive(simDockerWD)
    print(stat)

    for chunk in bits:
        f.write(chunk)
    f.close

    # unpack archive
    local_arc = tarfile.open(targetFileAbs, 'r')
    local_arc.extractall(path=targetDirectory)
    os.remove(targetFileAbs)

    # move files to results
    for f1 in os.listdir(targetDirectory):
        f1_ = targetDirectory+"/"+f1
        if os.path.isdir(f1_):
            for f2 in os.listdir(f1_):
                
                os.rename(f1_+"/"+f2, targetDirectory+"/"+f2)
            os.removedirs(f1_)

# load the prn file into a dataframe
def load_xyce_results_file(rFile):
    r_df = pd.read_table(rFile, skipfooter=1, index_col=0, delim_whitespace=True, engine='python')
    #print(str(r_df))
    return r_df

def change_r_node_ref(df, rFile, node_file, chem):
    
    df_nodes = list(df)

    #node_dict = json.load(open(rFile.replace('.prn','.nodes')))
    node_dict = json.load(open(node_file))

    for node in df_nodes:
        print("---"+node+"---")
        if node == 'TIME':
            continue
        else:
            if node[0] == 'V':
                node_num = node.replace('V(', '').replace(')', '')
                node_key = list(node_dict.keys())[list(node_dict.values()).index(int(node_num))]

                node_name = '_'.join(node_key.split('_')[:-1])
                #if '_' in node_name_k: 
                    #node_name_k = node_key.split('_')[-1]
                if '_' in node_name: 
                    node_name_k = node_key.split('_')[-1]
                else:
                    node_name_k = node_key

                print(node_name+' : '+node_name_k)

                if len(node_name_k) >= 4 and node_name_k.lower() == 'chem':
                    node_name = '_'.join(node_name.split('_')[:-1])
                    new_node = 'C_'+str(chem)+'('+node_name+')'
                elif node_name_k[-2:] == 'c0':
                    new_node = 'C_'+str(chem)+'('+node_name+')'
                else:
                    new_node = 'P('+node_name+')'

                print('  new node: '+new_node)

                df = df.rename(columns={node:new_node})

            elif node[0] == 'I':
                print('Current node : '+ node)
                pass

            #df = df.rename(columns={node:new_node})

    return df



def load_xyce_results(rDir, nodes_dir, rlist=None, chem_list=None):
    if rlist is None:
        return load_xyce_results_file(rDir)
    else:
        r_df = []
        #r_df = pd.DataFrame()
        # we assume in list generation the indexes did not shift
        for ind, rFile in enumerate(rlist):

            print(rDir+"/"+rFile)
            temp_df = pd.read_table(rDir+"/"+rFile, skipfooter=1, index_col=0, delim_whitespace=True, engine='python')
            #temp_df = pd.read_table(rFile, skipfooter=1, index_col=0, delim_whitespace=True, engine='python')
            
            if chem_list is not None:
                #temp_df = change_r_node_ref(temp_df, rDir+"/../"+rFile, chem_list[ind])
                temp_df = change_r_node_ref(temp_df,  rDir+rFile, nodes_dir+'/'+rFile.replace('.prn', '.str.nodes'), chem_list[ind])
                #temp_df = change_r_node_ref(temp_df, rFile, rFile.replace('.prn', '.str.nodes'), chem_list[ind])

            #r_df = pd.append([temp_df])
            # remove duplicate columns
            if ind > 0:
                for t_col in temp_df.columns.tolist():
                    if t_col in r_df[0].columns.tolist():
                        temp_df = temp_df.drop(t_col, axis=1) 
            if not ind:
                r_df.append(temp_df)
            else:
                #r_df.append(temp_df.drop('TIME', axis=1))
                r_df.append(temp_df)
            #print(str(r_df))
        r_df = pd.concat(r_df, axis=1)
        
        return r_df

# input is the results dataframe
def plot_xyce_results_list(r_df):

    if isinstance(r_df, list):
        for df in r_df:
            plot_xyce_results(df)
    elif isinstance(r_df, pd.DataFrame):
        plot_xyce_results(r_df)

def plot_xyce_results(r_df):
    
    x = r_df["TIME"]
    y = {}

    for col in r_df.keys():
        if col == "TIME":
            continue
        else:
            y[col] = r_df[col]

    fig, ax = plt.subplots()

    for p in y:
        ax.plot(x, y[p], label=p)

    ax.legend()
    plt.show()
    
def plot_xyce_results_2(design, results_directory):
    
    # generate report
    rfiles = pd.read_csv(results_directory+"/spiceList")["OutputFile"]

    for i, f in enumerate(rfiles):
        rfiles[i] = f+".prn"

    print("Result files")
    print(rfiles)

    df = load_xyce_results(results_directory+"/results", rfiles)

    plot_xyce_results_list(df)

    pass

def load_eval_file(ev_file, sim_obj=None):

    if sim_obj==None:
        sim_obj = SimulationXyce()
    
    sim_obj.parse_eval_file(ev_file)

    return sim_obj


def export_xyce_results_to_csv(design, chem_list, result_dir):
    pass

def evaluate_results(wd, results_dir, design_name, sim_obj=None, ev_file=None, sim_file=None):

    if ev_file is not None:
        sim_obj = load_eval_file(wd+'/'+ev_file, sim_obj=sim_obj)
    elif sim_file is not None:
        sim_obj = SimulationXyce()
        sim_obj.parse_config_file(sim_file)

    ev_chem_list = sim_obj.getEvaluation()

    eval_df_coln = ['Chemical', 'Time', 'Node', 'Error', 'Expected Conc', 'Eval Conc']
    eval_df = pd.DataFrame(columns=eval_df_coln)

    for ev_chem in ev_chem_list:

        rFile = results_dir+'/'+design_name+'_xyceOut.csv'
        #temp_df = pd.read_table(rFile, skipfooter=1, index_col=0, delim_whitespace=True)
        temp_df = pd.read_csv(rFile)
        if len(ev_chem_list[ev_chem]) == 0:
            continue

        for eval_obj in ev_chem_list[ev_chem]:

            if eval_obj.getTime() in temp_df['TIME']:

                # get time coln index
                row_time_ind = temp_df['TIME'][temp_df['TIME'] == eval_obj.getTime()].index[0]

                # get chemical value
                chem_name = 'C_'+eval_obj.getChem()+'('+eval_obj.getNode()+')'
                print("eval: "+chem_name)
                #chem_name = eval_obj.getChem()+'('+eval_obj.getNode()+')'
                #print(temp_df.columns.tolist())
                prn_val = temp_df[chem_name][row_time_ind]

                exp_val = eval_obj.getValue()
                # Calculate error
                err_val = abs((prn_val- exp_val)/exp_val)

                # add to data frame
                new_data = pd.DataFrame([[
                    eval_obj.getChem(),
                    eval_obj.getTime(),
                    eval_obj.getNode(),
                    err_val,
                    eval_obj.getValue(),
                    prn_val
                    ]], columns=eval_df_coln)

                eval_df = pd.concat([eval_df, new_data])

            else:
                print('Cannot evaluate time: '+str(eval_obj.getTime())+' for chem: '+str(eval_obj.getChem())+'('+str(eval_obj.getNode())+')')

    
    eval_df.to_csv(results_dir+'/Chem_Eval.csv')
        


def is_docker_container_running(client, container):
    if container not in [x.name for x in client.containers.list()]:
        #print(client.containers.list())
        raise ValueError('Container not in list (is it running?). Looking for ' + container + "\n"+\
                         "Running images: " + str([x.name for x in client.containers.list()]))
    return True

def docker_clean_result_dir(client, container, device):

    pass


if __name__ == "__main__":
    
    parser = argparse.ArgumentParser(
        prog="MFDASimulation",
        description="",
        epilog=""
    )

    parser.add_argument('--netlist',   metavar='<netlist_file>', type=str, required=True)
    parser.add_argument('--sim_config',metavar='<sim_config>' , type=str, required=True)
    parser.add_argument('--sim_dir',   metavar='<sim_dir>'    , type=str, required=True)
    parser.add_argument('--lib',       metavar='<lib>'        , type=str, required=True)
    
    # included with the parser
    parser.add_argument('--cir_config',metavar='<cir_config>', type=str, required=True)
    
    parser.add_argument('--output_dir',metavar='<output_dir>', type=str, default=None)
    parser.add_argument('--pcell_file',metavar='<pcell_file>', type=str, default=None)

    parser.add_argument('--design', metavar='<design>', type=str, required=True)
    parser.add_argument('--length_file', metavar='<length_file>', type=str, default=None)

    parser.add_argument('--docker_image', metavar='<image>', type=str)
    parser.add_argument('--docker_container', metavar='<container>', type=str)
    parser.add_argument('--docker_wd', metavar='<docker_wd>', 
            type=str, default="/mfda_simulation/local/simulations")
    
    parser.add_argument('--preRoute', metavar='<preRoute>', type=str, default='False')
    parser.add_argument('--convert_verilog', metavar='<convert_verilog>', type=str, default='True')
    
    parser.add_argument('--plot', type=str, default='False')
    #parser.add_argument('--eval_file', type=str, default=None)
    parser.add_argument('--eval_result', type=str, default='False')
    parser.add_argument('--local_xyce', type=str, default='False')

    parser.add_argument('--xyce_run_config', type=str, default=None)
    
    args = parser.parse_args()
    
    ex_args = {
        'plot':args.plot,
        #'eval_file':args.eval_file,
        'eval_result':args.eval_result,
        'xyce_run_config':args.xyce_run_config
        }

    

    
    runSimulation(
        design         = args.design,
        verilogFile    = args.netlist,
        sim_config     = args.sim_config,
        workDir        = args.sim_dir, 
        libraryFile    = args.lib,
        isLocalXyce    = args.local_xyce,
        cirConfigFile  = args.cir_config,
        length_file    = args.length_file,
        preRouteSim    = args.preRoute.lower() in ['true', '1'],
        dockerContainer= args.docker_container,
        dockerWD       = args.docker_wd,
        #xyceFiles      = "spiceList",
        convert_v      = args.convert_verilog.lower() in ['true', '1'],
        output_dir     = args.output_dir,
        pcell_file     = args.pcell_file,
        extra_args     = ex_args)
    
    """
    runSimulation(
        verilogFile, 
        workDir, 
        libraryFile,
        cirConfigFile,
        length_file=None,
        preRouteSim=False,
        dockerContainer=None,
        dockerWD=None,
        xyceFiles="spiceList",
        convert_v=True)
    """
    
    
    
