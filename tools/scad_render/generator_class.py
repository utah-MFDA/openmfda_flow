# fmt:off
import json
import regex, mmap, re
import networkx as nx

# custom classes
# import lef_component_class as lcc


class Nets:

    def __init__(
        self,
        net = None,
        devs = None,
        #dev1 = None,
        #p1 = None,
        #dev2 = None,
        #p2 = None,
        ):

        self.net = net
        #self.dev1 = dev1
        #self.p1   = p1
        #self.dev2 = dev2
        #self.p2   = p2
        self.devs = devs
        self.route = []
        self.compress = False
        self.route_len = 0

        self.dangle_routes = False

        # assumed False until routes added
        self.needs_layers_converted = False

        # tlef definitions

    def add_route(self,
        layer = None,
        x1 = None,
        y1 = None,
        z1 = None,
        x2 = None,
        y2 = None,
        z2 = None,
        via= None,
        debug = False
                  ):

        if isinstance(z1, str):
            self.needs_layers_converted = True
        elif isinstance(z1, float):
            pass
        nr = None
        if debug: print(" x2:",x2," via:", via)

        if (via is not None) and (x2 is not None):
            raise ValueError("Cannot both define 'via' and 'x2'")
        # check stars
        elif x2 is not None:
            nr = [[x1, y1, z1], [x2, y2, z2]]
        elif via is not None:
            nr = [[x1, y1, z1], [via]]
        if nr is None:
            raise ValueError("Not able to assign route a value")

        #print('Adding route: '+str(nr))
        self.route.append(nr)

    def calc_len_funct(self, in_route=None):
        if isinstance(in_route, type(None)):
            in_route=self.route

        if isinstance(in_route, list):
            if len(in_route) == 0:
                raise Exception(f"Empty route {in_route}")
            else:
                pass
        else:
            raise ValueError(f'in_route is {type(in_route)}; should be list')

        if not self.compress:
            raise Exception("Routes need compression")
        if self.needs_layers_converted:
            raise Exception("Run convert_layers() before calculating length")
        r_len = 0
        for i, r in enumerate(in_route):
            if i == 0:
                # print(len(in_route))
                # print("in_route:",in_route, ", len:", len(in_route))
                continue
            else:
                r_lenx = abs(in_route[i-1][0] - in_route[i][0])**2
                r_leny = abs(in_route[i-1][1] - in_route[i][1])**2
                r_lenz = abs(in_route[i-1][2] - in_route[i][2])**2
                r_len += (r_lenx+r_leny+r_lenz)**(1/2)

        return r_len
        #self.route_len = r_len

    def calc_len(self):
        print(f"calc len {self.net}")
        if isinstance(self.route, nx.Graph):
            print(self.route.nodes)
            len_dict = {}
            for nd in self.route.nodes:
                if 'route' in self.route.nodes[nd]:
                    print(self.route.nodes[nd]['route'])
                    len_dict[nd] = self.calc_len_funct(self.route.nodes[nd]['route'])
                else:
                    print('skipping length calc for', nd)
            self.route_len = len_dict
        else:
            self.route_len = self.calc_len_funct()

    def report_len(self):
        if self.route_len == 0:
            self.calc_len()
        return self.route_len

    def report_route_graph(self):
        print("Reporting routing graph")
        for r in list(self.route.nodes):
            # print("head",self.route.nodes[r]['head'])
            if 'tail' in self.route.nodes[r]:
                print("tail",self.route.nodes[r]['tail'], 'at', r)
                self.route.add_node(self.route.nodes[r]['tail'], component='')
                self.route.add_edge(r, self.route.nodes[r]['tail'])
            if 'head' in self.route.nodes[r]:
                print("head",self.route.nodes[r]['head'], 'at', r)
                self.route.add_node(self.route.nodes[r]['head'], component='')
                self.route.add_edge(r, self.route.nodes[r]['head'])
        return nx.node_link_data(self.route)

    def convert_layers(self, net_builder):
        if isinstance(self.add_route, list):
            self.route = net_builder.convert_route(self.route)
        elif isinstance(self.route, nx.Graph):
            for r_node in self.route.nodes:
                if 'route' not in self.route.nodes[r_node]:
                    print(f'skipping {r_node}, no routes')
                    continue
                print("converting route: ",self.net,':', r_node)
                net_builder.convert_route(self.route.nodes[r_node]['route'])
                # print(new_r)
                # self.route.nodes[r_node]['route'] = new_r
        else:
            raise Exception("Invalid route type")
        self.needs_layers_converted = False

                # self.route[r_node]['route'] = \
                #     net_builder.convert_route(self.route.nodes[r_node]['route'])


    def compress_routes(self, debug=False, design='', component_list=None, components_lef=None, comp_dict=None, pin_list=None, report_route=False, subsegment=True):

        if self.compress:
            raise Exception("Routes already compressed")

        self.compress = True

        #TODO pass as variable
        s = 7.6/1000  # hard coded scale
        s1 = s/1000  # hard coded scale
        err = 0.05

        if components_lef is not None:
            if component_list is not None:
                print("Component list not passed!!!!")
            if comp_dict is None:
                print("Reading LEFs")
                import component_parse
                import os


                os.environ["XYCE_WL_GRAPH"] = ''
                # with open(components_lef, 'r') as f:
                # component pins can be checked by
                # def is_pt_in_pins(self, pt, pos=None, layer=None):
                #get_comp_pins_from_lef
                # comp_dict = component_parse.ComponentParser().parser_multi_file(components_lef)
                comp_dict = {}
                if isinstance(components_lef, str):
                    comp_dict = component_parse.ComponentParser().get_comp_pins_from_lef(components_lef, scale=s)
                elif isinstance(components_lef, list):
                    for c_lef in components_lef:
                        new_dict = component_parse.ComponentParser().get_comp_pins_from_lef(c_lef, scale=s)
                        for cmp in new_dict.items():
                            if cmp[0] in comp_dict:
                                print(f"Component {cmp[0]} already read in, skipping")
                            else:
                                comp_dict[cmp[0]] = cmp[1]


        def check_inner(r_list, node, head=False):
            # that inner node is not inside
            if len(r_list) > 4:
                if node in r_list[2:-3]:
                    if debug: print(str(node)+" is inner")
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
                if debug: print(str(r[0])+" at head")
                check_inner(r_list, r[1], head=True)
                self.route.pop(ind)
                return True
                #rn.insert(0, r[1])
            elif r[0] == r_list[-1]:
                if debug: print(str(r[0])+" at tail")
                check_inner(r_list, r[1], head=False)
                self.route.pop(ind)
                return True
                #rn.append(r[1])
            elif r[-1] == r_list[0]:
                if debug: print(str(r[1])+" at head")
                check_inner(r_list, r[0], head=True)
                self.route.pop(ind)
                return True
                #rn.insert(0, r[0])
            elif r[-1] == r_list[-1]:
                if debug: print(str(r[1])+" at tail")
                check_inner(r_list, r[0], head=False)
                self.route.pop(ind)
                return True
                #rn.append(0, r[0])
            else:
                return False

        def check_d_routes(r, d_routes):
            for dr in d_routes:
                if check_route_ends(r, dr['route']):
                    return True
            return False

        def subsegment_routes(route, d_routes):
            # check if route head or tail in other routes
            #r_head_in_dr = False
            #r_tail_in_dr = False

            # It is assumed in this method we do not have loops in a 'wire'

            dr_head_in_r = [False]*(len(d_routes)+1)
            dr_tail_in_r = [False]*(len(d_routes)+1)

            in_routes = []
            in_routes.append({'route':route, 'head':False, 'tail':False, 'break':[]})
            for dr in d_routes:
                in_routes.append({'route':dr['route'], 'head':False, 'tail':False, 'break':[]})

            """
            This function checks if the ends in route_ends_check are in the target route.
            It returns (head|tail|False, pt, pt_ind)
            pt and pt_ind are of the target route
            """
            def check_ends_in_route(route_ends_check, targ_route):
                def seg_sl(lofl, l_ind):
                    return [a[l_ind] for a in lofl]
                def check_pt_vec(p1, p2, acc):
                    if isinstance(p1[2], str) and isinstance(p2[2], str):
                        return abs(p1[0]-p2[0])<acc and \
                            abs(p1[1]-p2[1])<acc and \
                            p1[2] == p2[2]
                    else:
                        return abs(p1[0]-p2[0])<acc and \
                            abs(p1[1]-p2[1])<acc and \
                            abs(p1[2]-p2[2])<acc
                pt_acc = 1e-4
                # assume either x1 == x2 or y1 == y2
                def check_pt_in_segment(p1, seg, acc):
                    print(f"Check pair {seg} for {p1}")
                    if isinstance(p1[2], str) and isinstance(seg[0][2], str) and isinstance(seg[1][2], str):
                        return p1[0] > min(seg_sl(seg, 0))-acc and \
                            p1[0] < max(seg_sl(seg, 0))+acc and \
                            p1[1] > min(seg_sl(seg, 1))-acc and \
                            p1[1] < max(seg_sl(seg, 1))+acc and \
                            (p1[2] == seg[0][2] or p1[2] == seg[1][2])
                            #abs(p1[0] - seg[1][0])<acc and \
                            #abs(p1[1])<acc and \
                    elif isinstance(p1[2], float) and isinstance(seg[0][2], float) and isinstance(seg[1][2], float):
                        return p1[0] > min(seg_sl(seg, 0))-acc and \
                            p1[0] < max(seg_sl(seg, 0))+acc and \
                            p1[1] > min(seg_sl(seg, 1))-acc and \
                            p1[1] < max(seg_sl(seg, 1))+acc and \
                            p1[2] < max(seg_sl(seg, 2))+acc and \
                            p1[2] > min(seg_sl(seg, 2))-acc
                        # return abs(p1[0])<acc and \
                        #     abs(p1[1])<acc and \
                        #     abs(p1[2])<acc
                    else:
                        raise ValueError(f"mixed pt definitions: {p1}, {seg}")
                ### START check ends in route
                pt_acc = err
                prev_pt= None
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
                    raise Exception("Lef not imported, cannot check component pins")
                if component_list is None:
                    raise Exception("Component list not passed, cannot check component pins")
                # for c in component_list:
                if not supress_output:
                    print(f"Checking devs in {self.net}, ind: {ind}")
                    print(f"devs: {self.devs}")
                for d in self.devs:
                    c = None
                    # check if device is valid component
                    for c_i in component_list:
                        if d['dev'] == c_i.name:
                            c = c_i
                    # TODO check for pins
                    # if d['dev'] in pin_list.keys():
                    if d['dev'] == "PIN":
                        p = pin_list[d['port']]
                        pos = [[(float(p.fx1)+float(p.lx1))*s1, (float(p.fy1)+float(p.ly1))*s1],
                               [(float(p.fx1)+float(p.lx2))*s1, (float(p.fy1)+float(p.ly2))*s1]]
                        if not supress_output:
                            print(f"Checking pin {d['port']} at {pos}")
                        if float(pt[0]) > pos[0][0] - err\
                            and float(pt[0]) < pos[1][0] + err \
                            and float(pt[1]) > pos[0][1] - err \
                            and float(pt[1]) < pos[0][1] + err \
                            and pt[2] == p.layer:
                            print("Found", d['port'], "in net", self.net,"!")
                            return d['port']
                    if c is None:
                        continue
                    c_pos = [float(c.x1)*c.lef_cv, float(c.y1)*c.lef_cv]
                    if not supress_output:
                        print(f'Checking {pt} in {c.name} at {c_pos} {c.dir}')
                    is_in_c, comp = comp_dict[c.comp].is_pt_in_pins(
                        [float(pt[0]),float(pt[1])],
                        pos=c_pos,
                        orient=c.dir,
                        layer=pt[2],
                        err=err
                    )
                    if is_in_c:
                        print("Found", c.name, "in net", self.net,"!")
                        return c.name
                return False

                # if 'PIN' in self.devs:
                #     for p in pins:
                #         if p in self.devs:
                #             p.is_point_in_pin(pt)
                #             return p
                # # check components
                # for comp in components:
                #     if comp in self.devs:
                #         comp.is_point_in_ports(pt)
                #         return comp
                #     else: # skip
                #         pass

            #for ind, seg in enumerate(d_routes):
            #    seg_return = check_if_ends_in_route(self.route, seg['route'])
            #    if seg_return == "head":
            #        r_head_in_dr = ind
            #    elif seg_return == "tail":
            #        r_tail_in_dr = ind
            #    if r_head_in_dr and r_tail_in_dr: # stop once ends are found
            #        break

            # check route first
            #for ind, dr in enumerate(d_routes):
            #    seg_return = check_ends_in_route(dr['route'], route)
            #    if seg_return == "head":
            #        dr_head_in_r[ind] = "r"
            #    elif seg_return == "tail":
            #        dr_tail_in_r[ind] = "r"
            #    if dr_head_in_r[ind] and dr_tail_in_r[ind]: # stop once ends are found
            #        break

            #################### BEGIN FUNCTION subsegment ######################

            # check d_routes

            """
            This for loop checks that routing of a new and tags the
            breakpoints where subsegments intersect
            """

            print("Subsegmenting route:", self.net)
            # TODO what if a break is at another break
            for ind_ends, dr_ends in enumerate(in_routes):
                for ind_srch, dr_srch in enumerate(in_routes):
                    if ind_ends == ind_srch: # this means we are checking the same route, skip
                        continue
                    # returns (1) type of return (2) pt value (3) index on segment
                    seg_return, out_pt, out_pt_ind = check_ends_in_route(dr_ends['route'], dr_srch['route'])
                    if seg_return == "head":
                        #dr_head_in_r[ind_ends] = ind_ch
                        in_routes[ind_ends]['head'] = ind_srch
                        # TODO check if exists, ifso append
                        in_routes[ind_srch]['break'].append({'pt_ind':out_pt_ind ,'pt':out_pt, 'r_ind':[[ind_ends, 'head']]})
                    elif seg_return == "tail":
                        #dr_tail_in_r[ind_ends] = ind_ch
                        in_routes[ind_ends]['tail'] = ind_srch
                        in_routes[ind_srch]['break'].append({'pt_ind':out_pt_ind ,'pt':out_pt, 'r_ind':[[ind_ends, 'tail']]})
                    elif seg_return == "head_ins":
                        in_routes[ind_srch]['route'].insert(out_pt_ind, out_pt)
                        # move break_pts after
                        for br_pts in in_routes[ind_srch]['break']:
                            if br_pts['pt_ind'] >= out_pt_ind:
                                br_pts['pt_ind'] += 1
                        in_routes[ind_ends]['head'] = ind_srch  # points segment end to attached segment
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
                        in_routes[ind_ends]['tail'] = ind_srch  # points segment end to attached segment
                        in_routes[ind_srch]['break'].append({
                            'pt_ind': out_pt_ind,
                            'pt': out_pt,
                            'r_ind': [[ind_ends, 'tail']]
                        })
                    if in_routes[ind_ends]['head'] and in_routes[ind_ends]['tail']: # stop once ends are found
                        break
            if components_lef is not None:
                print("-------------------------------------------")
                print("-- Checking for internal devs -", self.net)
                for ind_srch, dr_srch in enumerate(in_routes):
                    for pt_ind, pt in enumerate(dr_srch['route'][1:-1]):
                        # print(pt)
                        dev_out = get_dev(pt, supress_output=True)
                        if dev_out is not False:
                            # TODO change pin -> port
                            in_routes[ind_srch]['break'].append({'pt_ind':pt_ind ,'pt':pt, 'r_ind':[[dev_out, 'pin']]})
                            break

            # new_routes = {}
            # break routes

            debug = False

            net_G = nx.Graph()
            if debug: print(f"Subsegment net {self.net}")

            for ind, r_t in enumerate(in_routes):
                br_count = 0 # since 0 is the head of the route
                last_br_ind = 0
                # we want to go low to high nodes
                r_t['break'] = sorted(r_t['break'], key=lambda k : k['pt_ind'])
                if debug: print(f'breaks for {ind}: ', r_t['break'])
                if debug: print(f'route: {r_t["route"]}')
                for br_ind, br_pt in enumerate(r_t['break']):
                    new_node = f'{ind}_{br_count}'
                    # check if node exists; they can be created through add_edge
                    if new_node in net_G.nodes:
                        net_G.nodes[new_node]['route'] = r_t['route'][last_br_ind:br_pt['pt_ind']+1]
                    else:
                        net_G.add_node(f'{ind}_{br_count}', route=r_t['route'][last_br_ind:br_pt['pt_ind']+1])

                    net_G.add_edge(f'{ind}_{br_count}', f'br_{ind}_{br_count}')
                    net_G.add_edge(f'{ind}_{br_count+1}', f'br_{ind}_{br_count}')
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
                                net_G.add_edge(f'{ch_end[0]}_{0}', f'br_{ind}_{br_count}')
                            elif ch_end[1] == "tail": # we assume last seg is # of break pts
                                net_G.add_edge(f'{ch_end[0]}_{num_br}', f'br_{ind}_{br_count}')
                        elif isinstance(ch_end[0], str):
                            if ch_end[1] == "pin":
                                net_G.add_edge(ch_end[0], f'br_{ind}_{br_count}')
                            else:
                                raise ValueError(f"{ch_end[0]} not a valid input for break pts")
                        else:
                            raise ValueError(f"{ch_end[0]} not a valid input for break pts")
                    if debug: print(f"branch route {new_node}: {net_G.nodes[new_node]['route']}")

                    last_br_ind = br_pt['pt_ind']
                    # for last route in list
                    if br_ind == len(r_t['break'])-1:
                        net_G.nodes[f'{ind}_{br_count+1}']['route'] = r_t['route'][last_br_ind:]

                    # last_br_ind = br_pt['pt_ind']
                    # create final route
                    if ind == len(r_t['break'])-1:
                        # last element is == to len? (but it works??? vvvv)
                        net_G.nodes[f'{ind}_{br_count+1}']['route'] = r_t['route'][last_br_ind:len(r_t['route'])]
                        if debug: print(f"last branch route {ind}_{br_count+1}: {net_G.nodes[f'{ind}_{br_count+1}']['route']}")

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


        #################### BEGIN FUNCTION compress_routes ######################

        nr = []
        d_routes = []
        self.dangle_routes = False
        count = 0
        r_len = len(self.route)

        if debug:
            print("initial routes:")
            print(self.route)

        #while len(nr) + sum([len(x['route']) for x in d_routes]) < r_len+1:
        #while len(self.route) > 1:
        while True:
            #print(len(self.route))
            if debug: print("sr:"+str(len(self.route))+":"+str(self.route))
            if len(nr)>=1 and debug:
                print("nr:"+str(len(nr))+":"+str(nr))
            r_init_len = len(self.route)
            for ind, r in enumerate(self.route):
                if len(nr) < 1:
                    self.route.pop(ind)
                    nr.append(r[0])
                    nr.append(r[1])
                    break
                else:
                    if debug: print("r:"+str(r))
                    if check_route_ends(r, nr):
                        break
                    if len(d_routes) > 0:
                        if check_d_routes(r, d_routes):
                            break
                        #for dr in d_routes:
                        #    if check_route_ends(r, dr['route']):
                        #        break
                    # no matches
                    # check if node is internal
                    if len(nr) > 4 and r[0] in nr[2:-3]:
                        d_routes.append({'head':r[0], 'route':r})
                        self.route.pop(ind)
                        self.dangle_routes = True
                        print("has dangling route")
                        break
                    if len(nr) > 4 and r[1] in nr[2:-3]:
                        d_routes.append({'head':r[1], 'route':r})
                        self.route.pop(ind)
                        self.dangle_routes = True
                        print("has dangling route")
                        break
                # TODO start new route after running through entire list
                if ind +1 == r_init_len:
                    # loops again otherwise ind is too large
                    if len(self.route) == r_init_len:
                        d_routes.append({'head':None, 'route':r})
                        self.route.pop(ind)
                        self.dangle_routes = True
                        print("has dangling route (Unconnected)")

                    #if r[0] == nr[0]:
                    #    if debug: print(str(r[0])+" at head")
                    #    check_inner(nr, r[1], head=True)
                    #    self.route.pop(ind)
                    #    break
                    #    #rn.insert(0, r[1])
                    #elif r[0] == nr[-1]:
                    #    if debug: print(str(r[0])+" at tail")
                    #    check_inner(nr, r[1], head=False)
                    #    self.route.pop(ind)
                    #    break
                    #    #rn.append(r[1])
                    #elif r[1] == nr[0]:
                    #    if debug: print(str(r[1])+" at head")
                    #    check_inner(nr, r[0], head=True)
                    #    self.route.pop(ind)
                    #    break
                    #    #rn.insert(0, r[0])
                    #elif r[1] == nr[-1]:
                    #    if debug: print(str(r[1])+" at tail")
                    #    check_inner(nr, r[0], head=False)
                    #    self.route.pop(ind)
                    #    break
                        #rn.append(0, r[0])

            if len(self.route) < 1:
                break

            if debug: print('\n')
            count += 1
            if count > 100:
                raise Exception("Unable to complete route before 100 inters")

        # This is for debugging
        if report_route:
            route_report_file = f"routes_out_{design}.txt"
            rep_out = open(route_report_file, 'a+')
            rep_out.write(f"Net:{self.net}\nDevs:{self.devs}\nroutes:\n{nr}\n")
            if self.dangle_routes:
                for r in d_routes:
                    rep_out.write(f"{r}\n")

        if self.dangle_routes and subsegment:
            self.route = subsegment_routes(nr, d_routes)
        else:
            self.dangling_routes = d_routes
            self.route = nx.Graph()
            self.route.add_node('', route=nr)

        if debug:
            print("Final routes:")
            print(self.route)

    def compress_routes_2(self, debug=False):

        class loose_list(list):
            def __init__(self):
                self.head_link = None
                self.tail_link = None
                super().__init__()
            def can_insert(self):
                return (self.head_link is not None and
                    self.tail_link is not None)

        class main_list(list):
            def __init__(self):
                super().__init__()

        def add_to_list(r_list, route):
            # the first condition should never happen
            if (r[0] in comp_r) and (r[1] in comp_r):
                i0 = r_list.index(r[0])
                i1 = r_list.index(r[1])
                #i_min = min([i0, i1])

                return True
            elif (r[0] in comp_r[0]):
                r_list.insert(0, r[1])
                return True
            elif (r[0] in comp_r[-1]):
                r_list.append(r[1])
                return True
            elif (r[1] in comp_r[0]):
                r_list.insert(0, r[0])
                return True
            elif (r[1] in comp_r[-1]):
                r_list.append(r[0])
                return True
            # todo inserted in the center
            else:
                return False

        def check_inter(r_list, node):
            if len(r_list) > 4:
                if node in r_list[2:-3]:
                    # get sub list
                    # reverse list
                    # reinsert list
                    pass
                else:
                    pass

        def add_list_of_list(r_list, route):
            for sub_list in r_list:
                if add_to_list(r_list, route):
                    return True
                else:
                    break
            return False

        if debug:
            print("initial routes:")
            print(self.route)

        comp_r = []
        loose_r= []
        for r in self.route:
            if len(comp_r) == 0:
                comp_r += r
            else:
                if add_to_list(comp_r, r):
                    pass
                elif len(loose_r) == 0:
                    loose_r.append(r)
                elif add_list_of_list(loose_r, r):
                    pass
                    # check changed loose lists to be inserted

                else:
                    # create new list
                    loose_r.append(r)
                    # if sub_r not in r create new sub list

        if debug:
            print("Final routes:")
            print(self.route)


    def print_routes(self):
        pass

    def print_net(self):
        r = str(self.route).replace(']],', ']],\n')

        dev_str = [f"Dev{i+1}: {x['dev']} : {x['port']}"+'\n' for i, x in enumerate(self.devs)]

        print(f"""
        Net: {self.net}
        {dev_str}
        Route: {r}
        """)


class NetBuilder:

    def __init__(
            self,
            px=None,
            layer=None,
            lpv=None,
            def_scale=None,
            bottom_layers=None):

        self.px   = px
        self.layer = layer
        self.lpv  = lpv
        self.def_scale  = def_scale
        self.bot_layers = bottom_layers

        self.net = None
        self.vias = {}
        self.met_layers = None

        # default route dimm
        self.dimm = [14,14,10]

    def set_net(self, net):
        self.net = net

    def set_dimm(self, dimm):
        if self.net is not None:
            self.net.dimm = dimm

    def import_tlef(self, tlef_f):

        print(f"Importing TECH_LEF: {tlef_f}")
        # get layers
        layer_re = r'LAYER\s*(?P<layer_name>\w*)\s*(?|(?:TYPE\s*(?P<type>(?:ROUTING|CUT))\s*;|DIRECTION\s*(?P<direction>(?:HORIZONTAL|VERTICAL))\s*;|MINWIDTH\s*(?P<minwidth>[\d.]*)\s*;|WIDTH\s*(?P<width>[\d.]*)\s*;)\s*)*END\s*(\w*)\s$' 
        layer_re = bytes(layer_re, 'utf-8')

        self.layers_list = {
            "CUT":[],
            "ROUTING":[]}

        with open(tlef_f, 'r+') as f:
            data = mmap.mmap(f.fileno(), 0)
            mo_l = regex.finditer(layer_re, data, re.MULTILINE)

            for l in mo_l:
                self.layers_list[l.group('type').decode('utf-8')].append(l.group('layer_name').decode('utf-8'))

        # get vias
        via_re   = r'VIA\s*(?P<via_name>\w*)\s*(?P<type>\w*)(?|.*\n)*?(?:END\s*(?&via_name)\s*$)'
        via_l_re = r'LAYER (?P<met_name>\w*)\s*;\s*(?:RECT\s*(?P<x1>[\d.-]*)\s*(?P<y1>[\d.-]*)\s*(?P<x2>[\d.-]*)\s*(?P<y2>[\d.-]*)\s*;)*'

        via_re = bytes(via_re, 'utf-8')
        via_l_re=bytes(via_l_re, 'utf-8')


        # parse template
        with open(tlef_f, 'r+') as f:
            data = mmap.mmap(f.fileno(), 0)
            mo_v = regex.finditer(via_re, data, re.MULTILINE)

            for m in mo_v:
                #print(m.group(0))
                v_m = []
                mo_vl = regex.finditer(via_l_re, m.group(0), re.MULTILINE)
                for vl in mo_vl:
                    v_m.append(vl.group('met_name').decode('utf-8'))

                print("import via "+m.group('via_name').decode('utf-8')+"\n"+str(v_m))
                self.vias[m.group('via_name').decode('utf-8')] = v_m

    def get_vias_met(self, via):
        met_v = []
        for v in self.vias[via]:
            if v in self.met_layers:
                met_v.append(v)

        return [met_v[0], met_v[1]]

    # expects a json met config or dictionary
    def import_met(self, config=None, met_f=None):

        if config is not None:
            if isinstance(config, dict):
                self.met_layers = config
            elif isinstance(config, str):
                self.met_layers = json.loads

        if met_f is not None:
            raise ValueError('met_f not currently implemented')

    def add_route(
            self,
            layer = None,
            x1 = None,
            y1 = None,
            z1 = None,
            x2 = None,
            y2 = None,
            z2 = None,
            via= None,
            convert_layer=False,
            debug=False):


        if via is not None:
            x1 = float(x1)/self.def_scale*self.px
            y1 = float(y1)/self.def_scale*self.px
            x2 = x1
            y2 = y1
            v = self.get_vias_met(via)

            if convert_layer:
                z1 = (self.bot_layers + self.met_layers[v[0]]*self.lpv)*self.layer
                z2 = (self.bot_layers + self.met_layers[v[1]]*self.lpv)*self.layer
            else:
                z1 = v[0]
                z2 = v[1]

            if debug:
                print("Add route v: "+str([[x1, y1, z1],[x2, y2, z2]]))
        elif x2 is not None:
            if convert_layer:
                z1 = (self.bot_layers + self.met_layers[layer]*self.lpv)*self.layer
            else:
                z1 = layer
            z2 = z1

            if x2 == '*':
                x2 = x1
            if y2 == '*':
                y2 = y1
            x1 = float(x1)/self.def_scale*self.px
            y1 = float(y1)/self.def_scale*self.px

            x2 = float(x2)/self.def_scale*self.px
            y2 = float(y2)/self.def_scale*self.px

            if debug:
                print("Add route x2: "+str([[x1, y1, z1],[x2, y2, z2]]))
        self.net.add_route(layer, x1, y1, z1, x2, y2, z2)
        # self.net.add_route(layer, x1, y1, z1, x2, y2, z2, convert_layer)

    def convert_route(self, route):
        for i, r in enumerate(route):
            # print(r)
            # print(self.met_layers[r[2]])
            if isinstance(r[2], str):
                route[i][2] = (self.bot_layers + self.met_layers[r[2]]*self.lpv)*self.layer
        # return route

    def export_net(self):
        return self.net


class Component:

    def __init__(
            self,
            name=None,
            comp=None,
            x1=None,
            y1=None,
            dir=None,
            conversion_factor=None
                 ):

        self.name = name
        self.comp = comp
        self.x1   = x1  # /def_scale
        self.y1   = y1  # /def_scale
        self.dir  = dir
        if conversion_factor is None:
            self.lef_cv = 7.6/1000000 # hard coded for testing
        else:
            self.lef_cv = conversion_factor
        self.pins = {}

    # def add_pins(self, in_pins):
    #     for pin in in_pins:
    #         new_pin = {'layer':'', 'type':'', 'params':''}
    #         new_pin['layer'] = in_pin[pin]['layer']
    #         new_pin['type'] = in_pin[pin]['type']
    #         if new_pin['type'] == 'RECT':
    #             for i, x in enumerate(in_pin[pin]['params']):
    #                 if i%2:
    #                     new_pin['params'] = str(self.x1+int(x))
    #                 else:
    #                     new_pin['params'] = str(self.y1+int(x))
    #         elif new_pin['type'] == 'POLYGON' or \
    #             new_pin['type'] == 'PATH':
    #             print(f'{new_pin["type"]} not supported')
    #
    # def is_point_in_ports(self, pt, no_pin_ok=False, unsupported_type_ok=False):
    #     if len(self.pins) == 0:
    #         if not no_pin_ok:
    #             Exception("No pins")
    #         else:
    #             return False
    #
    #     for p in self.pins.items():
    #         if p['type'] == 'RECT':
    #             if p['layer'] == pt[2] and \
    #                 p['param'][0] > pt[0] and \
    #                 p['param'][1] > pt[1] and \
    #                 p['param'][2] > pt[0] and \
    #                 p['param'][3] > pt[1]:
    #                 return True
    #         elif p['type'] == 'POLYGON' or \
    #             p['type'] == 'PATH':
    #             print(f"{p['type']} is not supported")
    #             if not unsupported_type_ok:
    #                 Exception(f"{p['type']} is not supported")
    #     return False
    #


class Pin:

    def __init__(
            self,
            name=None,
            net=None,
            direction=None,
            layer=None,
            l_size=[0,0,0,0],
            fixed=[0,0,''],
            connect_dir=None,
            layer_z_pos=None
            ):

        self.name = name
        self.net  = net
        self.direction = direction
        self.layer = layer
        self.lx1 = l_size[0]
        self.ly1 = l_size[1]
        self.lx2 = l_size[2]
        self.ly2 = l_size[3]
        self.fx1 = fixed[0]
        self.fy1 = fixed[1]
        self.fdir = fixed[2]
        self.set_connect_dir(connect_dir)

        if not isinstance(layer_z_pos, type(None)):
            self.z = layer_z_pos

    def set_connect_dir(self, cdir):
        if cdir.upper() == "TOP" or \
            connect_dir == 'z+':
            self.connect_dir = "z+"
        elif cdir.upper() == "BOTTOM" or \
            connect_dir == 'z-':
            self.connect_dir = "z-"
        elif cdir.upper() == "LEFT" or \
            connect_dir == 'x+':
            self.connect_dir = "x+"
        elif cdir.upper() == "RIGHT" or \
            connect_dir == 'x-':
            self.connect_dir = "x-"
        elif cdir.upper() == "FRONT" or \
            connect_dir == 'y+':
            self.connect_dir = "y+"
        elif cdir.upper() == "BACK" or \
            connect_dir == 'y-':
            self.connect_dir = "y-"

    def is_point_in_pin(self, pt, scale=1, px=1):
        if pt[2] == layer and \
            pt[0] > fx1+lx1 and \
            pt[0] < fx1+lx2 and \
            pt[1] > fy1+ly1 and \
            pt[1] < fy1+ly2:
            return True
        else:
            False
