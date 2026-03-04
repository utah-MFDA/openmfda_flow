# Version 1.1

import re
import os
import sys
from queue import Queue
from pprint import pprint
import json
import copy

this_file = os.path.abspath(os.path.dirname(__file__))

sys.path.append(this_file)

this_file_dirs = str(this_file).split('/')
print(this_file_dirs)
is_tool = this_file_dirs[-2]

if is_tool == 'tools':
    path_for_omfda = os.path.abspath(f"{this_file}/../..")
else:
    path_for_omfda = os.path.abspath(f"{this_file}/../../openmfda_flow_2up")

if not os.path.exists(path_for_omfda):
    raise Exception(
        f"Not able to find openmfda_flow path; {os.path.abspath(path_for_omfda)}")

src_path = f"{path_for_omfda}/src/openmfda_flow"
print(os.path.abspath(src_path))
tool_path = f"{path_for_omfda}/tools"
flow_path = f"{path_for_omfda}/flow"
results_path = f"{path_for_omfda}/flow/results"

sys.path.append(os.path.abspath(src_path))
sys.path.append(os.path.abspath(tool_path+'/scad_render'))

#fmt:off
from astar_route import insert_list_2_list, \
    add_route_2_grid, \
    get_intersect_indexes, \
    convert_to_segments
from Astar_basic_grid import BlockedPathException
import Astar_basic_grid
import Astr_grid

import component_parse
import route_scripts

import def_obj_load

#fmt:on


def get_intersections2(rt_dict, silent=False):
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
            found_intersects = route_scripts.check_net_intersections(
                [pt for nd in net1[1].nodes for pt in net1[1].nodes[nd]['route']],
                [pt for nd in net2[1].nodes for pt in net2[1].nodes[nd]['route']],
                # silent=silent
            )
            if len(found_intersects) > 0:
                intersection_dict[(net1[0], net2[0])] = found_intersects
    return intersection_dict

# %% dafk


# this function extracts the pt from a list of intersections
#  and condenses the

def extract_intersect_pt_list2(
    inters_dict,
    print_debug=True
):
    # inter fnct
    #   checks if the point already exists in the list of
    #   points to fix in a net
    def add_if_unique(pt, pt_list, dkey=None):
        if dkey is None:
            if pt not in pt_list:
                pt_list.append(pt)
        else:
            if pt not in pt_list[dkey]:
                pt_list[dkey].append(pt)
    # end fnct

    inter_net_list = {}

    for net_pair in inters_dict.items():
        if print_debug:
            print("Extracting from ", net_pair[0])
        net1 = net_pair[0][0]
        net2 = net_pair[0][1]

        if net1 not in inter_net_list:
            inter_net_list[net1] = {}
        inter_net_list[net1][net2] = []

        if net2 not in inter_net_list:
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


def check_if_in_net(pt, net, acc=1e-5):
    for ntpt in net:
        if ntpt == pt:
            return True
    return False


def condense_solve_pts(
    lnk_rts,
    net_o_k,  # outter key
    net_o_pts,  # pts
    net_i_k,  # inner key
    net_i_pts,  # inner points
    solved_net_pairs,
    onet_solved_pts
):

    def insert_new_ptpair(s_list, new_pts):
        for ptpr in s_list:
            if ptpr[0]-1 == new_pts[1]:
                ptpr[0] = new_pts[0]
                return
            elif ptpr[1]+1 == new_pts[0]:
                ptpr[1] = new_pts[1]
                return
        s_list.append(new_pts)

    # ==============================================

    if (net_i_k, net_o_k) in solved_net_pairs:
        print("Skipping ", net_o_k, ":", net_i_k, "; Already solved")
        return

    skipped_pair_through_end = False
    for pt_list in net_i_pts:
        print('pt_list:', pt_list)
        if len(pt_list) == 0:
            print("no pts in list, skipping")
            continue
        if len(pt_list) == 1 and pt_list[0] == 0:
            pt_list = [1, 2]
        if len(pt_list) == 1 and pt_list[0] == len(lnk_rts[net_o_k].nodes['']['route'])-1:
            pt_list = [
                len(lnk_rts[net_o_k].nodes['']['route'])-3,
                len(lnk_rts[net_o_k].nodes['']['route'])-2
            ]
        ft_pt1_i = int(min(pt_list))
        ft_pt2_i = int(max(pt_list))

        if ft_pt1_i > ft_pt2_i:
            print("Indexes are not consistant, pt1 > pt2;",
                  ft_pt1_i, ":", ft_pt2_i)
            temp_pt = ft_pt1_i
            ft_pt1_i = ft_pt2_i
            ft_pt2_i = temp_pt

        if ft_pt1_i < 0:
            print(f"skipping {net_o_k}:{net_i_k}, {ft_pt1_i}")
            skipped_pair_through_end = True
            continue
        if ft_pt1_i == 0:
            # check if pt in net
            if check_if_in_net(
                    lnk_rts[net_o_k
                            ].nodes['']['route'][ft_pt1_i],
                    lnk_rts[net_i_k].nodes['']['route']):
                print(f"skipping {net_o_k}:{net_i_k}, {ft_pt1_i}")
                skipped_pair_through_end = True
                continue
            else:
                print(f"Index {ft_pt1_i}, not in {net_i_k}")
                ft_pt1_i += 1
                if ft_pt1_i == ft_pt2_i:
                    ft_pt2_i += 1
                skipped_pair_through_end = False

        if ft_pt2_i > len(lnk_rts[net_o_k].nodes['']['route'])-1:
            print(
                f"skipping {net_o_k}:{net_i_k}, {ft_pt2_i}/{len(lnk_rts[net_o_k].nodes['']['route'])}")
            skipped_pair_through_end = True
            continue
        elif ft_pt2_i == len(lnk_rts[net_o_k].nodes['']['route'])-1:
            # check if pt in net
            if check_if_in_net(
                    lnk_rts[net_o_k
                            ].nodes['']['route'][ft_pt2_i],
                    lnk_rts[net_i_k].nodes['']['route']):
                print(
                    f"skipping {net_o_k}:{net_i_k}, {ft_pt2_i}/{len(lnk_rts[net_o_k].nodes['']['route'])}")
                skipped_pair_through_end = True
                continue
            else:
                print(f"Index {ft_pt2_i}, not in {net_i_k}")
                ft_pt2_i -= 1
                if ft_pt1_i == ft_pt2_i:
                    ft_pt1_i -= 1
                skipped_pair_through_end = False

        # check if indexes are within previous solved route or are overlapping
        skip_solve_pt_pair = False

        # print("Solved indexes", onet_solved_pts)
        for slvd_net in onet_solved_pts:
            # pair are within
            if ft_pt1_i >= slvd_net[0] and ft_pt2_i <= slvd_net[1]:
                print("Indexes are within previous solutions, skipping")
                print("pts:", slvd_net, "; new_pts:", [ft_pt1_i, ft_pt2_i])
                skip_solve_pt_pair = True

            # pt2 is outside by pt1 is not
            elif ft_pt1_i >= slvd_net[0] and ft_pt1_i <= slvd_net[1]:
                print(
                    f'joining previous solution {slvd_net}:[{ft_pt1_i}, {ft_pt2_i}]')
                slvd_net[1] = ft_pt2_i
                skip_solve_pt_pair = True

            # pt1 is outside by pt2 is not
            elif ft_pt2_i <= slvd_net[1] and ft_pt2_i >= slvd_net[0]:
                print(
                    f'joining previous solution {slvd_net}:[{ft_pt1_i}, {ft_pt2_i}]')
                skip_solve_pt_pair = True

        if skip_solve_pt_pair:
            continue

        # onet_solved_pts += [[ft_pt1_i, ft_pt2_i]]

        # checks if segments are adjacent
        # onet_solved_pts = merge_solve(onet_solved_pts)
        insert_new_ptpair(onet_solved_pts, [ft_pt1_i, ft_pt2_i])

    if not skipped_pair_through_end:
        solved_net_pairs += [(net_o_k, net_i_k)]

    return onet_solved_pts


def create_solve_queue(solve_pts):
    solve_queue = Queue()

    for net in solve_pts.items():
        net_k = net[0]
        if not len(net[1]):
            print(f"No points in {net_k}")
            continue
        net_pts = sorted(net[1], key=lambda x: x[0])
        for ptpr in net_pts:
            solve_queue.put((net_k, (ptpr[0], ptpr[1])))

    return solve_queue


# sq = create_solve_queue(onet_s)


def get_outter_sgmt_pts(lnk_rts, inter_pts_sgmts):
    s_net_pr = []
    s_net_pt = []
    onet_s = {}

    for net_o in inter_pts_sgmts.items():
        net_ok = net_o[0]  # key
        net_opt = net_o[1]  # pts
        if net_ok not in onet_s:
            onet_s[net_ok] = []
        print(f"Condense {net_ok}")
        print(net_opt)
        for net_i in net_opt.items():
            net_ik = net_i[0]
            net_ipt = net_i[1]
            s_net_pt = condense_solve_pts(
                lnk_rts,
                net_ok,
                net_opt,
                net_ik,
                net_ipt,
                s_net_pr,
                onet_s[net_ok]
            )

    return onet_s


def solve_rt(
    pt_pair,
    net_name,
    insert_stack,
    grid,
    rt_dict,
    intersecting_rts,
    write_2_grid=False,
    write_2_grid_val=0
):
    print("net name:", net_name)
    # for i, pt_pair in enumerate(onet_solved_pts):
    # net_o_solved_ind += [[]]
    ft_pt1_i = pt_pair[0] - 1
    ft_pt2_i = pt_pair[1] + 1

    rt = rt_dict[net_name].nodes['']['route']

    ft_pt1 = [int(i) for i in rt[ft_pt1_i]]
    try:
        ft_pt2 = [int(i) for i in rt[ft_pt2_i]]

    except IndexError:
        if net_name not in rt_dict:
            raise IndexError(f"Failed to find {net_name} in netlist")
        # if pt_pair[1] >= len(rt):
        if ft_pt2_i-1 >= len(rt):
            raise IndexError(f"Cannot access {pt_pair[1]} in net len{len(rt)}")

    print("indexs:", ft_pt1_i, ft_pt2_i)

    # remove target route
    # 1 is open
    if write_2_grid:
        add_route_2_grid(
            grid,
            # replace net_o[0] with net name
            rt_dict[net_name].nodes['']['route'],
            v=1
        )

        # Add back routing around segment to be solved
        add_route_2_grid(
            grid,
            rt_dict[net_name
                    ].nodes['']['route'][:ft_pt1_i - 1],
            # v=write_2_grid_val
            v=0
        )
        add_route_2_grid(
            grid,
            rt_dict[net_name
                    ].nodes['']['route'][ft_pt2_i + 1:],
            # v=write_2_grid_val
            v=0
        )

        # Add back intersecting routes
        for net_i2 in intersecting_rts:
            add_route_2_grid(
                grid,
                rt_dict[net_i2[0]].nodes['']['route'],
                v=0
            )
        # for net_i2 in net_o[1].items():
            # add_route_2_grid(
            #     grid,
            #     rt_dict[net_i2[0]].nodes['']['route'],
            #     v=0
            # )

    # set pt to unblocked
    grid.set_value(ft_pt1, 1)
    grid.set_value(ft_pt2, 1)

    # solve path
    # ft_new_path[net_i[0]] = {}
    # ft_new_path.append({})
    # ft_new_path[i]['path'] = Astar_basic_grid.a_star_search(
    #     grid=ft_grid._grid,
    #     src=Astr_grid.convert_pt2grid(ft_pt1),
    #     dest=Astr_grid.convert_pt2grid(ft_pt2)
    # )
    # ft_new_path[i]['pt_ind'] = [ft_pt1_i, ft_pt2_i]

    new_path = {}
    new_path['net'] = net_name
    try:
        new_path['path'] = Astar_basic_grid.a_star_search(
            grid=grid._grid,
            src=Astr_grid.convert_pt2grid(ft_pt1),
            dest=Astr_grid.convert_pt2grid(ft_pt2)
        )
    except BlockedPathException:
        return
    if new_path['path'] is None:
        print(f"No valid path could be found, {net_name}:{pt_pair}")
        return
    new_path['pt_ind'] = [ft_pt1_i, ft_pt2_i]

    # TODO search in reverse and compare lengths
    # ft_new_path_rev = Astar_basic_grid.a_star_search(
    #     grid=ft_grid._grid,
    #     src=Astr_grid.convert_pt2grid(ft_pt2),
    #     dest=Astr_grid.convert_pt2grid(ft_pt1)
    # )

    # combine segements
    # print(ft_new_path)
    new_path['path'] = convert_to_segments(
        new_path['path'])
    # coords don't match : converting here
    new_path['path'] = [[pt[2], pt[1], pt[0]]
                        for pt in new_path['path']]

    # put new route in grid
    if new_path is not None:
        print("Adding path to grid: ", new_path['path'])
        add_route_2_grid(
            grid,
            new_path['path'],
            # rt_dict[net_i2[0]].nodes['']['route'],
            v=0
        )

    insert_stack.append(new_path)

    return new_path


def insert_rt(stack_net, rt_dict, rt_nd=''):
    print("Inserting into route: ", stack_net)
    rt_alias = rt_dict[stack_net['net']].nodes[rt_nd]['route']
    # rt_alias
    rt_dict[stack_net['net']].nodes[rt_nd]['route'] = insert_list_2_list(
        rt_alias,
        stack_net['path'],
        stack_net['pt_ind'][0],  # ft_pt1_i,
        stack_net['pt_ind'][1],  # ft_pt2_i
    )


# linked_routes_ft_cp = copy.deepcopy(linked_routes_ft)

def interate_through_rts(onet_s, lnk_rts, dev_grid):
    sol_q = create_solve_queue(onet_s)
    sol_rts = []
    rt_stack = []

    cur_net = ''
    for rt in iter(sol_q.get, None):
        if cur_net == '':
            cur_net = rt[0]
        # rt = ['rt_name', [pt1, pt2]]
        if rt[0] != cur_net and len(rt_stack) > 0:
            for plrt in iter(rt_stack.pop, None):
                insert_rt(plrt, lnk_rts)
                if len(rt_stack) == 0:
                    break
            cur_net = rt[0]
        solve_rt(
            pt_pair=rt[1],
            net_name=rt[0],
            insert_stack=rt_stack,
            rt_dict=lnk_rts,
            grid=dev_grid,
            intersecting_rts='',  # fix
            write_2_grid=True
        )
        if rt[0] not in sol_rts:
            sol_rts.append(rt[0])

        if sol_q.qsize() == 0:
            break

    # for final routes
    for plrt in iter(rt_stack.pop, None):
        insert_rt(plrt, lnk_rts)
        if len(rt_stack) == 0:
            break

    return rt_stack


def fix_design_route_2(
    trgt_def,
    design_name,
    platform_config,
    lef_list,
    grid_size,
    out_file=None,
    skip_bad_routes=False
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


def main(def_file):
    # load def

    # load route

    # solve

    # write def

    pass


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()

    parser.add_argument("--def_file", required=True)

    args = parser.parse_args()

    main(
        args.def_file
    )
