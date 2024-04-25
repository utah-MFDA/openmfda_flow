
import json
import regex, mmap, re

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

        # tlef definitions

    def add_route(self, 
        layer = None,
        x1 = None,
        y1 = None,
        z1 = None,
        x2 = None,
        y2 = None,
        z2 = None,
        via= None):
        
        if (via is not None) and (x2 is not None):
            ValueError("Cannot both define 'via' and 'x2'")
        # check stars
        elif x2 is not None:
            nr = [[x1, y1, z1], [x2, y2, z2]]
        elif via is not None:
            nr = [[x1, y1, z1], [via]]

        #print('Adding route: '+str(nr))
        self.route.append(nr)

    def calc_len(self):
        if not self.compress:
            raise Exception("Routes need compression")
        r_len = 0
        for i, r in enumerate(self.route):
            if i == 0:
                print(len(self.route))
                print(self.route)
                continue
            else:
                r_lenx = abs(self.route[i-1][0] - self.route[i][0])**2
                r_leny = abs(self.route[i-1][1] - self.route[i][1])**2
                r_lenz = abs(self.route[i-1][2] - self.route[i][2])**2
                r_len += (r_lenx+r_leny+r_lenz)**(1/2) 

        self.route_len = r_len
            
    def report_len(self):
        if self.route_len == 0:
            self.calc_len()
        return self.route_len
            

    def compress_routes(self, debug=False):

        if self.compress:
            raise Exception("Routes already compressed")

        self.compress = True

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
                        r_list = l_lsit+r_list[ii:]
                    else:
                        r_list = r_list[:ii]+l_list
                    
                    if debug: print("new list: "+r_list)
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

        self.dangling_routes = d_routes
        self.route = nr

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

    def __init__(self,
        px=None,
        layer=None,
        lpv=None,
        def_scale=None,
        bottom_layers=None):

        self.px   = px
        self.layer= layer
        self.lpv  = lpv
        self.def_scale  = def_scale
        self.bot_layers = bottom_layers 

        self.net = None
        self.vias= {}
        self.met_layers = None

    def set_net(self, net):
        self.net = net


    def import_tlef(self, tlef_f):
        
        print(tlef_f)
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

    def add_route(self, 
        layer = None,
        x1 = None,
        y1 = None,
        z1 = None,
        x2 = None,
        y2 = None,
        z2 = None,
        via= None,
        debug=False):


        if via is not None:
            x1 = float(x1)/self.def_scale*self.px
            y1 = float(y1)/self.def_scale*self.px
            x2 = x1
            y2 = y1
            v = self.get_vias_met(via)

            z1 = (self.bot_layers + self.met_layers[v[0]]*self.lpv)*self.layer

            z2 = (self.bot_layers + self.met_layers[v[1]]*self.lpv)*self.layer

            if debug:
                print("Add route v: "+str([[x1, y1, z1],[x2, y2, z2]]))
        elif x2 is not None:
            z1 = (self.bot_layers + self.met_layers[layer]*self.lpv)*self.layer
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



    def export_net(self):
        return self.net

class Component:
    
    def __init__(self,
        name=None,
        comp=None,
        x1=None,
        y1=None,
        dir=None):
        
        self.name = name
        self.comp = comp
        self.x1   = x1#/def_scale
        self.y1   = y1#/def_scale
        self.dir  = dir

class Pin:
    
    def __init__(self,
        name=None,
        net=None,
        direction=None,
        layer=None,
        l_size=[0,0,0,0],
        fixed=[0,0,''],
        connect_dir=None):
        
        self.name = name
        self.net  = net
        self.direction = direction
        self.layer = layer
        self.lx1 = l_size[0]
        self.ly1 = l_size[1]
        self.lx2 = l_size[2]
        self.l2y = l_size[3]
        self.fx1 = fixed[0]
        self.fy1 = fixed[1]
        self.fdir = fixed[2]
        self.set_connect_dir(connect_dir)

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
