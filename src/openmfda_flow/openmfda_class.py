import os
import sys
import subprocess
import shutil
import re

import platform as osplt
from pathlib import PureWindowsPath, PurePosixPath

import openmfda_flow.openmfda_flow_0_2 as of

# f_path = os.path.abspath(__file__)
# sys.path.insert(0, f'{f_path}/place_eval')
# from openmfda_flow.place_eval import get_placement_data
import openmfda_flow.get_placement_data as get_placement_data
# import get_placement_data


class OpenMFDA:

    class Platform:
        def __init__(self):
            self.core_site = [0, 0, 2550, 1590]
            self.die_area = [0, 0, 2550, 1590]
            self.layer_per_via = 20
            self.bulk_total_layers = 280

        def set_core_area(self, new_core_area):
            if len(new_core_area) == 2:
                self.core_site = [0, 0] + new_core_area
            elif len(new_core_area) == 4:
                self.core_site = new_core_area
            else:
                raise ValueError(
                    f"Expecting list of len 2 or 4 {len(new_core_area)} passed"
                )

        def get_core_site_mk(self):
            if len(self.core_site) == 2:
                return f"0 0 {self.core_site[0]} {self.core_site[1]}"
            if len(self.core_site) == 4:
                return f"{self.core_site[0]} {self.core_site[1]} {self.core_site[2]} {self.core_site[3]}"

        def set_die_area(self, new_core_area):
            if len(new_core_area) == 2:
                self.die_area = [0, 0] + new_core_area
            elif len(new_core_area) == 4:
                self.die_area = new_core_area
            else:
                raise ValueError(
                    f"Expecting list of len 2 or 4 {len(new_core_area)} passed"
                )

        def get_die_area_mk(self):
            if len(self.core_site) == 2:
                return f"0 0 {self.core_site[0]} {self.core_site[1]}"
            if len(self.core_site) == 4:
                # return ' '.join([str(x) for x in self.core_site])
                return f"{self.core_site[0]} {self.core_site[1]} {self.core_site[2]} {self.core_site[3]}"

        def set_xbulk(self, xbulk):
            self.die_area[2] = self.die_area[0] + xbulk
            self.core_site[2] = self.core_site[0] + xbulk

        def set_ybulk(self, ybulk):
            self.die_area[3] = self.die_area[1] + ybulk
            self.core_site[3] = self.core_site[1] + ybulk

        def set_zbulk(self, zbulk):
            self.bulk_total_layers = zbulk

        def set_layers_per_via(self, lpv):
            self.layer_per_via = lpv

        def get_xbulk(self):
            return self.die_area[2] - self.die_area[0]

        def get_ybulk(self):
            return self.die_area[3] - self.die_area[1]

        def get_zbulk(self):
            return self.bulk_total_layers

        def get_xchip(self):
            return " ".join([str(self.die_area[0]), str(self.die_area[2])])

        def get_ychip(self):
            return " ".join([str(self.die_area[1]), str(self.die_area[3])])

    class Simulator:

        def __init__(self):
            self.input = []
            self.chem = []

            # simluation probes
            self.pressure_probes = []
            self.flow_probes = []
            self.concentration_probes = []

            self.eval_probes = []

            self.analysis_list = []

            # for is config file is defined instead
            self.config_file = None

        def add_input(self, port, device, value, chemistry=None):

            if list(value.keys())[0] == "pressure":
                port_input_type = "pressure"
                in_value = value["pressure"]
            elif list(value.keys())[0] == "flow rate":
                port_input_type = "flow_rate"
                in_value = value["flow rate"]
            else:
                raise ValueError(
                    "Not a valid input type, must be flow rate or pressure"
                )

            self.input.append(
                {
                    "port": port,
                    "device": device,
                    "input_type": port_input_type,
                    "input_value": in_value,
                }
            )
            if chemistry is not None:
                if isinstance(chemistry, dict):
                    self.chem.append(
                        {
                            "port": port,
                            "chem": list(chemistry.keys())[0],
                            "concentration": list(chemistry.values())[0],
                        }
                    )

        def add_probe(self, probe_type, wire, device=None):
            if probe_type == "pressure" and device == None:
                self.pressure_probes.append([wire])
            elif probe_type == "pressure":
                self.pressure_probes.addend([wire, device])
            elif probe_type == "concentration":
                self.concentration_probes.addend([wire, device])
            elif probe_type == "flow":
                self.flow_probes.append([wire, device])
            else:
                raise ValueError("probe_type must be pressure, flow, or concentration")

        def add_eval(self, chemistry, wire, target_concentration, time=None):
            self.eval_probes.append(
                {
                    "chemistry": chemistry,
                    "wire": wire,
                    "concentration": target_concentration,
                    "time": time,
                }
            )

        def add_analysis(
            self,
            analysis_type,
            param1,
            param2=None,
            param3=None,
            param4=None,
            param5=None,
        ):
            params = [param1, param2, param3, param4, param5]
            self.analysis_list.append(
                {"type": analysis_type, "params": [x for x in params if x != None]}
            )

        def set_sim_config_file(self, sim_config_file):
            # check for probes + not compatible
            if (
                len(self.chem) == 0
                and len(self.flow_probes) == 0
                and len(self.pressure_probes) == 0
                and len(self.concentration_probes) == 0
                and len(self.analysis_list) == 0
                and isinstance(sim_config_file, str)
            ):
                self.config_file = sim_config_file
            else:
                raise ValueError(
                    "Only probes or simulation config can be passed. Not both"
                )

        def to_string_probes(self):
            o_str = ""
            for ip in self.input:
                o_str += str(ip) + "\n"
            for cp in self.chem:
                o_str += str(cp) + "\n"
            for pp in self.pressure_probes:
                o_str += "pressure probe " + str(pp) + "\n"
            for ep in self.eval_probes:
                o_str += "flow probe " + str(ep) + "\n"
            return o_str

        def to_string_analysis(self):
            o_str = ""
            for a in self.analysis_list:
                o_str = str(a) + "\n"
            return o_str

        def write_sim_config(self, out_dir, out_file="simulation.config"):

            if isinstance(self.config_file, str):
                if os.path.isfile(self.config_file):
                    shutil.copyfile(self.config_file, f"{out_dir}/{out_file}")
                    return
                else:
                    raise ValueError(
                        f"Input simulation file is not a file or does not exist; Passed in {self.config_file}"
                    )

            with open(f"{out_dir}/{out_file}", "w+") as of:
                # print("writing simulation config")
                of.write("\n\n# Analysis to perform\n")
                for a in self.analysis_list:
                    at = a["type"]
                    p = " ".join(a["params"])
                    of.write(f"{at} {p}\n")

                of.write("\n\n# input devices\n")
                for ins in self.input:
                    in_p = ins["port"]
                    in_d = ins["device"]
                    in_t = ins["input_type"]
                    in_v = ins["input_value"]
                    of.write(f"input {in_p} {in_d} {in_t}={in_v}\n")

                of.write("\n\n# chemical definitions\n")
                for ch in self.chem:
                    ch_p = ch["port"]
                    ch_ch = ch["chem"]
                    ch_con = ch["concentration"]
                    of.write(f"chem {ch_ch} {ch_p} {ch_con}\n")

                of.write("\n\n# pressure probes")
                for pr in self.pressure_probes:
                    if len(pr) == 1:
                        of.write(f"probe pressure {pr[0]}\n")
                    elif len(pr) == 2:
                        of.write(f"probe pressureNone {pr[0]} {pr[1]}\n")

                of.write("\n\n# flow probes")
                for fl in self.flow_probes:
                    of.write(f"probe flow {fl[0]} {fl[1]}\n")

                of.write("\n\n# eval probes\n")
                for ev in self.eval_probes:
                    ev_ch = ev["chemistry"]
                    ev_t = ev["time"]
                    ev_w = ev["wire"]
                    ev_con = ev["concentration"]

                    of.write(f"eval {ev_ch} {ev_t} {ev_w} {ev_con}\n")

    def __init__(self, design_name=None, verilog_file=None, platform=None):
        self.pins = [
            [{"name": None, "layer": None} for i in range(0, 8)] for j in range(0, 4)
        ]
        self.cells = None
        self.design_name = design_name
        self.verilog_file = verilog_file
        self.platform = platform
        self.platform_config = self.Platform()
        self.replace_arg = {}
        self.simulation_config = self.Simulator()
        if 'OPENMFDA_ROOT' in os.environ:
            self.openmfda_flow_path = os.environ['OPENMFDA_ROOT']
        else:
            self.openmfda_flow_path = None

    def import_verilog_file(self, verilog_file):
        self.verilog_file = verilog_file

    def set_verilog_file(self, verilog_file):
        self.verilog_file = verilog_file

    # def set_platform(self, platform):
    #    self.platform = platform

    def set_design_name(self, design_name):
        self.design_name = design_name

    def set_pin(self, pin, name, layer="met9"):
        self.pins[pin[0]][pin[1]] = {"name": name, "layer": layer}

    def set_openmfda_flow_path(self, path, skip_ckeck=False):

        def check_path():
            if os.path.isdir(f"{path}/flow") and \
                  os.path.isdir(f"{path}/tools"):
                print("Found main flow and tools")
                return True
            else:
                print("Unable to find flow and tools, checkign for old version")
                found_tools = {"xyce":False,"scad":False, "openroad":False}
                if os.path.isdir(f"{path}/xyce_flow"):
                    found_tools['xyce'] = True
                    print(f"Found xyce flow at {os.path.abspath(f'{path}/xyce_flow')}")
                if os.path.isdir(f"{path}/scad_flow"):
                    found_tools['scad'] = True
                    print(f"Found scad flow at {os.path.abspath(f'{path}/scad_flow')}")
                if os.path.isdir(f"{path}/openroad_flow"):
                    found_tools['openroad'] = True
                    print(f"Found openroad flow at {os.path.abspath(f'{path}/openroad_flow')}")

                if not found_tools['xyce'] and \
                      not found_tools['scad'] and \
                      not found_tools['openroad']:
                    return False
                else:
                    return True

        if os.path.isdir(path):
            if check_path() or skip_ckeck:
                self.openmfda_flow_path = path
            else:
                raise ValueError(f"Not able to find ./flow or ./tools for OpenMFDA_flow path: {path}")
        else:
            raise IsADirectoryError(f"{path} is not a valid directory")



    def get_openmfda_flow_path(self):
        if self.openmfda_flow_path is None:
            raise ValueError("OpenMFDA flow path not set, either set enviroment variable 'OPENMFDA_ROOT' or set with set_openmfda_flow_path(<path>)")
        else:
            return self.openmfda_flow_path

    def add_cell(self, cell, ports):
        pass

    def set_die_area(self, new_die_area):
        self.platform_config.set_die_area(new_die_area)

    def set_core_area(self, new_core_area):
        self.platform_config.set_core_area(new_core_area)

    def generate_platform_config_dict(self):
        export_plat = {}
        export_plat["core_site"] = self.platform_config.get_core_site_mk()
        export_plat["die_area"] = self.platform_config.get_die_area_mk()
        export_plat["xbulk"] = self.platform_config.get_xbulk()
        export_plat["ybulk"] = self.platform_config.get_ybulk()
        export_plat["zbulk"] = self.platform_config.get_zbulk()
        export_plat["xchip"] = self.platform_config.get_xchip()
        export_plat["ychip"] = self.platform_config.get_ychip()

        return export_plat

    def set_replace_arg(self, arg, value):
        if arg == "placement_density" or arg == "density":
            self.replace_arg["density"] = value
        elif arg == "bin":
            self.replace_arg["bin"] = value
        elif arg == "init_density_coef":
            self.replace_arg["init_density_coef"] = value
        elif arg == "init_wire_coef" or arg == "init_wirelength_coef":
            self.replace_arg["init_wire_coef"] = value
        elif arg == "max_phi":
            self.replace_arg["max_phi"] = value
        elif arg == "min_phi":
            self.replace_arg["min_phi"] = value
        elif arg == "overflow":
            self.replace_arg["overflow"] = value
        elif arg == "fanout":
            self.replace_arg["fanout"] = value

    def set_simulation_config_file(self, sim_config_file):
        self.simulation_config.set_sim_config_file(sim_config_file)

    # def add_probe(self, probe_type, wire):
    def add_probe(self, probe_type, wire):
        self.simulation_config.add_probe(probe_type, wire)

    # def add_input(self, port, device, value, chemistry=None):
    def add_input(self, port, device, value, chemistry=None):
        self.simulation_config.add_input(port, device, value, chemistry)

    # def add_eval(self, chemistry, wire, target_concentration, time=None):
    def add_eval(self, chemistry, wire, target_concentration, time=None):
        self.simulation_config.add_eval(chemistry, wire, target_concentration, time)

    def add_analysis(
        self, analysis_type, param1, param2=None, param3=None, param4=None, param5=None
    ):
        self.simulation_config.add_analysis(
            analysis_type, param1, param2, param3, param4, param5
        )

    # def write_sim_config(self, out_dir, out_file='simulation.config'):
    def write_sim_config(self, out_dir, out_file="simulation.config"):
        self.simulation_config.write_sim_config(out_dir, out_file)

    def to_string_probes(self):
        return self.simulation_config.to_string_probes()

    def generate_xyce_configs(self):
        # dir_path = os.path.dirname(
        #     os.path.normpath(os.path.realpath(__file__) + "/../../")
        # )
        dir_path = self.get_openmfda_flow_path()
        xyce_run_dir = (
            f"{dir_path}/xyce_flow/designs/{self.platform}/{self.design_name}"
        )
        # netlist_file = (
        #     f"{dir_path}/designs/{self.platform}/{self.design_name}/{self.verilog_file}"
        # )

        print("Writing Xyce configuration")
        os.makedirs(xyce_run_dir, exist_ok=True)

        if self.verilog_file is not None:
            shutil.copy(self.verilog_file, xyce_run_dir + "/" + os.path.basename(self.verilog_file))
            #shutil.copy(netlist_file, xyce_run_dir + "/" + self.verilog_file)
            self.write_sim_config(xyce_run_dir)

    def build(self):
        if self.platform is None:
            raise ValueError(f"Set platform for OpenMFDA_class: {self.design_name}")
        of.generate_config(
            self.verilog_file,
            self.design_name,
            openmfda_flow_path=self.get_openmfda_flow_path(),
            pins=self.pins,
            global_place_args=self.replace_arg,
            design_dir=True,
            platform=self.platform,
            platform_config=self.generate_platform_config_dict(),
        )
        self.generate_xyce_configs()
        # replace_file = f"openroad_flow/designs/{self.platform}/{self.design_name}/global_place_args.tcl"
        # of.write_replace_args(replace_file, self.replace_arg)

    def run_flow(self, mk_targets="all", make_pre='', skip_if_no_length_file=False):
        if self.platform is None:
            raise ValueError(f"Set platform for OpenMFDA_class: {self.design_name}")
        print(self.platform)
        of.run_flow(
            self.design_name,
            #self.get_openmfda_flow_path(),
            platform=self.platform,
            mk_targets=mk_targets,
            #make_pre=make_pre,
            #skip_if_no_length_file=skip_if_no_length_file,
        )

    def run_flow_iter_soln(
        self, iter_list, len_file, eval_file, out_csv_len, out_csv_chem, end_err=0
    ):
        density_var = iter_list[0]
        bin_var = iter_list[1]
        max_phi = iter_list[2]
        min_phi = iter_list[3]
        i_wire_coef = iter_list[4]
        i_dens_coef = iter_list[5]
        fan_out = iter_list[6]
        overflow = iter_list[7]

        init = True

        def write_vals(colns, val_list, init=True, out_file=None):

            out_file_n = None
            if out_file == None:
                out_file = "replace_vars.csv"
            else:
                pass

            if os.path.isfile(out_file) and init:
                count = 0
                out_file_n = out_file + "_" + str(count)
                while os.path.isfile(out_file_n):
                    out_file_n = out_file + "_" + str(count)
                    count += 1
                out_file = out_file_n

            if init:
                of = open(out_file, "w+")
                of.write(",".join(colns) + "\n")
            else:
                of = open(out_file, "a")

            of.write(",".join([str(x) for x in val_list]) + "\n")
            return out_file_n

        def report_len(len_file, o_len, init=True):
            import pandas as pd

            o_len_n = None
            len_df = pd.read_csv(len_file, index_col=1)
            len_df = len_df.T

            # print(len_df.iloc[1].tolist())

            if os.path.isfile(o_len) and init:
                count = 0
                o_len_n = o_len + "_" + str(count)
                while os.path.isfile(o_len_n):
                    o_len_n = o_len + "_" + str(count)
                    count += 1
                o_len = o_len_n

            if init:
                of = open(o_len, "w+")
                of.write(",".join(len_df.columns.tolist()) + "\n")
            else:
                of = open(o_len, "a")

            of.write(",".join([str(x) for x in len_df.iloc[1].tolist()]) + "\n")
            return o_len_n

        def report_chem(chem_file, o_chem, init=True):
            import pandas as pd

            o_chem_n = None
            chem_df = pd.read_csv(chem_file)

            ch_list = chem_df[:]["Chemical"].tolist()
            nd_list = chem_df[:]["Node"].tolist()

            row_list = []
            key_list = []

            min_err = None

            for ir in chem_df.iterrows():
                key_base = ir[1]["Chemical"] + "." + ir[1]["Node"]

                key_c = key_base + ".concentration"
                val_c = ir[1]["Eval Conc"]
                key_e = key_base + ".error"
                val_e = ir[1]["Error"]

                if min_err is None or val_e > min_err:
                    min_err = val_e

                key_list.append(key_c)
                key_list.append(key_e)

                row_list.append(str(val_c))
                row_list.append(str(val_e))

            if os.path.isfile(o_chem) and init:
                count = 0
                o_chem_n = o_chem + "_" + str(count)
                while os.path.isfile(o_chem_n):
                    o_chem_n = o_chem + "_" + str(count)
                    count += 1
                o_chem = o_chem_n

            if init:
                of = open(o_chem, "w+")
                of.write(",".join(key_list))
                if end_err > 0:
                    of.write(",min_err")
                of.write("\n")
            else:
                of = open(o_chem, "a")
            of.write(",".join(row_list))
            if end_err > 0:
                of.write(f",{min_err}")
            of.write("\n")
            # print(, )
            return o_chem_n, min_err

        iter_count = 0

        for dv in density_var:  # density_var
            for bv in bin_var:  # bin_var
                for maxp in max_phi:  # max_phi
                    for minp in min_phi:  # max_phi
                        for iwire in i_wire_coef:
                            for iden in i_dens_coef:
                                for ov in overflow:
                                    iter_count += 1
                                    self.set_replace_arg("overflow", ov)
                                    self.set_replace_arg("init_wire_coef", iwire)
                                    self.set_replace_arg("init_density_coef", iden)
                                    self.set_replace_arg("max_phi", maxp)
                                    self.set_replace_arg("min_phi", minp)
                                    self.set_replace_arg("bin", bv)
                                    self.set_replace_arg("density", dv)

                                    mfda_error = False

                                    print(self.to_string_probes())
                                    self.build()
                                    try:
                                        self.run_flow(
                                            mk_targets=["pnr", "render", "simulate"]
                                        )
                                    except subprocess.CalledProcessError:
                                        # TODO report blank or missing entries
                                        mfda_error = True

                                    w_colns = [
                                        "overflow",
                                        "init_wire_coef",
                                        "init_density_coef",
                                        "max_phi",
                                        "min_phi",
                                        "bin",
                                        "density",
                                        "error",
                                    ]
                                    w_vals = [
                                        ov,
                                        iwire,
                                        iden,
                                        maxp,
                                        minp,
                                        bv,
                                        dv,
                                        str(mfda_error),
                                    ]
                                    if init:
                                        write_vals(w_colns, w_vals, init)
                                    else:
                                        write_vals(w_colns, w_vals, init)

                                    # report lengths
                                    if init:
                                        nl = report_len(len_file, out_csv_len, init)
                                        if nl != None:
                                            out_csv_len = nl
                                        nc, min_err = report_chem(eval_file, out_csv_chem, init)
                                        if nc != None:
                                            out_csv_chem = nc
                                    else:
                                        # report len
                                        report_len(len_file, out_csv_len, init)

                                        # report eval
                                        nnc, min_err = report_chem(eval_file, out_csv_chem, init)

                                    init = False

                                    if min_err is not None and min_err <= end_err:
                                        print(f"found solution below {end_err}, actual error {min_err}")
                                        print("Values:", ' '.join([f"{w_colns[id]}:{w_vals[id]}" for id in range(0,len(w_vals))]))
                                        print(f"Iteration: {iter_count}")
                                        return


    def run_flow_iter_soln_opt(
        self, iter_list, len_file, eval_file, out_csv_len, out_csv_chem, end_err=0
    ):
        density_var = iter_list[0]
        bin_var = iter_list[1]
        max_phi = iter_list[2]
        min_phi = iter_list[3]
        i_wire_coef = iter_list[4]
        i_dens_coef = iter_list[5]
        fan_out = iter_list[6]
        overflow = iter_list[7]

        init = True

        def write_vals(colns, val_list, init=True, out_file=None):

            out_file_n = None
            if out_file == None:
                out_file = "replace_vars.csv"
            else:
                pass

            if os.path.isfile(out_file) and init:
                count = 0
                out_file_n = out_file + "_" + str(count)
                while os.path.isfile(out_file_n):
                    out_file_n = out_file + "_" + str(count)
                    count += 1
                out_file = out_file_n

            if init:
                of = open(out_file, "w+")
                of.write(",".join(colns) + "\n")
            else:
                of = open(out_file, "a")

            of.write(",".join([str(x) for x in val_list]) + "\n")
            return out_file_n

        def report_len(len_file, o_len, init=True):
            import pandas as pd

            o_len_n = None
            len_df = pd.read_csv(len_file, index_col=1)
            len_df = len_df.T

            # print(len_df.iloc[1].tolist())

            if os.path.isfile(o_len) and init:
                count = 0
                o_len_n = o_len + "_" + str(count)
                while os.path.isfile(o_len_n):
                    o_len_n = o_len + "_" + str(count)
                    count += 1
                o_len = o_len_n

            if init:
                of = open(o_len, "w+")
                of.write(",".join(len_df.columns.tolist()) + "\n")
            else:
                of = open(o_len, "a")

            of.write(",".join([str(x) for x in len_df.iloc[1].tolist()]) + "\n")
            return o_len_n

        def report_chem(chem_file, o_chem, init=True):
            import pandas as pd

            o_chem_n = None
            chem_df = pd.read_csv(chem_file)

            ch_list = chem_df[:]["Chemical"].tolist()
            nd_list = chem_df[:]["Node"].tolist()

            row_list = []
            key_list = []

            min_err = None

            for ir in chem_df.iterrows():
                key_base = ir[1]["Chemical"] + "." + ir[1]["Node"]

                key_c = key_base + ".concentration"
                val_c = ir[1]["Eval Conc"]
                key_e = key_base + ".error"
                val_e = ir[1]["Error"]

                if min_err is None or val_e > min_err:
                    min_err = val_e

                key_list.append(key_c)
                key_list.append(key_e)

                row_list.append(str(val_c))
                row_list.append(str(val_e))

            if os.path.isfile(o_chem) and init:
                count = 0
                o_chem_n = o_chem + "_" + str(count)
                while os.path.isfile(o_chem_n):
                    o_chem_n = o_chem + "_" + str(count)
                    count += 1
                o_chem = o_chem_n

            if init:
                of = open(o_chem, "w+")
                of.write(",".join(key_list) + "\n")
            else:
                of = open(o_chem, "a")
            of.write(",".join(row_list) + "\n")
            # print(, )
            return o_chem_n, min_err

        iter_count = 0

        for dv in density_var:  # density_var
            for bv in bin_var:  # bin_var
                for maxp in max_phi:  # max_phi
                    for minp in min_phi:  # min_phi
                        for iwire in i_wire_coef:
                            for iden in i_dens_coef:
                                for ov in overflow:
                                    iter_count += 1
                                    self.set_replace_arg("overflow", ov)
                                    self.set_replace_arg("init_wire_coef", iwire)
                                    self.set_replace_arg("init_density_coef", iden)
                                    self.set_replace_arg("max_phi", maxp)
                                    self.set_replace_arg("min_phi", minp)
                                    self.set_replace_arg("bin", bv)
                                    self.set_replace_arg("density", dv)

                                    mfda_error = False

                                    print(self.to_string_probes())
                                    self.build()
                                    try:
                                        self.run_flow(
                                            mk_targets=["pnr", "render", "simulate"]
                                        )
                                    except subprocess.CalledProcessError:
                                        # TODO report blank or missing entries
                                        mfda_error = True

                                    w_colns = [
                                        "overflow",
                                        "init_wire_coef",
                                        "init_density_coef",
                                        "max_phi",
                                        "min_phi",
                                        "bin",
                                        "density",
                                        "error",
                                    ]
                                    w_vals = [
                                        ov,
                                        iwire,
                                        iden,
                                        maxp,
                                        minp,
                                        bv,
                                        dv,
                                        str(mfda_error),
                                    ]
                                    if init:
                                        write_vals(w_colns, w_vals, init)
                                    else:
                                        write_vals(w_colns, w_vals, init)

                                    # report lengths
                                    if init:
                                        nl = report_len(len_file, out_csv_len, init)
                                        if nl != None:
                                            out_csv_len = nl
                                        nc, min_err = report_chem(eval_file, out_csv_chem, init)
                                        if nc != None:
                                            out_csv_chem = nc
                                    else:
                                        # report len
                                        report_len(len_file, out_csv_len, init)

                                        # report eval
                                        nnc, min_err = report_chem(eval_file, out_csv_chem, init)

                                    init = False

                                    if min_err <= end_err:
                                        print(f"found solution below {end_err}, actual error {min_err}")
                                        print("Values:", ' '.join([f"{w_colns[id]}:{w_vals[id]}" for id in range(0,len(w_vals))]))
                                        print(f"Iteration: {iter_count}")
                                        return

    def run_flow_iter_placement(
        self, iter_list, results_root, lef_file, centers=False, delim=','
    ):
        # from place_eval import get_placement_data
        if not isinstance(delim, str):
            raise ValueError("delim must be of type str")

        if len(iter_list) != 7:
            raise ValueError("First arg (iter list) needs to have len 7 [density, bin, max_phi, min_phi, init_wire_len, init_den, overflow]")

        density_var = iter_list[0]
        bin_var = iter_list[1]
        max_phi = iter_list[2]
        min_phi = iter_list[3]
        i_wire_coef = iter_list[4]
        i_dens_coef = iter_list[5]
        overflow = iter_list[6]

        def reform_e(edge):
            e = str(edge)
            edge_reg = r'\s*\(\s*[\'\"]([_\w\d]+)[\'\"]\s*,\s*[\'\"]([_\w\d]+)[\'\"]\s*\)\s*'
            edge_repl= r'\1-\2'
            return re.sub(edge_reg, edge_repl, e)


        def write_vals(colns, val_list, distances_gp={}, distances_dp={}, init=True, out_file=None,
                       centers_gp={}, centers_dp={}, centers=False):

            out_file_n = None
            if out_file is None:
                out_file = "distances.csv"
            else:
                if out_file[-4:] != '.csv':
                    out_file += '.csv'

            if os.path.isfile(out_file) and init:
                count = 0
                out_file_n = out_file[:-4] + "_" + str(count) + '.csv'
                while os.path.isfile(out_file_n):
                    out_file_n = out_file[:-4] + "_" + str(count) + '.csv'
                    count += 1
                out_file = out_file_n

            if centers:
                out_centers = out_file[:-4] + '_centers.csv'

            if init:
                of = open(out_file, "w+")
                of.write(delim.join(colns +
                    [reform_e(comp)+'_gp' for comp in list(distances_gp.keys())] +
                    [reform_e(comp)+'_dp' for comp in list(distances_dp.keys())]
                         ) + "\n")
                if centers:
                    ofc = open(out_centers, "w+")
                    ofc.write(delim.join(colns +
                        [reform_e(comp)+'_cntr_gp' for comp in list(centers_gp.keys())] +
                        [reform_e(comp)+'_cntr_dp' for comp in list(centers_dp.keys())]
                            ) + '\n')

            else:
                of = open(out_file, "a")
                if centers:
                    ofc = open(out_centers, "a")

            of.write(delim.join([str(x) for x in val_list] +
                [str(v) for v in distances_gp.values()] +
                [str(v) for v in distances_dp.values()]) + "\n")
            if centers:
                ofc.write(delim.join([str(x) for x in val_list] +
                    [str(v) for v in centers_gp.values()] +
                    [str(v) for v in centers_dp.values()]) + "\n")

            return out_file_n

        iter_count = 0
        init = True

        for dv in density_var:  # density_var
            for bv in bin_var:  # bin_var
                for maxp in max_phi:  # max_phi
                    for minp in min_phi:  # max_phi
                        for iwire in i_wire_coef:
                            for iden in i_dens_coef:
                                for ov in overflow:
                                    iter_count += 1
                                    self.set_replace_arg("overflow", ov)
                                    self.set_replace_arg("init_wire_coef", iwire)
                                    self.set_replace_arg("init_density_coef", iden)
                                    self.set_replace_arg("max_phi", maxp)
                                    self.set_replace_arg("min_phi", minp)
                                    self.set_replace_arg("bin", bv)
                                    self.set_replace_arg("density", dv)

                                    mfda_error = False

                                    print(self.to_string_probes())
                                    self.build()
                                    placement = {}
                                    placement["global_place"] = {}
                                    placement["detail_place"] = {}
                                    try:
                                        self.run_flow(
                                            mk_targets=["pnr -e OR_MK_ARGS=place"]
                                        )
                                        # results_root, self.design, verilog_file, lef_file)
                                        if centers:
                                            (placement, p_centers) = get_placement_data.get_placement_distances(
                                                results_root, self.design_name, self.verilog_file, lef_file, conversion_factor=7.6e-3
                                            )
                                        else:
                                            (placement, p_centers) = get_placement_data.get_placement_distances(
                                                results_root, self.design_name, self.verilog_file, lef_file, conversion_factor=7.6e-3
                                            )
                                    except subprocess.CalledProcessError:
                                        # TODO report blank or missing entries
                                        mfda_error = True

                                    w_colns = [
                                        "overflow",
                                        "init_wire_coef",
                                        "init_density_coef",
                                        "max_phi",
                                        "min_phi",
                                        "bin",
                                        "density",
                                        "error",
                                    ]
                                    w_vals = [
                                        ov,
                                        iwire,
                                        iden,
                                        maxp,
                                        minp,
                                        bv,
                                        dv,
                                        str(mfda_error),
                                    ]
                                    if init:
                                        #if centers:
                                        write_vals(
                                            w_colns,
                                            w_vals,
                                            placement["global_place"],
                                            placement["detail_place"],
                                            init,
                                            centers=centers,
                                            centers_gp=p_centers["global_place"],
                                            centers_dp=p_centers["detail_place"]
                                        )
                                        # else:
                                        #    write_vals(w_colns, w_vals, placement["global_place"], placement["detail_place"], init)
                                    else:
                                        write_vals(
                                            w_colns,
                                            w_vals,
                                            placement["global_place"],
                                            placement["detail_place"],
                                            init,
                                            centers=centers,
                                            centers_gp=p_centers["global_place"],
                                            centers_dp=p_centers["detail_place"]
                                        )
                                        #write_vals(w_colns, w_vals, placement["global_place"], placement["detail_place"], init)
                                    init = False



    def run_flow_remote(
        self,
        remote_pyenv_home,
        remote_dir,
        mk_targets="all",
        win_root_drive="C:",
        wsl_root=None,
    ):
        self.run_remote(
            design=self.design_name,
            platform=self.platform,
            remote_env_home=remote_pyenv_home,
            remote_dir=remote_dir,
            win_drive=win_root_drive,
            wsl_root=wsl_root,
            make_only=True,
            make_targets=mk_targets,
        )

    # def run_flow_render(self):
    #    of.run_flow_ow_slice(self.design_name, platform=self.platform)

    def sync_remote(self, remote_dir, wsl_root_dir="/mnt/c", win_root_drive="C:"):
        # sync files with server
        local_paths = [
            "designs",
            "openroad_flow",
            "scad_flow",
            "xyce_flow",
            "Makefile",
            "requirements.txt",
            "openmfda_flow.py",
            "main.py",
            "src/openmfda_flow",
        ]

        # dir_path = os.path.dirname(
        #     os.path.normpath(os.path.realpath(__file__) + "/../../").replace("\\", "/")
        # )
        dir_path = self.get_openmfda_flow_path()

        cmd_paths = " ".join([f"{dir_path}/{x}" for x in local_paths])

        rs_cmd = f"rsync -avh -e ssh {cmd_paths} mfda_remote:~/MFDA_flow --delete"

        if osplt.system() == "Windows":
            wsl_cmd = "wsl ~ -e bash -c"
            win_cmd = f'{wsl_cmd} "{rs_cmd.replace(win_root_drive, wsl_root_dir)}"'
            print(win_cmd)
            os.system(win_cmd)
        elif osplt.system() == "Linux":
            print(rs_cmd)
            subprocess.run(rs_cmd.split())
        else:  # assumes a linux system
            print(platform.system())
            print(rs_cmd)
            subprocess.run(rs_cmd.split())

    def sync_w_remote_outputs(
        self,
        remote_dir,
        local_path="",
        relative_path=True,
        or_logs=True,
        or_reports=True,
        wsl_root_dir="/mnt/c",
        win_root_drive="C:",
    ):

        dir_path = os.path.dirname(
            os.path.normpath(os.path.realpath(__file__) + "/../../").replace("\\", "/")
        )

        if osplt.system() == "Windows":
            dir_path = dir_path.replace(win_root_drive, wsl_root_dir)

        result_out = ["openroad_flow/results/", "scad_flow/results/"]

        if or_logs:
            result_out.append("openroad_flow/logs/")

        if or_reports:
            result_out.append("openroad_flow/reports/")

        if relative_path:
            local_path = f"{dir_path}/{local_path}"

        wsl_cmd = lambda rs: f'wsl ~ -e bash -c "{rs}"'

        for x in result_out:
            rs_cmd = f"rsync -av -e ssh mfda_remote:{remote_dir}/{x} {local_path}/{x}".split()

            if osplt.system() == "Windows":
                print("WSL cmd: " + wsl_cmd(" ".join(rs_cmd)))
                os.system(wsl_cmd(" ".join(rs_cmd)))
            elif osplt.system() == "Linux":
                subprocess.run(rs_cmd)
            else:
                subprocess.run(rs_cmd)

    def run_remote(
        self,
        design,
        platform,
        remote_env_home,
        remote_dir,
        win_drive="C:",
        wsl_root=None,
        make_only=False,
        make_targets=["all"],
    ):
        # Assuming convention
        if wsl_root == None:
            print(
                "Assuming root for WSL system, you can be explicit by setting wsl_root argument"
            )
            wsl_root = f"/mnt/{win_drive[0]}"

        self.sync_remote(
            remote_dir=remote_dir, win_root_drive=win_drive, wsl_root_dir=wsl_root
        )

        # send run command remotely
        main_args = f"--design {design} --platform {platform}"

        if make_only:
            main_args += f" --make_only True"

        targets = " ".join(make_targets)
        main_args += f" --make_targets {targets}"

        if osplt.system() == "Windows":
            remote_env_home.replace("\~", "~")

        mainpy = f"{remote_dir}/main.py"
        srccmd = f"source {remote_env_home}/bin/activate"

        if make_only:
            pycmd = f"python3 {mainpy} {main_args}"
        else:
            mainpy = f"designs/{platform}/{design}/{design}_configure.py"
            main_args = ""
            pycmd = f"cd {remote_dir} && python3 {mainpy} {main_args}"

        sshcmd = [f'ssh mfda_remote "{srccmd} ; {pycmd}"']

        if osplt.system() == "Windows":
            sshcmd[0] = sshcmd[0].replace('"', "'")
            print("ssh cmd: " + sshcmd[0])
            wsl_cmd = f'wsl ~ -e bash -c "{sshcmd[0]}"'
            print("WSL cmd: " + wsl_cmd)
            os.system(wsl_cmd)
        elif osplt.system() == "Linux":
            subprocess.run(sshcmd[0], shell=True, check=True)
        else:  # Macs are assumed to have ssh
            subprocess.run(sshcmd, shell=True, check=True)

        self.sync_w_remote_outputs(
            remote_dir, win_root_drive=win_drive, wsl_root_dir=wsl_root
        )

    def run_flow_render(self):
        pass


if __name__ == "__main__":

    design = "demo"
    plat = "mfda_30px"
    py_remote = "~/mfda_env"
    remote_dir = "MFDA_flow"

    # test = OpenMFDA().run_remote(design, plat, py_remote, remote_dir)
    print("In module products __package__, __name__ ==", __package__, __name__)
    import sys

    print("In module products sys.path[0], __package__ ==", sys.path[0], __package__)
