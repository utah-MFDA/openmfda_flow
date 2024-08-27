import os

import regex, re
import mmap
import pandas as pd
import numpy as np


def find_pcell_lef(in_dir):

    if isinstance(in_dir, str):
        pass

    if isinstance(in_dir, list):
        pass


def parse_p_cell_lef(in_lef):
    dl = "#"

    # param_reg  = dl+r".*?"+dl
    param_reg = r"\s*[\w.]+\s*"
    # header_reg = r"^[ ]*MACRO\s*(?P<module_name>[\w#.]*)\s*?$".replace('#', dl)
    header_reg = (
        r"^[ ]*MACRO\s*(?P<module_name>[\w.]*)\s*\((?P<params>[\w,\. ]*)\)\s*?$"
    )
    module_reg = r"^[ ]*module\s*(?P<module_name>[a-zA-Z][\w]*)\s\((?P<module_ports>[\s\w,]*)\)\s*;(?P<module_netlist>[\s\w.,\(\);]*?)endmodule"

    # expression reg
    try:
        with open(in_lef, "r+") as f:
            data = mmap.mmap(f.fileno(), 0)
            mo = regex.finditer(bytes(header_reg, "utf-8"), data, re.MULTILINE)
    except FileNotFoundError:
        print("Current WD:", os.getcwd())
        raise FileNotFoundError()

    lef_mods = {}

    for m in mo:
        m_params = regex.findall(bytes(param_reg, "utf-8"), m.group("params"))
        # m_params = regex.findall(bytes(param_reg,'utf-8'), m)

        # param_reg_str = m.decode('utf-8')
        param_reg_str = m.group("module_name").decode("utf-8")

        param_list = []
        for mp in m_params:
            mp = mp.decode("utf-8").strip()  # .replace(dl,'')
            mod_type = ""
            if "." in mp:
                x = 0
                for c in mp:  # count number of '.'
                    if c == ".":
                        x += 1
                if x == 1:
                    mod_param, mod_type = mp.split(".")
                if mod_type == "d":
                    mod_type = r"(?P<"
                    mod_type += mp.split(".")[0]
                    mod_type += r">\d+)"
                elif mod_type == "w":
                    mod_type = r"\w+"
                else:
                    raise ValueError(
                        f"Param {mp} in {m.decode('utf-8')} must be type .d (num) or .w (word)"
                    )
            else:
                mod_type = r"(?P<" + mp + r">\d*)"
                # mod_type = mp+r'\d*'

            param_list.append(mp.split(".")[0])
            # param_reg_str = param_reg_str.replace(f'{dl}{mp}{dl}', mod_type)
            param_reg_str += f"_{mod_type}"

        # lef_mods[m.decode('utf-8')]={
        lef_mods[m.group("module_name").decode("utf-8")] = {
            "lef_loc": in_lef,
            "reg_str": param_reg_str,
            "params": param_list,
        }

    return lef_mods


def lef_mod_2_row(lef_mod_dict, out_file=None):

    lef_df = None
    out_colunms = ["pcell", "lef_loc", "pcell_reg"]
    out_list = []

    for lef in lef_mod_dict:
        # lef_list = np.ndarray((1,2+len(lef_mod_dict[lef]['params'])), dtype=str)
        lef_list = []
        lef_list.append(lef)
        lef_list.append(lef_mod_dict[lef]["lef_loc"])
        lef_list.append(lef_mod_dict[lef]["reg_str"])
        for ind, item in enumerate(lef_mod_dict[lef]["params"]):
            lef_list.append(item)
            if ind > len(out_colunms) - 4:
                out_colunms.append("param" + str(ind + 1))
        out_list.append(lef_list)
        # print(out_list)
        # if not isinstance(lef_df, pd.DataFrame):
        #    lef_df = pd.DataFrame(out_list, columns=out_colunms)
        #    print(lef_df)
        # else:
        #    lef_df = pd.concat([
        #        lef_df,

    lef_df = pd.DataFrame(out_list, columns=out_colunms)

    if out_file is not None:
        # lef_df = pd.DataFrame(out_list, columns=out_colunms)
        os.makedirs(os.path.dirname(out_file), exist_ok=True)
        lef_df.to_csv(out_file)

    return lef_df


def get_pcells_in_lib(lib_csv):
    pass


def parse_verilog_modules(
    in_v, lef_regs, out_lef_merge=None, conversion_file=None, debug=True
):
    module_reg = r"^[ ]*module\s+(?P<module_name>[a-zA-Z][\w]*)\s*\((?P<module_ports>[\s\w,]*)\)\s*;(?P<module_netlist>[\s\w_.,\(\);]*?)endmodule"
    input_reg = r"^[ ]*input\s*(?P<input_port>[\w*, \n]*);"
    output_reg = r"^[ ]*output\s*(?P<output_port>[\w*, \n]*);"
    wire_reg = r"^[ ]*wire\s*(?P<wires>[\w*, \n]*);"
    comp_reg = r"^[ ]*(?P<component>[a-zA-Z][\w]*)\s*(?P<name>[a-zA-Z][\w]*)\s*\((?P<ports>[\w\(\),\s.]*)\)\s*;"
    net_reg = r"^[ ]*(module\s*(?P<module_name>[a-zA-Z][\w]*)\s*\((?P<module_ports>[\s\w,]*\);)|wire\s*(?P<wires>[a-zA-Z][\w\s,]*);|input\s*(?P<in_ports>[a-zA-Z][\w\s,]*);|output\s*(?P<out_ports>[a-zA-Z][\w\s,]*);|(?P<component>[a-zA-Z][\w]*)\s*(?P<name>[a-zA-Z][\w]*)\s*\((?P<ports>[\w\(\),\s.]*)\)\s*;)"
    component_port_reg = (
        r".(?P<component_port>[a-zA-Z][\w]*)\s*\(\s*(?P<net_port>[a-zA-Z][\w]*)\s*\)\s*"
    )

    c1_reg = r"^[ ]*(?P<component>"
    c2_reg = r")\s*(?P<name>[a-zA-Z][\w]*)\s*\((?P<ports>[\w\(\),\s.]*)\)\s*;"

    # lef_mod_reg1 = r"^[ ]*MACRO\s*(?P<module_name>"
    lef_mod_reg1 = r"^[ ]*(MACRO\s+"
    lef_mod_reg2 = r"[\s\d\D]*?END\s+"

    p_sub_1 = r"(#.*?)("
    p_sub_2 = r")([.]?[wd]?)(.*?#)"

    p_repl = r"\1p['\2']\4"

    dl = "#"
    param_reg = dl + r".*?" + dl

    if isinstance(lef_regs, str):
        lef_regs_df = pd.read_csv(lef_regs)
    if isinstance(lef_regs, pd.DataFrame):
        lef_regs_df = lef_regs

    if out_lef_merge == None:
        out_lef_merge = "out_lef_merge.lef"
    else:
        os.makedirs(os.path.dirname(out_lef_merge), exist_ok=True)
    out_f = open(out_lef_merge, "w+")

    p_cell_out_list = []

    print(f"looking in {in_v}")

    for r in lef_regs_df.iterrows():
        # Reg for Verilog
        this_comp_reg = c1_reg + r[1]['pcell_reg'] + c2_reg

        with open(in_v, "r+") as f:
            print(f"Looking for {r[1]['pcell_reg']}")
            print("REG:", this_comp_reg)
            data = mmap.mmap(f.fileno(), 0)
            mo = regex.findall(bytes(this_comp_reg, "utf-8"), data, re.MULTILINE)

        mods = []
        # for each found module
        for m in mo:
            # check if module has been created
            print(f"Found {m[0]}")
            if m[0].decode("utf-8") in mods:
                continue
            else:
                mods.append(m[0].decode("utf-8"))
            # create a parameter dict for module
            p = {}
            for ind, pr in enumerate(r[1][4:]):
                p[pr] = float(m[1 + ind].decode("utf-8"))

            # get lef module
            # lef_mod_reg1 + r[1]["pcell"] + lef_mod_reg2 + r[1]["pcell"] + r")[ ]*$"
            get_mod_lef_reg = (
                lef_mod_reg1 + r[1]["pcell"] + lef_mod_reg2 + r[1]["pcell"] + r")"
            )
            with open(r[1]["lef_loc"], "r+") as f:
                data = mmap.mmap(f.fileno(), 0)
                lef_mo = re.search(
                    bytes(get_mod_lef_reg, "utf-8"), data, re.MULTILINE
                )
                if lef_mo is None:
                    print(get_mod_lef_reg)
                    print(r[1]["lef_loc"])
                    print(data.read().decode("utf-8"))
                lef_mo = lef_mo.group(0)
            ### write compatible LEF
            print(lef_mo)
            replace_lef_mod = r[1]["pcell"]
            for param in r[1][4:]:
                if p[param] % 1 == 0:
                    p[param] = int(p[param])
                replace_lef_mod += f"_{p[param]}"
                if debug:
                    print(p_sub_1 + param + p_sub_2)
                    print(p_repl)
                    print(replace_lef_mod)
                lef_mo = re.sub(
                    bytes(p_sub_1 + param + p_sub_2, "utf-8"),
                    bytes(p_repl, "utf-8"),
                    lef_mo,
                )
            # replace header
            mod_head_repl_reg = (
                r"(MACRO|END)*\s*(" + r[1]["pcell"] + r")\s*?(\([\w,. ]*\))*"
            )
            mod_head_sub_reg = r"\1 " + replace_lef_mod
            lef_mo = re.sub(
                bytes(mod_head_repl_reg, "utf-8"),
                bytes(mod_head_sub_reg, "utf-8"),
                lef_mo,
            )

            # print(lef_mo.decode('utf-8'))
            lef_param_eval = regex.findall(bytes(param_reg, "utf-8"), lef_mo)

            lef_mo = lef_mo.decode("utf-8")
            # eval final lef mod
            for p_ev in lef_param_eval:
                p_ev = p_ev.decode("utf-8")
                if debug:
                    print(p_ev)
                    print(p)
                # print(p_ev)
                ex_out = eval(p_ev.replace("#", ""))
                if not ex_out % 1:
                    ex_out = int(ex_out)
                lef_mo = lef_mo.replace(p_ev, str(ex_out))

            out_f.write(lef_mo)
            out_f.write("\n\n")

            # used for downstream pcells
            p_cell_out_list.append(
                # {'pcell':m[0].decode('utf-8'), 'lef':r[1]['pcell'], 'params':p}
                {"pcell": r[1]["pcell"], "lef": m[0].decode("utf-8"), "params": p}
            )

    # conversion file is used to link lef definitions to other pcells
    if isinstance(conversion_file, str):
        if os.path.isdir(conversion_file):
            o_dir = conversion_file
        else:
            o_dir = os.path.dirname(conversion_file)
        write_downstream_pcell_csv(
            p_cell_out_list, convert_pcell_list=["xyce", "scad"], out_dir=o_dir
        )

    # get modules
    # mod_re_b = bytes(comp_reg, 'utf-8')

    # with open(in_v, 'r+') as f:
    #    data = mmap.mmap(f.fileno(), 0)
    #    mo = regex.findall(mod_re_b, data, re.MULTILINE)


def write_downstream_pcell_csv(p_cell_list, convert_pcell_list, out_dir):

    file_name_base = "pcell_out_"
    if len(out_dir.strip()) > 0 and out_dir[-1] != "/":
        out_dir += "/"

    print(f"Writing coversion files {str(convert_pcell_list).replace('[','').replace(']','')} to {out_dir}")
    # conversion files are assumed module : {file1:name, file2:name, ...}
    conversion_list = {}
    for pc in p_cell_list:
        # convert_pcell_list = c_dict[pc['lef']]

        for file_type in convert_pcell_list:
            if file_type.lower() == "lef":
                continue
            else:
                if file_type not in conversion_list:
                    conversion_list[file_type] = []
                conversion_list[file_type].append(
                    f'{pc["lef"]},{pc["pcell"]},{" ".join([x+"="+str(pc["params"][x]) for x in pc["params"]])}'
                )

    for cl in conversion_list:
        with open(out_dir + file_name_base + cl, "w+") as of:
            print(f"Writing: {out_dir+file_name_base+cl}")
            of.write("lef,cell_name,parameters\n")
            of.write("\n".join(conversion_list[cl]))
            of.close()


def merge_lefs(original_lef, pcell_lef, out_lef):

    with open(out_lef, "w+") as of:
        with open(original_lef, "r+") as ilef:
            # Need this below the inserted pcells
            for line in ilef:
                of.write(re.sub(r"^[ ]*END\s+LIBRARY\s*", "", line))
        of.write("\n\n")
        of.write("########################## PCELLS #############################\n")
        of.write("\n\n")
        with open(pcell_lef, "r+") as ilef:
            for line in ilef:
                of.write(line)

        of.write("\nEND LIBRARY")


def parse_verilog_componets(mod):
    pass


def read_parameters(comp):
    pass


def generate_netlist_lefs(comp, params):
    pass


def load_pcell_lef(in_lef_list):
    pass


def main(
    original_lef, pcell_lef, out_lef, in_verilog, conversion_file_loc, out_lef_csv
):

    out_dict = parse_p_cell_lef(pcell_lef)

    if isinstance(out_lef_csv, str):
        pass
    else:
        out_lef_csv = os.path.dirname(out_lef) + "/out_lef_list.csv"

    if isinstance(conversion_file_loc, str):
        pass
    else:
        conversion_file_loc = os.path.dirname(out_lef)

    lef_mod_2_row(out_dict, out_file=out_lef_csv)

    out_lef_pcell_only = out_lef + ".pcells"

    parse_verilog_modules(
        in_verilog,
        out_lef_csv,
        out_lef_merge=out_lef_pcell_only,
        conversion_file=conversion_file_loc,
    )

    merge_lefs(original_lef, out_lef_pcell_only, out_lef)


if __name__ == "__main__":

    import argparse

    parser = argparse.ArgumentParser()

    # input verilog file
    parser.add_argument("--netlist", type=str, required=True)
    # lef file without pcells
    parser.add_argument("--orig_lef", type=str, required=True)
    # output lef file
    parser.add_argument("--out_lef", type=str, required=True)
    #
    parser.add_argument("--pcell_lef", type=str, required=True)
    # csv to keep track of lefs
    parser.add_argument("--out_lef_csv", type=str, default=None)
    parser.add_argument("--conversion_file_dir", type=str, default=None)

    args = parser.parse_args()

    main(
        original_lef=args.orig_lef,
        pcell_lef=args.pcell_lef,
        out_lef=args.out_lef,
        in_verilog=args.netlist,
        conversion_file_loc=args.conversion_file_dir,
        out_lef_csv=args.out_lef_csv,
    )
