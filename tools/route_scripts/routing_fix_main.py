import os
import sys
import json
import routing_fix
import astar_route
import Astr_grid

# fmt: off
this_file_dir = os.path.abspath(os.path.dirname(__file__))

openmfda_base_dir = os.path.abspath(f'{this_file_dir}/../../openmfda_flow_2up')
if not os.path.exists(openmfda_base_dir):
    raise Exception(f'openmfda_base_dir is not pointing to a valid dir; {openmfda_base_dir}')

sys.path.append(f'{openmfda_base_dir}/src/openmfda_flow')
import def_obj_load

sys.path.append(f'{openmfda_base_dir}/tools/scad_render')
import route_scripts
import component_parse
# fmt: on


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
        # unlink routes

        # connect back with def object

        # write def file
        pass
