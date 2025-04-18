#fmt:off"
import os
import sys
import copy
import json
this_file = os.path.abspath(os.path.dirname(__file__))
is_tool = str(this_file).split('/')[-2]
sys.path.append(os.path.abspath(os.path.dirname(__file__)))
import Astr_grid
import Astar_basic_grid

# testing path configuration
if is_tool == 'tools':
    path_for_omfda = os.path.abspath(f"{this_file}/../..")
else:
    path_for_omfda = "../openmfda_flow_2up"
src_path = f"{path_for_omfda}/src/openmfda_flow"
tool_path = f"{path_for_omfda}/tools"
flow_path = f"{path_for_omfda}/flow"
sys.path.append(os.path.abspath(src_path))
sys.path.append(os.path.abspath(tool_path+'/scad_render'))
import component_parse
import route_scripts
import def_obj_load
#fmt:on


# lef_files = []
# lef_files.append(
#     os.path.abspath(flow_path+'/platforms/h.r.3.3/lef/h.r.3.3_merged.up.lef'))
# lef_files.append(
#     os.path.abspath(flow_path+'/results/albumin_opt_0/base/h.r.3.3_albumin_opt_0_pcells.lef'))
#
# CompP = component_parse.ComponentParser()
#
# # defs
# trgt_def = f"{flow_path}/results/albumin_opt_0/base/4_final.def"
# def_design = def_obj_load.Design().import_def(trgt_def)
#
# alb = def_design['design']['albumin_opt_0']
#
# # -- design configuration
#
# # copied from below cell
# via_map = {
#     'M1M2_PR': ['met1', 'met2'],
#     'M2M3_PR': ['met2', 'met3'],
#     'M3M4_PR': ['met3', 'met4'],
#     'M4M5_PR': ['met4', 'met5'],
#     'M5M6_PR': ['met5', 'met6'],
#     'M6M7_PR': ['met6', 'met7'],
#     'M7M8_PR': ['met7', 'met8'],
#     'M8M9_PR': ['met8', 'met9']
# }
#
# # met mapping
# layers = {
#     'met1': 0,
#     'met2': 1,
#     'met3': 2,
#     'met4': 3,
#     'met5': 4,
#     'met6': 5,
#     'met7': 6,
#     'met8': 7,
#     'met9': 8,
#     'met10': 9,
# }
#
# # pitch * def_scale (which is 30 * 1000)
# def_grid_scale = 30000
#
# # load lefs into parser
# lefs = []
# for leff in lef_files:
#     lefs.append(CompP.parser_file(in_file=leff))
#
#
# # get list of components from nets
# route_dev = [{'dev': c[1].component_type} for c in alb.components.items()]
#
# # convert nets to consecutive segments
# linked_routes = {}


def link_def_segments(def_design, lefs, via_map, silent=False):
    linked_routes = {}
    for net in def_design.nets.items():
        linked_routes[net[0]] = link_net(
            net=net[1],  # .export_as_list(as_3pts=True, via_map=via_map),
            net_components=[{'dev': c[1].component_type}
                            for c in def_design.components.items()],
            lefs=lefs,
            component_list=def_design.export_component_obj_list(),
            via_map=via_map,
            silent=silent
        )
    return linked_routes
    # linked_routes[net[0]] = route_scripts.link_routes(
    #     route=net[1].export_as_list(as_3pts=True, via_map=via_map),
    #     route_devs=[{'dev': c[1].component_type}
    #                 for c in alb.components.items()],
    #     components_lef=lefs,
    #     component_list=alb.export_component_obj_list()
    # )


def link_net(net, net_components, lefs, component_list, via_map, silent=False):
    return route_scripts.link_routes(
        route=net.export_as_list(as_3pts=True, via_map=via_map),
        route_devs=net_components,
        components_lef=lefs,
        component_list=component_list,
        silent=silent
    )

# linked_routes = copy.deepcopy(linked_routes_bkup)

# convert to grid pts


def convert_route(linked_routes, def_grid_scale, layers_map, acc=0.0001):
    for net in linked_routes.items():
        print(net[0])
        for rt in [net[1].nodes[r]['route'] for r in net[1].nodes]:
            print("before: ", rt)
            for pt in rt:
                pt[2] = layers_map[pt[2]]

                pt1 = pt[1]/def_grid_scale
                if pt1 % 1 < acc:
                    pt[1] = int(pt1)
                else:
                    pt[1] = pt1

                pt0 = pt[0]/def_grid_scale
                if pt0 % 1 < acc:
                    pt[0] = int(pt0)
                else:
                    pt[0] = pt0

            print("after: ", rt)


# ----------------------------------------------------------
# other defined functions


def get_intersections(rt_dict, silent=False):
    intersection_dict = {}
    for net1 in rt_dict.items():
        for net2 in rt_dict.items():
            # skip the same net
            if net1[0] == net2[0]:
                continue
            # skip nets already checked
            if (net2[0], net1[0]) in intersection_dict:
                continue
            # print([pt for nd in net1[1].nodes for pt in net1[1].nodes[nd]['route']])
            print(f"{net1[0]}:{net2[0]}")
            found_intersects = \
                route_scripts.check_net_intersections(
                    [pt for nd in net1[1].nodes for pt in net1[1].nodes[nd]['route']],
                    [pt for nd in net2[1].nodes for pt in net2[1].nodes[nd]['route']],
                    silent=silent
                )
            if len(found_intersects) > 0:
                intersection_dict[(net1[0], net2[0])] = found_intersects
    return intersection_dict


def convert_inters(
    inters_dict,
    layers_map,
    print_debug=False
):
    for net_pair in inters_dict.items():
        print(net_pair[0])
        for inter in net_pair[1]:
            if print_debug:
                print("before: ", inter)
            for pt in inter[1:]:
                if len(pt) == 3:
                    if isinstance(pt[2], str):
                        pt[2] = layers_map[pt[2]]
                        pt[1] = int(pt[1]/def_grid_scale)
                        pt[0] = int(pt[0]/def_grid_scale)
                else:
                    if isinstance(pt[0][2], str):
                        pt[0][2] = layers_map[pt[0][2]]
                        pt[0][1] = int(pt[0][1]/def_grid_scale)
                        pt[0][0] = int(pt[0][0]/def_grid_scale)

                    if isinstance(pt[1][2], str):
                        pt[1][2] = layers_map[pt[1][2]]
                        pt[1][1] = int(pt[1][1]/def_grid_scale)
                        pt[1][0] = int(pt[1][0]/def_grid_scale)

            if print_debug:
                print("after: ", inter)


def extract_intersect_pt_list(inters_dict,
                              print_debug=True):
    def add_if_unique(pt, pt_list, dkey=None):
        if dkey is None:
            if pt not in pt_list:
                pt_list.append(pt)
        else:
            if pt not in pt_list[dkey]:
                pt_list[dkey].append(pt)
    inter_net_list = {}

    for net_pair in inters_dict.items():
        print("Extracting from ", net_pair[0])
        net1 = net_pair[0][0]
        net2 = net_pair[0][1]
        if net_pair[0][0] not in inter_net_list:
            inter_net_list[net1] = {}
        inter_net_list[net1][net2] = []

        if net_pair[0][1] not in inter_net_list:
            inter_net_list[net2] = {}
        inter_net_list[net2][net1] = []

        for inter in net_pair[1]:
            pt_l1 = inter[1]
            pt_l2 = inter[2]

            if len(pt_l1) == 2:
                add_if_unique(pt_l1[0], inter_net_list[net1], net2)
                add_if_unique(pt_l1[1], inter_net_list[net1], net2)
            else:
                add_if_unique(pt_l1, inter_net_list[net1], net2)

            if len(pt_l2) == 2:
                add_if_unique(pt_l2[0], inter_net_list[net2], net1)
                add_if_unique(pt_l2[1], inter_net_list[net2], net1)
            else:
                add_if_unique(pt_l2, inter_net_list[net2], net1)

    return inter_net_list


def check_interpoints_full_segment(pts, key, net_list):
    # isfound_pts = False
    found_pts_ind = {}

    net_segments = net_list[key].nodes['']['route']

    for pt in pts:
        if pt in net_segments:
            pt_ind = net_segments.index(pt)
            if pt_ind in found_pts_ind:
                print(" duplicate:", pt, ", ind:", pt_ind)
            found_pts_ind[net_segments.index(pt)] = pt
        else:
            print(f"Point {pt} not found in : {net_segments}")
    # check are consecutive
    pts_ind_sorted = sorted(list(found_pts_ind.keys()))

    if len(pts_ind_sorted) <= 1:
        return [pts_ind_sorted]

    pt_ind_list = []
    pt_ind_temp_list = []
    pt_i1_iter = iter(pts_ind_sorted[:-1])
    for ct, pt_i2 in enumerate(pts_ind_sorted[1:]):
        pt_i1 = next(pt_i1_iter)
        # print(pt_i1, pt_i2)
        if len(pt_ind_temp_list) == 0:
            pt_ind_temp_list += [pt_i1]
        # print((pt_i2 - pt_i1))
        if 1 == abs(pt_i2 - pt_i1):
            pt_ind_temp_list += [pt_i2]
        else:
            pt_ind_list += [pt_ind_temp_list]
            pt_ind_temp_list = []
        if ct >= len(pts_ind_sorted)-2:
            pt_ind_list += [pt_ind_temp_list]

    return pt_ind_list


def initialize_routes_in_grid(a_grid, net_list):
    for net in net_list.items():
        print("Adding net:", net[0])
        for rt in net[1].nodes:
            pt1_iter = iter(net[1].nodes[rt]['route'][:-1])
            for pt2 in net[1].nodes[rt]['route'][1:]:
                sg = [next(pt1_iter), pt2]
                print(sg)
                a_grid.add_line(sg)


# constants for init_components
lef_pos_scale = 30000
lef_sz_scale = 30
lszs = lef_sz_scale


def initialize_components_in_grid(
    a_grid,
    component_inst,
    component_lef,
    layers_map,
    lef_pos_scale=lef_pos_scale,
    lef_sz_scale=lef_sz_scale
):
    for c in component_inst.values():
        # get size
        c_pos = [int(c.pos[0]/lef_pos_scale), int(c.pos[1]/lef_pos_scale)]
        c_sz = [int(i/lef_sz_scale)
                for i in component_lef[c.component_type]['SIZE']]
        c_obs = [
            [[int((cOBS['RECT'][0][0]+lszs-1)/lef_sz_scale),  # x
                int((cOBS['RECT'][0][1]+lszs-1)/lef_sz_scale),  # y
                layers_map[cOBS['LAYER']]],
             [int((cOBS['RECT'][1][0]+lszs-1)/lef_sz_scale),  # x
                int((cOBS['RECT'][1][1]+lszs-1)/lef_sz_scale),  # y
                layers_map[cOBS['LAYER']]]]
            for cOBS in component_lef[c.component_type]['OBS']]
        print(component_lef[c.component_type]['OBS'])
        c_box = [c_pos, [c_pos[0]+c_sz[0], c_pos[1]+c_sz[1]]]
        # print(c_obs)
        # create a box for each OBS layer
        c_box2 = [
            [[c_pos[0]+cOBS[0][0], c_pos[1]+cOBS[0][1], cOBS[0][2]],
                [c_pos[0]+cOBS[1][0], c_pos[1]+cOBS[1][1], cOBS[1][2]]]
            for cOBS in c_obs]
        print(c_box)
        print(c_box2)
        print('')
        # a_grid.add_box([c_sz[0]], [c_sz[1]])
        for box in c_box2:
            a_grid.add_box(box[0], box[1])


# defs for convert path2scad
x_cvt = 30*7.6e-3
y_cvt = 30*7.6e-3
z_cvt = 20*10e-3
z_off = 75*10e-3


def convert_path2scad(
    path,
    isgrid=True,
    x_cvt=x_cvt,
    y_cvt=y_cvt,
    z_cvt=z_cvt,
    z_offset=z_off
):
    new_path = []
    for pt in path:
        if isgrid:
            new_path += [[
                pt[2]*x_cvt,
                pt[1]*y_cvt,
                pt[0]*z_cvt+z_offset
            ]]
        else:
            new_path += [[
                pt[0]*x_cvt,
                pt[1]*y_cvt,
                pt[2]*z_cvt+z_offset
            ]]
    return new_path


def convert_to_segments(pt_list, verbose=False):
    prev_vect = [0, 0, 0]
    prev_vect_eq = False
    pt_list_tmp = [pt_list[0]]

    for ind, pt in enumerate(pt_list[1:]):
        vect = (pt_list[ind][0] - pt[0],
                pt_list[ind][1] - pt[1],
                pt_list[ind][2] - pt[2])
        print(f"{pt_list[ind]}:{pt} - {vect}")
        if prev_vect != vect:
            if prev_vect_eq:
                pt_list_tmp.append(pt_list[ind])
                if verbose:
                    print(f"  adding:{pt_list[ind]}")
            pt_list_tmp.append(pt)
            if verbose:
                print(f"  adding:{pt}")
            prev_vect_eq = False
        else:
            if not prev_vect_eq:
                print(f"  rm:{pt_list_tmp[-1]}")
                pt_list_tmp.pop()
            prev_vect_eq = True
        prev_vect = vect
    return pt_list_tmp


def print_polyroute(path, route_name='', color="orange", convert_units=False):
    if convert_units:
        opth = path
        path = convert_path2scad(copy.deepcopy(path))
    print(f"""        polychannel_route("{route_name}",
        [], [],
[""")
    for i, pt in enumerate(path):
        if convert_units:
            print(
                f'["cube", [14*px, 14*px, 10*layer], {pt}, [0, [0, 0, 1]]], //{opth[i]}')
        else:
            print(f'["cube", [14*px, 14*px, 10*layer], {pt}, [0, [0, 0, 1]]],')
    print(f'], clr="{color}") ;')


def write_polyroute(path, out_file, route_name='', color="orange", convert_units=False, mode='a'):
    if convert_units:
        opth = path
        path = convert_path2scad(copy.deepcopy(path))
    with open(out_file, mode) as ply_rt:

        ply_rt.write(f"""        polychannel_route("{route_name}",
            [], [],
    [\n""")
        for i, pt in enumerate(path):
            if convert_units:
                ply_rt.write(
                    f'["cube", [14*px, 14*px, 10*layer], {pt}, [0, [0, 0, 1]]], //{opth[i]}\n')
            else:
                ply_rt.write(
                    f'["cube", [14*px, 14*px, 10*layer], {pt}, [0, [0, 0, 1]]],\n')
        ply_rt.write(f'], clr="{color}") ;\n\n')


# Additional functions
#   not in main testing


def get_intersect_indexes(intersect_pts_dict, routes):
    inter_pts_indexes = {}
    for o_net in intersect_pts_dict.keys():
        inter_pts_indexes[o_net] = {}
        for i_net in intersect_pts_dict[o_net].keys():
            inter_pts_indexes[o_net][i_net] = check_interpoints_full_segment(
                intersect_pts_dict[o_net][i_net],
                o_net,
                routes
            )
    return inter_pts_indexes


def add_route_2_grid(a_grid, route, v=0):
    pt1_iter = iter(route[:-1])
    for pt2 in route[1:]:
        sg = [next(pt1_iter), pt2]
        print(sg)
        a_grid.add_line(sg, v)


def get_path_len(path):
    pass


# def check_interpoints_full_segment(pts, key, net_list):
#     # isfound_pts = False
#     found_pts_ind = {}
#
#     net_segments = net_list[key].nodes['']['route']
#
#     for pt in pts:
#         if pt in net_segments:
#             pt_ind = net_segments.index(pt)
#             if pt_ind in found_pts_ind:
#                 print(" duplicate:", pt, ", ind:", pt_ind)
#             found_pts_ind[net_segments.index(pt)] = pt
#         else:
#             print(f"Point {pt} not found in : {net_segments}")
#     # check are consecutive
#     pts_ind_sorted = sorted(list(found_pts_ind.keys()))
#
#     pt_ind_list = []
#     pt_ind_temp_list = []
#     pt_i1_iter = iter(pts_ind_sorted[:-1])
#     for ct, pt_i2 in enumerate(pts_ind_sorted[1:]):
#         pt_i1 = next(pt_i1_iter)
#         # print(pt_i1, pt_i2)
#         if len(pt_ind_temp_list) == 0:
#             pt_ind_temp_list += [pt_i1]
#         # print((pt_i2 - pt_i1))
#         if 1 == abs(pt_i2 - pt_i1):
#             pt_ind_temp_list += [pt_i2]
#         else:
#             pt_ind_list += [pt_ind_temp_list]
#             pt_ind_temp_list = []
#         if ct >= len(pts_ind_sorted)-2:
#             pt_ind_list += [pt_ind_temp_list]
#
#     return pt_ind_list


def remove_patch(path, patch_len=3):
    if len(path) < 3:
        return path
    if patch_len % 2 != 1:
        raise Exception(
            f"invalid patch len, mush be odd. patch len = {patch_len}")
    pt0 = path[0]
    pt1 = path[1]
    for pt0_i, pt2 in enumerate(path[2:]):
        if pt0 == pt2:
            path.pop(pt0_i+1)
            print(f"Removing:{pt1}, around {pt0}, {pt2}")
            remove_patch(path, patch_len)
        pt0 = pt1
        pt1 = pt2


# insert list into another list
def insert_list_2_list(base_list, insert_list, st_nd, end_nd=None):
    print("start")
    print(base_list)
    if end_nd is not None:
        base_list_new = base_list[:st_nd] + base_list[end_nd:]
    else:
        end_nd = st_nd+1
        base_list_new = base_list
    print(base_list[:st_nd], " | ", base_list[end_nd:])

    # print(base_list_new)

    for i in range(len(insert_list)):
        base_list_new.insert(i + st_nd, insert_list[i])
    print("output", base_list_new)
    return base_list_new

# ----------------------------------------------------------
#       Script with all together
# setup


def check_if_in_net(pt, net, acc=1e-5):
    for ntpt in net:
        if ntpt == pt:
            return True
    return False


def fix_design_route_2(
    trgt_def,
    design_name,
    platform_config,
    lef_list,
    grid_size,
    out_file=None,
    skip_bad_routes=True
):

    if out_file is not None:
        of = open(out_file, 'w')
        of.write('')
        of.close()

    # load def -------------------------------------------------
    if not os.path.exists(trgt_def):
        raise ValueError(f"{os.path.abspath(trgt_def)} not found")
    def_design = def_obj_load.Design().import_def(trgt_def)

    # full test
    design_obj = def_design['design'][design_name]

    # load platform config
    platform = json.load(open(platform_config, 'r'))

    # link routes ----------------------------------------------
    # convert nets to consecutive segments
    linked_routes_ft = {}

    for net in design_obj.nets.keys():
        linked_routes_ft[net] = route_scripts.link_routes(
            route=design_obj.nets[net].export_as_list(
                as_3pts=True, via_map=platform["via_map"]),
            route_devs=[{'dev': c[1].component_type}
                        for c in design_obj.components.items()],
            components_lef=lef_list,
            component_list=design_obj.export_component_obj_list()
        )
    linked_routes_ft = link_def_segments(
        design_obj,
        lef_list,
        platform["via_map"]
    )

    # convert routes to grid
    for net in linked_routes_ft.items():
        print(net[0])
        for rt in [net[1].nodes[r]['route'] for r in net[1].nodes]:
            print("before: ", rt)
            for pt in rt:
                pt[2] = platform["layers"][pt[2]]
                pt[1] = int(pt[1]/platform["def_grid_scale"])
                pt[0] = int(pt[0]/platform["def_grid_scale"])
            print("after: ", rt)

    # get intersections ----------------------------------------
    inters_ft = get_intersections(linked_routes_ft)

    grid_inters_ft = copy.deepcopy(inters_ft)
    convert_inters(grid_inters_ft, platform['layers'])
    inter_pts_ft = extract_intersect_pt_list(grid_inters_ft)

    # get intersection indexes ---------------------------------
    # this need to be done right before grid
    #     otherwise this can be off
    inter_pts_sgmts_ft = get_intersect_indexes(
        inter_pts_ft,
        linked_routes_ft
    )

    # initialize solver ----------------------------------------
    G_col = grid_size[0]
    G_row = grid_size[1]
    G_lay = grid_size[2]

    ft_grid = Astr_grid.AStr_grid(G_col, G_row, G_lay)

    initialize_routes_in_grid(
        a_grid=ft_grid,
        net_list=linked_routes_ft
    )

    CompP = component_parse.ComponentParser()

    lefs_l = []
    for leff in lef_list:
        lefs_l.append(CompP.parser_file(in_file=leff))

    lefs = lefs_l[0]
    if len(lefs_l) > 1:
        for l in lefs_l[1:]:
            lefs.update(l)

    initialize_components_in_grid(
        ft_grid,
        design_obj.components,
        lefs,
        layers_map=platform["layers"]
    )

    # main loop to solve Astar
    # use indexes as src and dest ------------------------------
    solved_net_pairs = []

    # used in function testing
    write_2_grid = True
    write_2_grid_val = 0

    for net_o in inter_pts_sgmts_ft.items():
        # for net_o in inter_pts_sgmts_ft.items():
        # global ft_new_path
        # global solved_net_pairs

        ft_new_path = []
        print(f"solving {net_o[0]} -----------------------------")
        print(net_o[1])
        onet_solved_pts = []
        for net_i in net_o[1].items():
            if (net_i[0], net_o[0]) in solved_net_pairs:
                print("Skipping ", net_o[0], ":", net_i[0], "; Already solved")
                continue
            skipped_pair_through_end = False
            for pt_list in net_i[1]:
                print(pt_list)
                if len(pt_list) == 0:
                    print(f"empty list {net_o[0]} with {net_i[0]}")
                    continue
                elif len(pt_list) == 1 and pt_list[0] == 0:
                    pt_list = [1, 2]
                elif len(pt_list) == 1 and pt_list[0] == len(linked_routes_ft[net_o[0]].nodes['']['route'])-1:
                    pt_list = [
                        len(linked_routes_ft[net_o[0]].nodes['']['route'])-3,
                        len(linked_routes_ft[net_o[0]].nodes['']['route'])-2
                    ]
                ft_pt1_i = int(min(pt_list))
                ft_pt2_i = int(max(pt_list))

                if ft_pt1_i <= 0:
                    if ft_pt1_i == 0:
                        # check if pt in net
                        if check_if_in_net(
                                linked_routes_ft[net_o[0]
                                                 ].nodes['']['route'][ft_pt1_i],
                                linked_routes_ft[net_i[0]].nodes['']['route']):
                            print(
                                f"skipping {net_o[0]}:{net_i[0]}, {ft_pt1_i}")
                            skipped_pair_through_end = True
                            continue
                        else:
                            print(f"Index {ft_pt1_i}, not in {net_i[0]}")
                            ft_pt1_i += 1
                            if ft_pt1_i == ft_pt2_i:
                                ft_pt2_i += 1
                            skipped_pair_through_end = False
                    else:
                        print(f"skipping {net_o[0]}:{net_i[0]}, {ft_pt1_i}")
                        skipped_pair_through_end = True
                        continue
                if ft_pt2_i >= len(linked_routes_ft[net_o[0]].nodes['']['route'])-1:
                    if ft_pt2_i == len(linked_routes_ft[net_o[0]].nodes['']['route'])-1:
                        # check if pt in net
                        if check_if_in_net(
                                linked_routes_ft[net_o[0]
                                                 ].nodes['']['route'][ft_pt2_i],
                                linked_routes_ft[net_i[0]].nodes['']['route']):
                            print(
                                f"skipping {net_o[0]}:{net_i[0]}, {ft_pt2_i}/{len(linked_routes_ft[net_o[0]].nodes['']['route'])}")
                            skipped_pair_through_end = True
                            continue
                        else:
                            print(f"Index {ft_pt2_i}, not in {net_i[0]}")
                            ft_pt2_i -= 1
                            if ft_pt1_i == ft_pt2_i:
                                ft_pt1_i -= 1
                            skipped_pair_through_end = False
                    else:
                        print(
                            f"skipping {net_o[0]}:{net_i[0]}, {ft_pt2_i}/{len(linked_routes_ft[net_o[0]].nodes['']['route'])}")
                        skipped_pair_through_end = True
                        continue

                # check if indexes are within previous solve
                skip_solve_pt_pair = False
                # for slvd_net in ft_new_path.values():
                for slvd_net in onet_solved_pts:
                    print("Solved indexes", slvd_net)  # ['pt_ind'])
                    # if ft_pt1_i >= slvd_net['pt_ind'][0] and ft_pt2_i <= slvd_net['pt_ind'][1]:
                    if ft_pt1_i >= slvd_net[0] and ft_pt2_i <= slvd_net[1]:
                        print("Indexes are within previous solutions, skipping")
                        skip_solve_pt_pair = True
                    # if only one is outside, continue the solution
                    # elif ft_pt1_i-1 >= slvd_net['pt_ind'][0] and ft_pt1_i <= slvd_net['pt_ind'][1]:
                    elif ft_pt1_i >= slvd_net[0] and ft_pt1_i <= slvd_net[1]:
                        print(
                            f'continuing previous solution {slvd_net}:[{ft_pt1_i}, {ft_pt2_i}]')
                        slvd_net[1] = ft_pt2_i
                        # ft_pt1_i = slvd_net[1]
                        # ft_pt1 = slvd_net['path'][-1]
                        skip_solve_pt_pair = True
                    # if only one is outside, continue the solution
                    # elif ft_pt2_i+1 <= slvd_net['pt_ind'][1] and ft_pt2_i >= slvd_net['pt_ind'][0]:
                    elif ft_pt2_i <= slvd_net[1] and ft_pt2_i >= slvd_net[0]:
                        print(
                            f'continuing previous solution {slvd_net}:[{ft_pt1_i}, {ft_pt2_i}]')
                        # ft_pt2_i = slvd_net[0]
                        # ft_pt2 = slvd_net['path'][0]
                        skip_solve_pt_pair = True
                    # if only one is outside, continue the solution
                if skip_solve_pt_pair:
                    continue

                onet_solved_pts += [[ft_pt1_i, ft_pt2_i]]

                def can_merge_solve(s_list):
                    if len(s_list) <= 1:
                        return s_list
                    n_list = []
                    for i in range(0, len(s_list))[::-1]:
                        if len(n_list) == 0:
                            n_list = [s_list.pop()]
                            continue
                        s_pt = s_list.pop()
                        chains = False
                        for npt in n_list:
                            if s_pt[0]-1 == npt[1]:
                                npt[1] = s_pt[1]
                                chains = True
                            elif s_pt[1]+1 == npt[0]:
                                npt[0] = s_pt[0]
                                chains = True
                        if not chains:
                            n_list.append(s_pt)
                    return n_list

                onet_solved_pts = can_merge_solve(onet_solved_pts)

            if not skipped_pair_through_end:
                solved_net_pairs += [(net_o[0], net_i[0])]

        onet_solved_pts = sorted(onet_solved_pts, key=lambda l: l[0])
        print("Pair indexes: ", onet_solved_pts)
        for i, pt_pair in enumerate(onet_solved_pts):
            # net_o_solved_ind += [[]]
            ft_pt1_i = pt_pair[0]
            ft_pt2_i = pt_pair[1]

            ft_pt1 = linked_routes_ft[net_o[0]
                                      ].nodes['']['route'][ft_pt1_i - 1]
            ft_pt2 = linked_routes_ft[net_o[0]
                                      ].nodes['']['route'][ft_pt2_i + 1]

            print("indexs:", ft_pt1_i, ft_pt2_i)

            # remove target route
            # 1 is open
            if write_2_grid:
                add_route_2_grid(
                    ft_grid,
                    linked_routes_ft[net_o[0]].nodes['']['route'],
                    v=1
                )

                # Add back routing around segment to be solved
                add_route_2_grid(
                    ft_grid,
                    linked_routes_ft[net_o[0]
                                     ].nodes['']['route'][:ft_pt1_i - 1],
                    v=0
                )
                add_route_2_grid(
                    ft_grid,
                    linked_routes_ft[net_o[0]
                                     ].nodes['']['route'][ft_pt2_i + 1:],
                    v=0
                )

                # Add back intersecting routes
                for net_i2 in net_o[1].items():
                    add_route_2_grid(
                        ft_grid,
                        linked_routes_ft[net_i2[0]].nodes['']['route'],
                        v=0
                    )

            # set pt to unblocked
            ft_grid.set_value(ft_pt1, 1)
            ft_grid.set_value(ft_pt2, 1)

            # solve path
            # ft_new_path[net_i[0]] = {}
            ft_new_path.append({})
            ft_new_path[i]['path'] = Astar_basic_grid.a_star_search(
                grid=ft_grid._grid,
                src=Astr_grid.convert_pt2grid(ft_pt1),
                dest=Astr_grid.convert_pt2grid(ft_pt2)
            )
            ft_new_path[i]['pt_ind'] = [ft_pt1_i, ft_pt2_i]

            # TODO search in reverse and compare lengths
            # ft_new_path_rev = Astar_basic_grid.a_star_search(
            #     grid=ft_grid._grid,
            #     src=Astr_grid.convert_pt2grid(ft_pt2),
            #     dest=Astr_grid.convert_pt2grid(ft_pt1)
            # )

            # combine segements
            # print(ft_new_path)
            if ft_new_path[i]['path'] is None:
                if skip_bad_routes:
                    continue
                raise ValueError(f"No path for indexes {ft_pt1_i}:{ft_pt2_i}")
                continue
            ft_new_path[i]['path'] = convert_to_segments(
                ft_new_path[i]['path'])
            # coords don't match : converting here
            ft_new_path[i]['path'] = [[pt[2], pt[1], pt[0]]
                                      for pt in ft_new_path[i]['path']]

        ft_new_route = copy.deepcopy(
            linked_routes_ft[net_o[0]].nodes['']['route'])
        for net_i in ft_new_path[::-1]:
            if net_i['path'] is None and skip_bad_routes:
                continue
            # insert path to previous route
            print("Inserting into route: ", net_o[0])
            ft_new_route = insert_list_2_list(
                ft_new_route,
                net_i['path'],
                net_i['pt_ind'][0]-1,  # ft_pt1_i,
                net_i['pt_ind'][1]+1,  # ft_pt2_i
            )
        remove_patch(ft_new_route)

        if write_2_grid:
            linked_routes_ft[net_o[0]].nodes['']['route'] = ft_new_route
            # write new path to grid
            add_route_2_grid(
                ft_grid,
                ft_new_route,
                v=write_2_grid_val
            )

        # Here the new route can be written to def file ------------
        #     however to validate we will write them to
        #     scad segments
        # convert to scad polyroute
        if out_file is None:
            print_polyroute(
                path=[[pt[2], pt[1], pt[0]] for pt in ft_new_route],
                route_name=net_o[0],
                convert_units=True
            )
        elif isinstance(out_file, str):
            write_polyroute(
                path=[[pt[2], pt[1], pt[0]] for pt in ft_new_route],
                out_file=out_file,
                route_name=net_o[0],
                convert_units=True
            )
        # print(onet_solved_pts)
    # return back new routes
    return linked_routes_ft


def fix_design_route_1(
    trgt_def,
    design_name,
    platform_config,
    lef_list,
    grid_size,
    out_file=None
):

    if out_file is not None:
        of = open(out_file, 'w')
        of.write('')
        of.close()

    # load def -------------------------------------------------
    def_design = def_obj_load.Design().import_def(trgt_def)

    # full test
    design_obj = def_design['design'][design_name]

    # load platform config
    platform = json.load(open(platform_config, 'r'))

    # link routes ----------------------------------------------
    # convert nets to consecutive segments
    linked_routes_ft = {}

    for net in design_obj.nets.keys():
        linked_routes_ft[net] = route_scripts.link_routes(
            route=design_obj.nets[net].export_as_list(
                as_3pts=True, via_map=platform["via_map"]),
            route_devs=[{'dev': c[1].component_type}
                        for c in design_obj.components.items()],
            components_lef=lef_list,
            component_list=design_obj.export_component_obj_list()
        )
    linked_routes_ft = link_def_segments(
        design_obj,
        lef_list,
        platform["via_map"]
    )

    # convert routes to grid
    for net in linked_routes_ft.items():
        print(net[0])
        for rt in [net[1].nodes[r]['route'] for r in net[1].nodes]:
            print("before: ", rt)
            for pt in rt:
                pt[2] = platform["layers"][pt[2]]
                pt[1] = int(pt[1]/platform["def_grid_scale"])
                pt[0] = int(pt[0]/platform["def_grid_scale"])
            print("after: ", rt)

    # get intersections ----------------------------------------
    inters_ft = get_intersections(linked_routes_ft)

    grid_inters_ft = copy.deepcopy(inters_ft)
    convert_inters(grid_inters_ft, platform['layers'])
    inter_pts_ft = extract_intersect_pt_list(grid_inters_ft)

    # get intersection indexes ---------------------------------
    # this need to be done right before grid
    #     otherwise this can be off
    inter_pts_sgmts_ft = get_intersect_indexes(
        inter_pts_ft,
        linked_routes_ft
    )

    # initialize solver ----------------------------------------
    G_col = grid_size[0]
    G_row = grid_size[1]
    G_lay = grid_size[2]

    ft_grid = Astr_grid.AStr_grid(G_col, G_row, G_lay)

    initialize_routes_in_grid(
        a_grid=ft_grid,
        net_list=linked_routes_ft
    )

    CompP = component_parse.ComponentParser()

    lefs_l = []
    for leff in lef_list:
        lefs_l.append(CompP.parser_file(in_file=leff))

    lefs = lefs_l[0]
    if len(lefs_l) > 1:
        for l in lefs_l[1:]:
            lefs.update(l)

    initialize_components_in_grid(
        ft_grid,
        design_obj.components,
        lefs,
        layers_map=platform["layers"]
    )

# main loop to solve Astar
# use indexes as src and dest ------------------------------
    solved_net_pairs = []

    for net_o in inter_pts_sgmts_ft.items():
        ft_new_path = {}
        print(f"solving {net_o[0]} -----------------------------")
        print(net_o[1])
        for net_i in net_o[1].items():
            if (net_i[0], net_o[0]) in solved_net_pairs:
                print("Skipping ", net_o[0], ":", net_i[0], "; Already solved")
                continue
            skipped_pair_through_end = False
            for pt_list in net_i[1]:
                # print(pt_list)
                ft_pt1_i = int(min(pt_list))
                ft_pt2_i = int(max(pt_list))

                if ft_pt1_i <= 0:
                    print(f"skipping {net_o[0]}:{net_i[0]}, {ft_pt1_i}")
                    skipped_pair_through_end = True
                    continue
                if ft_pt2_i >= len(linked_routes_ft[net_o[0]].nodes['']['route'])-1:
                    print(
                        f"skipping {net_o[0]}:{net_i[0]}, {ft_pt2_i}/{len(linked_routes_ft[net_o[0]].nodes['']['route'])}")
                    skipped_pair_through_end = True
                    continue

                print("indexs:", ft_pt1_i, ft_pt2_i)

                ft_pt1 = linked_routes_ft[net_o[0]
                                          ].nodes['']['route'][ft_pt1_i - 1]
                ft_pt2 = linked_routes_ft[net_o[0]
                                          ].nodes['']['route'][ft_pt2_i + 1]

                # check if indexes are within previous solve
                skip_solve_pt_pair = False
                for slvd_net in ft_new_path.values():
                    print("Solved indexes", slvd_net['pt_ind'])
                    if ft_pt1_i >= slvd_net['pt_ind'][0] and ft_pt2_i <= slvd_net['pt_ind'][1]:
                        print("Indexes are within previous solutions, skipping")
                        skip_solve_pt_pair = True
                    # if only one is outside, continue the solution
                    elif ft_pt1_i >= slvd_net['pt_ind'][0] and ft_pt1_i <= slvd_net['pt_ind'][1]:
                        print('continuing previous solution')
                        ft_pt1_i = slvd_net['pt_ind'][1]
                        ft_pt1 = slvd_net['path'][-1]
                    elif ft_pt2_i <= slvd_net['pt_ind'][1] and ft_pt1_i >= slvd_net['pt_ind'][0]:
                        print('continuing previous solution')
                        ft_pt2_i = slvd_net['pt_ind'][0]
                        ft_pt2 = slvd_net['path'][0]
                if skip_solve_pt_pair:
                    continue

                # remove target route
                # 1 is open
                add_route_2_grid(
                    ft_grid,
                    linked_routes_ft[net_o[0]].nodes['']['route'],
                    v=1
                )

                # Add back routing around segment to be solved
                add_route_2_grid(
                    ft_grid,
                    linked_routes_ft[net_o[0]
                                     ].nodes['']['route'][:ft_pt1_i - 1],
                    v=0
                )
                add_route_2_grid(
                    ft_grid,
                    linked_routes_ft[net_o[0]
                                     ].nodes['']['route'][ft_pt2_i + 1:],
                    v=0
                )

                # Add back intersecting routes
                for net_i2 in net_o[1].items():
                    add_route_2_grid(
                        ft_grid,
                        linked_routes_ft[net_i[0]].nodes['']['route'],
                        v=0
                    )

                # set pt to unblocked
                ft_grid.set_value(ft_pt1, 1)
                ft_grid.set_value(ft_pt2, 1)

                # solve path
                ft_new_path[net_i[0]] = {}
                ft_new_path[net_i[0]]['path'] = Astar_basic_grid.a_star_search(
                    grid=ft_grid._grid,
                    src=Astr_grid.convert_pt2grid(ft_pt1),
                    dest=Astr_grid.convert_pt2grid(ft_pt2)
                )
                ft_new_path[net_i[0]]['pt_ind'] = [ft_pt1_i, ft_pt2_i]

                # TODO search in reverse and compare lengths
                # ft_new_path_rev = Astar_basic_grid.a_star_search(
                #     grid=ft_grid._grid,
                #     src=Astr_grid.convert_pt2grid(ft_pt2),
                #     dest=Astr_grid.convert_pt2grid(ft_pt1)
                # )

                # combine segements
                # print(ft_new_path)
                ft_new_path[net_i[0]]['path'] = convert_to_segments(
                    ft_new_path[net_i[0]]['path'])
                # coords don't match : converting here
                ft_new_path[net_i[0]]['path'] = [[pt[2], pt[1], pt[0]]
                                                 for pt in ft_new_path[net_i[0]]['path']]

            if not skipped_pair_through_end:
                solved_net_pairs += [(net_o[0], net_i[0])]

        ft_new_route = copy.deepcopy(
            linked_routes_ft[net_o[0]].nodes['']['route'])
        for net_i in list(ft_new_path.items())[::-1]:
            # insert path to previous route
            print("Inserting route: ", net_i[0])
            ft_new_route = insert_list_2_list(
                ft_new_route,
                net_i[1]['path'],
                net_i[1]['pt_ind'][0]-1,  # ft_pt1_i,
                net_i[1]['pt_ind'][1]+1,  # ft_pt2_i
            )
        remove_patch(ft_new_route)

        linked_routes_ft[net_o[0]].nodes['']['route'] = ft_new_route
        # write new path to grid
        add_route_2_grid(
            ft_grid,
            ft_new_route
        )

        # Here the new route can be written to def file ------------
        #     however to validate we will write them to
        #     scad segments
        # convert to scad polyroute
        if out_file is None:
            print_polyroute(
                path=[[pt[2], pt[1], pt[0]] for pt in ft_new_route],
                route_name=net_o[0],
                convert_units=True
            )
        elif isinstance(out_file, str):
            write_polyroute(
                path=[[pt[2], pt[1], pt[0]] for pt in ft_new_route],
                out_file=out_file,
                route_name=net_o[0],
                convert_units=True
            )
