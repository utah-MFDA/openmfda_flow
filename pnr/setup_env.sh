#!/bin/bash

# Directory paths
export OPENROAD_FLOW_DIR=openroad_flow
export PYTHON_DIR=python
export SCAD_DIR=scad

# Tool commands
export OPENROAD_EXE= # Put binary path here
export KLAYOUT_CMD= # Put binary path here

# SCAD file paths
export SCAD_ROUTING=$SCAD_DIR/routing_181220.scad
export SCAD_STANDARD_CELLS=$SCAD_DIR/components_05052022.scad

# OpenROAD result directory
export OR_RESULTS=$OPENROAD_FLOW_DIR/results

# SCAD result directories
export RESULTS_DIR=results