

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

    wd = "./testing/smart_toilet_test"
    vFile = "smart_toilet.v"
    libFile="./testing/StandardCellLibrary.csv"
    cirConfig = "./V2Va_Parser/VMF_xyce.mfsp"

    runMFDASim.convertToCir(
        verilogFile=vFile,
        wd=wd,
        libFile=libFile,
        configFile=cirConfig,
        preRouteSim=False)
    
def test_gen_simple_cir():
    import runMFDASim

    wd = "./testing/simpleChannelTest"
    vFile = "simple_channel.v"
    libFile="./testing/StandardCellLibrary.csv"
    cirConfig = "./V2Va_Parser/VMF_xyce.mfsp"

    runMFDASim.convertToCir(
        verilogFile=vFile,
        wd=wd,
        libFile=libFile,
        configFile=cirConfig,
        preRouteSim=False,
        overwrite=True)

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
    
    wd        = "./testing/smart_toilet_test_config"
    vFile     = "smart_toilet.v"
    libFile   = "./testing/StandardCellLibrary.csv"
    cirConfig = "./V2Va_Parser/VMF_xyce.mfsp"
    
    simConfigFile = "./testing/smart_toilet_test_V2/simulation.config"
    
    runMFDASim.convertToCir_from_config(
        verilogFile =vFile,
        sim_config  =simConfigFile,
        wd          =wd,
        libFile     =libFile,
        configFile  =cirConfig,
        preRouteSim =False,
        overwrite   =True)

def test_push2Docker():

    import runMFDASim

    wd = "./testing/smart_toilet_test"
    vFile = "smart_toilet.v"
    libFile="./testing/StandardCellLibrary.csv"
    cirConfig = "./V2Va_Parser/VMF_xyce.mfsp"

    # Docker config
    runSimComm = ""

    #dock_container = "sweet_shockley"
    dock_WD = "/mfda_simulation/local/simulations"

    simTar = runMFDASim.convertToCir(
        verilogFile=vFile,
        wd=wd,
        libFile=libFile,
        configFile=cirConfig,
        preRouteSim=False,
        overwrite=True)

    runMFDASim.pushCir2Docker(
        simArchive=simTar,  
        dockerContainer=dock_container, 
        dockerWD=dock_WD)

def runXyceDocker(verilogFile, wd, libFile, configFile, prerouteSim, overwrite, 
                  docker_container, docker_WD, 
                  simRunTime, simDir, simStartFile, simArgs):
    import runMFDASim
    import os

    simTar = runMFDASim.convertToCir(
        verilogFile=verilogFile,
        wd=wd,
        libFile=libFile,
        configFile=configFile,
        preRouteSim=prerouteSim,
        overwrite=overwrite)

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

    wd = "./testing/smart_toilet_test"
    vFile = "smart_toilet.v"
    libFile="./testing/StandardCellLibrary.csv"
    cirConfig = "./V2Va_Parser/VMF_xyce.mfsp"

    # Docker config
    simDir      = "/mfda_simulation/xyce_docker_server"
    simRunTime  = "python3"
    simStartFile= "xyceRun.py"
    simArgs     = "--list spiceList"
    

    #dock_container = "vibrant_clarke"
    dock_WD        = "/mfda_simulation/local/simulations"

    simTar = runMFDASim.convertToCir(
        verilogFile=vFile,
        wd=wd,
        libFile=libFile,
        configFile=cirConfig,
        preRouteSim=False,
        overwrite=True)

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

    wd        ="./testing/simpleChannelTest"
    vFile     ="simple_channel.v"
    libFile   ="./testing/StandardCellLibrary.csv"
    cirConfig ="./V2Va_Parser/VMF_xyce.mfsp"

    # Docker config
    simDir      = "/mfda_simulation/xyce_docker_server"
    simRunTime  = "python3"
    simStartFile= "xyceRun.py"
    simArgs     = "--list spiceList"
    

    #dock_container = "vibrant_clarke"
    dock_WD        = "/mfda_simulation/local/simulations"
    
    

    runXyceDocker(verilogFile=vFile, 
                  wd=wd, 
                  libFile=libFile, 
                  configFile=cirConfig, 
                  prerouteSim=False, 
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
    
    load_xyce_results(result_wd+"/"+result_file)

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
    workDir        ="./testing/simpleChannelTest_full_config"
    libraryFile    ="./testing/StandardCellLibrary.csv"
    cirConfigFile  ="./V2Va_Parser/VMF_xyce.mfsp"
    preRouteSim    =False
    #dock_container ="vibrant_clarke"
    dockerWD       ="/mfda_simulation/local/simulations"
    xyceFiles      ="spiceList"

    runSimulation(
        verilogFile=verilogFile, 
        workDir=workDir, 
        libraryFile=libraryFile,
        cirConfigFile=cirConfigFile,
        preRouteSim=preRouteSim,
        dockerContainer=dock_container,
        dockerWD=dockerWD,
        xyceFiles=xyceFiles)

def test_full_simulation_smart_toilet():

    from runMFDASim import runSimulation

    verilogFile    ="smart_toilet.v"
    
    workDir        ="./testing/smart_toilet_test_config"
    libraryFile    ="./testing/StandardCellLibrary.csv"
    cirConfigFile  ="./V2Va_Parser/VMF_xyce.mfsp"
    preRouteSim    =False
    #dock_container ="vibrant_clarke"
    dockerWD       ="/mfda_simulation/local/simulations"
    xyceFiles      ="spiceList"

    length_file    =workDir+"/smart_toilet_lengths.xlsx"

    runSimulation(
        verilogFile=verilogFile, 
        workDir=workDir, 
        libraryFile=libraryFile,
        cirConfigFile=cirConfigFile,
        length_file=length_file,
        preRouteSim=preRouteSim,
        dockerContainer=dock_container,
        dockerWD=dockerWD,
        xyceFiles=xyceFiles)

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
