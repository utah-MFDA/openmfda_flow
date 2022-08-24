# Microfluidic Design Automation (MFDA)

The central idea for this project is to create an automation 
tool for microfluidic design using a combination of open-source
electronic design automation (EDA) and SCAD tools. This project
uses the OpenROAD EDA tool for 2D place and route with standard
compnents found in their respective platforms found in 
/pnr/openroad_flow/platforms. The supported cells include
basic valves, pumps, and various sizes of resistive channels.
After 2D PNR, a Python-based tool which includes the
SolidPython package parses through the EDA results and connects
the 2D results with their 3D counterparts. The SCAD results can
be viewed and rendered in any SCAD software such as OpenSCAD
(https://openscad.org/). This tool generates the 3D structures
required for the 3D printing technology developed at BYU under
Dr. Nordin.

## Geting Started

The first thing to do after cloning the repo is to download and
install the OpenROAD software found in the following repo 
https://github.com/The-OpenROAD-Project/OpenROAD. Another
tool used for 2D visualization is KLayout which can be
downloaded at https://www.klayout.de. Once the repo has been
cloned and the mentioned tools downloaded. The next step is to
update the binaries in /pnr/setup_env.sh and source the setup.
In /pnr:

```
source setup_env.sh
```

## General Flow

To complete a flow, the following steps are taken:

1. Start by creating a new design with this path structure
    - pnr/openroad_flow/designs/(platform)/(design name)
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
      /pnr/openroad_flow/designs/mfda/smart_toilet/io_constraints.tcl
      for correct allignment with the flushing chip. Otherwise,
      the I/Os must be placed at the edge of the device and
      pinholes will automatically added for tubing.
3. The chips are described using Verilog HDL netlist scripting.
   The netlist description is structured like
   /pnr/openroad_flow/designs/src/(design)/(design).v.
   This netlist describes the I/Os, what components are used,
   and how they are all connected.
4. In /pnr/openroad_flow/Makefile, the *DESIGN_CONFIG* variable
   must be the path to the /config.mk file described in step 2.
5. The 3D configuration is setup in this path structure,
   /pnr/scad_flow/designs/(platform)/(design name). Within
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
   the Makefile in /pnr/Makefile
   ```
   cd pnr
   make
   ```