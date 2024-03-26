
import sys, os

dir_path = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, f'{dir_path}/..')

from openmfda_flow import *

def test_exec_remote():
    design    = 'demo'
    plat      = 'mfda_30px'
    py_remote = '~/mfda_env'
    remote_dir= "MFDA_flow"

    test = run_remote(design, plat, py_remote, remote_dir)

if __name__ == "__main__":

    test_exec_remote()