import operator
import solid
import solid.utils
import os
import numpy as np
import pandas as pd
import opendbpy as odb
from functools import reduce
class Params():
    """
    This sets the pixel size scale unique to the printer.
    All x,y dimensions are scalar multiples of the "px" value and
    z dimensions are scalar multiples of the "layer" value. For example,
    if a standard cell is instatntiated and needs x, y, or z dimensional
    arguments, the arguments will be the number of pixels and the
    physical value will be the argument mutliplied by the pixel scalar.
    """
    def set_scale_parameters(self, px, layer):
        self.px_     = px
        self.layer_  = layer
        print(f"px set to: {px} mm/px\nlayer set to: {layer} mm/layer", )

    """
    This sets the render resoultion when exported to openSCAD.
    """
    def set_render_resolution(self, res):
        self.res_ = res
        print(f"Rendering fragment number set to: {res}")

    """
    This sets the scale used in the lef/def files for 1 pixel. For example,
    if 1 pixel is equivalent to 0.5 units in the lef/def file then this value
    should be set to 0.5.
    """
    def set_def_scale(self, def_scale):
        self.def_scale_ = def_scale
        print(f".def unit scale set to: {def_scale}")


    """
    This sets the pixel pitch of the PNR flow as determined by the platform.
    """
    def set_pitch(self, pitch):
        self.pitch_ = pitch
        print(f"The platform pitch is {pitch} pixels.")

    """
    This sets the phyical location that the bottom routing layer is placed.
    """
    def set_bottom_layer(self, bottom_layer) :
        self.bottom_layer_ = bottom_layer * self.layer_
        print(f"The bottom layer is set to: {bottom_layer} of {int(self.z_bdim_/self.layer_)} layers")

    """
    This sets the multiple of layers per via.
    """
    def set_layers_per_via(self, lpv) :
        self.lpv_ = lpv
        print(f"The number of layer per via is set to: {lpv} layers/via")

    """
    This sets the dimensions of the bulk chip.
    """
    def set_bulk_dimensions(self, x_bdim, y_bdim, z_bdim) :
        self.x_bdim_ = x_bdim * self.px_
        self.y_bdim_ = y_bdim * self.px_
        self.z_bdim_ = z_bdim * self.layer_
        print(f"Bulk dimensions are:\n\tx: {x_bdim} px\n\ty: {y_bdim} px\n\tz: {z_bdim}  layers")

    """
    This sets the dimensions of the chip.
    """
    def set_chip_dimensions(self, x_cdim, y_cdim) :
        self.x_cdim_ = x_cdim
        self.y_cdim_ = y_cdim
        self.cleft = (x_cdim[0]+1) * self.def_scale_
        self.cright = (x_cdim[1]-1) * self.def_scale_
        self.cbottom = (y_cdim[0]+1) * self.def_scale_
        self.ctop = (y_cdim[1]-1) * self.def_scale_

        print(f"The lower and upper bounds of the chip are:\n\tx: [{x_cdim[0]} {x_cdim[1]}] px\n\ty: [{y_cdim[0]} {y_cdim[1]}] px")

    """
    This initializes the tensor of the design space.
    """
    def design_space_init(self, xspace: int, yspace: int, num_layers: int) :
        ys =  int(yspace/self.pitch_)+1
        xs = int(xspace/self.pitch_)+1
        self.design_space_       = np.zeros((num_layers, ys, xs), dtype=np.bool_)
        self.design_space_nets_  = np.empty((num_layers, ys, xs), dtype=object)

class place:
    """
    This class takes a .def file with place information and can get the 2D components
    found in the file as well as the placement location and transform that information
    to openSCAD with the corresponding 3D components.
    """
    def __init__(self, params, db) :
        self.params = params
        self.db = db
        self.mapOrient = {"R180": "S",
                          "R0": "N",
                          "MY": "FN",
                          "MX": "FS"}
    def get_components(self):
        block = self.db.getChip().getBlock()
        def_scale_ = self.params.def_scale_
        bottom_layer_ = self.params.bottom_layer_
        layer_ = self.params.layer_
        for i in block.getInsts():
            name = i.getName()
            orient = self.mapOrient[i.getOrient()]
            macro = i.getMaster().getName()
            x, y = i.getLocation()
            xd = x/def_scale_
            yd = y/def_scale_
            zd = bottom_layer_/layer_
            yield scad_std_cell.__dict__[macro](xd, yd, zd, orient)

    def place_components(self):
        components_placed = list(self.get_components())

        if len(components_placed) > 0:
            return reduce(operator.add, components_placed)
        else:
            return scad_std_cell.empty_obj('NO COMPONENTS')

class component_offset:
    """
    Builds a tuple of the components and their layer offsets.
    """
    def __init__(self, name: str, layer: list, coord_offset: list) :
        self.name           = name
        self.layer          = layer
        self.coord_offset   = coord_offset

    def build (self) :
        output = {key: value for key, value in zip(self.layer, self.coord_offset)}
        return(self.name, output)


class design_space_place:
    """
    This fills the design space with the placed components.
    """
    def __init__(self, params, place_list) :
        self.place_list = place_list
        self.params = params
        def_scale_ = self.params.def_scale_


        valve_20_N  = component_offset('valve_20px_1', [1, 2], [[[25, 50], [75, 50]], [[50, 75], [50, 25]]]).build()
        pump_40_0_N = component_offset('pump_40px_0', [1, 2], [[[75, 175], [75, 25]], [[25, 150], [125, 150], [25, 100], [125, 100], [25, 50], [125, 50]]]).build()
        pump_40_1_N = component_offset('pump_40px_1', [1, 2], [[[175, 75], [25, 75]], [[150, 25], [150, 125], [100, 25], [100, 125], [50, 25], [50, 125]]]).build()
        serp_25_N   = component_offset('serpentine_25px_0', [1], [[[25, 25], [50, 50]]]).build()
        serp_50_N   = component_offset('serpentine_50px_0', [1], [[[25, 25], [75, 25]]]).build()
        serp_75_N   = component_offset('serpentine_75px_0', [1], [[[25, 25], [100, 100]]]).build()
        serp_100_N  = component_offset('serpentine_100px_0', [1], [[[25, 25], [125, 25]]]).build()
        serp_150_N  = component_offset('serpentine_150px_0', [1], [[[25, 25], [175, 25]]]).build()
        serp_200_N  = component_offset('serpentine_200px_0', [1], [[[25, 25], [225, 25]]]).build()
        serp_200_3_N  = component_offset('serpentine_200px_3', [2, 5], [[[25, 25]], [[25, 25]]]).build()
        serp_300_N  = component_offset('serpentine_300px_0', [1], [[[25, 25], [325, 25]]]).build()
        serp_300_1_N  = component_offset('serpentine_300px_1', [2, 3], [[[50, 25]], [[25, 25]]]).build()
        serp_300_2_N  = component_offset('serpentine_300px_2', [2, 4], [[[25, 25]], [[350, 25]]]).build()
        serp_300_3_N  = component_offset('serpentine_300px_3', [2, 5], [[[50, 25]], [[25, 25]]]).build()
        serp_300_4_N  = component_offset('serpentine_300px_4', [2, 6], [[[25, 25]], [[350, 25]]]).build()
        dmix_25_N   = component_offset('diffmix_25px_0', [1], [[[25, 50], [25, 25], [50, 50]]]).build()
        junc_25_N   = component_offset('junction_25px_0', [1], [[[25, 50], [25, 25], [50, 25]]]).build()

        all_N           = [valve_20_N, pump_40_0_N, pump_40_1_N, serp_25_N, serp_50_N, serp_75_N, serp_100_N, serp_150_N, serp_200_N, serp_200_3_N, serp_300_N, serp_300_1_N, serp_300_2_N, serp_300_3_N, serp_300_4_N, dmix_25_N, junc_25_N]
        keys_N          = [component[0] for component in all_N]
        all_offset_N    = {key: value for key, value in zip(keys_N, all_N)}

        valve_20_FN  = component_offset('valve_20px_1', [1, 2], [[[25, 50], [75, 50]], [[50, 75], [50, 25]]]).build()
        pump_40_0_FN = component_offset('pump_40px_0', [1, 2], [[[75, 175], [75, 25]], [[25, 150], [125, 150], [25, 100], [125, 100], [25, 50], [125, 50]]]).build()
        pump_40_1_FN = component_offset('pump_40px_1', [1, 2], [[[175, 75], [25, 75]], [[150, 25], [150, 125], [100, 25], [100, 125], [50, 25], [50, 125]]]).build()
        serp_25_FN   = component_offset('serpentine_25px_0', [1], [[[50, 25], [25, 50]]]).build()
        serp_50_FN   = component_offset('serpentine_50px_0', [1], [[[75, 25], [25, 25]]]).build()
        serp_75_FN   = component_offset('serpentine_75px_0', [1], [[[100, 25], [25, 100]]]).build()
        serp_100_FN  = component_offset('serpentine_100px_0', [1], [[[125, 25], [25, 25]]]).build()
        serp_150_FN  = component_offset('serpentine_150px_0', [1], [[[175, 25], [25, 25]]]).build()
        serp_200_FN  = component_offset('serpentine_200px_0', [1], [[[225, 25], [25, 25]]]).build()
        serp_200_3_FN  = component_offset('serpentine_200px_3', [2, 5], [[[225, 25]], [[225, 25]]]).build()
        serp_300_FN  = component_offset('serpentine_300px_0', [1], [[[325, 25], [25, 25]]]).build()
        serp_300_1_FN  = component_offset('serpentine_300px_1', [2, 3], [[[300, 25]], [[325, 25]]]).build()
        serp_300_2_FN  = component_offset('serpentine_300px_2', [2, 4], [[[350, 25]], [[25, 25]]]).build()
        serp_300_3_FN  = component_offset('serpentine_300px_3', [2, 5], [[[300, 25]], [[325, 25]]]).build()
        serp_300_4_FN  = component_offset('serpentine_300px_4', [2, 6], [[[350, 25]], [[25, 25]]]).build()
        dmix_25_FN   = component_offset('diffmix_25px_0', [1], [[[50, 50], [50, 25], [25, 50]]]).build()
        junc_25_FN   = component_offset('junction_25px_0', [1], [[[50, 50], [50, 25], [25, 25]]]).build()

        all_FN           = [valve_20_FN, pump_40_0_FN, pump_40_1_FN, serp_25_FN, serp_50_FN, serp_75_FN, serp_100_FN, serp_150_FN, serp_200_FN, serp_200_3_FN, serp_300_FN, serp_300_1_FN, serp_300_2_FN, serp_300_3_FN, serp_300_4_FN, dmix_25_FN, junc_25_FN]
        keys_FN          = [component[0] for component in all_FN]
        all_offset_FN    = {key: value for key, value in zip(keys_FN, all_FN)}

        valve_20_S  = component_offset('valve_20px_1', [1, 2], [[[25, 50], [75, 50]], [[50, 75], [50, 25]]]).build()
        pump_40_0_S = component_offset('pump_40px_0', [1, 2], [[[75, 175], [75, 25]], [[25, 150], [125, 150], [25, 100], [125, 100], [25, 50], [125, 50]]]).build()
        pump_40_1_S = component_offset('pump_40px_1', [1, 2], [[[175, 75], [25, 75]], [[150, 25], [150, 125], [100, 25], [100, 125], [50, 25], [50, 125]]]).build()
        serp_25_S   = component_offset('serpentine_25px_0', [1], [[[50, 50], [25, 25]]]).build()
        serp_50_S   = component_offset('serpentine_50px_0', [1], [[[75, 75], [25, 75]]]).build()
        serp_75_S   = component_offset('serpentine_75px_0', [1], [[[100, 100], [25, 25]]]).build()
        serp_100_S  = component_offset('serpentine_100px_0', [1], [[[125, 125], [25, 125]]]).build()
        serp_150_S  = component_offset('serpentine_150px_0', [1], [[[175, 175], [25, 175]]]).build()
        serp_200_S  = component_offset('serpentine_200px_0', [1], [[[225, 225], [25, 225]]]).build()
        serp_200_3_S  = component_offset('serpentine_200px_3', [2, 5], [[[225, 225]], [[225, 225]]]).build()
        serp_300_S  = component_offset('serpentine_300px_0', [1], [[[325, 325], [25, 325]]]).build()
        serp_300_1_S  = component_offset('serpentine_300px_1', [2, 3], [[[300, 325]], [[325, 325]]]).build()
        serp_300_2_S  = component_offset('serpentine_300px_2', [2, 4], [[[350, 325]], [[25, 325]]]).build()
        serp_300_3_S  = component_offset('serpentine_300px_3', [2, 5], [[[300, 325]], [[325, 325]]]).build()
        serp_300_4_S  = component_offset('serpentine_300px_4', [2, 6], [[[350, 325]], [[25, 325]]]).build()
        dmix_25_S   = component_offset('diffmix_25px_0', [1], [[[50, 25], [50, 50], [25, 25]]]).build()
        junc_25_S   = component_offset('junction_25px_0', [1], [[[50, 25], [50, 50], [25, 50]]]).build()

        all_S           = [valve_20_S, pump_40_0_S, pump_40_1_S, serp_25_S, serp_50_S, serp_75_S, serp_100_S, serp_150_S, serp_200_S, serp_200_3_S, serp_300_S, serp_300_1_S, serp_300_2_S, serp_300_3_S, serp_300_4_S, dmix_25_S, junc_25_S]
        keys_S          = [component[0] for component in all_S]
        all_offset_S    = {key: value for key, value in zip(keys_S, all_S)}

        valve_20_FS  = component_offset('valve_20px_1', [1, 2], [[[25, 50], [75, 50]], [[50, 75], [50, 25]]]).build()
        pump_40_0_FS = component_offset('pump_40px_0', [1, 2], [[[75, 175], [75, 25]], [[25, 150], [125, 150], [25, 100], [125, 100], [25, 50], [125, 50]]]).build()
        pump_40_1_FS = component_offset('pump_40px_1', [1, 2], [[[175, 75], [25, 75]], [[150, 25], [150, 125], [100, 25], [100, 125], [50, 25], [50, 125]]]).build()
        serp_25_FS   = component_offset('serpentine_25px_0', [1], [[[25, 50], [50, 25]]]).build()
        serp_50_FS   = component_offset('serpentine_50px_0', [1], [[[25, 75], [75, 75]]]).build()
        serp_75_FS   = component_offset('serpentine_75px_0', [1], [[[25, 100], [100, 25]]]).build()
        serp_100_FS  = component_offset('serpentine_100px_0', [1], [[[25, 125], [125, 125]]]).build()
        serp_150_FS  = component_offset('serpentine_150px_0', [1], [[[25, 175], [175, 175]]]).build()
        serp_200_FS  = component_offset('serpentine_200px_0', [1], [[[25, 225], [225, 225]]]).build()
        serp_200_3_FS  = component_offset('serpentine_200px_3', [2, 5], [[[25, 225]], [[25, 225]]]).build()
        serp_300_FS  = component_offset('serpentine_300px_0', [1], [[[25, 325], [325, 325]]]).build()
        serp_300_1_FS  = component_offset('serpentine_300px_1', [2, 3], [[[50, 325]], [[25, 325]]]).build()
        serp_300_2_FS  = component_offset('serpentine_300px_2', [2, 4], [[[25, 325]], [[350, 325]]]).build()
        serp_300_3_FS  = component_offset('serpentine_300px_3', [2, 5], [[[50, 325]], [[25, 325]]]).build()
        serp_300_4_FS  = component_offset('serpentine_300px_4', [2, 6], [[[25, 325]], [[350, 325]]]).build()
        dmix_25_FS   = component_offset('diffmix_25px_0', [1], [[[25, 25], [25, 50], [50, 25]]]).build()
        junc_25_FS   = component_offset('junction_25px_0', [1], [[[25, 25], [25, 50], [50, 50]]]).build()

        all_FS           = [valve_20_FS, pump_40_0_FS, pump_40_1_FS, serp_25_FS, serp_50_FS, serp_75_FS, serp_100_FS, serp_150_FS, serp_200_FS, serp_200_3_FS, serp_300_FS, serp_300_1_FS, serp_300_2_FS, serp_300_3_FS, serp_300_4_FS, dmix_25_FS, junc_25_FS]
        keys_FS          = [component[0] for component in all_FS]
        all_offset_FS    = {key: value for key, value in zip(keys_FS, all_FS)}

        for component in self.place_list:
            c3 = int(component[3])/def_scale_
            c2 = int(component[2])/def_scale_
            name = component[1]
            orient = component[4]
            if orient == 'N':
                for key, offsets in all_offset_N[name][1].iteritems():
                    for offset in offsets:
                        a = int(c3/25)
                        b = int((c3+offset[1])/25)
                        c = int((c2)/25)
                        d = int((c2+offset[0])/25)
                        self.params.design_space_[key-1,a:b, c:d] = True
                        self.params.design_space_nets_[key-1, a:b, c:d] = name
            elif orient == 'FN':
                for key, offsets in all_offset_FN[name][1].iteritems():
                    for offset in offsets:
                        b = int((c3+offset[1])/25)
                        d = int((c2+offset[0])/25)
                        self.params.design_space_[key-1, b, d] = True
                        self.params.design_space_nets_[key-1, b, d] = name
            elif orient == 'S':
                for key, offsets in all_offset_S[name][1].iteritems():
                    for offset in offsets:
                        b = int((c3+offset[1])/25)
                        d = int((c2+offset[0])/25)
                        self.params.design_space_[key-1, b, d] = True
                        self.params.design_space_nets_[key-1, b, d] = name
            else:
                for key, offsets in all_offset_FS[name][1].iteritems():
                    for offset in offsets:
                        b = int((c3+offset[1])/25)
                        d = int((c2+offset[0])/25)
                        self.params.design_space_[key-1, b, d] = True
                        self.params.design_space_nets_[key-1, b, d] = name


class route:
    """
    This class takes a .def file with routing information and creates a SCAD model of the routing channels.
    """
    def __init__(self, def_file, db, params) :
        self.def_file = def_file
        self.db = db
        self.params = params

    def snap_to_grid(self, value):
        pitch_ = self.params.pitch_
        def_scale_ = self.params.def_scale_
        snap_value = round(int(value)/pitch_/def_scale_) * pitch_ * def_scale_
        return(f"{snap_value}")

    def get_routing_new(self):
        pass

    # TODO remove
    def get_routing(self):
        f = open(self.def_file)
        index, flag = 0, 0
        routes = []
        index_found = []
        for line in f:
            routes.append(line.strip())
            index += 1
            if flag < 2:
                if 'NETS' in line:
                    flag += 1
                    index_found.append(index)
            else:
                break
        f.close()
        if flag == 2:
            routes = routes[index_found[0]:index_found[1]-1]
            index = 0
            index_found = []
            for net in routes:
                if net[0] == '-':
                    index_found.append(index)
                index += 1
            index_found.append(index)
            replace_list = ['+ ', '( ', ') ', ' )', ';', 'NEW', 'ROUTED', 'met', 'USE', 'SIGNAL']
            for i in range(0, len(routes)):
                for char in replace_list:
                    routes[i] = routes[i].replace(char, '')
                routes[i] = routes[i].strip().split(' ')
            for j in range(0, len(index_found)-1):
                for i in range(index_found[j]+1, index_found[j+1]):
                    routes[i].insert(0, routes[index_found[j]][1])
                    if len(routes[i]) >= 7:
                        if len(routes[i]) == 7:
                            if routes[i][4] == '0':
                                del routes[i][4]
                            else:
                                del routes[i][6]
                        else:
                            del routes[i][4]
                            del routes[i][6]
                    if '*' in routes[i]:
                        star_index = routes[i].index('*')
                        routes[i][star_index] = routes[i][star_index-2]
                    if 'PIN' in routes[index_found[j]]:
                        routes[i].append('PIN')
            new_routes = []
            for route in routes:
                if route[0] != '-' and route[1].isnumeric():
                    new_routes.append(route)
            routes = new_routes
            for net in routes:
                try:
                    if (len(net) == 6 and net[5] != 'PIN') or len(net) == 7:
                        net[2] = self.snap_to_grid(net[2])
                        net[3] = self.snap_to_grid(net[3])
                        net[4] = self.snap_to_grid(net[4])
                        net[5] = self.snap_to_grid(net[5])
                    else:
                        net[2] = self.snap_to_grid(net[2])
                        net[3] = self.snap_to_grid(net[3])
                except:
                    print(net)
                    raise
            i = 0
            length = len(routes)
            while i < length:
                route = routes[i]
                r1 = int(route[1])
                sr1 = str(r1-1)
                r0 = route[0]
                r2 = route[2]
                r3 = route[3]
                r4 = route[4]
                if len(route) >= 6 and (r2==r4 and r3==route[5]):
                    f = [r0, sr1, r2, r3, f"M{r1-1}M{r1}_PR"]
                    if 'PIN' in route:
                        f.append("PIN")
                    if routes.count(f) == 2:
                        routes = list(filter(f.__ne__, routes))
                    del routes[i] #TODO this is scary
                    i = 0
                    length = len(routes)
                else:
                    i += 1
            return(routes)
        else:
            pass # add error later

    def get_target_routing(self, target):
        """
        Options: 'one_length'
        """
        px_ = self.params.px_
        pitch_ = self.params.pitch_
        def_scale_ = self.params.def_scale_

        routes = self.get_routing()

        if target == 'one_length': # Targets routes that are one grid unit in length for flattening
            one_length_routes = []
            for route in routes:
                if ((len(route) == 6 and route[5] != 'PIN') or len(route) == 7) and route[1] != '1':
                    if route[2] == route[4] and ((int(route[5])-int(route[3]))/def_scale_/pitch_) == 1:
                        one_length_routes.append(route)
                    elif route[3] == route[5] and ((int(route[4])-int(route[2]))/def_scale_/pitch_) == 1:
                        one_length_routes.append(route)
            return(one_length_routes)

    def flatten_routes(self, routes, target):
        design_space_route(self.params, routes) #side effects
        px_ = self.params.px_
        pitch_ = self.params.pitch_
        def_scale_ = self.params.def_scale_

        if target == 'one_length':
            one_length_routes           = self.get_target_routing(target)
            for i in range(0, 9):
                for route in one_length_routes:
                    r0 = route[0]
                    r1 = int(route[1])-1
                    r1a = str(int(route[1])-1)
                    r2a = int(int(route[2])/def_scale_/pitch_)
                    r3a = int(int(route[3])/def_scale_/pitch_)
                    r4a = int(int(route[4])/def_scale_/pitch_)
                    r5a = int(int(route[5])/def_scale_/pitch_)
                    m = f'M{r1}M{int(route[1])}_PR'
                    ca = [r0, r1a, route[2], route[3], m]
                    cb = [r0, r1a, route[2], route[3], m, 'PIN']
                    cc = [r0, r1a, route[4], route[5], m]
                    cd = [r0, r1a, route[4], route[5], m, 'PIN']
                    if  (ca in routes or cb in routes) and (cc in routes or cd in routes):
                        if len(route) == 6:
                            routes.remove(ca)
                            routes.remove(cc)
                        else:
                            routes.remove(cb)
                            routes.remove(cd)

                        self.params.design_space_nets_[r1, r3a, r2a] = ''
                        self.params.design_space_nets_[r1, r5a, r4a] = ''

                        index = routes.index(route)
                        routes[index][1]             = r1a  # drop the length down one level
                        route[1]  = r1a  # update one_length_routes
        return(routes)

    def get_nets(self):
        list = self.get_routing()
        nets_repeat = []
        nets = []
        for line in list:
            nets_repeat.append(line[0])
        [nets.append(net) for net in nets_repeat if net not in nets]
        return(nets)

    def get_route_params(self, dimm_file = None):
        if dimm_file == None:
            return({})
        else:
            from csv import reader
            with open(dimm_file) as f:
                params = list(reader(f))
            net_params_keys   = {}
            for param in params:
                if len(param) > 2:
                    net_params_keys.update({param[0]:list(param[1:4])})
            return(net_params_keys)

    def generate_dimm(self, wchan, xychan, hchan):
        px_ = self.params.px_
        layer_ = self.params.layer_
        #TODO untangle
        dimm = f"[[[0, 0], [-{wchan}/2*{px_}, {wchan}/2*{px_}], [0, {hchan}*{layer_}]],\n [[-{wchan}/2*{px_}, {wchan}/2*{px_}], [0, 0], [0, {hchan}*{layer_}]],\n [[-{xychan}/2*{px_}, {xychan}/2*{px_}], [-{xychan}/2*{px_}, {xychan}/2*{px_}], [0, 0]]]"
        return(dimm)

    def generate_dimms(self, dimm_file = None):
        if dimm_file == None:
            route_params = self.get_route_params()
        else:
            route_params = self.get_route_params(dimm_file)
        nets        = self.get_nets()
        nets_params = route_params.keys()
        dimms       = {}
        for i in range(len(nets)):
            net = nets[i]
            if net in nets_params:
                x = route_params[net][0]
                y = route_params[net][1]
                z = route_params[net][2]
            else:
                x = 14
                y = 14
                z = 10
            dimms.update({net:self.generate_dimm(x, y, z)})
        return(dimms)

    def report_route_lengths(self, nets, pins, output_dir, design):
        lengths = {}
        px_ = self.params.px_
        bottom_layer_ = self.params.bottom_layer_
        def_scale_ = self.params.def_scale_
        layer_ = self.params.layer_
        lpv_ = self.params.lpv_
        x_bdim_ = self.params.x_bdim_
        y_bdim_ = self.params.y_bdim_
        z_bdim_ = self.params.z_bdim_

        lengths = {net[0]: 0 for net in nets}
        for net in nets:
            name = net[0]
            if net[4][0] == 'M':
                lengths[name] += lpv_*layer_
            elif net[2] == net[4]:
                n5 = int(net[5])
                n3 = int(net[3])
                lengths[name] += (n5-n3)/def_scale_*px_
            else:
                n4 = int(net[4])
                n2 = int(net[2])
                lengths[name] += (n4-n2)/def_scale_*px_
        for pin in pins:
            name = pin[0][0]
            if name in lengths:
                p1 = int(pin[0][1])
                lengths[name] += z_bdim_ - (p1-1)*lpv_*layer_+bottom_layer_

        df = pd.DataFrame(lengths, index=['length (mm)'])
        df.to_csv(os.path.join(output_dir, design + "_lengths.csv"))


    def get_ports(self):
        place_components    = place(self.params, self.db).get_components()
        inst                = [component[0] for component in place_components]
        placement           = [component[1:5] for component in place_components]
        inst_placement      = {key: value for key, value in zip(inst, placement)}

        std_cells =     {'valve_20px_1' : [100, 100, {'in_air' : [2, 50, 75], 'in_fluid' : [1, 25, 50], 'out_air' : [2, 50, 25], 'out_fluid' : [1, 75, 50]}],
                        'pump_40px_0' : [150, 200, {'in_air_valve1' : [2, 25, 150], 'in_air_dc' : [2, 25, 100], 'in_air_valve2' : [2, 25, 50], 'in_fluid' : [1, 75, 175], 'out_air_valve1' : [2, 125, 150], 'out_air_dc' : [2, 125, 100], 'out_air_valve2' : [2, 125, 50], 'out_fluid' : [1, 75, 25]}],
                        'pump_40px_1' : [200, 150, {'in_air_valve1' : [2, 50, 125], 'in_air_dc' : [2, 100, 125], 'in_air_valve2' : [2, 150, 125], 'in_fluid' : [1, 25, 75], 'out_air_valve1' : [2, 50, 25], 'out_air_dc' : [2, 100, 25], 'out_air_valve2' : [2, 150, 25], 'out_fluid' : [1, 175, 75]}],
                        'serpentine_25px_0' : [75, 75, {'in_fluid' : [1, 25, 25], 'out_fluid' : [1, 50, 50]}],
                        'serpentine_50px_0' : [100, 100, {'in_fluid' : [1, 25, 25], 'out_fluid' : [1, 75, 25]}],
                        'serpentine_75px_0' : [125, 125, {'in_fluid' : [1, 25, 25], 'out_fluid' : [1, 100, 100]}],
                        'serpentine_100px_0' : [150, 150, {'in_fluid' : [1, 25, 25], 'out_fluid' : [1, 125, 25]}],
                        'serpentine_150px_0' : [200, 200, {'in_fluid' : [1, 25, 25], 'out_fluid' : [1, 175, 25]}],
                        'serpentine_200px_0' : [250, 250, {'in_fluid' : [1, 25, 25], 'out_fluid' : [1, 225, 25]}],
                        'serpentine_300px_0' : [350, 350, {'in_fluid' : [1, 25, 25], 'out_fluid' : [1, 325, 25]}],
                        'serpentine_300px_2' : [350, 350, {'in_fluid' : [2, 25, 25], 'out_fluid' : [4, 325, 25]}],
                        'diffmix_25px_0' : [75, 75, {'a_fluid' : [1, 25, 50], 'b_fluid' : [1, 25, 25], 'out_fluid' : [1, 50, 50]}],
                        'junction_25px_0' : [75, 75, {'in_fluid' : [1, 25, 50], 'out_fluid1' : [1, 50, 50], 'out_fluid2' : [1, 50, 25]}]}

        ports = {}
        for port in inst_placement:
            orient = inst_placement[port][3]
            name = inst_placement[port][0]
            x = int(inst_placement[port][1])/def_scale_
            y = int(inst_placement[port][2])/def_scale_
            cell = std_cells[name][2]
            ports[port] = {}
            for port1 in cell:
                layer = cell[port1][0]
                f = cell[port1][1]
                g = cell[port1][2]
                h = std_cells[name][0]
                i = std_cells[name][1]

                ports[port].update({port1 : [layer, xpos, ypos]})

                if orient == 'N':
                    xpos = x + f
                    ypos = y + g
                elif orient == 'FN':
                    xpos = x + h - f
                    ypos = y + g
                elif orient == 'FS':
                    xpos = x + f
                    ypos = y + i - g
                elif orient == 'S':
                    xpos = x + h - f
                    ypos = y + i - g
                else:
                    raise "Unknown orientation"
                ports[port].update({port1 : [layer, xpos, ypos]})
        return(ports)

    def perform_routing(self, output_dir, design, dimm_file = None, flatten = False):
        px_ = self.params.px_
        bottom_layer_ = self.params.bottom_layer_
        def_scale_ = self.params.def_scale_
        layer_ = self.params.layer_
        lpv_ = self.params.lpv_


        if dimm_file == None:
            route_dimms  = self.generate_dimms()
            route_params = self.get_route_params(None)
        else:
            route_dimms  = self.generate_dimms(dimm_file)
            route_params = self.get_route_params(dimm_file)
        routes        = self.get_routing()
        routing     = []
        if flatten:
            routes = self.flatten_routes(routes, 'one_length')
        self.report_route_lengths(routes,
                                  pin_place(self.def_file, self.db, self.params).get_pins(),
                                  output_dir,
                                  design)
        for route in routes:
            r2 = int(route[2])/def_scale_*px_
            r3 = int(route[3])/def_scale_*px_
            r1a = (int(route[1])-1)*lpv_*layer_+bottom_layer_
            d = (int(route_params[route[0]][0]) if (dimm_file != None and route[0] in route_params.keys()) else 14)
            if (route[4][0] == 'M'):
                r4_3 = (int(route[4][3])-1)*lpv_*layer_+bottom_layer_
                p0 =    [r2, r3, r1a]
                p1 =    [r2, r3, r4_3]
                connect_matrix = [["z", p1, 2]]
            else:
                r4 = int(route[4])/def_scale_*px_
                r5 = int(route[5])/def_scale_*px_
                if route[2] == route[4]:
                    p0 =    [r2,
                             r3 - 0.5 * d * px_,
                             r1a]
                    p1 =    [r4,
                             r5 + 0.5 * d * px_,
                             r1a]
                    connect_matrix = [["y", p1, 1]]
                else:
                    p0 =    [r2 - 0.5 * d * px_,
                             r3,
                             r1a]
                    p1 =    [r4 + 0.5 * d * px_,
                             r5,
                             r1a]
                    connect_matrix = [["x", p1, 0]]
            routing.append(scad_routing.routing(p0, connect_matrix, route_dimms[route[0]]))
        if routing:
            return reduce(operator.add, routing)
        else:
            return scad_std_cell.empty_obj('NO ROUTING')


class design_space_route:
    """
    This fills the design space with the routed nets and pins.
    """
    def __init__(self, params, route_list) :
        self.params = params
        self.route_list = route_list
        px_ = self.params.px_
        pitch_ = self.params.pitch_
        def_scale_ = self.params.def_scale_
        for route in self.route_list:
            r1 = int(route[1])-1
            r2 = int(int(route[2])/def_scale_/pitch_)
            r3 = int(int(route[3])/def_scale_/pitch_)
            if (len(route) == 6 and route[5] != 'PIN') or len(route) == 7:
                r4 = int(int(route[4])/def_scale_/pitch_)
                r5 = int(int(route[5])/def_scale_/pitch_)
                if route[2] == route[4]:
                    self.params.design_space_[r1, r3:r5+1, r2] = True
                    self.params.design_space_nets_[r1, r3:r5+1, r2] = route[0]
                else:
                    self.params.design_space_[r1, r3, r2:r4+1] = True
                    self.params.design_space_nets_[r1, r3, r2:r4+1] = route[0]
            else:
                r4_1 = int(route[4][1])
                r4_3 = int(route[4][3])
                self.params.design_space_[r4_1-1:r4_3, r3, r2] = True
                self.params.design_space_nets_[r4_1-1:r4_3, r3, r2] = route[0]

class pin_place:
    """
    This class takes a .def file with pin information and places pins or pinholes accordingly.
    """
    def __init__(self, def_file, db, params) :
        self.def_file = def_file
        self.db = db
        self.params = params

    def snap_to_grid(self, value):
        def_scale_ = self.params.def_scale_
        pitch_ = self.params.pitch_
        snap_value = round(int(value)/pitch_/def_scale_) * pitch_ * def_scale_
        return(f"{snap_value}")

    #TODO remove
    def get_pins(self):
        f = open(self.def_file)
        index, flag = 0, 0
        list = []
        index_found = []
        for line in f:
            list.append(line.strip().split('\n'))
            index += 1
            if flag < 2:
                if 'PINS' in line:
                    flag += 1
                    index_found.append(index)
            else:
                break
        f.close()
        if flag == 2:
            list        = list[index_found[0]:index_found[1]-1]
            replace_list = ['+ ', '( ', ') ', ' )', ';', 'LAYER ', 'FIXED ', 'PLACED ', 'NET ', 'DIRECTION ', 'INPUT ', 'OUTPUT ', 'USE ', 'SIGNAL', 'met', ' N', ' FN', ' S', ' FS']
            for element in list:
                for char in replace_list:
                    element[0] = element[0].replace(char, '')
                element[0] = element[0].strip().split(' ')
            i = 0
            length = len(list)
            while i < length:
                if list[i][0][0] == 'PORT':
                    del list[i]
                    i = 0
                    length = len(list)
                else:
                    i += 1
            index       = 0
            index_found = []
            for pin in list:
                if pin[0][0] == '-':
                    index_found.append(index)
                index += 1
            index_found.append(index)
            for i in range(0, len(index_found)-1):
                list[index_found[i]+2][0].insert(0, list[index_found[i]+1][0][0])
                list[index_found[i]+2][0].insert(0, list[index_found[i]][0][1])
            i = 0
            length = len(list)
            while i < length:
                if list[i][0][0] == '-' or len(list[i][0]) > 4:
                    del list[i]
                    i = 0
                    length = len(list)
                else:
                    i += 1
            good = []
            for pin in list:
                try:
                    pin[0][2] = self.snap_to_grid(pin[0][2])
                    pin[0][3] = self.snap_to_grid(pin[0][3])
                    good.append(pin)
                except:
                    continue
            return(good)
        else:
            pass # add error later

    def get_pin_params(self, dimm_file = None):
        if dimm_file == None:
            return({})
        else:
            from csv import reader
            with open(dimm_file) as f:
                params = list(reader(f))
            net_params_keys   = {}
            for param in params:
                if len(param) == 2:
                    net_params_keys.update({param[0]:list(param[1:2])})
            return(net_params_keys)

    def get_nets(self):
        list = self.get_pins()
        nets = []
        for line in list:
            nets.append(line[0][0])
        return(nets)

    def generate_dimm(self, xychan):
        px_ = self.params.px_
        dimm = f"[[[-{xychan}/2*{px_}, {xychan}/2*{px_}], [-{xychan}/2*{px_}, {xychan}/2*{px_}], [0, 0]]]"
        return(dimm)

    def generate_dimms(self, dimm_file = None):
        if dimm_file == None:
            route_params = self.get_pin_params()
        else:
            route_params = self.get_pin_params(dimm_file)
        nets        = self.get_nets()
        nets_params = route_params.keys()
        dimms       = {}
        for i in range(len(nets)):
            if nets[i] in nets_params:
                dimms.update({nets[i]:self.generate_dimm(route_params[nets[i]][0])})
            else:
                dimms.update({nets[i]:self.generate_dimm(14)})
        return(dimms)

    def place_pinholes(self):
        def_scale_ = self.params.def_scale_
        x_cdim_ = self.params.x_cdim_
        y_cdim_ = self.params.y_cdim_
        x_bdim_ = self.params.x_bdim_
        y_bdim_ = self.params.y_bdim_
        lpv_ = self.params.lpv_
        px_ = self.params.px_
        bottom_layer_ = self.params.bottom_layer_
        layer_ = self.params.layer_
        list = self.get_pins()
        pinholes_placed = []
        for i in range(0, len(list)):
            x1 = int(list[i][0][1])
            x1s = (x1-1)*lpv_+bottom_layer_/layer_
            x2 = int(list[i][0][2])
            x2s = x2/def_scale_
            x3 = int(list[i][0][3])
            x3s = x3/def_scale_
            yb = y_bdim_/px_
            xb = x_bdim_/px_
            if x2 <= self.params.cleft:
                pinholes_placed.append(scad_std_cell["pinhole_325px_0"](0, x3s, x1s, 'left'))
            elif x2 >= self.params.cright:
                pinholes_placed.append(scad_std_cell["pinhole_325px_0"](xb, x3s, x1s, 'right'))
            elif x3 <= self.params.cbottom:
                pinholes_placed.append(scad_std_cell["pinhole_325px_0"](x2s, 0, x1s, 'bottom'))
            elif x3 >= self.params.ctop:
                pinholes_placed.append(scad_std_cell["pinhole_325px_0"](x2s, yb, x1s, 'top'))

        if len(pinholes_placed) == 0:
            return scad_std_cell.empty_obj('NO PINHOLES')
        else:
            return reduce(operator.add, pinholes_placed)

    def place_pins(self, dimm_file = None):
        x_cdim_ = self.params.x_cdim_
        y_cdim_ = self.params.y_cdim_
        def_scale_ = self.params.def_scale_
        bottom_layer_ = self.params.bottom_layer_
        layer_ = self.params.layer_
        px_ = self.params.px_
        lpv_ = self.params.lpv_
        x_bdim_ = self.params.x_bdim_
        y_bdim_ = self.params.y_bdim_
        z_bdim_ = self.params.z_bdim_


        if dimm_file == None:
            route_dimms = self.generate_dimms()
        else:
            route_dimms = self.generate_dimms(dimm_file)
        pins = self.get_pins()
        pins_placed = []
        for i in range(0, len(pins)):
            x0 = pins[i][0][0]
            x1 = int(pins[i][0][1])
            x1s = (x1-1)*lpv_*layer_+bottom_layer_
            x2 = int(pins[i][0][2])
            x2s = x2*px_/def_scale_
            x3 = int(pins[i][0][3])
            x3s = x3*px_/def_scale_
            yb = y_bdim_/px_
            xb = x_bdim_/px_

            cond_x_left    = x2 <= self.params.cleft
            cond_x_right   = x2 >= self.params.cright
            cond_y_bottom  = x3 <= self.params.cbottom
            cond_y_top     = x3 >= self.params.ctop
            if (not cond_x_left and not cond_x_right and not cond_y_bottom and not cond_y_top):
                p0 = [x2s, x3s, x1s]
                p1 = [x2s, x3s, z_bdim_]
                connect_matrix = [["z", p1, 0]]
                pins_placed.append(scad_routing.routing(p0, connect_matrix, route_dimms[x0]))
        if pins_placed:
            return reduce(operator.add, pins_placed)
        else:
            return scad_std_cell.empty_obj('NO PINS')


class interconnect_place:
    """
    If pins are found inside of the boundary of the chip, this will place an interconnect for use with the interconnect module.
    """
    def __init__(self, def_file, db, params) :
        self.def_file = def_file
        self.db = db
        self.params = params

    def place_interconnect(self):
        x_bdim_ = self.params.x_bdim_
        y_bdim_ = self.params.y_bdim_
        z_bdim_ = self.params.z_bdim_
        x_cdim_ = self.params.x_cdim_
        y_cdim_ = self.params.y_cdim_
        px_ = self.params.px_
        layer_ = self.params.layer_
        def_scale_ = self.params.def_scale_

        pins                = pin_place(self.def_file, self.db, self.params).get_pins()
        xpos                = solid.utils.floor(x_bdim_/px_/2)
        ypos                = solid.utils.floor(y_bdim_/px_/2)
        for i in range(0, len(pins)):
            x0 = pins[i][0][0]
            x1 = int(pins[i][0][1])
            x2 = int(pins[i][0][2])
            x3 = int(pins[i][0][3])

            cond_x_left    = x2 <= self.params.cleft
            cond_x_right   = x2 >= self.params.cright
            cond_y_bottom  = x3 <= self.params.cbottom
            cond_y_top     = x3 >= self.params.ctop
            if (not cond_x_left and not cond_x_right and not cond_y_bottom and not cond_y_top):
                print(f"Pin '{x0}' is located inside of the chip boundary.\nUsing interconnect module - ensure pins are alligned correctly in io_constraints.tcl.")
                return scad_std_cell.interconnect_32channel(xpos, ypos, z_bdim_/layer_)
        return scad_std_cell.empty_obj('NO PINS')


class add_bulk:
    """
    This class creates the bulk chip.
    """
    def __init__(self,params) :

        self.x_dim = params.x_bdim_
        self.y_dim = params.y_bdim_
        self.z_dim = params.z_bdim_

    def bulk(self):
        bulk_chip = solid.cube([self.x_dim, self.y_dim, self.z_dim])
        return(bulk_chip)


class add_marker:
    """
    This class creates a marker on the chip for orientation.
    """
    def __init__(self, params):
        self.params = params

    def marker(self):
        xpos = self.params.x_bdim_-200*self.params.px_
        ypos = self.params.y_bdim_-200*self.params.px_
        zpos = self.params.z_bdim_-200*self.params.px_
        return scad_std_cell.marker(xpos, ypos, zpos)

class scad_generation:
    """
    This class generates the dependent scad files for the design.
    """
    def __init__(self) :
        pass

    def generate_routing_scad(self, scad_dir, output_dir, platform, design):
        """Generates the routing scad and writes to the results directory."""
        try:
            os.makedirs(output_dir)
        except FileExistsError:
            pass

        with open(f"{scad_dir}/{platform}/routing_181220.scad") as f:
            with open(os.path.join(output_dir, design + "_routing.scad"), "a") as f1:
                for line in f:
                    f1.write(line)


    def generate_std_cell_scad(self, px, layer, lpv, scad_dir, output_dir, platform, design):

        """Generates the standard cell scad with the pixel and layers defined."""
        self.generate_routing_scad(scad_dir, output_dir, platform, design)

        with open(os.path.join(output_dir, design + "_std_cells.scad"), "w") as f:
            f.write(f"include<{design}_routing.scad>\n\n")

        with open(os.path.join(output_dir, design + "_std_cells.scad"), "a") as f:
            f.write(f"px = {px};\nlayer = {layer};\nlpv = {lpv};\n\n")

        with open(f"{scad_dir}/{platform}/components_05052022.scad") as f:
            with open(os.path.join(output_dir, design + "_std_cells.scad"), "a") as f1:
                for line in f:
                    f1.write(line)

    def generate_interconnect_scad(self, px, layer, scad_dir, output_dir, platform, design):
        """
        Generates the interconnect chip.
        """
        with open(os.path.join(output_dir, design + "_interconnect.scad"), "a") as f:
            f.write(f"px = {px};\nlayer = {layer};\n\n")

        with open(f"{scad_dir}/{platform}/flushing_interface_32.scad") as f:
            with open(os.path.join(output_dir, design + "_interconnect.scad"), "a") as f1:
                for line in f:
                    f1.write(line)


def scad_pnr(db, scad_dir, platform, design, def_file, results_dir, px, layer, bottom_layer, lpv, xbulk, ybulk, zbulk, xchip, ychip, def_scale, pitch, res, dimm_file = None):
    """This function generates the entire SCAD flow by calling the classes above in their intended order."""

    print("------------------------------")
    print("SCAD Place and Route begin")
    print("------------------------------\n")

    print("Generating standard cell and routing SCAD...")
    scad_generation().generate_std_cell_scad(px, layer, lpv, scad_dir, results_dir, platform, design)
    scad_generation().generate_interconnect_scad(px, layer, scad_dir, results_dir, platform, design)
    print("SCAD generation complete\n")

    print(f"Importing generated SCAD for design '{design}'")
    global scad_routing, scad_std_cell
    scad_routing    = solid.import_scad(f"{results_dir}/{design}_routing.scad")
    scad_std_cell   = solid.import_scad(f"{results_dir}/{design}_std_cells.scad")
    print(f"SCAD import for '{design}' complete\n")

    print(f"The design parameters for '{design}' are:")
    params = Params()
    params.set_def_scale(def_scale)
    params.set_pitch(pitch)
    params.set_scale_parameters(px, layer)
    params.set_bulk_dimensions(xbulk, ybulk, zbulk)
    params.set_chip_dimensions(xchip, ychip)
    params.set_bottom_layer(bottom_layer)

    params.set_layers_per_via(lpv)

    print("\nInitializing design space")
    params.design_space_init(xbulk, ybulk, 10)
    params.set_render_resolution(res)
    print("Initialization complete.")

    print(f"\nBuilding the design model for '{design}' from:\n'{def_file}'")
    bulk = add_bulk(params).bulk()
    routing = route(def_file, db, params).perform_routing(results_dir, design, dimm_file, flatten = True)

    components =  place(params, db).place_components()
    pinholes = pin_place(def_file, db, params).place_pinholes()
    pins = pin_place(def_file, db, params).place_pins(dimm_file)
    marker = add_marker(params).marker()
    interconnect = interconnect_place(def_file, db, params).place_interconnect()
    negative = components + pinholes + pins + marker + interconnect
    model = bulk - routing + interconnect
    print("Build complete\n")

    print(f"Rendering build for '{design}'")
    solid.scad_render_to_file(model,
                              f"{results_dir}/{design}.scad",
                              file_header=f"$fn = {params.res_};",
                              include_orig_code=False)
    print(f"Rendering complete\n")

    print("------------------------------")
    print("SCAD Place and Route complete")
    print("------------------------------\n")

    print(f"Place and Route results are found in '{results_dir}'")

if __name__ == "__main__":
    import argparse

    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--platform', metavar='<platform>', dest='platform', type=str,
                    help="Design platform.")
    ap.add_argument('--design', metavar='<design_name>', dest='design', type=str,
                    help="The design name.")
    ap.add_argument('--def_file', metavar='<path>', dest='def_file', type=str,
                    help="Path to the .def file from OpenROAD flow.")
    ap.add_argument('--lef_file', metavar='<path>', dest='lef_file', type=str,
                    help="Path to the .lef file from OpenROAD flow.")
    ap.add_argument('--tlef_file', metavar='<path>', dest='tlef_file', type=str,
                    help="Path to the .tlef file from OpenROAD flow.")
    ap.add_argument('--results_dir', metavar='<path>', dest='results_dir', type=str,
                    help="Path where the results are generated.")
    ap.add_argument('--px', metavar='<value>', dest='px', type=float,
                    help="Metric pixel size.")
    ap.add_argument('--layer', metavar='<value>', dest='layer', type=float,
                    help="Metric layer size.")
    ap.add_argument('--bottom_layer', metavar='<value>', dest='bottom_layer', type=int,
                    help="Value of bottom layer (routing).")
    ap.add_argument('--lpv', metavar='<value>', dest='lpv', type=int,
                    help="Multiples of layers per via.")
    ap.add_argument('--xbulk', metavar='<value>', dest='xbulk', type=int,
                    help="Horizontal length of the bulk in pixels.")
    ap.add_argument('--ybulk', metavar='<value>', dest='ybulk', type=int,
                    help="Vertical length of the bulk in pixels.")
    ap.add_argument('--zbulk', metavar='<value>', dest='zbulk', type=int,
                    help="Height of the bulk in layers.")
    ap.add_argument('--xchip', metavar='<values>', dest='xchip', nargs = '+', type=int,
                    help="Left and right endpoints of chip in multiples of pixels.")
    ap.add_argument('--ychip', metavar='<values>', dest='ychip', nargs = '+', type=int,
                    help="Bottom and top endpoints of chip in multiples of pixels.")
    ap.add_argument('--def_scale', metavar='<value>', dest='def_scale', type=int,
                    help="Multiplier used in the def file for unit precision.")
    ap.add_argument('--pitch', metavar='<value>', dest='pitch', type=int,
                    help="PNR pitch for the platform.")
    ap.add_argument('--res', metavar='<value>', dest='res', type=int,
                    help="Resolution of the scad rendering.")
    ap.add_argument('--dimm_file', metavar='<path>', dest='dimm_file', type=str,
                    help="Optional .csv file with routing dimensions.", default = None)
    args = ap.parse_args()

    db = odb.dbDatabase.create()
    odb.read_lef(db, args.tlef_file)
    odb.read_lef(db, args.lef_file)
    odb.read_def(db, args.def_file)
    scad_dir = os.environ['SCAD_DIR']
    scad_pnr(db,
             scad_dir,
             args.platform,
             args.design,
             args.def_file,
             args.results_dir,
             args.px,
             args.layer,
             args.bottom_layer,
             args.lpv,
             args.xbulk,
             args.ybulk,
             args.zbulk,
             args.xchip,
             args.ychip,
             args.def_scale,
             args.pitch,
             args.res,
             args.dimm_file)
