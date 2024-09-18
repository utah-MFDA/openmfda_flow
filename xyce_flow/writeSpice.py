import networkx as nx
import numpy as np
import pandas as pd


import SimulationXyce

import os
import json
import regex
import mmap
import copy


def add_probes_to_device(probes, netlist_graph):

    probe_list = []
    node = "node"
    dev = "device"

    if "pressure" in probes:
        # TODO add dev to pressure probe call
        for p in probes["pressure"]:
            print(p)
            if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                dev_node = list(netlist_graph[p.getNode()].keys())[0]
                probe_list.append(f"V({p.getNode()}_{dev_node})")
            else:
                dev_node = list(netlist_graph[p[node]].keys())[0]
                probe_list.append(f"V({p[node]}_{dev_node})")

    if "flow" in probes:
        for p in probes["flow"]:
            netlist_graph.remove_edge(p[node], p[dev])
            flow_probe = f"vpr_{p[node]}_{p[dev]}"
            new_probe_nodes = [
                (
                    f"{p[node]}_{p[dev]}_pr",
                    {"node_type": "connection", "chem_wire": p[node]},
                ),
                (
                    f"{flow_probe}",
                    {"node_type": "flow_probe", "device": p[dev], "param": {"": "0"}},
                ),
            ]
            new_es = []
            new_es.append((new_probe_nodes[0][0], p[dev]))
            new_es.append((new_probe_nodes[0][0], new_probe_nodes[1][0]))
            # new_es.append((new_probe_nodes[1][0], new_probe_nodes[2][0]))
            new_es.append((new_probe_nodes[1][0], p[node]))

            netlist_graph.add_nodes_from(new_probe_nodes)
            netlist_graph.add_edges_from(new_es)

            probe_list.append(f"I({flow_probe})")

    if "pressureNode" in probes:
        for p in probes["pressureNode"]:
            if p in probes["flow"]:
                # we don't need to edit the netlist after flow probes have been placed
                if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                    probe_list.append(f"V({p[node]}_{p[dev]}_pr)")
                else:
                    probe_list.append(f"V({p[node]}_{p[dev]}_pr)")
            else:
                netlist_graph.remove_edge(p[node], p[dev])
                new_probe_nodes = [
                    (
                        f"{p[node]}_{p[dev]}_pr",
                        {"node_type": "connection", "chem_wire": p[node]},
                    ),
                    (
                        f"vpr_{p[node]}_{p[dev]}",
                        {
                            "node_type": "pressure_probe",
                            "device": p[dev],
                            "param": {"": "0"},
                        },
                    ),
                ]
                new_es = []
                new_es.append((new_probe_nodes[0][0], p[dev]))
                new_es.append((new_probe_nodes[0][0], new_probe_nodes[1][0]))
                # new_es.append((new_probe_nodes[1][0], new_probe_nodes[2][0]))
                new_es.append((new_probe_nodes[1][0], p[node]))

                netlist_graph.add_nodes_from(new_probe_nodes)
                netlist_graph.add_edges_from(new_es)
                # same as if in list
                if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                    probe_list.append(f"V({p[node]}_{p[dev]}_pr)")
                else:
                    probe_list.append(f"V({p[node]}_{p[dev]}_pr)")

    # concentration probes are assumed (<connect_name>_chem)
    if "concentration" in probes:
        for p in probes["concentration"]:

            print(list(netlist_graph.nodes))
            print(list(netlist_graph.edges))
            if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                print(" Node: ", p.getNode())
                dev_node = list(netlist_graph[p.getNode()].keys())[0]
                if f"V({p.getNode()}_{dev_node}_chem)" not in probe_list:
                    dev_node = list(netlist_graph[p.getNode()].keys())[0]
                    probe_list.append(f"V({p.getNode()}_{dev_node}_chem)")
            else:
                print(p)
                dev_node = list(netlist_graph[p[node]].keys())[0]
                if f"V({p[node]}_{dev_node}_chem)" not in probe_list:
                    dev_node = list(netlist_graph[p[node]].keys())[0]
                    probe_list.append(f"V({p[node]}_{dev_node}_chem)")

    if "concentrationNode" in probes:
        for p in probes["concentrationNode"]:
            # explicit chem node dev
            if isinstance(p, SimulationXyce.SimulationXyce.Probe):

                netlist_graph.nodes[p.getDevice()]["chem_connection"] = {
                    "node": f"vchpr_{p.getNode()}_{p.getDevice()}_chem",
                    "oth_node": p.getNode(),
                }
                # netlist_graph.nodes[p.getNode()]["chem_connection"]={"node":f"vchpr_{p.getNode()}_conn_chem","oth_node":p.getDevice()}
                if (
                    netlist_graph.nodes[p.getNode()]["node_type"] in "input"
                    and len(netlist_graph[p.getNode()]) > 1
                ):
                    chan_node = f"{p.getNode()}_channel_out_chem "
                elif (
                    netlist_graph.nodes[p.getNode()]["node_type"] == "output"
                    and len(netlist_graph[p.getNode()]) > 1
                ):
                    chan_node = f"{p.getNode()}_channel_in_chem "
                elif (
                    netlist_graph.nodes[p.getNode()]["node_type"] == "wire"
                    and len(netlist_graph[p.getNode()]) > 2
                ):
                    # which port
                    if (
                        netlist_graph.edges[p.getDevice(), p.getNode()]["port"]
                        == "out_fluid"
                    ):
                        chan_node = f"{p.getNode()}_channel_in "
                    else:
                        chan_node = f"{p.getNode()}_channel_out "
                elif "chem_connection" in netlist_graph.nodes[p.getNode()]:
                    chan_node = f"vchpr_{p.getNode()}_conn_chem"
                    netlist_graph.nodes[p.getNode()]["chem_connection"] = {
                        "node": chan_node,
                        "oth_node": p.getDevice(),
                    }
                else:
                    chan_node = f"vchpr_{p.getNode()}_conn_chem"

                new_probe_node = [
                    (
                        f"vchpr_{p.getNode()}_{p.getDevice()}_pr",
                        {
                            "node_type": "concentration_probe",
                            "chem_pr_wires": [
                                f"vchpr_{p.getNode()}_{p.getDevice()}_chem",
                                chan_node,
                            ],
                        },
                    ),
                ]
            else:
                netlist_graph.nodes[p[dev]]["chem_connection"] = {
                    "node": f"vchpr_{p[node]}_{p[dev]}_chem",
                    "oth_node": p[node],
                }
                # netlist_graph.nodes[p[node]]["chem_connection"]={"node":f"vchpr_{p[node]}_conn_chem","oth_node":p[dev]}
                print(netlist_graph.nodes[p[node]])
                if (
                    netlist_graph.nodes[p[node]]["node_type"] in "input"
                    and len(netlist_graph[p[node]]) > 1
                ):
                    chan_node = f"{p[node]}_channel_out_chem "
                elif (
                    netlist_graph.nodes[p[node]]["node_type"] == "output"
                    and len(netlist_graph[p[node]]) > 1
                ):
                    chan_node = f"{p[node]}_channel_in_chem "
                elif (
                    netlist_graph.nodes[p[node]]["node_type"] == "wire"
                    and len(netlist_graph[p[node]]) > 2
                ):
                    # which port
                    if (
                        netlist_graph.edges[p.getDevice(), p[node]]["port"]
                        == "out_fluid"
                    ):
                        chan_node = f"{p[node]}_channel_in "
                    else:
                        chan_node = f"{p[node]}_channel_out "
                elif "chem_connection" in netlist_graph.nodes[p[node]]:
                    chan_node = f"vchpr_{p[node]}_conn_chem"
                    netlist_graph.nodes[p[node]]["chem_connection"] = {
                        "node": chan_node,
                        "oth_node": p.getDevice(),
                    }
                else:
                    chan_node = f"vchpr_{p[node]}_conn_chem"
                # explicit chem node wire
                new_probe_node = [
                    (
                        f"vchpr_{p[node]}_{p[dev]}_pr",
                        {
                            "node_type": "concentration_probe",
                            "chem_pr_wires": [
                                f"vchpr_{p[node]}_{p[dev]}_chem",
                                chan_node,
                            ],
                        },
                    ),
                ]
            # new_es = []
            # new_es.append((new_probe_nodes[0][0], p[dev]))
            # new_es.append((new_probe_nodes[0][0], new_probe_nodes[1][0]))
            # new_es.append((new_probe_nodes[1][0], p[node]))

            netlist_graph.add_nodes_from(new_probe_node)
            # netlist_graph.add_edges_from(new_es)
            # same as if in list
            if isinstance(p, SimulationXyce.SimulationXyce.Probe):
                probe_list.append(f"V(vchpr_{p.getNode()}_{p.getDevice()}_chem)")
            else:
                probe_list.append(f"V(vchpr_{p[node]}_{p[dev]}_chem)")

    return probe_list, netlist_graph


def generate_source_list(spice_config_class, has_chem=False):

    dev_lines = {}

    for key, dev in spice_config_class.getDeviceList().items():
        dev_lines[dev.getNode()] = [
            dev.getType(),
            f"{dev.getNode()}_dev",
            f"{dev.getNode()}_in",
        ]
        # adds chem port
        if has_chem:
            dev_lines[dev.getNode()].append(f"{dev.getNode()}_in_chem")
        # adds arguments
        if isinstance(dev.getArgs(), dict):
            for key, val in dev.getArgs().items():
                dev_lines[dev.getNode()].append(f"{key}={val}")
        elif isinstance(dev.getArgs(), list):
            for a in dev.getArgs():
                dev_lines[dev.getNode()].append(a)
        elif isinstance(dev.getArgs(), str):
            dev_lines[dev.getNode()].append(dev.getArgs())

    chem_args = {}
    # print(spice_config_class.getInputChemList())
    if has_chem:
        for key, chem in spice_config_class.getInputChemList().items():
            if isinstance(chem, SimulationXyce.SimulationXyce.ChemInput):
                chem_args[key] = {chem.getNode(): chem.getInValue()}
            if isinstance(chem, list):
                chem_args[key] = {}
                for c in chem:
                    chem_args[key][c.getNode()] = chem.getInValue()

    return dev_lines, chem_args


def generate_time_lines(spice_config_class):
    # returns a list

    out_lines = []
    if "transient" in spice_config_class.getSimulationTimes():
        for t in spice_config_class.getSimulationTimes()["transient"]:
            out_lines.append([".tran"] + t[1:])
    if "static" in spice_config_class.getSimulationTimes():
        for t in spice_config_class.getSimulationTimes()["static"]:
            out_lines.append([".dc"] + t[1:])

    return out_lines


def write_time_lines(spice_config_class):
    pass


def write_spice_file(
    in_netlist,
    probes_list,
    source_lines,
    sims_time_lines=None,
    sim_type=None,
    length_list=None,
    chem_list=None,
    out_file=None,
    add_prn_to_list=False,
    basename_only=False,
    pcell_file=None,
):

    dev = "dev"

    conn_channel = "Ychannel"

    if out_file == None:
        out_file = "out_spice"
    if out_file.split(".")[-1] == "cir":
        out_file = ".".join(out_file.split(".")[:-1])

    if chem_list == None or len(chem_list) == 0:
        chem_list = {"": ""}
        no_chems = True
    else:
        no_chems = False

    if length_list == None:
        no_lengths = True
    else:
        no_lengths = False
        len_df = get_length_list(length_list)

    pc_dict = {}
    if isinstance(pcell_file, str):
        has_pcells = True
        with open(pcell_file, "r+") as pc_if:
            import csv

            pc_reader = csv.reader(pc_if)
            for i, row in enumerate(pc_reader):
                if i == 0:
                    continue
                else:
                    pc_dict[row[0]] = {"pcell": row[1], "params": row[2]}
    else:
        has_pcells = False

    output_file_list = []

    for chem, chem_node_dict in chem_list.items():

        chem_out_file = f"{out_file}_{chem}.cir.str"

        if basename_only:
            output_file_entry = {
                "Chemical": chem,
                "spice_str_file": chem_out_file,
                "spice_file": os.path.basename(chem_out_file)[:-4],
            }
            if add_prn_to_list:
                output_file_entry["OutputFile"] = (
                    os.path.basename(chem_out_file)[:-4] + ".prn"
                )
        else:
            output_file_entry = {
                "Chemical": chem,
                "spice_str_file": chem_out_file,
                "spice_file": chem_out_file[:-4],
            }
            if add_prn_to_list:
                output_file_entry["OutputFile"] = chem_out_file[:-4] + ".prn"

        output_file_list.append(output_file_entry)

        c_of = open(chem_out_file, "w+")

        c_of.write(f"* Simulation of device {dev}; chem: {chem}\n")

        chem_source_list = copy.deepcopy(source_lines)
        if isinstance(chem_node_dict, dict):
            for node, val in chem_node_dict.items():
                chem_source_list[node].append(f"chemConcentration={val}")

        # write inputs and connections
        for node, line in chem_source_list.items():
            line[0] = "Y" + line[0]
            new_line = line + ["\n"]
            # if not no_lengths:
            #    new_line += [
            #        conn_channel, f'{node}_chan', f'{node}_0', f'{node}_1'
            #    ]
            #    if not no_chems:
            #        new_line += [f'{node}_0_chem', f'{node}_1_chem']
            #    new_line += ['length='+str(length_list['wire'][node]), '\n']
            # new_line += ['\n']
            new_line = " ".join(new_line)

            c_of.write(new_line)

        wire_connections = {}
        probe_wires = [[], []]
        node_dict = {}

        for node in in_netlist.nodes:
            chem_nodes = ""
            if in_netlist.nodes[node]["node_type"] == "input":
                # and (not no_lengths):
                wl = len_df.loc[node]["length (mm)"]
                chem_nodes = f"{node}_in_chem "
                fluid_nodes = f"{node}_in "
                node_dict[node] = {'chem':chem_nodes, 'fluid':fluid_nodes}
                # TODO is this for loop necessary
                # for ind, conn_node in enumerate(in_netlist[node]):
                conn_node = list(in_netlist[node])[0]
                if len(in_netlist[node]) == 1:
                    if "chem_connection" in in_netlist.nodes[node]:
                        chem_nodes += f"{in_netlist.nodes[node]['chem_connection']} "
                    else:
                        chem_nodes += f"{node}_{conn_node}_chem "
                else:
                    chem_nodes += f"{node}_channel_out_chem "

                if (
                    in_netlist.nodes[conn_node]["node_type"] == "wire"
                    or len(in_netlist[node]) > 1
                ):
                    fluid_nodes += f"{node}_channel_out "
                else:
                    fluid_nodes += f"{node}_{conn_node} "

                input_line = (
                    f"{conn_channel} {node} {fluid_nodes} {chem_nodes}length={wl}m"
                )
                c_of.write(input_line + "\n")

            elif in_netlist.nodes[node]["node_type"] == "output":
                # TODO check if output as dev
                # print(len_df)
                wl = len_df.loc[node]["length (mm)"]
                chem_nodes = ""
                fluid_nodes = ""
                print(node, len(in_netlist[node]))
                for ind, conn_node in enumerate(in_netlist[node]):
                    if len(in_netlist[node]) == 1:
                        if (
                            "chem_connection" in in_netlist.nodes[node]
                            and conn_node
                            == in_netlist.nodes[node]["chem_connection"]["oth_node"]
                        ):
                            chem_nodes += (
                                f"{in_netlist.nodes[node]['chem_connection']['node']} "
                            )
                        else:
                            chem_nodes += f"{node}_{conn_node}_chem "
                    elif ind == 0:
                        chem_nodes += f"{node}_channel_in_chem "
                    else:
                        pass

                    if len(in_netlist[node]) > 1 and ind == 0:
                        fluid_nodes += f"{node}_channel_in "
                    elif ind == 0:
                        fluid_nodes += f"{node}_{conn_node} "
                chem_nodes += f"{node}_out_chem "
                output_line = (
                    f"{conn_channel} {node} {fluid_nodes} 0 {chem_nodes}length={wl}m"
                )
                c_of.write(output_line + "\n")

            elif in_netlist.nodes[node]["node_type"] == "wire":
                # and (not no_lengths):
                wl = len_df.loc[node]["length (mm)"]
                chem_nodes = ""
                fluid_nodes = ""
                if len(in_netlist[node]) == 2:
                    for ind, conn_node in enumerate(in_netlist[node]):
                        # is a chemical node
                        if (
                            "chem_connection" in in_netlist.nodes[node]
                            and conn_node
                            == in_netlist.nodes[node]["chem_connection"]["oth_node"]
                        ):
                            chem_nodes += (
                                f"{in_netlist.nodes[node]['chem_connection']['node']} "
                            )
                        # is a probe; TODO interaction of chem and conn nodes
                        # elif in_netlist.nodes[conn_node]["node_type"] == "flow_probe" or \
                        # in_netlist.nodes[conn_node]["node_type"] == "pressure_probe":
                        # chem_nodes += f"{node}_{in_netlist.nodes[conn_node]['device']}_chem "
                        else:
                            chem_nodes += f"{node}_{conn_node}_chem "
                        if (
                            in_netlist.nodes[conn_node]["node_type"] == "flow_probe"
                            or in_netlist.nodes[conn_node]["node_type"]
                            == "pressure_probe"
                        ):
                            fluid_nodes += (
                                f"{node}_{in_netlist.nodes[conn_node]['device']}_pr "
                            )
                        else:
                            fluid_nodes += f"{node}_{conn_node} "
                else:
                    fluid_nodes = f"{node}_channel_in {node}_channel_out "
                    chem_nodes = f"{node}_channel_in_chem {node}_channel_out_chem "

                wire_line = (
                    f"{conn_channel} {node} {fluid_nodes} {chem_nodes}length={wl}m"
                    # f"{conn_channel} {node} {fluid_nodes} {chem_nodes}length={wl}m CROSS_SECTION=3"
                )
                c_of.write(wire_line + "\n")
            elif in_netlist.nodes[node]["node_type"] == "connection":
                continue
            # elif in_netlist.nodes[node]['node_type'] == 'flow_probe':
            #    print()
            #    vp_conn_nodes = in_netlist[node]
            #    probe_line = f"{node}"

            else:  # is component
                comp_type = in_netlist.nodes[node]["node_type"]
                print(in_netlist[node])
                if (
                    comp_type != "flow_probe"
                    and comp_type != "pressure_probe"
                    and comp_type != "concentration_probe"
                ):
                    # changes to pcell definition
                    # later appends params
                    if has_pcells:
                        is_pcell = False
                        pcell_params = ""
                        if comp_type in pc_dict:
                            pcell_params = " " + pc_dict[comp_type]["params"]
                            comp_type = pc_dict[comp_type]["pcell"]
                            is_pcell = True
                    comp_line = f"Y{comp_type} {node} "
                    chem_line = ""
                else:
                    comp_line = f"{node} "
                    chem_line = ""
                # iterate through adjacent nodes
                for n in in_netlist[node]:
                    no_wire = n not in wire_connections
                    zero_wire = (n in wire_connections) and (wire_connections[n] == 0)

                    wire_edges = len(in_netlist[n])

                    if in_netlist.nodes[n]["node_type"] == "input":
                        if wire_edges == 1:
                            comp_line += f"{n}_{node} "
                        else:
                            comp_line += f"{n}_channel_in "
                        # chem_line += f"{n}_{node}_chem "
                    elif in_netlist.nodes[n]["node_type"] == "output":
                        if wire_edges == 1:
                            comp_line += f"{n}_{node} "
                        else:
                            comp_line += f"{n}_channel_out "
                        # chem_line += f"{n}_{node}_chem "
                    elif in_netlist.nodes[n]["node_type"] == "wire":
                        # print(node)
                        # if 'device' in in_netlist.nodes[node] and \
                        #    in_netlist.nodes[node]["device"] in probe_wires[0]:
                        #    n_dev = in_netlist.nodes[node]["device"]
                        #    print(node,n_dev)
                        # comp_line += f"{n}_{probe_wires[1][probe_wires[0].index(n_dev)][1]}"
                        #    comp_line += f"{n}_{in_netlist.nodes[node]['device']}"
                        #    n_dev = None
                        # else:
                        if wire_edges == 2:
                            comp_line += f"{n}_{node} "
                        else:
                            # for components
                            if in_netlist.edges[node, n]["port"] == "out_fluid":
                                comp_line += f"{n}_channel_in "
                            else:
                                comp_line += f"{n}_channel_out "
                            # chem_line += f"{n}_{node}_chem "
                        # elif no_wire or zero_wire:
                        #    wire_connections[n] = 1
                        #    comp_line += f"{n}_{node} "
                        #    chem_line += f"{n}_{node}_chem "
                        # else:
                        #    wire_connections[n] += 1
                        #    comp_line += f"{n}_{node} "
                        #    chem_line += f"{n}_{node}_chem "
                    # adding probes
                    elif in_netlist.nodes[n]["node_type"] == "connection":
                        comp_line += f"{n} "
                        if in_netlist.nodes[n]["chem_wire"] not in wire_connections:
                            wire_connections[in_netlist.nodes[n]["chem_wire"]] = 1
                            chem_line += (
                                f"{in_netlist.nodes[n]['chem_wire']}_{node}_chem "
                            )
                            if (
                                comp_type != "flow_probe"
                                and comp_type != "pressure_probe"
                            ):
                                probe_wires[0].append(node)
                                probe_wires[1].append(
                                    [in_netlist.nodes[n]["chem_wire"], 0]
                                )
                                print(probe_wires)
                        else:
                            wire_connections[in_netlist.nodes[n]["chem_wire"]] += 1
                            chem_line += (
                                f"{in_netlist.nodes[n]['chem_wire']}_{node}_chem "
                            )
                            if (
                                comp_type != "flow_probe"
                                and comp_type != "pressure_probe"
                            ):
                                probe_wires[0].append(node)
                                probe_wires[1].append(
                                    [in_netlist.nodes[n]["chem_wire"], 1]
                                )
                                print(probe_wires)
                    elif in_netlist.nodes[n]["node_type"] == "flow_probe":
                        if zero_wire:
                            wire_connections[n] = 1
                            comp_line += f"{n}_{node} "
                            # chem_line += f"{n}_0_chem "
                        else:
                            wire_connections[n] += 1
                            comp_line += f"{n}_{node} "
                            # chem_line += f"{n}_1_chem "
                    elif in_netlist.nodes[n]["node_type"] == "pressure_probe":
                        if zero_wire:
                            wire_connections[n] = 1
                            comp_line += f"{n}_{node} "
                            # chem_line += f"{n}_0_chem "
                        else:
                            wire_connections[n] += 1
                            comp_line += f"{n}_{node} "
                            # chem_line += f"{n}_1_chem "
                    elif in_netlist.nodes[n]["node_type"] == "concentration_probe":
                        # should not have connecting nodes
                        pass

                    else:
                        raise Exception(f"{n} not of correct type")

                    # chemical nodes
                    # TODO test with other probes
                    if (
                        in_netlist.nodes[n]["node_type"] == "input"
                        or in_netlist.nodes[n]["node_type"] == "output"
                        or in_netlist.nodes[n]["node_type"] == "wire"
                    ):
                        # chem_line += f"{n}_{node}_chem "

                        if (
                            "chem_connection" in in_netlist.nodes[node]
                            and n
                            == in_netlist.nodes[node]["chem_connection"]["oth_node"]
                        ):
                            chem_line += (
                                f"{in_netlist.nodes[node]['chem_connection']['node']} "
                            )
                        else:
                            if (
                                wire_edges == 2
                                and in_netlist.nodes[n]["node_type"] == "wire"
                            ):
                                chem_line += f"{n}_{node}_chem "
                            elif wire_edges == 1 and in_netlist.nodes[n][
                                "node_type"
                            ] in ["input", "output"]:
                                chem_line += f"{n}_{node}_chem "
                            else:
                                if in_netlist.edges[node, n]["port"] == "out_fluid":
                                    chem_line += f"{n}_channel_in_chem "
                                else:
                                    chem_line += f"{n}_channel_out_chem "
                            # chem_line += f"{n}_{node}_chem "

                print(comp_type)

                if (
                    (comp_type != "flow_probe")
                    and (comp_type != "pressure_probe")
                    and (comp_type != "concentration_probe")
                ):
                    comp_line += " " + chem_line
                    if has_pcells and is_pcell:
                        comp_line += " " + pcell_params
                elif comp_type == "concentration_probe":
                    print(comp_type)
                    for w in in_netlist.nodes[node]["chem_pr_wires"]:
                        comp_line += f"{w} "
                        pass
                    comp_line += "0V "
                elif comp_type == "flow_probe" or comp_type == "pressure_probe":
                    comp_line += " 0V"
                c_of.write(comp_line + "\n")
                # raise Exception()

        # add transient lines
        c_of.write("\n\n")

        for t in sims_time_lines:
            print(t)
            c_of.write(" ".join(t) + "\n")

        # add probes
        if sim_type is not None:
            if isinstance(sim_type, str):
                sim_type = [sim_type]

            for st in sim_type:
                if st == "transient":
                    nl = ".print tran " + " ".join(probes_list)
                    c_of.write(nl + "\n")
                elif st == "static":
                    nl = ".print dc " + " ".join(probes_list)
                    c_of.write(nl + "\n")
                else:
                    raise ValueError("sim_type must be transient or static")
        c_of.write("\n.end")

    o_csv_col = ["Chemical", "spice_str_file", "spice_file"]
    if add_prn_to_list:
        o_csv_col.append("OutputFile")
    o_csv = pd.DataFrame(output_file_list, columns=o_csv_col)
    # for of in output_file_list:
    #    o_csv = o_csv.concat([o_csv, of, ignore_index=True)
    return o_csv


def get_length_list(len_file):

    if len_file.split(".")[-1] == "csv":
        len_df = pd.read_csv(len_file, index_col=0)
    elif len_file.split(".")[-1] == "xlsx":
        len_df = pd.read_excel(len_file, index_col=0)
        # if len_df.columns.toList()[0].strip() == "":
        #    len_df = pd.read_execl(len_file, index_col=1)
    if len_df.shape[0] == 1:
        len_df = len_df.T
    elif len_df.shape[1] == 2:
        len_df = pd.read_csv(len_file, index_col=1)

    print(len_df.shape[0])
    print(len_df)

    return len_df


def convert_nodes_2_numbers_xyce(SPfile, cir_out=False):
    if os.path.isfile(SPfile) and (SPfile[-4:] == ".cir" or SPfile[-8:] == ".cir.str"):
        SPfile = [SPfile]
    else:
        # if directory is given
        SPfile = [
            "/".join([SPfile, f])
            for f in os.listdir(SPfile)
            if os.path.isfile(os.path.join(SPfile, f)) and f[-4:] == ".cir"
        ]

    for f in SPfile:
        SPfile_o = open(f, "r")

        if cir_out:
            if len(f) > 8 and f[-8:] == ".cir.str":
                new_file = f[:-8] + ".cir"
            elif f[-4:] != ".cir":
                new_file = f + ".cir"
        else:
            new_file = f + ".num"
        SPfile_n = open(new_file, "w")

        nodeList = {}

        for line in SPfile_o:
            # remove leading WS
            line = line.rstrip()

            # remove comments
            line = line.split("*")[0]
            line_comment = "".join(line.split("*")[1:])

            if line == "" or line == "\n":
                SPfile_n.write(line + line_comment + "\n")
            else:
                line_vars = line.replace("  ", " ").split(" ")
                if len(line_vars) > 1:
                    arg1 = line_vars[0]
                    end_line_str = []
                    line_nodes = []
                    # xyce command start with .
                    if arg1[0] == ".":
                        for ind, param in enumerate(line_vars[1:]):
                            for n in nodeList.keys():
                                if n in param:
                                    n_num = str(nodeList[n])
                                    rplace_str = "(" + n + ")"
                                    newParam = param.replace(
                                        "(" + n + ")", "(" + n_num + ")"
                                    )
                                    line_vars[ind + 1] = newParam
                        new_sp_line = " ".join(line_vars) + "\n"
                    # xyce voltage probes start with v
                    elif arg1[0] == "v":
                        for ind, param in enumerate(line_vars[1:]):
                            if ind < 2:
                                if "=" in param:
                                    end_line_str += [param]
                                elif param == "0":
                                    line_nodes.append(0)
                                else:
                                    if param not in nodeList.keys():
                                        # we do not want 0
                                        nodeList[param] = len(nodeList) + 1
                                    line_node = nodeList[param]
                                    line_nodes.append(line_node)
                            if ind >= 2:
                                end_line_str += [param]
                        # append all
                        print(arg1)
                        new_sp_line = (
                            " ".join(
                                [arg1] + [str(x) for x in line_nodes] + end_line_str
                            )
                            + "\n"
                        )
                    else:
                        # replaces params for numbers
                        # <device> <name>
                        device = [arg1, line_vars[1]]
                        for param in line_vars[2:]:
                            # exception for parameters which will explicitly use =
                            if "=" in param:
                                end_line_str += [param]
                            elif param == "0":
                                line_nodes.append(0)
                            else:
                                if param not in nodeList.keys():
                                    # we do not want 0
                                    nodeList[param] = len(nodeList) + 1
                                line_node = nodeList[param]
                                line_nodes.append(line_node)
                        # append all
                        new_sp_line = (
                            " ".join(
                                device + [str(x) for x in line_nodes] + end_line_str
                            )
                            + "\n"
                        )

                    SPfile_n.write(new_sp_line + line_comment)
                else:
                    SPfile_n.write(line + line_comment + "\n")

        node_file = f + ".nodes"
        with open(node_file, "w") as node_f:
            json.dump(nodeList, node_f)

        SPfile_o.close()
        SPfile_n.close()


def visualize_netlist(in_cir):
    netlist_parse_reg = r"^[ ]*((?P<std_comp>[IVivRrCc]\w*)\s+(?P<pos_node>\w+)\s+(?P<neg_node>\w+)\s+(\d+[\w]?[\w]?)\s*?$|(?P<custom_component>[Yy]\w*)\s+(?P<instance>\w+)\s+(?P<params>[\w\s=.]*?$))"

    net_reg = bytes(netlist_parse_reg, "utf-8")

    with open(in_cir, "r+") as f:
        data = mmap.mmap(f.fileno(), 0)
        mo = regex.finditer(net_reg, data, re.MULTILINE)

    for m in mo:

        if "std_comp" in m.groups():
            pass
        elif "custom_component" in m.groups():
            pass

            param_reg = r"[\w=.]+"

            params = regex.finditer()


def generate_cir_main(
    design,
    verilog_file,
    config_file,
    length_file,
    out_file,
    basename_only=False,
    pcell_file=None,
):

    import sys, os

    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + "/verilog_2_NX/")
    from Verilog2NX import get_modules, visual_graph

    net_dict, net_graph = get_modules(in_v=verilog_file, visual=False)

    # out_probes, netlist_graph_out = add_probes_to_device(probes, netlist_graph['smart_toilet']['netlist'])

    from SimulationXyce import SimulationXyce

    Xcl = SimulationXyce()
    Xcl.parse_config_file(config_file)

    print(net_graph.keys())
    out_probes, netlist_graph_out = add_probes_to_device(
        Xcl.probes, net_graph[design]["netlist"]
    )

    dev_lines, chem_args = generate_source_list(Xcl, has_chem=True)

    print(out_probes)

    sim_lines = generate_time_lines(Xcl)

    sp_files = write_spice_file(
        net_graph[design]["netlist"],
        probes_list=out_probes,
        source_lines=dev_lines,
        length_list=length_file,
        chem_list=chem_args,
        sims_time_lines=sim_lines,
        sim_type="transient",
        out_file=out_file,
        add_prn_to_list=True,
        basename_only=basename_only,
        pcell_file=pcell_file,
    )

    for spf in sp_files.iterrows():
        convert_nodes_2_numbers_xyce(spf[1]["spice_str_file"], cir_out=True)

    sp_files.to_csv(os.path.dirname(out_file) + "/spice_files.csv")
