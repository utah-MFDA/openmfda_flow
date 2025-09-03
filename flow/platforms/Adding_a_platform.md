# Developing a PDK for OpenMFDA

OpenMFDA is developed using a version of OpenROAD and utilizes OpenSCAD as the main rendering tool. 
The document discusses the main required files for newly developed PDKs (process design kit). 
New PDKs for other printers will require that a new directory be created under the flow/platform 
directory with the name of the printer.

## Developing the technology files

These files are used to define the process information for the 3D printer. To work with DLP 3D printing 
process we developed the PDK with the unit dimension being pixel.  

### Tech LEF

This file is used for technology description of the device such as technology sites, available layers for 
routing, layer's physical information (pitch, width, spacing etc.), DRC rules, VIA definition, Non-Default Rules 
(NDR). Not all the features of LEF files are used here or described and refer readers to go to Cadance 
LEF/DEF documentation for a complete description. Here we provide some simple examples of technology lef 
statements to build a PDK for OpenMFDA. The example describes setting up a basic layer, and via (z-direction 
connecting channel) that is minimally required to use OpenMFDA. The way the file will be written is the bottom 
layers are defined first in the file with following layers on top defined below. From a manufacturing standpoint 
the layers are defined from first processes are near the top. In general, the file will be defined in alternating 
layer types between routing and cut that look like this:
- Layer1 routing
- Via1 cut
- Layer2 routing
- Via2 cut
- Layer3 routing

The example below is an example of defining a single routing layer in the tech lef file with name met1. What 
is included in this definition is the preferred direction to be horizontal (the other being vertical), with 
channel width being 14 pixels and minimum width being 14 pixels for the design rule check.
```
LAYER met1
  TYPE ROUTING ;
  DIRECTION HORIZONTAL ;
  MINWIDTH 14 ;
  WIDTH 14 ;
END met1
```

Between each layer we also need to define a cut layer that will be used to from the vias. Below is an example
of statements like that below can be used. This simply creates a via of width 14 pixels. 
```
LAYER via1
  TYPE CUT ;
  WIDTH 14 ;
END via1
```

In this example we additionally need to define a via that is composed of two routing layers and a single
cut layer.
```
VIA M1M2_PR DEFAULT
  LAYER via1 ;
    RECT -7 -7 7 7 ;
  LAYER met1 ;
    RECT -7 -7 7 7 ;
  LAYER met2 ;
    RECT -7 -7 7 7 ;
END M1M2_PR
```

### make_track.tcl
The make_tracks.tcl file is part of the initialize floorplan process of OpenROAD that can be found at, 
https://openroad.readthedocs.io/en/latest/main/src/ifp/README.html.

We use this file to define grid for the routing channels pitch distances. Each routing layer should have
a matching statement like:

```
make_tracks layer_name -x_offset 0 -x_pitch 30 -y_offset 0 -y_pitch 30
```

where the offset parameters is the distance the routing grid will be offset from the origin, and the pitch parameters is the pitch distance of parallel routing tracks.	

### config_3dp.mk
This file contains the definitions of many of the 3D printing parameters to be used in the flow such as pixel
dimensions, layer dimension, number of bottom layers, size in pixels in the x and y dimensions of the device 
to print, number of total printing layers (different from tlef layers), spacing from outer edges, top and bottom 
routing layers, and rendering smoothness.

### Other files
Other files such as fastroute.tcl and config.mk can be copied into the new platform directory.

### Merged platform LEF file of standard cells
This file contains all the lef definition of the components in the library. This is a merged file of 
all the LEF files within the `Components` directory of the PDK found at https://github.com/utah-MFDA/h.r.3.3_pdk.

### Merged Platform SCAD files 
This file contains all the SCAD files of the components implemented in the library. This is a 
merged file containing all the scad files in the `Components` directory and the `scad_include` 
found at https://github.com/utah-MFDA/h.r.3.3_pdk. The two different routing files should be included
in any new PDKs.

### Xyce library file

This file is a compiled binary of the components developed for Xyce. This can be built with a copy of the 
PDK, https://github.com/utah-MFDA/h.r.3.3_pdk running `build_va`. The files use to build the library are 
contained in the `Components` directory.