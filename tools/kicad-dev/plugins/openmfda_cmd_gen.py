import os

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


def gen_cmd(design, config, results, args, logs=None):
    if logs is None:
        logs = results
    base_cmd = ["make", "-C", flow_root(),
                "TIME_CMD=",
                f"DESIGN={design}", f"DESIGN_CONFIG={config}",
                f"LOG_DIR={logs}",  f"OBJECTS_DIR={results}",
                f"REPORTS_DIR={results}", f"RESULTS_DIR={results}"]
    return base_cmd + args
