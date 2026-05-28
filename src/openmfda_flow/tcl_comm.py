import tkinter
import subprocess
import os
import atexit
from time import sleep

ORD_CMD = "openroad"

ORD_TCL_STARTUP = [
    "source $::env(ORD_COMM_DIR)/snit.tcl"
    "source $::env(ORD_COMM_DIR)/comm.tcl",
    "",
    "package require comm"
    "set id [::comm::comm self]"
    "set fd [open $::env(ORD_COMM_DIR)/ord_id_file.txt w]",
    "puts $fd $id",
    "close $fd",
    "",
    "proc stop_server {} {set ::forever 1}",
    "vwait forever"
    ]

if "OPENMFDA_FLOW_ROOT" not in os.environ:
    os.environ["OPENMFDA_FLOW_ROOT"] = os.path.abspath(os.path.dirname(__file__)+"/../..")

ORD_COMM_DIR = os.environ["OPENMFDA_FLOW_ROOT"]+"/tools/tcl_comm"
os.environ["ORD_COMM_DIR"] = ORD_COMM_DIR

ORD_COMM_SRV_START = ORD_COMM_DIR+"/ord_comm_startup.tcl"

ord_interp = None

# def start_ord_tcl_server():
#     interp = tkinter.Tcl()
#     for line in ORD_TCL_STARTUP:
#         interp.eval(line)


def start_ord_tcl_server(no_wait=False):
    p = subprocess.Popen(
            [ORD_CMD, ORD_COMM_SRV_START],
            cwd=ORD_COMM_DIR,
            start_new_session=True)
    if not no_wait:
        sleep(1)
        print("started ord tcl server")
    return p


# returns an interpreter that can communicate with an
#   openroad tcl process. This requires the server
#   be created first
def start_ord_tcl_client():
    interp = tkinter.Tcl()
    interp.eval('package require comm')

    # load the id
    with open('idfile.txt') as fd:
        comm_id = fd.read().strip()

    return interp


class Ord_tcl_client:

    def __init__(self):
        self.comm_id = None
        self.tcl_cl = self.start_ord_tcl_client()

    def start_ord_tcl_client(self):
        interp = tkinter.Tcl()
        interp.eval('package require comm')

        # load the id
        with open('idfile.txt') as fd:
            self.comm_id = fd.read().strip()

        return interp

    def send_command(self, cmd):
        self.tcl_cl.eval(
                'comm::comm send {0!s} {1!s}'.format(self.comm_id, cmd))

    def read_lef(self, lef_file):
        self.send_command(f'read_lef {lef_file}')

    def read_def(self, def_file):
        self.send_command(f'read_def {def_file}')


def exit_handler():
    pass


atexit.register(exit_handler)


if __name__ == "__main__":
    # fmt:off
    pr = start_ord_tcl_server()
    sleep(3)
    pr.kill()
