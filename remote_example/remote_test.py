
import sys, os
import platform

dir_path = os.path.dirname(os.path.realpath(__file__))
sys.path.insert(0, f'{dir_path}/..')

from openmfda_class import OpenMFDA

def test_exec_remote():
    design    = 'demo'
    plat      = 'mfda_30px'
    py_remote = '~/mfda_env'
    remote_dir= "MFDA_flow"

    # windows specific args
    root_drive = "C:"
    pos_root   = '/mnt/c'

    if platform.system() == "Linux":
        test = OpenMFDA().run_remote(design, plat, py_remote, remote_dir)
    elif platform.system() == "Windows":
        test = OpenMFDA().run_remote(design, plat, py_remote, remote_dir, win_drive=root_drive, wsl_root=pos_root)

if __name__ == "__main__":

    test_exec_remote()