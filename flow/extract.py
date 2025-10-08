import sys, os, json, re
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

designs = [
    "ChIP4",
    "ChIP10",
    "mRNAiso_4",
    "mnacidpro_3",
    "kinase_activity_2",
    "simple",
    "grad_cells",
    "multi_input",
    "hasty",
    "rotary_cells",
    "logic04",
    "rotary16",
    "net_mux",
    "grid_8"
]

logs = [
    "1_synth.log",
    "1_1_floorplan.log",
    "1_2_floorplan_io.log",
    "1_3_mplace.log",
    "2_1_place_gp.log",
    "2_2_place_iop.log",
    "2_3_opendp.log",
    "3_1_fastroute.log",
    "3_2_TritonRoute.log",
    "4_report.log",
    "5_1_scad_generate.log",
    "5_2_stl_render.log",
    "5_3_slicer.log",
]

base = "/home/snelgrov/nas/mfda/openmfda/flow/logs"

def get_elapsed(fn):
    with open(fn) as f:
        m = re.search(r"Elapsed \(wall clock\) time \(h:mm:ss or m:ss\): (?:([0-9]+):)?([0-9]+):([0-9.]+)", f.read())
        return float(m.group(1) if m.group(1) else 0)*60*60 + float(m.group(2))*60 + float(m.group(3))

data = []
for design in designs:
    for variant in range(4,13):
        work = f"{base}/{design}/met{variant}"
        os.chdir(work)
        print(design, variant)
        with open("4_report.log") as f:
            m = re.search(r"Design area ([0-9]+)", f.read())
            if not m:
                raise Exception("No area reported")
            area_px = int(m.group(1))

        with open("3_2_TritonRoute.json") as f:
            j = json.load(f)
            length_px = j["route__wirelength"]
        elapsed = [get_elapsed(log) for log in logs]

        data.append([design, variant, area_px, length_px, (7.6e-3)**2 * area_px, length_px * 7.6e-3, sum(elapsed[:-2]), sum(elapsed)])# + elapsed)

keys = ["design", "variant", "area_px", "length_px", "area_mm", "length_mm", "runtime", "total_runtime"]# + [log[:-4] for log in logs]
df = pd.DataFrame(data, columns=keys)

fig, axs = plt.subplots(4,4)
for (i, (d, g)) in enumerate(df.groupby("design")):
    ax = axs[i%4,i//4]
    ax.plot(g["variant"], g["length_mm"], label=d)
    ax.legend()

fig2, ax2 = plt.subplots()
for (d, g) in df.groupby("design"):
    ax2.plot(g["variant"], g["length_mm"], label=d)
ax2.legend()

plt.show()
