

#global_defs
dock_container = "sweet_shockley"

def test_file_load():

    import runMFDASim

    wd = "./testing/smart_toilet_test"
    vFile = "smart_toilet.v"

    files = runMFDASim.getSimFiles(verilogFile=vFile,
                            wd=wd)

    verilogFile= wd+"/"+vFile
    specFile   = wd+"/smart_toilet_spec.csv"
    lengthFile = wd+"/smart_toilet_lengths.xlsx"
    devFile    = wd+"/devices.csv"
    timeFile   = wd+"/simTime.csv"

    assert files['verilogFile'] == verilogFile
    assert files['specFile']    == specFile
    assert files['lengthFile']  == lengthFile
    assert files['devFile']     == devFile
    assert files['timeFile']    == timeFile

def test_gen_cir():
    import runMFDASim

    vFile = "smart_toilet.v"
    design= "smart_toilet"
    wd = "./testing/smart_toilet_test"
    sim_config = f"{wd}/simulation.config"    
    libFile="./testing/StandardCellLibrary.csv"
    cirConfig = "./V2Va_Parser/VMF_xyce.mfsp"
    length_file="testing/smart_toilet_test/smart_toilet_lengths.xlsx"
    preRouteSim=False
    gen_output_dir= "spiceFiles"
    basename_only = True
    pcell_file    = None

    runMFDASim.convertToCir_from_config(
        design=design,
        verilogFile=vFile,
        sim_config=sim_config,
        wd=wd,
        libFile=libFile,
        configFile=cirConfig,
        length_file=length_file,
        preRouteSim=preRouteSim,
        noarchive=False,
        gen_output_dir=gen_output_dir,
        basename_only=basename_only,
        pcell_file=pcell_file,
        )
    
def test_gen_simple_cir():
    import runMFDASim

    vFile = "simple_channel.v"
    design= "simple_channel"
    wd = "./testing/simpleChannelTest"
    sim_config = f"{wd}/simulation.config"
    
    libFile="./testing/StandardCellLibrary.csv"
    cirConfig = "./V2Va_Parser/VMF_xyce.mfsp"
    length_file=f"{wd}/simple_channel_lengths.xlsx"
    preRouteSim=False
    gen_output_dir= "spiceFiles"
    basename_only = True
    pcell_file    = None


    runMFDASim.convertToCir_from_config(
        design=design,
        verilogFile=vFile,
        sim_config=sim_config,
        wd=wd,
        libFile=libFile,
        configFile=cirConfig,
        length_file=length_file,
        preRouteSim=preRouteSim,
        noarchive=False,
        gen_output_dir=gen_output_dir,
        basename_only=basename_only,
        pcell_file=pcell_file,
        )

def test_parse_sim_config_file():
    
    import runMFDASim
    
    simConfigFile = "./testing/smart_toilet_test_V2/simulation.config"
    
    # class tests
    sim_test = runMFDASim.SimulationXyce()
    sim_test.parse_config_file(simConfigFile)
    
    assert 'soln1' in sim_test.dev
    assert 'soln2' in sim_test.dev
    assert 'soln3' in sim_test.dev
    
    assert sim_test.dev['soln1'].getType() == 'pressurePump'
    assert sim_test.dev['soln2'].getType() == 'pressurePump'
    assert sim_test.dev['soln3'].getType() == 'pressurePump'
    
    assert sim_test.dev['soln1'].getArgs()[0] == 'pressure=100k'
    #assert sim_test.dev['soln1'].getArgs()[1] == 'chemConcentration=100m'
    
    #assert 'H2O'    in sim_test.eval
    #assert 'Tag'    in sim_test.eval
    #assert 'Sample' in sim_test.eval
    
    #assert 'out' in sim_test.getEvaluation('H2O') 
    #assert sim_test.getEvaluation('H2O')['out'] == '89.2m'
    
def test_gen_simple_cir_from_config():
    
    import runMFDASim
    
    design    = "smart_toilet"
    wd        = "./testing/smart_toilet_test_config"
    vFile     = "smart_toilet.v"
    libFile   = "./testing/StandardCellLibrary.csv"
    cirConfig = "./V2Va_Parser/VMF_xyce.mfsp"
    
    simConfigFile = "./testing/smart_toilet_test_V2/simulation.config"

    len_f = "./testing/smart_toilet_test_V2/smart_toilet_lengths.xlsx"
    
    runMFDASim.convertToCir_from_config(
        design      =design,
        verilogFile =vFile,
        sim_config  =simConfigFile,
        wd          =wd,
        libFile     =libFile,
        configFile  =cirConfig,
        length_file =len_f,
        preRouteSim =False,
        overwrite   =True,
        gen_output_dir="spiceFiles")

def test_push2Docker():

    import runMFDASim

    vFile = "smart_toilet.v"
    design= "smart_toilet"

    wd = "./testing/smart_toilet_test"
    sim_config = f"{wd}/simulation.config"
    
    libFile="./testing/StandardCellLibrary.csv"
    cirConfig = "./V2Va_Parser/VMF_xyce.mfsp"
    length_file="testing/smart_toilet_test/smart_toilet_lengths.xlsx"
    preRouteSim=False
    gen_output_dir= "spiceFiles"
    basename_only = True
    pcell_file    = None

    dock_WD = "/mfda_simulation/local/simulations"

    simTar = runMFDASim.convertToCir_from_config(
            design=design,
        verilogFile=vFile,
        sim_config=sim_config,
        wd=wd,
        libFile=libFile,
        configFile=cirConfig,
        length_file=length_file,
        preRouteSim=preRouteSim,
        noarchive=False,
        gen_output_dir=gen_output_dir,
        basename_only=basename_only,
        pcell_file=pcell_file,
        )

    runMFDASim.pushCir2Docker(
        simArchive=simTar,  
        dockerContainer=dock_container, 
        dockerWD=dock_WD)

def runXyceDocker(design, verilogFile, sim_config, wd, libFile, cirConfig, length_file, 
                preRouteSim, overwrite, 
                docker_container, docker_WD, 
                simRunTime, simDir, simStartFile, simArgs):
    import runMFDASim
    import os

    gen_output_dir= "spiceFiles"
    basename_only = True
    pcell_file = None

    simTar = runMFDASim.convertToCir_from_config(
        design=design,
        verilogFile=verilogFile,
        sim_config=sim_config,
        wd=wd,
        libFile=libFile,
        configFile=cirConfig,
        length_file=length_file,
        preRouteSim=preRouteSim,
        noarchive=False,
        gen_output_dir=gen_output_dir,
        basename_only=basename_only,
        pcell_file=pcell_file,
        )

    runMFDASim.pushCir2Docker(
        simArchive=simTar,  
        dockerContainer=docker_container, 
        dockerWD=docker_WD)
    
    simDockerWDarg = "--workdir "+docker_WD+'/'+os.path.basename(simTar).replace('.tar','')

    runSimComm = simRunTime+' '+\
        simDir+'/'+simStartFile+' '+\
        simArgs+' '+simDockerWDarg

    runMFDASim.runRemoteXyce(runSimComm, docker_container, simDir)

def test_runXyceDocker():
    import runMFDASim

    import os

    vFile = "smart_toilet.v"
    design= "smart_toilet"

    wd = "./testing/smart_toilet_test"
    sim_config = f"{wd}/simulation.config"
    length_file=f"{wd}/simple_channel_lengths.xlsx"
    
    libFile="./testing/StandardCellLibrary.csv"
    cirConfig = "./V2Va_Parser/VMF_xyce.mfsp"
    length_file="testing/smart_toilet_test/smart_toilet_lengths.xlsx"
    preRouteSim=False
    gen_output_dir= "spiceFiles"
    basename_only = True
    pcell_file    = None

    # Docker config
    simDir      = "/mfda_simulation/xyce_docker_server"
    simRunTime  = "python3"
    simStartFile= "xyceRun.py"
    simArgs     = "--list spiceList"
    

    #dock_container = "vibrant_clarke"
    dock_WD        = "/mfda_simulation/local/simulations"

    simTar = runMFDASim.convertToCir_from_config(
        design=design,
        verilogFile=vFile,
        sim_config=sim_config,
        wd=wd,
        libFile=libFile,
        configFile=cirConfig,
        length_file=length_file,
        preRouteSim=preRouteSim,
        noarchive=False,
        gen_output_dir=gen_output_dir,
        basename_only=basename_only,
        pcell_file=pcell_file,
        )

    runMFDASim.pushCir2Docker(
        simArchive=simTar,  
        dockerContainer=dock_container, 
        dockerWD=dock_WD)
    
    simDockerWDarg = "--workdir "+dock_WD+'/'+os.path.basename(simTar).replace('.tar','')

    runSimComm = simRunTime+' '+\
        simDir+'/'+simStartFile+' '+\
        simArgs+' '+simDockerWDarg

    runMFDASim.runRemoteXyce(runSimComm, dock_container, simDir)

def test_simplechannel_runXyceDocker():
    import runMFDASim

    import os

    vFile     ="simple_channel.v"
    design    ="simple_channel"
    wd        ="./testing/simpleChannelTest"
    sim_config = f"{wd}/simulation.config"
    
    libFile   ="./testing/StandardCellLibrary.csv"
    cirConfig ="./V2Va_Parser/VMF_xyce.mfsp"
    length_file=f"{wd}/simple_channel_lengths.xlsx"

    # Docker config
    simDir      = "/mfda_simulation/xyce_docker_server"
    simRunTime  = "python3"
    simStartFile= "xyceRun.py"
    simArgs     = "--list spiceList"
    

    #dock_container = "vibrant_clarke"
    dock_WD        = "/mfda_simulation/local/simulations"
    
    
    # local function
    runXyceDocker(design=design, 
                verilogFile=vFile, 
                wd=wd,
                sim_config=sim_config, 
                libFile=libFile, 
                cirConfig=cirConfig,
                length_file=length_file,
                preRouteSim=False, 
                overwrite=True,  
                docker_container=dock_container, 
                docker_WD=dock_WD, 
                simRunTime=simRunTime, 
                simDir=simDir, 
                simStartFile=simStartFile, 
                simArgs=simArgs)
    
def test_pullFileFromDocker():

    #
    targetDir       = "testing/DockerPullTest"
    #dock_container = "vibrant_clarke"
    dockerTargetDir = "/mfda_simulation/local/simulations/smart_toilet_xyce_0"

    # 
    from runMFDASim import pullFromDocker

    # pullFromDocker(targetDirectory, dockerContainer, simDockerWD)
    pullFromDocker(targetDirectory=targetDir,
                   dockerContainer=dock_container,
                   simDockerWD=dockerTargetDir,
                   OR_fileExists=True)
    
def test_simple_channel_pullFileFromDocker():

    import os
    #
    targetDir       = os.getcwd()+"/testing/DockerPullTest"
    #dock_container = "vibrant_clarke"
    #dockerTargetDir = "/mfda_simulation/local/simulations/simple_channel_xyce_0/results"
    dockerTargetDir = "/mfda_simulation/local/simulations/simple_channel_xyce_0"

    # 
    from runMFDASim import pullFromDocker

    # pullFromDocker(targetDirectory, dockerContainer, simDockerWD)
    pullFromDocker(targetDirectory=targetDir,
                   dockerContainer=dock_container,
                   simDockerWD=dockerTargetDir,
                   OR_fileExists=True)
    
def test_parse_simple_channel():

    from runMFDASim import load_xyce_results

    result_file = "simple_channel_H2O.cir.prn"
    result_wd   = "./testing/DockerPullTest/results"
    node_dir    = "./testing/DockerPullTest/"
    
    load_xyce_results(result_wd, node_dir, result_file)

def test_plot_simple_channel():

    from runMFDASim import load_xyce_results
    from runMFDASim import plot_xyce_results

    result_file = "simple_channel_H2O.cir.prn"
    result_wd   = "./testing/DockerPullTest/results"
    
    df = load_xyce_results(result_wd+"/"+result_file)

    plot_xyce_results(df)

def test_full_simulation_simpleChannel():
    from runMFDASim import runSimulation

    verilogFile    ="simple_channel.v"
    sim_config     ="./testing/simpleChannelTest_full_config/simulation.config"
    workDir        ="./testing/simpleChannelTest_full_config"
    libraryFile    ="./testing/StandardCellLibrary.csv"
    cirConfigFile  ="./V2Va_Parser/VMF_xyce.mfsp"
    preRouteSim    =False
    #dock_container ="vibrant_clarke"
    dockerWD       ="/mfda_simulation/local/simulations"
    xyceFiles      ="spiceList"

    len_f = "./testing/simpleChannelTest_full_config/simple_channel_lengths.xlsx"

    runSimulation(
        design="simple_channel",
        verilogFile=verilogFile,
        sim_config=sim_config,
        workDir=workDir, 
        libraryFile=libraryFile,
        cirConfigFile=cirConfigFile,
        length_file=len_f,
        preRouteSim=preRouteSim,
        dockerContainer=dock_container,
        dockerWD=dockerWD,
        isLocalXyce="False",
        verilog_2_xyce_extras_loc="spiceFiles"
        #xyceFiles=xyceFiles
        )

def test_full_simulation_smart_toilet():

    from runMFDASim import runSimulation

    verilogFile    ="smart_toilet.v"
    
    sim_config     ="./testing/smart_toilet_test_config/simulation.config"
    workDir        ="./testing/smart_toilet_test_config"
    libraryFile    ="./testing/StandardCellLibrary.csv"
    cirConfigFile  ="./V2Va_Parser/VMF_xyce.mfsp"
    preRouteSim    =False
    #dock_container ="vibrant_clarke"
    dockerWD       ="/mfda_simulation/local/simulations"
    xyceFiles      ="spiceList"

    length_file    =workDir+"/smart_toilet_lengths.xlsx"

    runSimulation(
        design="smart_toilet",
        verilogFile=verilogFile,
        sim_config=sim_config, 
        workDir=workDir,
        libraryFile=libraryFile,
        cirConfigFile=cirConfigFile,
        length_file=length_file,
        preRouteSim=preRouteSim,
        dockerContainer=dock_container,
        dockerWD=dockerWD,
        isLocalXyce="False",
        verilog_2_xyce_extras_loc="spiceFiles",
        #xyceFiles=xyceFiles
        )

def test_load_eval_file():

    from runMFDASim import SimulationXyce

    wd = "./testing/smart_toilet_test_config"
    eval_file = "eval.config"

    eval_file = wd+'/'+eval_file

    x_sim = SimulationXyce()

    x_sim.parse_eval_file(eval_file)

    #print('fPrime node: ' + str(x_sim.eval['fPrime'][0].getNode()))
    assert x_sim.eval['H2O'][0].getNode()  == 'out'
    assert x_sim.eval['H2O'][0].getValue() == 89.2e-3
    assert x_sim.eval['H2O'][0].getChem()  == 'H2O'
    assert x_sim.eval['H2O'][0].getTime()  == 0.0

    assert x_sim.eval['Tag'][0].getNode()  == 'out'
    assert x_sim.eval['Tag'][0].getValue() == 10e-3
    assert x_sim.eval['Tag'][0].getChem()  == 'Tag'
    assert x_sim.eval['Tag'][0].getTime()  == 0.0

    assert x_sim.eval['Sample'][0].getNode()  == 'out'
    assert x_sim.eval['Sample'][0].getValue() == 0.8e-3
    assert x_sim.eval['Sample'][0].getChem()  == 'Sample'
    assert x_sim.eval['Sample'][0].getTime()  == 0.0


def test_full_simulation_evaluate():

    from runMFDASim import evaluate_results

    design_name= "smart_toilet"
    test_wd    = "./testing/smart_toilet_test_config"

    ev_file    = 'eval.config'
    result_dir = test_wd+"/results/results"

    #evaluate_results(ev_file, wd, results_dir, design_name, sim_obj=None)

    evaluate_results(
        ev_file    = ev_file,
        wd         = test_wd,
        results_dir = result_dir,
        design_name= design_name
    )


    


if __name__ == "__main__":
    
    import sys

    import os
    sys.path.insert(1, os.getcwd())

    #from runMFDASim import runRemoteXyce
    
    #test_gen_simple_cir()
    #test_simplechannel_runXyceDocker()
    #test_parse_simple_channel()
    test_full_simulation_simpleChannel()
