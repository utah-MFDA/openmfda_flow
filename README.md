
# OpenMFDA (Microfluidic Design Automation) – Quick start
We are excited to help members of the community test and use this software. If you are interested we are happy to help you get started, please email ashton.snelgrove@utah.edu.

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
- KLayout
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

# Configuration

## Quick start configuration

Place your verilog netlist in the root directory of the flow.

Create a copy of the `demo_configure.py` script or create a new file with the following.

```
from openmfda_flow import *

verilog_file = "demo.v"
design_name = "demo"
platform = "h.r.3.3"
pins = [[None for i in range(0,8)] for j in range(0,4)]
pins[0][1] = "soln1"
pins[0][2] = "soln2"
pins[0][3] = "soln3"
pins[1][7] = "out"

generate_config(verilog_file, design_name, pin_names=pins, platform=platform)
```

Modify your copy, specifying the `verilog_file` and `design_name`.

For each input/output pins from your verilog file, add an entry in the array in row/column format. This will assign the pin to the port of the interface.

Invoke your script like `python3 demo_configure.py`, which will generate configuration files.

After the configuration is created, the flow can be run by invoking `make DESIGN=demo`.

Once configured, verilog design and configuration files can be modified as described in the next section. Verilog files are located in `openroad_flow/designs/src/{DESIGN}`

## Manual configuration

To manually configure a flow, the following steps are taken:

1. Start by creating a new design with this path structure
    - openroad_flow/designs/(platform)/(design name)
2. Within the folder above, three files need to be generated:
   ./config.mk, ./constraint.sdc, and ./io_constraints.tcl.
   Designs are included for reference.
    - ./config.mk - this contains variables that specify the
      design name, platform, relevant design paths, and floor
      planning parameters such as die size (MF chip size) and
      core size (legal placement and route area).
    - ./constraint.sdc - only contains the design name.
      Critical file in EDA but not used in the current flow of
      MFDA.
    - ./io_constraints.tcl - this specifies where the I/Os of
      the MF chip are physically located. If using the
      flushing chip automatically generated in the flow, the
      I/Os must be configured such as in
      /openroad_flow/designs/mfda/smart_toilet/io_constraints.tcl
      for correct allignment with the flushing chip. Otherwise,
      the I/Os must be placed at the edge of the device and
      pinholes will automatically added for tubing.
3. The chips are described using Verilog HDL netlist scripting.
   The netlist description is structured like
   /openroad_flow/designs/src/(design)/(design).v.
   This netlist describes the I/Os, what components are used,
   and how they are all connected.
4. In /openroad_flow/Makefile, the *DESIGN_CONFIG* variable
   must be the path to the /config.mk file described in step 2.
5. The 3D configuration is setup in this path structure,
   /scad_flow/designs/(platform)/(design name). Within
   this folder are two files: ./config.mk and the optional file
   ./dimm.csv.
   - ./config.mk - This file contains several variable that
     specify the 3D parameters of the MF chip as well as the printer
     properties such as physical pixel and layer size.
   - ./dimm.csv - this is an optional file which specifies dimensions
     for the interconnect channels between components and I/Os. The format
     should be as follows:
     ```
     For component and I/O interconnects:

     pin_name,horizontal_channel_width,vertical_channel_width,channel_height

     For I/Os (connecting to the flushing chip through the interconnect device):

     pin_name,square_side_width
     ```
     All widths are integer number of pixels and heights are integer number of
     layers.
6. After all the files are added for the design with the
   parameters specified, the entire flow can be completed through
   the Makefile in /Makefile
   ```
   make DESIGN=demo
   ```

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


