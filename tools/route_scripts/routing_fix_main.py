import os
import sys
import json
import routing_fix
import astar_route
import Astr_grid

# fmt: off
this_file_dir = os.path.abspath(os.path.dirname(__file__))

is_tool = str(this_file_dir).split('/')[-2]

if is_tool == 'tools':
    openmfda_base_dir = os.path.abspath(f'{this_file_dir}/../../')
    print(openmfda_base_dir)
else:
    openmfda_base_dir = os.path.abspath(f'{this_file_dir}/../../openmfda_flow_2up')

if not os.path.exists(openmfda_base_dir):
    raise Exception(f'openmfda_base_dir is not pointing to a valid dir; {openmfda_base_dir}')

sys.path.append(f'{openmfda_base_dir}/src/openmfda_flow')
import def_obj_load

sys.path.append(f'{openmfda_base_dir}/tools/scad_render')
import route_scripts
import component_parse
# fmt: on


def transfer_comp(new_netlist, old_netlist):
    for rt, net_val in new_netlist.items():
        for comp, port in old_netlist[rt].net_components.items():
            net_val.add_component(comp, port)


def format_netlist_2_def(net_list):
    nets = {}
    for net, sgmts in net_list.items():
        new_net = def_obj_load.Net(
            net
        )
        for sind, s_data in enumerate(sgmts):
            if sind == 0:
                new_net.add_segment(
                    s_layer=s_data['layer'],
                    s_pt1=s_data['pt1'],
                    s_pt2=s_data['pt2'],
                )
            else:
                new_net.add_segment(
                    s_layer=s_data['layer'],
                    s_pt1=s_data['pt1'],
                    s_pt2=s_data['pt2']
                )

        new_net.net_segments[0].init_segment = True

        nets[net] = new_net

    return nets


def lnk_pts_2_def_obj(
    lnk_rt,
    convert_factor_grid,
    convert_factor_layer,
    platform_config,
    export_int=True,
    ignore_layer_cp=False
):
    def add_via(pt_1, pt_2):
        pass

    net_list = {}

    via_map = platform_config['via_map']
    met_via_map = {}
    for v, mets in via_map.items():
        met_via_map[(mets[0], mets[1])] = v

    # invert layer map
    met_map = platform_config['layers']
    lay_map = {}
    for met, lay in met_map.items():
        if lay in lay_map.keys():
            if ignore_layer_cp:
                print(f'Skipping {met} as {lay} already exists')
                continue
            else:
                raise ValueError(
                    'Duplicate layer {met} as {lay} already exists')
        lay_map[lay] = met

    for rt, segs in lnk_rt.items():
        segment_list = []
        via_list = []
        for br in segs.nodes:
            pt1_iter = iter(segs.nodes[br]['route'])
            for pt2 in segs.nodes[br]['route'][1:]:
                pt1 = next(pt1_iter)

                if export_int:
                    exp_seg = [
                        [int(pt1[0]*convert_factor_grid),
                         int(pt1[1]*convert_factor_grid)],
                        [int(pt2[0]*convert_factor_grid),
                         int(pt2[1]*convert_factor_grid)]
                    ]
                    # if isinstance(pt1[2], str):
                else:
                    exp_seg = [
                        [pt1[0]*convert_factor_grid,
                         pt1[1]*convert_factor_grid],
                        [pt2[0]*convert_factor_grid,
                         pt2[1]*convert_factor_grid]
                    ]

                is_via = (
                    pt1[2] != pt2[2]
                )

                if is_via:
                    mets_stack = []

                    es = sorted([pt1[2], pt2[2]], key=lambda x: x)

                    if es[1] - es[0] >= 2:
                        for i in range(es[0], es[1]):
                            exp_layer = (
                                lay_map[i],
                                lay_map[i+1]
                            )
                            mets_stack += [exp_layer]
                    else:
                        exp_layer = tuple(lay_map[a] for a in es)
                        mets_stack = [(exp_layer[0], exp_layer[1])]

                    for mets2 in mets_stack:

                        # determine which vias
                        via = met_via_map[mets2]

                        # replace pt

                        # add point
                        via_list += [{
                            'pt1': exp_seg[0],
                            'pt2': via,
                            'layer': exp_layer[0]
                        }]

                else:
                    # create segement

                    segment_list += [{
                        'pt1': exp_seg[0],
                        'pt2': exp_seg[1],
                        'layer': exp_layer[0]
                    }]

        # add segments to routes
        net_list[rt] = segment_list + via_list

    return net_list


def fix_routes(
    def_file,
    design_name,
    platform_config_file,
    lef_files,
    out_def=None,
    grid_size=[0, 0, 0],
    def_scale=1000,
    write_polyroute=False
):
    # ---------------------------------------
    # load def_file
    def_obj = def_obj_load.Design().import_def(os.path.abspath(def_file))

    # TODO iterate for multiple modules
    design_obj = def_obj['design'][design_name]

    platform_conf = json.load(open(platform_config_file))

    # ---------------------------------------
    # convert nets
    lnk_routes = {}

    for net in design_obj.nets.keys():
        lnk_routes[net] = route_scripts.link_routes(
            route=design_obj.nets[net].export_as_list(
                as_3pts=True, via_map=platform_conf["via_map"]),
            route_devs=[{'dev': c[1].component_type}
                        for c in design_obj.components.items()],
            components_lef=lef_files,
            component_list=design_obj.export_component_obj_list()
        )

    # in astar_route
    lnk_routes = astar_route.link_def_segments(
        design_obj,
        lef_files,
        platform_conf["via_map"]
    )

    # ---------------------------------------
    # convert routing pts to grid pts

    if 'def_scale' in def_obj:
        def_scale = def_obj['def_scale']

    int_convert_d = (1/def_scale) * platform_conf['def_grid_scale']

    for net in lnk_routes.items():
        print(net[0])
        for rt in [net[1].nodes[r]['route'] for r in net[1].nodes]:
            print("before: ", rt)
            for pt in rt:
                pt[2] = platform_conf["layers"][pt[2]]
                # check distance from grid
                if (pt[1] % platform_conf["def_grid_scale"]) < int_convert_d:
                    pt[1] = int(pt[1]/platform_conf["def_grid_scale"])
                else:
                    pt[1] = pt[1]/platform_conf["def_grid_scale"]
                if (pt[0] % platform_conf["def_grid_scale"]) < int_convert_d:
                    pt[0] = int(pt[0]/platform_conf["def_grid_scale"])
                else:
                    pt[0] = pt[0]/platform_conf["def_grid_scale"]
            print("after: ", rt)

    # in astar_route
    seg_inters = astar_route.get_intersections(lnk_routes)

    ex_inter_pts = routing_fix.extract_intersect_pt_list2(
        seg_inters,
    )

    # where is this function found?
    inter_pts_sgmts = astar_route.get_intersect_indexes(
        ex_inter_pts,
        lnk_routes
    )

    o_net_sol = routing_fix.get_outter_sgmt_pts(
        lnk_rts=lnk_routes,
        inter_pts_sgmts=inter_pts_sgmts
    )

    sol_q = routing_fix.create_solve_queue(o_net_sol)

    # --------------------------------------------------
    # initialize solver
    if 0 in grid_size:
        raise ValueError('grid size contains a zero in an index')

    G_col = grid_size[0]
    G_row = grid_size[1]
    G_lay = grid_size[2]

    solv_grid = Astr_grid.AStr_grid(G_col, G_row, G_lay)

    CompP = component_parse.ComponentParser()

    loaded_lefs = []
    for leff in lef_files:
        loaded_lefs.append(CompP.parser_file(in_file=leff))

    # I think I can unload CompP

    # put into a dict
    lef_dict = loaded_lefs[0]
    if len(loaded_lefs) > 1:
        for l in loaded_lefs[1:]:
            lef_dict.update(l)

    # in astar_route
    astar_route.initialize_components_in_grid(
        solv_grid,
        design_obj.components,
        lef_dict,
        layers_map=platform_conf["layers"]
    )

    # -------------------------------------------------------
    # Fix the routes

    sol_rts = []
    rt_stack = []

    cur_net = ''
    for rt in iter(sol_q.get, None):
        if cur_net == '':
            cur_net = rt[0]
        # rt = ['rt_name', [pt1, pt2]]
        if rt[0] != cur_net and len(rt_stack) > 0:
            for plrt in iter(rt_stack.pop, None):
                # function not found
                routing_fix.insert_rt(plrt, lnk_routes)
                if len(rt_stack) == 0:
                    break
            cur_net = rt[0]
        routing_fix.solve_rt(
            pt_pair=rt[1],
            net_name=rt[0],
            insert_stack=rt_stack,
            rt_dict=lnk_routes,
            intersecting_rts='',
            grid=solv_grid,
            write_2_grid=True
        )
        if rt[0] not in sol_rts:
            sol_rts.append(rt[0])

        if sol_q.qsize() == 0:
            break

    # for final routes
    for plrt in iter(rt_stack.pop, None):
        # function not found
        routing_fix.insert_rt(plrt, lnk_routes)
        if len(rt_stack) == 0:
            break

    if write_polyroute:
        fix_polyroute_out = 'fix_polyroute.scad'
        f = open(fix_polyroute_out, '+w')
        f.close()
        for rt in lnk_routes.items():
            astar_route.write_polyroute(
                path=[[pt[2], pt[1], pt[0]]
                      for pt in rt[1].nodes['']['route']],
                out_file=fix_polyroute_out,
                route_name=rt[0],
                convert_units=True,
                mode='a'
            )

    if out_def is not None:
        print(f"Writing to file: {out_def}")
        # unlink routes
        new_net_list = format_netlist_2_def(
                lnk_pts_2_def_obj(
                    lnk_rt=lnk_routes,
                    convert_factor_grid=platform_conf["def_grid_scale"],
                    convert_factor_layer=1,
                    platform_config=platform_conf,
                    export_int=True,
                    ignore_layer_cp=False
                )
        )

        transfer_comp(
            new_net_list,
            def_obj['design'][design_name].nets
        )

        from pprint import pp
        pp(new_net_list)

        # connect back with def object
        def_obj['design'][design_name].nets = new_net_list

        # write def file
        def_obj['design'][design_name].write_def(
            out_def if len(
                out_def) > 4 and out_def[-4:] == '.def' else f'{out_def}.def'
        )

    return lnk_routes
