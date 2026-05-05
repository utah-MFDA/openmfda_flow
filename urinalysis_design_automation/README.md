# OpenMFDA+ (Wrapper software for OpenMFDA) - Quick Start

This document, along with the included python scripts, is provided to help with setup and running the OpenMFDA+ software.

## Setup

### Installing OpenMFDA
To install OpenMFDA, clone the repo at https://github.com/utah-MFDA/openmfda_flow and follow the provided steup instructions.

### Interfacing OpenMFDA+ with OpenMFDA
To automate microfluidic designs using OpenMFDA+, download 'main.py', 'file_generation.py', and 'design_automation.py' and place the files in the main OpenMFDA directory. 

To replicate the urinalysis suite and class of continuous-flow, pressure driven device results as found in publication, navigate to 'flow/platforms/h.r.3.3/config_3dp.mk' within the OpenMFDA flow. In 'config_3dp.mk', set 'ZBULK_VAL = 230' and 'EDGE_PADDING = 0'.

From the command line, call 'python3 main.py' to run OpenMFDA+. The user will be presented with different prompts about their assay from which a design will be automated. 

The urinalysis suite assay information (as automated in publication) is listed in 'urinalysis_dicts.py'. Likewise, OpenMFDA+ benchmark assays are found in 'test_dicts.py'.

