
import sys, os
import platform

dir_path = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, f'{dir_path}/..')

from openmfda_flow import *

def test_exec_remote():
    # design and platform to run
    #design    = 'demo'
    design    = 'mix_01_iter'
    plat      = 'mfda_30px'
    # environment on the server
    py_remote = '~/mfda_env'
    # directory to put files on the server in home
    remote_dir= "MFDA_flow"

    # windows specific args
    root_drive = "C:"
    pos_root   = '/mnt/c'

    if platform.system() == "Linux":
        test = run_remote(design, plat, py_remote, remote_dir)
    elif platform.system() == "Windows":
        test = run_remote(design, plat, py_remote, remote_dir, win_drive=root_drive, wsl_root=pos_root)

if __name__ == "__main__":

    test_exec_remote()