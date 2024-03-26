## MFDA simulation

This is a microfluidic design automation (MFDA) module developed to simulate using a modified nodal analysis, based on using Xyce ciruit simulator. This module to run on a host machine with Xyce or  communicate with the docker image with Xyce for MFDA simulation. This program acts as a bridge to run simulation programs, as well as translate the verilog netlist files to the nessary format for Xyce.

## Getting started 

You can copy the template folder to get all the nessary files for the simulator. Just change the name of the netlist file <device_name>.v and change the module name inside the netlist file to match.

First you will need to make sure you have done one of the following:
1) Install XYce on the host machine with support for external libraries, or

2) For those running the simulator within a docker container, you will first need to make sure you have docker installed and the nessary docker image downloaded, bgoenner/mfda_xyce.

After that edit the files in your new device directory, make sure the name of the device directory is the same as the verilog netlist file without .v and the top-most module within the verilog file.

Create a running docker container with 
```
$ docker run -dit bgoenner/mfda_xyce
```
Take note of the name of the docker container by running
```
docker ps
```

The simulator can then simply be ran with
```
python3 runMFDASim.py <args>
```

There are a lot of necessary arguments to run the simulator listed here

For local Xyce builds make sure to include

--netlist <verilog_file.v>\
   The name of the verilog netlist, without the path

--sim_dir <path_to_simluation_files>\
   The path to the simulation files

--sim_file <path_to_simulation_simluation.config>\
   Directory of the simulation config file, usually simulation.config. Omit simluation.config from the argument.

--design <device_name>\
   The name of the device, usually the verilog file without the extension

--cir_config <path/cir_file.mfsp>\
   configurion of the .v to .cir translation. Usually "./V2Va_Parser/VMF_xyce.mfsp" is fine

--lib <path_to_lib/lib_name.csv>\
   A list of valid library components in csv format.

--docker_container <docker_container_name>\
   (docker) The name of the docker container used for the simulator. You can find this out if it is running with ```$ docker ps``` or if it not running ```$ docker ps -a``` will list all containers. Then start it with ```$ docker start <container name```. If issues persist ```docker run -dit /bgoenner/mfda_xyce``` will create a new running container. Old containers can be removed with ```docker rm <container_name```  

--xyce_local <True/False>\
   (xyce host) Set True to use Xyce from the local machine. Make sure to initialize the xyce_run submodule, and create/edit the configuration file configuration. Default is False.

--eval_file <path_to_eval_file/eval.config>\
   (optional) file used for error calculations

--length_file <length_file>\
   (optional) file used to add additional channel for channels for connecting components. It must be called <design_name>_lengths.xlxs

--plot <True/False>\
   (optional) add True after this argument to automatically plot the outputs

