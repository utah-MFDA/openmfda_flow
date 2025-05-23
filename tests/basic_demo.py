import os
import sys

this_dir = os.path.dirname(os.path.abspath(__file__))
docker_run_dir = os.path.abspath(this_dir+'/..')
flow_dir = os.path.dirname(this_dir+'/../flow')

make_args_full = 'pnr render simulate'
make_args_part = 'pnr render'

# fmt: off
sys.path.append(docker_run_dir)
from run_mfda_docker import run_mfdaflow_docker
# fmt: on

run_mfdaflow_docker('smart_toilet', 'h.r.3.3', make_args_full, True)

run_mfdaflow_docker('valves_demo', 'h.r.3.3', make_args_part, True)

run_mfdaflow_docker('reservoir_demo', 'h.r.3.3', make_args_part, True)

run_mfdaflow_docker('pcl_serpentine', 'h.r.3.3', 'mk_pcell ' + make_args_part, True)

run_mfdaflow_docker('pcl_valve', 'h.r.3.3', 'mk_pcell ' + make_args_part, True)
