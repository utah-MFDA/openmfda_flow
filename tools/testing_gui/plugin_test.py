#!pyton3

import os

openmfda_flow_root = os.path.abspath('../../flow')
if os.path.exists(openmfda_flow_root):
    os.environ['OPENMFDA_FLOW_ROOT'] = openmfda_flow_root
else:
    raise ValueError(f'Cannot file flow root at "{openmfda_flow_root}"')

print(os.environ['OPENMFDA_FLOW_ROOT'])
# fmt: off
#from plugin_lnis.plugin_testing import testing_app
from plugin_testing import testing_app

#testing_app.start_app_dialog()
