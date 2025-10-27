import subprocess
# import opendbpy as odb
# from pcbnew_to_verilog import PcbnewToVerilog
from flask import Flask, request, url_for, send_from_directory
from werkzeug.utils import secure_filename
import tempfile
import os.path

app = Flask(__name__)

@app.route("/route", methods=["POST"])
def router():
    pcb_file = request.files['input_file']
    root = workspace_root()
    results_dir = tempfile.mkdtemp(dir=root)
    _, id = os.path.split(results_dir)
    url = url_for("fetch_data", dir=id)
    pcb_filename = f"{results_dir}/original.kicad_pcb"
    pcb_file.save(pcb_filename)
    # design = "kicad_remote_design"
    # config = PcbnewToVerilog(board, design, directory)
    # cmd = gen_cmd(design, config, results_dir, ["pnr"])
    cmd = ["cat", pcb_filename]
    def generate():
        proc = subprocess.Popen(cmd,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT)
        try:
            while line := proc.stdout.readline():
                yield line
            proc.wait()
        except:
            proc.kill()
    return generate(), {"Status": 303, "Location": url, "Content-Type": "text/plain"}

@app.route("/route/<dir>", methods=["GET"])
def fetch_data(dir):
    id = secure_filename(dir)
    root = workspace_root()
    root = f"{root}/{id}"
    # def_file = f"{root}/{id}/results/4_final.def"
    # pcb_file = f"{root}/{id}/original.kicad_pcb"
    pcb_file = "original.kicad_pcb"
    # tlef_files, lef_files = lef_from_env()
    # db = load_db(def_file, tlef_files, lef_files)

    # board = pcbnew.LoadBoard(pcb_file)
    # for tr in board.GetTracks():
        # board.Remove(tr)
    # d = DefToPcbnew(db, board)
    # d.extract_layers()
    # d.place()
    # d.route()
    # board.Save(pcb_file)
    return send_from_directory(root, pcb_file), {"Content-Type": "text/kicad_pcb"}

def workspace_root():
    return "./workspace"

def flow_root():
    if "OPENMFDA_FLOW_ROOT" in os.environ:
        return os.environ["OPENMFDA_FLOW_ROOT"]
    else:
        return "/app/opt/openmfda/flow"

def lef_from_env():
    root = flow_root()
    tlef_files = [f"{root}/platforms/h.r.3.3/lef/h.r.3.3.tlef"]
    lef_files = [f"{root}/platforms/h.r.3.3/lef/h.r.3.3_merged.lef",
                 f"{root}/platforms/h.r.3.3/lef/h.r.3.3_pads.lef"]
    return tlef_files, lef_files

def gen_cmd(design, config, results, args):
    base_cmd = ["echo", "make", "-C", flow_root(),
                "TIME_CMD=",
                f"DESIGN={design}", f"DESIGN_CONFIG={config}",
                f"LOG_DIR={results}",  f"OBJECTS_DIR={results}",
                f"REPORTS_DIR={results}", f"RESULTS_DIR={results}"]
    return base_cmd + args
