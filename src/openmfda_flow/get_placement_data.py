
import openmfda_flow.def_parse as def_parse
import openmfda_flow.component_parse as component_parse
import openmfda_flow.read_netlist as read_netlist
# import def_parse
# import component_parse
# import read_netlist
from openmfda_flow import def_obj_load

import networkx as nx
from PIL import Image, ImageDraw
import logging
import os


def load_lefs():
    return component_parse.ComponentParser().get_comp_pins_from_lef()


def get_placement_data(
        results_dir_root,
        design,
        design_varient="base",
        placement_step='both'
):

    print(f"looking for file in {os.getcwd()}/{results_dir_root}")
    if placement_step == 'both':
        gp_file = f"{results_dir_root}/{design}/{design_varient}/2_1_place_gp.def"
        dp_file = f"{results_dir_root}/{design}/{design_varient}/2_3_place_dp.def"

        try:
            gp_pos = def_parse.get_info(
                gp_file, design, ["COMPONENTS", "PINS"])
            dp_pos = def_parse.get_info(
                dp_file, design, ["COMPONENTS", "PINS"])
        except FileNotFoundError:
            raise FileNotFoundError(
                f"Could not find placement file in {os.getcwd()}/{results_dir_root}")

        return (gp_pos, dp_pos)
    elif placement_step == 'global':
        gp_file = f"{results_dir_root}/{design}/{design_varient}/2_1_place_gp.def"
        try:
            gp_pos = def_parse.get_info(
                gp_file, design, ["COMPONENTS", "PINS"])
        except FileNotFoundError:
            raise FileNotFoundError(
                f"Could not find placement file in {os.getcwd()}/{results_dir_root}")
        return gp_pos
    elif placement_step == 'detail':
        dp_file = f"{results_dir_root}/{design}/{design_varient}/2_3_place_dp.def"
        try:
            dp_pos = def_parse.get_info(
                dp_file, design, ["COMPONENTS", "PINS"])
        except FileNotFoundError:
            raise FileNotFoundError(
                f"Could not find placement file in {os.getcwd()}/{results_dir_root}")
        return dp_pos
    else:
        raise ValueError(
            f"Invalid value for placement_step {placement_step}; expecting 'both', 'global', or 'detail'")


def get_placement_distances(
    results_root,
    design,
    lef_file,
    conversion_factor,
    verilog_file=None,
    def_file=None,
    design_varient='base',
    placement_step='both'
):

    def_data = get_placement_data(results_root, design, design_varient)
    lef_list = component_parse.ComponentParser().get_comp_pins_from_lef(lef_file)
    if verilog_file is not None:
        net_G = read_netlist.import_from_file(verilog_file)
    elif def_file is not None:
        def_dict = def_obj_load.Design().import_def(def_file)
        design_name = design
        net_G = def_obj_load.Design().generate_netlist_graph(
            def_dict
        )
    else:
        raise ValueError("Missing variable verilog_file or def_file")
    # print([ver_G.get_graph().nodes[n] for n in ver_G.get_graph().nodes])
    print([n for n in net_G.get_graph(
    ).nodes if 'comp_type' not in net_G.get_graph().nodes[n]])

    inputs = [n
              for n in net_G.get_graph().nodes
              if net_G.get_graph().nodes[n]['comp_type'] == 'INPUT']
    print('INPUTS:', inputs)

    if placement_step == 'both':
        nd_gp = traverse_graph(
            net_G.graph, lef_list, def_data[0], node1=inputs[0], cv=conversion_factor)
        nd_dp = traverse_graph(
            net_G.graph, lef_list, def_data[1], node1=inputs[0], cv=conversion_factor)

        return {"global_place": nd_gp["distances"], "detail_place": nd_dp["distances"]}, {"global_place": nd_gp["center"], "detail_place": nd_dp["center"]}

    elif placement_step == 'global':
        nd_gp = traverse_graph(
            net_G.graph, lef_list, def_data[0], node1=inputs[0], cv=conversion_factor)
        return {'distances': {"global_place": nd_gp["distances"]}, 'centers': {"global_place": nd_gp["center"]}}

    elif placement_step == 'detail':
        nd_dp = traverse_graph(
            net_G.graph, lef_list, def_data[1], node1=inputs[0], cv=conversion_factor)
        return {'distances': {"detail_place": nd_dp["distances"]}, 'centers': {"detail_place": nd_dp["center"]}}
    else:
        raise ValueError(
            f"Invalid value for placement_step {placement_step}; expecting 'both', 'global', or 'detail'")


def draw_placement(verilog_G, comp_list, def_pos, place_area, def_scale=1000, img_name=None, show_img=False):

    img = Image.new("RGB", (place_area[0], place_area[1]))
    # img_draw = [] #ImageDraw.Draw(img)
    img_draw = ImageDraw.Draw(img, "RGBA")

    for node in verilog_G.nodes:
        if verilog_G.nodes[node]["comp_type"] not in ["WIRE", "INPUT", "OUTPUT", "INOUT"]:
            c_pos = [pt/def_scale for pt in def_pos["COMPONENTS"][node]["pt"]]
            c_size = comp_list[verilog_G.nodes[node]["comp_type"]].size
            logging.debug(c_pos, c_size)
            # img_draw.append(ImageDraw.Draw(img))
            # img_draw[-1] = ImageDraw.Draw(img)
            shape = [(c_pos[0], c_pos[1]),
                     (c_pos[0]+c_size[0], c_pos[1]+c_size[1])]
            # img_draw[-1].rectangle(shape, fill="#800800", outline="green")
            img_draw.rectangle(shape, fill="#80080032", outline="green")

    if show_img:
        img.show()
    if img_name is not None:
        if img_name[-4:] == '.jpg':
            img_name = img_name[-4]
        img.save(f"{img_name}.jpg")
    else:
        img.save("placement.jpg")


def traverse_graph(verilog_G, comp_list, def_pos, def_scale=1000, node1=None, pre_node=None, cv=1, from_component_center=True):

    def get_pin_center(pin_name):
        # Assumed the layer is centered at the origin
        pos = def_pos["PINS"][pin_name]["pt"]
        return [pos[0]/def_scale, pos[1]/def_scale]

    CP = component_parse.ComponentParser()
    # pick an input node
    # in_node = "soln1"
    in_node = node1
    node_distances = {}
    node_centers = {}
    p_adj = 10
    print("Starting distance calculation")

    for node in nx.dfs_tree(verilog_G, in_node):
        if verilog_G.nodes[node]["comp_type"] not in ["WIRE", "INPUT", "OUTPUT", "INOUT"]:
            for att_node in verilog_G[node]:
                node_pos = None
                if from_component_center:
                    # print(node, def_pos["COMPONENTS"][node]["pt"])
                    node_pos = comp_list[verilog_G.nodes[node]["comp_type"]].get_component_center(
                        [i/def_scale*cv for i in def_pos["COMPONENTS"][node]["pt"]])
                else:
                    node_pos = comp_list[verilog_G.nodes[node]
                                         ["comp_type"]].get_pin_center()
                print(node_pos)
                node_centers[node] = node_pos
                if verilog_G.nodes[att_node]["comp_type"] == "WIRE":
                    for att_comp in verilog_G[att_node]:
                        # skip if same node
                        if att_comp == node or (node, att_comp) in node_distances or (att_comp, node) in node_distances:
                            continue

                        # these are attached components on net att_node
                        if verilog_G.nodes[att_comp]['comp_type'] in ['INPUT', 'OUTPUT']:
                            # ignore 'OUTPUT'
                            continue
                        elif from_component_center:
                            att_comp_pos = comp_list[verilog_G.nodes[att_comp]["comp_type"]].get_component_center(
                                [i/def_scale*cv for i in def_pos["COMPONENTS"][att_comp]["pt"]])
                        else:
                            att_comp_pos = comp_list[verilog_G.nodes[att_comp]["comp_type"]].get_pin_center(
                            )
                        # Manhatten distance
                        logging.debug(node_pos, att_comp_pos)
                        logging.debug(
                            abs(node_pos[0]-att_comp_pos[0]) + abs(node_pos[1]-att_comp_pos[1]))
                        node_distances[(node, att_comp)] = (
                            abs(node_pos[0]-att_comp_pos[0]) + abs(node_pos[1]-att_comp_pos[1]))
                elif verilog_G.nodes[att_node]["comp_type"] in ["INPUT", "OUTPUT", "INOUT"]:
                    port_pos = [
                        i/def_scale*cv*p_adj for i in def_pos["PINS"][att_node]["FIXED"]["pt"]]
                    print("port pos", [i/cv for i in port_pos])
                    print("port pos", port_pos)
                    logging.debug(node_pos, port_pos)
                    logging.debug(
                        abs(node_pos[0]-port_pos[0]) + abs(node_pos[1]-port_pos[1]))
                    node_distances[(node, att_node)] = (
                        abs(node_pos[0]-port_pos[0]) + abs(node_pos[1]-port_pos[1]))

    return {"distances": node_distances, "center": node_centers}


def test_draw():
    verilog_file = '../parallel_test_5_place.v'
    def_file = '../../../../openroad_flow/results/parallel_test_5/base/2_1_place_gp.def'
    lef_file = '../../../../openroad_flow/platforms/mfda_30px/lef/mfda_30px_merged.lef'
    #               ../../../../openroad_flow/platforms/mfda_30px/lef/mfda_30px_merged.lef

    results_root = '../../../../openroad_flow/results'
    design = 'parallel_test_5'

    conversion_factor = 7.6e-3

    def_data = get_placement_data(results_root, design)
    logging.debug(def_data[0]["COMPONENTS"])
    logging.debug(def_data[0]["PINS"])
    logging.debug(def_data[1])

    ver_G = read_netlist.import_from_file(verilog_file)

    lef_list = component_parse.ComponentParser().get_comp_pins_from_lef(lef_file)
    logging.debug(lef_list)

    draw_placement(ver_G.graph, lef_list, def_data[0], [
                   2550, 2000], img_name="gp_placement")
    draw_placement(ver_G.graph, lef_list, def_data[1], [
                   2550, 2000], img_name="dp_placement")


def test_distance():
    verilog_file = '../parallel_test_5_place.v'
    def_file = '../../../../openroad_flow/results/parallel_test_5/base/2_1_place_gp.def'
    lef_file = '../../../../openroad_flow/platforms/mfda_30px/lef/mfda_30px_merged.lef'
    #               ../../../../openroad_flow/platforms/mfda_30px/lef/mfda_30px_merged.lef

    results_root = '../../../../openroad_flow/results'
    design = 'parallel_test_5'

    conversion_factor = 7.6e-3

    def_data = get_placement_data(results_root, design)
    logging.debug(def_data[0]["COMPONENTS"])
    logging.debug(def_data[0]["PINS"])
    logging.debug(def_data[1])

    ver_G = read_netlist.import_from_file(verilog_file)
    # for n in ver_G.graph.nodes:
    # print(ver_G.graph.nodes[n])

    lef_list = component_parse.ComponentParser().get_comp_pins_from_lef(lef_file)
    logging.debug(lef_list)

    nd_gp = traverse_graph(ver_G.graph, lef_list,
                           def_data[0], cv=conversion_factor)
    print(nd_gp)

    nd_dp = traverse_graph(ver_G.graph, lef_list,
                           def_data[1], cv=conversion_factor)
    print(nd_dp)

    nd_dd = {}
    for nd in nd_gp.items():
        nd_dd[nd[0]] = (nd_gp[nd[0]] - nd_dp[nd[0]])

    print(nd_dd)


if __name__ == "__main__":
    # test_distance()
    test_draw()
