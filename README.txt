
# OpenMFDA (Microfluidic Design Automation) – Quick start

This document should help with providing setup and run the software flow for OpenMFDA with the 
supplied code to run that smart toilet chip. For the most up to date version clone the repo at 
https://github.com/utah-MFDA/openmfda_flow.

## Setup

### Submodules

If pulled from github, this repository contains submodule links to design kits and tools. Make 
sure to run `git submodule update --init --recursive` after cloning or updating to ensure that 
the submodules are up to date.

### Prerequisites Linux based systems

The following external tools are required.
- OpenROAD
- Xyce (7.8)
    - must be built from source with the ADMS plugin
    - ADMS (2.3.7)
- OpenSCAD
- python3
- make

The OpenROAD tool can be downloaded at https://github.com/The-OpenROAD-Project/OpenROAD.
Xyce can be built from https://github.com/Xyce/Xyce. Be sure to build with the ADMS plugin.

By default, the tools are invoked using the $PATH search variable. 

Environment variables can be set to specify a specific location for the tools.

### Python environment

Python package dependencies can be installed using the system package manager, or using a virtual environment.
To create a virtual environment and install the tool dependencies, run the following commands.

```
python3 -m venv env
source env/bin/activate
pip3 install -r python-requirements.txt
```

This will create a directory `env` containing the python environment and libraries. To activate 
the environment you will need to run `source env/bin/activate` before using the flow.
For more information about virtual environments, see https://docs.python.org/3/library/venv.html

## Prerequisites for Docker base implementation

We have a developed Docker based implementation for deployment that can work on 
non-linux systems.

### Software requirements
- Docker
    - Recommended: https://docs.docker.com/desktop/
- WSL
    - https://learn.microsoft.com/en-us/windows/wsl/install
- Python3
- Recommended: OpenSCAD

## Running the flow

### Linux based systems

Once configured (as demonstrated in the next section), the flow is invoked with the `make` command.

Specifying the design
The design being operated on is specified using the `DESIGN` variable, matching the design 
name used during configuration. This can be set by:

- The design can be specified when invoking `make`, for example `make DESIGN=smart_toilet`.
- The design can be specified once in an environment variable `export DESIGN=smart_toilet`, 
	then subsequent invocations using `make -e`.
- The `DESIGN` variable can be set in the `Makefile` in the root of the directory.

### Running the flow

To run the complete flow, invoke `make` (with the design variable specified as shown in the previous section). 
This will run all steps in the flow and generate a .zip archive containing all output files.

To run placement and routing, invoke `make pnr`

To generate the device 3D model, invoke `make render`

To generate flow analysis files of the design, invoke `make simulate`

To remove all generated files, invoke `make clean`

## For non-linux based system - Docker based implementation

For non-linux based system a script to run the flow within a docker image with the necessary software is provided. 
This must be run within a windows WSL shell (a linux shell within windows) for windows systems, instructions 
to install WSL on windows can be found at, https://learn.microsoft.com/en-us/windows/wsl/install

To get started you can simply run the command:

```
python3 run_mfda_docker.py –design smart_toilet
```

This will, in not already, download the docker image, and run the demo, smart toilet chip, design. 
The Docker image will contain the necessary software and python packages to run the flow.

## Expected output

We expect during program runtime that the terminal will print the logs for each of 
the steps to be completed in the program. Several design files for each step of the 
physical design process will be in the `flow/results/<design_name>/base` directory. 
The final .scad file that is located in the `flow/results/<design_name>/base` which will 
be named `<name of your design>_base.scad` can be loaded into OpenSCAD to render the final 
results. The simulation evaluation output will be inside the flow/results/simulation/Chem_Eval.csv` 
directory and any probe data will be in `flow/results/simulation/<design_name>_xyceOut.csv`.

Instructions for use on submitted data
To run the program on the smart toilet data simply run.

```
cd flow && make -e DESIGN=smart_toilet
```

or for docker implementation

```
python3 run_mfda_docker.py -–design smart_toilet
```

Results should be located in the `flow/results/smart_toilet/base` directory.
