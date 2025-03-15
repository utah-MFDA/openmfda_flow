#fmt:off
import networkx as nx
import copy
from math import sqrt


#<<<<<<< HEAD
# this script tries to order the routes in consecutive segments
def link_routes(route, route_devs, debug=False, design='', component_list=None,
                components_lef=None, comp_dict=None, pin_list=None,
                report_route=False, subsegment=True, def_scale=1000,
                px_sz=7.6e-3, pt_err=0.05
# =======
# def link_routes(route, route_devs, debug=False, design='', component_list=None,
#                     components_lef=None, comp_dict=None, pin_list=None,
#                     report_route=False, subsegment=True,def_scale=1000,
#                     px_sz = 7.6e-3, pt_err=0.05
# >>>>>>> dafa4f78692090b001f90a8bea2fe60ae248bc31
                ):

    cp_route = copy.deepcopy(route)

    # TODO pass as variable
    s = px_sz  # hard coded scale
    # s1 = s/1000  # hard coded scale
    s1 = px_sz/def_scale
    err = pt_err

    if components_lef is not None:
        if component_list is not None:
            print("Component list not passed!!!!")
        if comp_dict is None:
            print("Reading LEFs")
            import component_parse
            import os

            os.environ["XYCE_WL_GRAPH"] = ''
            comp_dict = {}
            if isinstance(components_lef, str):
                comp_dict = component_parse.ComponentParser(
                ).get_comp_pins_from_lef(components_lef, scale=s)
            elif isinstance(components_lef, list):
                for c_lef in components_lef:
                    new_dict = component_parse.ComponentParser().get_comp_pins_from_lef(c_lef, scale=s)
                    for cmp in new_dict.items():
                        if cmp[0] in comp_dict:
                            print(
                                f"Component {cmp[0]} already read in, skipping")
                        else:
                            comp_dict[cmp[0]] = cmp[1]

    def check_inner(r_list, node, head=False):
        # that inner node is not inside
        if len(r_list) > 4:
            if node in r_list[2:-3]:
                if debug:
                    print(str(node)+" is inner")
                # get sub list
                ii = r_list.index(node)
                if head:
                    l_list = r_list[:ii-1]
                else:
                    l_list = r_list[ii-1:]
                # if head reverse list
                l_list = list(reversed(l_list))
                # reinsert list
                if head:
                    r_list = l_list+r_list[ii:]
                else:
                    r_list = r_list[:ii]+l_list

                if debug:
                    print("new list: "+r_list)
            else:
                if head:
                    r_list.insert(0, node)
                else:
                    r_list.append(node)
        else:
            if head:
                r_list.insert(0, node)
            else:
                r_list.append(node)

    def check_route_ends(r_nodes, r_list):
        r = r_nodes
        if r[0] == r_list[0]:
            if debug:
                print(str(r[0])+" at head")
            check_inner(r_list, r[1], head=True)
            cp_route.pop(ind)
            return True
        elif r[0] == r_list[-1]:
            if debug:
                print(str(r[0])+" at tail")
            check_inner(r_list, r[1], head=False)
            cp_route.pop(ind)
            return True
        elif r[-1] == r_list[0]:
            if debug:
                print(str(r[1])+" at head")
            check_inner(r_list, r[0], head=True)
            cp_route.pop(ind)
            return True
        elif r[-1] == r_list[-1]:
            if debug:
                print(str(r[1])+" at tail")
            check_inner(r_list, r[0], head=False)
            cp_route.pop(ind)
            return True
        else:
            return False

    def check_d_routes(r, d_routes):
        for dr in d_routes:
            if check_route_ends(r, dr['route']):
                return True
        return False

    def subsegment_routes(route, d_routes):
        # check if route head or tail in other routes

        in_routes = []
        in_routes.append({'route': route, 'head': False,
                         'tail': False, 'break': []})
        for dr in d_routes:
            in_routes.append(
                {'route': dr['route'], 'head': False, 'tail': False, 'break': []})

        """
        This function checks if the ends in route_ends_check are in the target route.
        It returns (head|tail|False, pt, pt_ind)
        pt and pt_ind are of the target route
        """
        def check_ends_in_route(route_ends_check, targ_route):
            pt_acc = 1e-4

            def seg_sl(lofl, l_ind):
                return [a[l_ind] for a in lofl]

            def check_pt_vec(p1, p2, acc):
                if isinstance(p1[2], str) and isinstance(p2[2], str):
                    return abs(p1[0]-p2[0]) < acc and \
                        abs(p1[1]-p2[1]) < acc and \
                        p1[2] == p2[2]
                else:
                    return abs(p1[0]-p2[0]) < acc and \
                        abs(p1[1]-p2[1]) < acc and \
                        abs(p1[2]-p2[2]) < acc
            # assume either x1 == x2 or y1 == y2

            def check_pt_in_segment(p1, seg, acc):
                # print(f"Check pair {seg} for {p1}")
                if isinstance(p1[2], str) and isinstance(seg[0][2], str) and isinstance(seg[1][2], str):
                    return p1[0] > min(seg_sl(seg, 0))-acc and \
                        p1[0] < max(seg_sl(seg, 0))+acc and \
                        p1[1] > min(seg_sl(seg, 1))-acc and \
                        p1[1] < max(seg_sl(seg, 1))+acc and \
                        (p1[2] == seg[0][2] or p1[2] == seg[1][2])

                elif isinstance(p1[2], float) and isinstance(seg[0][2], float) and isinstance(seg[1][2], float):
                    return p1[0] > min(seg_sl(seg, 0))-acc and \
                        p1[0] < max(seg_sl(seg, 0))+acc and \
                        p1[1] > min(seg_sl(seg, 1))-acc and \
                        p1[1] < max(seg_sl(seg, 1))+acc and \
                        p1[2] < max(seg_sl(seg, 2))+acc and \
                        p1[2] > min(seg_sl(seg, 2))-acc
                else:
                    raise ValueError(f"mixed pt definitions: {p1}, {seg}")

            # START check ends in route
            pt_acc = err
            prev_pt = None
            for ind, pt in enumerate(targ_route):
                if check_pt_vec(route_ends_check[0], pt, pt_acc):
                    return "head", pt, ind
                if check_pt_vec(route_ends_check[-1], pt, pt_acc):
                    # elif abs(route_ends_check[-1] - pt) < pt_acc:
                    return "tail", pt, ind
                # check between route segments
                elif (prev_pt is not None) and check_pt_in_segment(route_ends_check[0], [pt, prev_pt], pt_acc):
                    return "head_ins", route_ends_check[0], ind
                    pass
                elif (prev_pt is not None) and check_pt_in_segment(route_ends_check[-1], [pt, prev_pt], pt_acc):
                    return "tail_ins", route_ends_check[-1], ind
                    pass
                else:
                    prev_pt = pt

            return False, None, None

        # index does not have a functional impact useful for debugging
        def get_dev(pt, ind=0, supress_output=False):
            # check pins
            if components_lef is None:
                raise Exception(
                    "Lef not imported, cannot check component pins")
            if component_list is None:
                raise Exception(
                    "Component list not passed, cannot check component pins")
            # for c in component_list:
            # if not supress_output:
                # print(f"Checking devs in {self.net}, ind: {ind}")
                # print(f"devs: {self.devs}")
            for d in route_devs:
                c = None
                # check if device is valid component
                for c_i in component_list:
                    if 'dev' in d and d['dev'] == c_i.name:
                        c = c_i
                    elif 'name' in d and d['components'] == c_i.name:
                        c = c_i
                # TODO check for pins
                # if d['dev'] in pin_list.keys():
                if d['dev'] == "PIN" and isinstance(pin_list, list):
                    p = pin_list[d['port']]
                    pos = [
                        [(float(p.fx1)+float(p.lx1))*s1,
                         (float(p.fy1)+float(p.ly1))*s1],
                        [(float(p.fx1)+float(p.lx2))*s1,
                         (float(p.fy1)+float(p.ly2))*s1]
                    ]
                    if not supress_output:
                        print(f"Checking pin {d['port']} at {pos}")
                    if float(pt[0]) > pos[0][0] - err\
                            and float(pt[0]) < pos[1][0] + err \
                            and float(pt[1]) > pos[0][1] - err \
                            and float(pt[1]) < pos[0][1] + err \
                            and pt[2] == p.layer:
                        print("Found", d['port'], "!")
                        return d['port']
                if c is None:
                    continue
                c_pos = [float(c.x1)*c.lef_cv, float(c.y1)*c.lef_cv]
                if not supress_output:
                    print(f'Checking {pt} in {c.name} at {c_pos} {c.dir}')
                is_in_c, comp = comp_dict[c.comp].is_pt_in_pins(
                    [float(pt[0]), float(pt[1])],
                    pos=c_pos,
                    orient=c.dir,
                    layer=pt[2],
                    err=err
                )
                if is_in_c:
                    print("Found", c.name, "!")
                    return c.name
            return False

        #################### BEGIN FUNCTION subsegment ######################

        # check d_routes

        """
        This for loop checks that routing of a new and tags the
        breakpoints where subsegments intersect
        """

        print("Subsegmenting route")
        # TODO what if a break is at another break
        for ind_ends, dr_ends in enumerate(in_routes):
            for ind_srch, dr_srch in enumerate(in_routes):
                if ind_ends == ind_srch:  # this means we are checking the same route, skip
                    continue
                # returns (1) type of return (2) pt value (3) index on segment
                seg_return, out_pt, out_pt_ind = check_ends_in_route(
                    dr_ends['route'], dr_srch['route'])
                if seg_return == "head":
                    # dr_head_in_r[ind_ends] = ind_ch
                    in_routes[ind_ends]['head'] = ind_srch
                    # TODO check if exists, ifso append
                    in_routes[ind_srch]['break'].append(
                        {'pt_ind': out_pt_ind, 'pt': out_pt, 'r_ind': [[ind_ends, 'head']]})
                elif seg_return == "tail":
                    # dr_tail_in_r[ind_ends] = ind_ch
                    in_routes[ind_ends]['tail'] = ind_srch
                    in_routes[ind_srch]['break'].append(
                        {'pt_ind': out_pt_ind, 'pt': out_pt, 'r_ind': [[ind_ends, 'tail']]})
                elif seg_return == "head_ins":
                    in_routes[ind_srch]['route'].insert(out_pt_ind, out_pt)
                    # move break_pts after
                    for br_pts in in_routes[ind_srch]['break']:
                        if br_pts['pt_ind'] >= out_pt_ind:
                            br_pts['pt_ind'] += 1
                    # points segment end to attached segment
                    in_routes[ind_ends]['head'] = ind_srch
                    in_routes[ind_srch]['break'].append({
                        'pt_ind': out_pt_ind,
                        'pt': out_pt,
                        'r_ind': [[ind_ends, 'head']]
                    })
                elif seg_return == "tail_ins":
                    in_routes[ind_srch]['route'].insert(out_pt_ind, out_pt)
                    # move break_pts after
                    for br_pts in in_routes[ind_srch]['break']:
                        if br_pts['pt_ind'] >= out_pt_ind:
                            br_pts['pt_ind'] += 1
                    # points segment end to attached segment
                    in_routes[ind_ends]['tail'] = ind_srch
                    in_routes[ind_srch]['break'].append({
                        'pt_ind': out_pt_ind,
                        'pt': out_pt,
                        'r_ind': [[ind_ends, 'tail']]
                    })
                # stop once ends are found
                if in_routes[ind_ends]['head'] and in_routes[ind_ends]['tail']:
                    break
        if components_lef is not None:
            print("-------------------------------------------")
            # print("-- Checking for internal devs -", self.net)
            for ind_srch, dr_srch in enumerate(in_routes):
                for pt_ind, pt in enumerate(dr_srch['route'][1:-1]):
                    dev_out = get_dev(pt, supress_output=True)
                    if dev_out is not False:
                        # TODO change pin -> port
                        in_routes[ind_srch]['break'].append(
                            {'pt_ind': pt_ind, 'pt': pt, 'r_ind': [[dev_out, 'pin']]})
                        break

        debug = False

        net_G = nx.Graph()

        for ind, r_t in enumerate(in_routes):
            br_count = 0  # since 0 is the head of the route
            last_br_ind = 0
            # we want to go low to high nodes
            r_t['break'] = sorted(r_t['break'], key=lambda k: k['pt_ind'])
            if debug:
                print(f'breaks for {ind}: ', r_t['break'])
            if debug:
                print(f'route: {r_t["route"]}')
            for br_ind, br_pt in enumerate(r_t['break']):
                new_node = f'{ind}_{br_count}'
                # check if node exists; they can be created through add_edge
                if new_node in net_G.nodes:
                    net_G.nodes[new_node]['route'] = r_t['route'][last_br_ind:br_pt['pt_ind']+1]
                else:
                    net_G.add_node(
                        f'{ind}_{br_count}', route=r_t['route'][last_br_ind:br_pt['pt_ind']+1])

                net_G.add_edge(f'{ind}_{br_count}', f'br_{ind}_{br_count}')
                net_G.add_edge(f'{ind}_{br_count+1}',
                               f'br_{ind}_{br_count}')
                # check if node is at 0 or 1; this adds the branching route node and edge
                for ch_end in list(br_pt['r_ind']):
                    # number of breaks in ref route
                    # num_br = len(in_routes[ch_end[0]]["break"])
                    # if ch_end[1] == "head":
                    #     net_G.add_edge(f'{ch_end[0]}_{0}', f'br_{ind}_{br_count}')
                    # elif ch_end[1] == "tail": # we assume last seg is # of break pts
                    #     net_G.add_edge(f'{ch_end[0]}_{num_br}', f'br_{ind}_{br_count}')
                    if isinstance(ch_end[0], int):
                        num_br = len(in_routes[ch_end[0]]["break"])
                        if ch_end[1] == "head":
                            net_G.add_edge(
                                f'{ch_end[0]}_{0}', f'br_{ind}_{br_count}')
                        elif ch_end[1] == "tail":  # we assume last seg is # of break pts
                            net_G.add_edge(
                                f'{ch_end[0]}_{num_br}', f'br_{ind}_{br_count}')
                    elif isinstance(ch_end[0], str):
                        if ch_end[1] == "pin":
                            net_G.add_edge(
                                ch_end[0], f'br_{ind}_{br_count}')
                        else:
                            raise ValueError(
                                f"{ch_end[0]} not a valid input for break pts")
                    else:
                        raise ValueError(
                            f"{ch_end[0]} not a valid input for break pts")
                if debug:
                    print(
                        f"branch route {new_node}: {net_G.nodes[new_node]['route']}")

                last_br_ind = br_pt['pt_ind']
                # for last route in list
                if br_ind == len(r_t['break'])-1:
                    net_G.nodes[f'{ind}_{br_count+1}']['route'] = r_t['route'][last_br_ind:]

                # last_br_ind = br_pt['pt_ind']
                # create final route
                if ind == len(r_t['break'])-1:
                    # last element is == to len? (but it works??? vvvv)
                    net_G.nodes[f'{ind}_{br_count+1}']['route'] = r_t['route'][last_br_ind:len(
                        r_t['route'])]
                    if debug:
                        print(
                            f"last branch route {ind}_{br_count+1}: {net_G.nodes[f'{ind}_{br_count+1}']['route']}")

                br_count += 1

            if len(r_t['break']) == 0:
                if f'{ind}_0' in net_G:
                    net_G.nodes[f'{ind}_0']['route'] = r_t['route']
                else:
                    net_G.add_node(f'{ind}_0', route=r_t['route'])

            if component_list is not None and components_lef is not None:
                if r_t['head'] is False:
                    r_t['head'] = get_dev(r_t['route'][0], ind)
                    # r_t['head'] = {'dev':get_dev(r_t['route'][0], ind)}
                    if r_t['head'] is not False:
                        print(r_t)
                        net_G.nodes[f'{ind}_0']['head'] = r_t['head']
                if r_t['tail'] is False:
                    r_t['tail'] = get_dev(r_t['route'][-1], ind)
                    # r_t['tail'] = {'dev':get_dev(r_t['route'][-1], ind)}
                    if r_t['tail'] is not False:
                        print(r_t)
                        num_br = len(in_routes[ind]["break"])
                        net_G.nodes[f'{ind}_{num_br}']['tail'] = r_t['tail']

        return net_G

    def route_validation(route):
        print(route)
        if not isinstance(route, list):
            raise Exception(
                f"Input route not of correct type, expecting list: {type(route)}")
        for iseg, seg in enumerate(route):
            if not isinstance(seg, list):
                raise Exception(
                    f"Element {iseg} of route not correct type, expecting list: {type(seg)}")
            if len(seg) != 2:
                raise Exception(
                    f"Element {iseg} of route not correct length, should be 2: {len(seg)}")
            if len(seg[0]) != 3 or len(seg[1]) != 3:
                raise Exception(
                    f"Segment points not formated correctly: {seg}")

    #################### BEGIN FUNCTION compress_routes ######################
    route_validation(route)

    nr = []
    d_routes = []
    dangle_routes = False
    count = 0
    # r_len = len(self.route)

    if debug:
        print("initial routes:")
        print(cp_route)

    # while len(nr) + sum([len(x['route']) for x in d_routes]) < r_len+1:
    # while len(self.route) > 1:
    while True:
        if debug:
            print("sr:"+str(len(cp_route))+":"+str(cp_route))
        if len(nr) >= 1 and debug:
            print("nr:"+str(len(nr))+":"+str(nr))
        r_init_len = len(cp_route)
        for ind, r in enumerate(cp_route):
            if len(nr) < 1:
                cp_route.pop(ind)
                nr.append(r[0])
                nr.append(r[1])
                break
            else:
                if debug:
                    print("r:"+str(r))
                if check_route_ends(r, nr):
                    break
                if len(d_routes) > 0:
                    if check_d_routes(r, d_routes):
                        break
                    # for dr in d_routes:
                    #    if check_route_ends(r, dr['route']):
                    #        break
                # no matches
                # check if node is internal
                if len(nr) > 4 and r[0] in nr[2:-3]:
                    d_routes.append({'head': r[0], 'route': r})
                    cp_route.pop(ind)
                    dangle_routes = True
                    print("has dangling route")
                    break
                if len(nr) > 4 and r[1] in nr[2:-3]:
                    d_routes.append({'head': r[1], 'route': r})
                    cp_route.pop(ind)
                    dangle_routes = True
                    print("has dangling route")
                    break
            # TODO start new route after running through entire list
            if ind + 1 == r_init_len:
                # loops again otherwise ind is too large
                if len(cp_route) == r_init_len:
                    d_routes.append({'head': None, 'route': r})
                    cp_route.pop(ind)
                    dangle_routes = True
                    print("has dangling route (Unconnected)")

        if len(cp_route) < 1:
            break

        if debug:
            print('\n')
        count += 1
        if count > 200:
            raise Exception("Unable to complete route before 200 inters")

    # This is for debugging
    if report_route:
        route_report_file = f"routes_out_{design}.txt"
        rep_out = open(route_report_file, 'a+')
        rep_out.write(f"Devs:{route_devs}\nroutes:\n{nr}\n")
        if dangle_routes:
            for r in d_routes:
                rep_out.write(f"{r}\n")

    if dangle_routes and subsegment:
        g_route = subsegment_routes(nr, d_routes)
    else:
        dangling_routes = d_routes
        g_route = nx.Graph()
        g_route.add_node('', route=nr)

    if debug:
        print("Final routes:")
        print(g_route['route'])

    return g_route


def convert_route(route, met_layers, lpv, layer_ht, num_bot_layers):
    rt_cp = copy.deepcopy(route)
    for i, r in enumerate(route):
        if isinstance(r[2], str):
            rt_cp[i][2] = (num_bot_layers + met_layers[r[2]]*lpv)*layer_ht
    return rt_cp


def convert_route_len(route, route_multi):
    for i, r in enumerate(route):
        route[i][0] = (route_multi*r[0])
        route[i][1] = (route_multi*r[1])


def convert_layers(routes, layers_ref, lpv, layer_ht, num_bot_layers):
    if isinstance(routes, list):
        return convert_route(routes, layers_ref, lpv, layer_ht, num_bot_layers)
    elif isinstance(routes, nx.Graph):
        out_route = {}
        for r_node in routes.nodes:
            if 'route' not in routes.nodes[r_node]:
                print(f'skipping {r_node}, no routes')
                continue
            # print("converting route: ",self.net,':', r_node)
            out_route[r_node]['route'] = convert_route(
                routes.nodes[r_node]['route'],
                layers_ref,
                lpv,
                layer_ht,
                num_bot_layers
            )
        return out_route
        # print(new_r)
        # self.route.nodes[r_node]['route'] = new_r
    else:
        raise Exception("Invalid route type")


def convert_lengths(self, net_builder, len_multiplier):
    if isinstance(self.add_route, list):
        self.route = net_builder.convert_route_len(self.route, len_multiplier)
    elif isinstance(self.route, nx.Graph):
        for r_node in self.route.nodes:
            if 'route' not in self.route.nodes[r_node]:
                print(f'skipping {r_node}, no routes')
                continue
            print("converting route: ", self.net, ':', r_node)
            net_builder.convert_route_len(
                self.route.nodes[r_node]['route'], len_multiplier)
            # print(new_r)
            # self.route.nodes[r_node]['route'] = new_r
    else:
        raise Exception("Invalid route type")


def convert_pt(pt_list):
    for pt in pt_list:
        if len(pt[0]) == 3 and len(pt[1]) == 3:
            print(f"skipping {pt}")
        elif len(pt[0]) == 3:
            if isinstance(pt[1], str):
                raise Exception(f"{pt[1]} is not valid for list len 3, {pt}")
            pt[1] += [pt[0][2]]
        elif len(pt[0]) == 2:
            vias = via_table[pt[1]]
            pt[1] = pt[0] + [vias[1]]
            pt[0] += [vias[0]]
        else:
            raise Exception(f"Not able to handle {pt}")
    return pt_list


#
# Check for intersections


def cross(p1, p2): return (p1[0]*p2[1]) - (p1[1]*p2[0])
def dot(p1, p2): return p1[0]*p2[0] + p1[1]*p2[1]


def colin_3pt(p1, p2, p3): return (
    cross([p1[0]-p2[0], p1[1]-p2[1]], [p1[0]-p3[0], p1[1]-p3[1]]) == 0)


def ccw(A,B,C):
    return (C[1]-A[1]) * (B[0]-A[0]) > (B[1]-A[1]) * (C[0]-A[0])


# Return true if line segments AB and CD intersect
def do_lines_cross(A,B,C,D):
    return ccw(A,C,D) != ccw(B,C,D) and ccw(A,B,C) != ccw(A,B,D)


def is_between(p1, p2, p3, fl_acc=0.00001, print_debug=False):
    # check slope, they need to be equal to be on the same line
    # check they both equal zero

    # p12_is0 = (p1[0]-p2[0]) == 0
    # p13_is0 = (p1[0]-p3[0]) == 0
    # if (not p12_is0 and not p13_is0):
    #     slope_d = ((float(p1[1])-float(p2[1]))/(float(p1[0])-float(p2[0])) -
    #                (float(p1[1])-float(p3[1]))/(float(p1[0])-float(p3[0])))
    #     if slope_d >= fl_acc:
    #         return False
    # elif (p12_is0 and not p13_is0) or (not p12_is0 and p13_is0):
    #     return False
    # else:
    slope_d = "ncalc"

    v_12 = [p1[0]-p2[0], p1[1]-p2[1]]
    v_13 = [p1[0]-p3[0], p1[1]-p3[1]]

    X_p = cross(v_12, v_13)
    K_13 = dot(v_12, v_13)
    K_12 = dot(v_12, v_12)

    if (X_p <= fl_acc) and (X_p >= -fl_acc) and (K_13 >= 0) and (K_13 <= K_12):
        if print_debug:
            print("Xp:", X_p, ", K_13:", K_13, ", K_12:", K_12, ", dy/dx:", slope_d)
        return True
    else:
        return False


def check_net_intersections(net1, net2, fl_acc=0.00001):
    intersections = []

    def is_via(pt1, pt2):
        return not (pt1[2] == pt2[2])

    def is_via_sgmt(sg):
        return not (sg[0][2] == sg[1][2])

    def check_pt_eq(pt1, pt2):
        if isinstance(pt1[2], float):
            return abs(pt1[0]-pt2[0]) < fl_acc and \
                abs(pt1[1]-pt2[1]) < fl_acc and \
                abs(pt1[2]-pt2[2]) < fl_acc
        elif isinstance(pt1[2], int):
            return abs(pt1[0]-pt2[0]) < fl_acc and \
                abs(pt1[1]-pt2[1]) < fl_acc and \
                abs(pt1[2]-pt2[2]) < fl_acc
        elif isinstance(pt1[2], str):
            return abs(pt1[0]-pt2[0]) < fl_acc and \
                abs(pt1[1]-pt2[1]) < fl_acc and \
                pt1[2] == pt2[2]
        raise ValueError(f"Type not supported {pt1[2]}; {pt1}, {pt2}")

    for i1, ntpt1 in enumerate(net1[:-1]):
        for i2, ntpt2 in enumerate(net2[:-1]):
            sg1 = [ntpt1, net1[i1+1]]
            sg2 = [ntpt2, net2[i2+1]]
            # chcck if both are vias
            if is_via(sg1[0], sg1[1]) and \
                    is_via(sg2[0], sg2[1]):
                # if check_pt_eq(ntpt1, ntpt2) and check_pt_eq(net1[i1+1], net2[i2]+1):
                if check_pt_eq(ntpt1, ntpt2) and check_pt_eq(net1[i1+1], net2[i2+1]):
                    print(f"Via {sg1} == {sg2}")
                    # intersections.append((i1, i2))
                    intersections.append(("via", sg1, sg2))
                elif check_pt_eq(sg1[0], sg2[0]):
                    intersections.append(("via", sg1[0], sg2[0]))
                elif check_pt_eq(sg1[0], sg2[1]):
                    intersections.append(("via", sg1[0], sg2[1]))
                elif check_pt_eq(sg1[1], sg2[0]):
                    intersections.append(("via", sg1[1], sg2[0]))
                elif check_pt_eq(sg1[1], sg2[1]):
                    intersections.append(("via", sg1[1], sg2[1]))
                else:
                    continue
            # we have checked is both are vias
            #  check if one is a via
            elif is_via_sgmt(sg1):
                if sg1[0][2] == sg2[0][2]:
                    if is_between(sg2[0], sg2[1], sg1[0], fl_acc, 1):
                        print(f"(1.1) pt {sg1[0]} is in {sg2}")
                        intersections.append(('via_pt', sg1[0], sg2))
                elif sg1[1][2] == sg2[0][2]:
                    if is_between(sg2[0], sg2[1], sg1[1], fl_acc, 1):
                        print(f"(1.2) pt {sg1[1]} is in {sg2}")
                        intersections.append(('via_pt', sg1[1], sg2))
            elif is_via_sgmt(sg2):
                if sg2[0][2] == sg1[0][2]:
                    if is_between(sg1[0], sg1[1], sg2[0], fl_acc, 1):
                        print(f"(1.3) pt {sg2[0]} is in {sg1}")
                        intersections.append(('via_pt', sg1, sg2[0]))
                elif sg2[1][2] == sg1[0][2]:
                    if is_between(sg1[0], sg1[1], sg2[1], fl_acc, 1):
                        print(f"(1.4) pt {sg2[1]} is in {sg1}")
                        intersections.append(('via_pt', sg1, sg2[1]))
            # both are segments
            else:
                if isinstance(sg1[0][2], str) and sg1[0][2] != sg2[0][2] or \
                        isinstance(sg1[0][2], float) and abs(sg1[0][2]-sg2[0][2]) >= fl_acc or \
                        isinstance(sg1[0][2], int) and abs(sg1[0][2]-sg2[0][2]) >= fl_acc:
                    continue
                else:
                    if is_between(sg1[0], sg1[1], sg2[0], fl_acc) or \
                            is_between(sg1[0], sg1[1], sg2[1], fl_acc) or \
                            is_between(sg2[0], sg2[1], sg1[0], fl_acc) or \
                            is_between(sg2[0], sg2[1], sg1[1], fl_acc):
                        intersections.append(('sgmt', sg1, sg2))
                    elif do_lines_cross(sg1[0], sg1[1], sg2[0], sg2[1]):
                        intersections.append(('sgmt', sg1, sg2))
                    else:
                        continue
    return intersections


def check_net_intersections_from_sgmt_list(net1, net2, fl_acc=0.001):
    intersections = []

    def is_via(sg):
        if len(sg[0]) == 3 and len(sg[1]) == 3:
            return not (sg[0][2] == sg[1][2])
        else:
            raise ValueError(sg)

    for i1, sg1 in enumerate(net1):
        for i2, sg2 in enumerate(net2):
            # chcck if both are vias
            if is_via(sg1) and is_via(sg2):
                if sg1 == sg2:
                    print(f"Via {sg1} == {sg2}")
                    intersections.append((i1, i2))
                else:
                    continue
            # we have checked is both are vias
            if is_via(sg1):
                if sg1[0][2] == sg2[0][2]:
                    if is_between(sg2[0], sg2[1], sg1[0], fl_acc):
                        print(f"(1.1) pt {sg1[0]} is in {sg2}")
                        intersections.append((i1, i2))
                elif sg1[1][2] == sg2[0][2]:
                    if is_between(sg2[0], sg2[1], sg1[1], fl_acc):
                        print(f"(1.2) pt {sg1[1]} is in {sg2}")
                        intersections.append((i1, i2))
            elif is_via(sg2):
                if sg2[0][2] == sg1[0][2]:
                    if is_between(sg1[0], sg1[1], sg2[0], fl_acc):
                        print(f"(1.3) pt {sg2[0]} is in {sg1}")
                        intersections.append((i1, i2))
                elif sg2[1][2] == sg1[0][2]:
                    if is_between(sg1[0], sg1[1], sg2[1], fl_acc):
                        print(f"(1.4) pt {sg2[1]} is in {sg1}")
                        intersections.append((i1, i2))
            # both are segments
            else:
                if sg1[0][2] != sg2[0][2]:
                    continue
                else:
                    if is_between(sg1[0], sg1[1], sg2[0], fl_acc) or \
                            is_between(sg1[0], sg1[1], sg2[1], fl_acc) or \
                            is_between(sg2[0], sg2[1], sg1[0], fl_acc) or \
                            is_between(sg2[0], sg2[1], sg1[1], fl_acc):
                        intersections.append((i1, i2))
                    else:
                        continue
    return intersections


# ================================
# U detection and fixes


def is_via_from_pts(pt1, pt2):
    return (pt1[0] == pt2[0]) and (pt1[1] == pt2[1]) and pt1[2] != pt2[2]


def is_intersected(A, B, C, D):
    def ccw(a, b, c):
        return (c[1]-a[1]) * (b[0]-a[0]) > (b[1]-a[1]) * (c[0]-a[0])
    return ccw(A, C, D) != ccw(B, C, D) and ccw(A, B, C) != ccw(A, B, D)


def line_len(A, B):
    return sqrt((B[1]-A[1])**2 + (B[0]-A[0])**2)


def is_seg_intersect(sg1, sg2):
    return sg1[0][2] == sg1[1][2] and \
        sg2[0][2] == sg2[1][2] and \
        sg1[0][2] == sg2[0][2] and \
        is_intersected(sg1[0], sg1[1], sg2[0], sg2[1])


"""
o-----o
|     |
o - - o

Of 4 pts we have the two otter form two vias and the ceneter be a segment
    we then need to check that no other segment intersects it.

We assume the route is an ordered list of points.

"""


def u_adjustments(route, other_rt=None, u_len_limit=0.0, skip_intersection_check=False):
    # nothing can be done too short.
    if len(route) < 4:
        return route

    new_route = []

    rt_iter = enumerate(route[3:])
    for ip, pt in rt_iter:
        if is_via_from_pts(route[ip], route[ip+1]) and \
                is_via_from_pts(route[ip+2], route[ip+3]) and \
                (not is_via_from_pts(route[ip+1], route[ip+2])) and \
                route[ip][2] == route[ip+3][2]:
            print(f"Segment len {line_len(route[ip+1], route[ip+2])}.")

            if line_len(route[ip+1], route[ip+2]) < u_len_limit:
                print(f"Removing {route[ip+1]} and {route[ip+2]}")
                new_seg=[route[ip], route[ip+3]]
                print(f"New segment {new_seg}")

                if not skip_intersection_check and other_rt is not None:
                    has_intersect=False
                    for rt in other_rt:
                        for iopt, opt in enumerate(rt[:-1]):
                            if is_seg_intersect(new_seg, [opt, rt[iopt+1]]):
                                has_intersect=True
                        if has_intersect:
                            print("Intersection found in new segment")
                            break
                    if has_intersect:  # default behavior
                        new_route.append(route[ip])
                        # if ip == len(route)-3:
                        #     new_route.append(route[ip+1])
                        #     new_route.append(route[ip+2])
                        #     new_route.append(route[ip+3])

                    else:  # no intersection
                        # append segment
                        new_route.append(new_seg[0])
                        new_route.append(new_seg[1])
                        # skip 3 pts
                        next(rt_iter, None)  # None is default return
                        next(rt_iter, None)
                        next(rt_iter, None)
                        if ip == len(route)-5:
                            new_route.append(route[ip+4])
                        if ip == len(route)-6:
                            new_route.append(route[ip+4])
                            new_route.append(route[ip+5])
                        if ip == len(route)-7:
                            new_route.append(route[ip+4])
                            new_route.append(route[ip+5])
                            new_route.append(route[ip+6])

                else:  # skip intersection check
                    if skip_intersection_check:
                        print("skipping intersectio check other_rt == None")
                    # append segment
                    new_route.append(new_seg[0])
                    new_route.append(new_seg[1])
                    # skip 3 pts
                    next(rt_iter, None)
                    next(rt_iter, None)
                    next(rt_iter, None)
                    if ip == len(route)-5:
                        new_route.append(route[ip+4])
                    if ip == len(route)-6:
                        new_route.append(route[ip+4])
                        new_route.append(route[ip+5])
                    if ip == len(route)-7:
                        new_route.append(route[ip+4])
                        new_route.append(route[ip+5])
                        new_route.append(route[ip+6])

            else:  # len too short
                new_route.append(route[ip])
                # if ip == len(route)-3:
                #     new_route.append(route[ip+1])
                #     new_route.append(route[ip+2])
                #     new_route.append(route[ip+3])

        else:  # no vias
            new_route.append(route[ip])
        if ip == len(route)-4:
            new_route.append(route[ip+1])
            new_route.append(route[ip+2])
            new_route.append(route[ip+3])

    print(new_route)
    return new_route
