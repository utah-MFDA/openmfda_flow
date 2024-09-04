[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/utah-MFDA/openmfda_flow/main)

# Microfluidic Design Automation (MFDA)

The central idea for this project is to create an automation
tool for microfluidic design using a combination of open-source
electronic design automation (EDA) and SCAD tools. This project
uses the OpenROAD EDA tool for 2D place and route with standard
compnents found in their respective platforms found in
/
openroad_flow/platforms. The supported cells include
basic valves, pumps, and various sizes of resistive channels.
After 2D PNR, a Python-based tool which includes the
SolidPython package parses through the EDA results and connects
the 2D results with their 3D counterparts. The SCAD results can
be viewed and rendered in any SCAD software such as OpenSCAD
(https://openscad.org/). This tool generates the 3D structures
required for the 3D printing technology developed at BYU under
Dr. Nordin.

# Setup

## Submodules

This repository contains submodule links to design kits and tools. Make sure to run `git submodule update --init --recursive` after cloning or updating to ensure that the submodules are up to date.

## Prerequisites
The following external tools are required.
- OpenROAD
- KLayout
- python3
- make

The OpenROAD tool can be downloaded at https://github.com/The-OpenROAD-Project/OpenROAD.

KLayout can be downloaded at https://www.klayout.de.

By default, the tools are invoked using the $PATH search variable. Environment variables can be set to specify a specific location for the tools.

## Python environment

Python package dependencies can be installed using the system package manager, or using a virtual environment.

To create a virtual environment and install the tool dependencies, run the following commands.

```
python3 -m venv env
source env/bin/activate
pip3 install -r requirements.txt
```

This will create a directory `env` containing the python environment and libraries. To activate the environment you will need to run `source env/bin/activate` before using the flow.

For more information about virtual environments, see https://docs.python.org/3/library/venv.html

# Running the flow

Once configured (as demonstrated in the next section), the flow is invoked with the `make` command.

## Specifying the design
The design being operated on is specified using the `DESIGN` variable, matching the design name used during configuration. This can be set by:
- The design can be specified when invoking `make`, for example `make DESIGN=demo`.
- The design can be specified once in an environment variable `export DESIGN=demo`, then subsequent invocations using `make -e`.
- The `DESIGN` variable can be set in the `Makefile` in the root of the directory.

## Running the flow
To run the complete flow, invoke `make` (with the design variable specified as shown in the previous section). This will run all steps in the flow and generate a .zip archive containing all output files.

To run placement and routing, invoke `make pnr`

To generate the device 3D model, invoke `make render`

To generate sliced files for printing, invoke `make slice`

To remove all generated files, invoke `make clean`

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
