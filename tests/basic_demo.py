import os
import sys

this_dir = os.path.dirname(os.path.abspath(__file__))
docker_run_dir = os.path.abspath(this_dir+'/..')
flow_dir = os.path.dirname(this_dir+'/../flow')

make_args_full = 'pnr render simulate'

# fmt: off
sys.path.append(docker_run_dir)
from run_mfda_docker import run_mfdaflow_docker
# fmt: on

# def run_mfdaflow_docker(
#     design,
#     mfda_platform,
#     make_args,
#     docker_env_vars=None,
#     run_deps=False,
#     no_check=False,
# ):
run_mfdaflow_docker(
    design='smart_toilet',
    mfda_platform='h.r.3.3',
    make_args=make_args_full,
    run_deps=True
)
