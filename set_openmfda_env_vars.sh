#/bin/bash

# takes the current directory  as the base for the openmfda flow
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
echo "Setting OPENMFDA_ROOT as $SCRIPT_DIR"
export OPENMFDA_ROOT=$SCRIPT_DIR
