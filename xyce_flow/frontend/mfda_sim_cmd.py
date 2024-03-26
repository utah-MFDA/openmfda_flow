

import sys
import os

import argparse
from configparser import ConfigParser

# set project directory
def set_project_dir(project_dir, config):
    read_configuration_file(config)

    config_p = read_configuration_file(config)

    config_p['projectConfig']['project_directory'] = project_dir

    with open(config, 'w') as config_file:
        config_p.write(config)

# set active project
def set_active_project(project, config):
    read_configuration_file(config)

    config_p = read_configuration_file(config)

    #print(config_p['projectConfig']['active_project'])

    config_p['projectConfig']['active_project'] = project

    with open(config+".test", 'w') as config_file:
        config_p.write(config_file)


# set docker image
def set_docker_image(docker_image, config):
    read_configuration_file(config)

    config_p = read_configuration_file(config)

    config_p['DockerImages']['simulationImage'] = docker_image

    with open(config, 'w') as config_file:
        config.write(config_file)

# set docker container
def set_docker_container(docker_container, config):
    read_configuration_file(config)

    config_p = read_configuration_file(config)

    config_p['DockerImages']['simulation_container'] = docker_container

    with open(config, 'w') as config_file:
        config.write(config_file)

# read configuration file
def read_configuration_file(file_loc):
    config_p = ConfigParser()
    config_p.read(file_loc)

    return config_p

# print configuration

def print_config(config_file):

    config_p = read_configuration_file(config_file)

    print("Configuration:")
    for sect in config_p.sections():
        print("["+sect+"]")
        for var in config_p[sect]:
            print("  "+var+":\t"+config_p[sect][var])

# run simulation

def runSimulation(config_file, arguments):

    print(os.getcwd())
    sys.path.insert(1, os.getcwd()+"/..")

    from runMFDASim import runSimulation 

    config_p = read_configuration_file(config_file)

    project_dir = config_p['projectConfig']['project_directory']
    project     = config_p['projectConfig']['active_project']

    base_dir = project_dir+"/"+project

    verilog_file = project+".v"
    #workDir      = base_dir
    libraryFile  = config_p['simConfig']['libraryFile']
    cirConfigFile= config_p['simConfig']['cirConfig']

    ## docker config
    if arguments.docker_image == None:
        d_container = config_p['dockerImages']['simulation_container']
    else:
        d_container = arguments.docker_image
    
    if arguments.docker_image == None:
        d_image     = config_p['dockerImages']['simulation_image']
    else:
        d_image     = arguments.docker_image

    d_wd        = config_p['dockerConfig']['sim_docker_WD']
    
    
    runSimulation(
        verilogFile=verilog_file, 
        workDir=base_dir, 
        libraryFile=libraryFile,
        cirConfigFile=cirConfigFile,
        preRouteSim=False,
        dockerContainer=d_container,
        dockerWD=d_wd,
        xyceFiles="spiceList",
        convert_v=True)


################ 
## commands list

def program_command(args):

    input_command = args.command[0]
    #try:
    argument      = args.arg
    #except:
    #    pass

    #docker_image    = args.docker_image
    #docker_container= args.docker_container 
    #project         = args.project
    #project_dir     = args.project_dir

    file_loc = 'config.ini'

    #print(input_command)

    if input_command == 'run':
        runSimulation(file_loc, args)

    if input_command == 'info':
        print_config(file_loc)

    if input_command == 'set_project':
        set_active_project(argument, file_loc)

    if input_command == 'set_dir':
        set_project_dir(argument, file_loc)

    if input_command == 'set_container':
        set_docker_container(argument, file_loc)

    if input_command == 'set_image':
        set_docker_image(argument, file_loc)

if __name__ == "__main__":

    

    parser = argparse.ArgumentParser(
        description='',

    )

    parser.add_argument('command', metavar='<command>', type=str, nargs=1, help=
                        'avalible commands: run info set_dir set_project set_container set_image')
    parser.add_argument('--arg', '-arg', metavar='<argument>', type=str ,help='', default=None)
    parser.add_argument('--docker_container', default=None)
    parser.add_argument('--docker_image', default=None)
    parser.add_argument('--project_dir', default=None)
    parser.add_argument('--project', default=None)

    args = parser.parse_args()

    program_command(args)