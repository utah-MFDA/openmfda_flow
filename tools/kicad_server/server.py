from opendb_helpers import load_db
import subprocess
import pcbnew
import opendbpy as odb
from pcbnew_to_verilog import PcbnewToVerilog
from def_to_pcbnew import DefToPcbnew
from flask import Flask, request, url_for, send_from_directory
from werkzeug.utils import secure_filename
import tempfile
import os.path
from pathlib import Path
app = Flask(__name__)

@app.route("/route", methods=["POST"])
def router():
    pcb_file = request.files['input_file']
    root = workspace_root()
    results_dir = Path(tempfile.mkdtemp(dir=root))
    id = results_dir.stem
    url = url_for("fetch_data", dir=id)
    pcb_filename = results_dir / "original.kicad_pcb"
    pcb_file.save(pcb_filename)
    board = pcbnew.LoadBoard(pcb_filename)
    design = "kicad_remote_design"
    converter = PcbnewToVerilog(board, design, results_dir)
    converter.export()
    config = results_dir / "config.mk"
    cmd = gen_cmd(design, config, results_dir, ["pnr"])
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
    def_file = f"{root}/{id}/results/4_final.def"
    pcb_file = f"{root}/{id}/original.kicad_pcb"
    tlef_files, lef_files = lef_from_env()
    db = load_db(def_file, tlef_files, lef_files)

    board = pcbnew.LoadBoard(pcb_file)
    for tr in board.GetTracks():
        board.Remove(tr)
    d = DefToPcbnew(db, board)
    d.extract_layers()
    d.place()
    d.route()
    target_file = f"{root}/{id}/results/final.kicad_pcb"
    board.Save(target_file)
    return send_from_directory(root, target_file), {"Content-Type": "text/kicad_pcb"}

def workspace_root():
    return "/var/tmp/openmfda"

def flow_root():
    if "OPENMFDA_FLOW_ROOT" in os.environ:
        return os.environ["OPENMFDA_FLOW_ROOT"]
    else:
        return "/opt/openmfda/flow"

def lef_from_env():
    root = flow_root()
    tlef_files = [f"{root}/platforms/h.r.3.3/lef/h.r.3.3.tlef"]
    lef_files = [f"{root}/platforms/h.r.3.3/lef/h.r.3.3_merged.lef",
                 f"{root}/platforms/h.r.3.3/lef/h.r.3.3_pads.lef"]
    return tlef_files, lef_files

def gen_cmd(design, config, results, args):
    base_cmd = ["make", "-C", flow_root(),
                "TIME_CMD=",
                f"DESIGN={design}", f"DESIGN_CONFIG={config}",
                f"LOG_DIR={results}",  f"OBJECTS_DIR={results}",
                f"REPORTS_DIR={results}", f"RESULTS_DIR={results}"]
    return base_cmd + args
