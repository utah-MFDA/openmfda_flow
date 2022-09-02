#!/bin/bash

# Directory paths
export OPENROAD_FLOW_DIR=openroad_flow
export SCAD_FLOW_DIR=scad_flow
export SCAD_DIR=$SCAD_FLOW_DIR/scad
export SCAD_FLOW_DESIGN_DIR=$SCAD_FLOW_DIR/designs

# Tool commands
export OPENROAD_EXE= # Put binary path here
export KLAYOUT_CMD= # Put binary path here
export TIME_CMD=/usr/bin/time

# SCAD file paths
# export SCAD_ROUTING=$SCAD_DIR/routing_181220.scad
# export SCAD_STANDARD_CELLS=$SCAD_DIR/components_05052022.scad
# export SCAD_INTERCONNECT=$SCAD_DIR/flushing_interface_32.scad

# OpenROAD result directory
export OR_RESULTS=$OPENROAD_FLOW_DIR/results

# SCAD result directories
export RESULTS_DIR=results