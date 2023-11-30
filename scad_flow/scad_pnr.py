from solid import *
from solid import scad_render_to_file
from solid.utils import *
import os
import numpy as np
import pandas as pd


class set_scale_parameters:
    """
    This sets the pixel size scale unique to the printer.
    All x,y dimensions are scalar multiples of the "px" value and
    z dimensions are scalar multiples of the "layer" value. For example,
    if a standard cell is instatntiated and needs x, y, or z dimensional 
    arguments, the arguments will be the number of pixels and the 
    physical value will be the argument mutliplied by the pixel scalar.
    """
    def __init__(self, px, layer) -> None:
        global px_, layer_
        px_     = px
        layer_  = layer
        print(f"px set to: {px} mm/px\nlayer set to: {layer} mm/layer", )


class set_render_resolution:
    """
    This sets the render resoultion when exported to openSCAD.
    """
    def __init__(self, res) -> None:
        global res_
        res_ = res
        print(f"Rendering fragment number set to: {res}")


class set_def_scale:
    """
    This sets the scale used in the lef/def files for 1 pixel. For example,
    if 1 pixel is equivalent to 0.5 units in the lef/def file then this value
    should be set to 0.5.
    """
    def __init__(self, def_scale) -> None:
        global def_scale_
        def_scale_ = def_scale
        print(f".def unit scale set to: {def_scale}")


class set_pitch:
    """
    This sets the pixel pitch of the PNR flow as determined by the platform.
    """
    def __init__(self, pitch) -> None:
        global pitch_
        pitch_ = pitch
        print(f"The platform pitch is {pitch} pixels.")


class set_bottom_layer:
    """
    This sets the phyical location that the bottom routing layer is placed.
    """
    def __init__(self, bottom_layer) -> None:
        global bottom_layer_
        bottom_layer_ = bottom_layer * layer_
        print(f"The bottom layer is set to: {bottom_layer} of {int(z_bdim_/layer_)} layers")


class set_layers_per_via:
    """
    This sets the multiple of layers per via.
    """
    def __init__(self, lpv) -> None:
        global lpv_
        lpv_ = lpv
        print(f"The number of layer per via is set to: {lpv} layers/via")


class set_bulk_dimensions:
    """
    This sets the dimensions of the bulk chip.
    """
    def __init__(self, x_bdim, y_bdim, z_bdim) -> None:
        global x_bdim_, y_bdim_, z_bdim_
        x_bdim_ = x_bdim * px_
        y_bdim_ = y_bdim * px_
        z_bdim_ = z_bdim * layer_
        print(f"Bulk dimensions are:\n\tx: {x_bdim} px\n\ty: {y_bdim} px\n\tz: {z_bdim}  layers")


class set_chip_dimensions:
    """
    This sets the dimensions of the chip.
    """
    def __init__(self, x_cdim, y_cdim) -> None:
        global x_cdim_, y_cdim_
        x_cdim_ = x_cdim
        y_cdim_ = y_cdim
        print(f"The lower and upper bounds of the chip are:\n\tx: [{x_cdim[0]} {x_cdim[1]}] px\n\ty: [{y_cdim[0]} {y_cdim[1]}] px")


class design_space_init:
    """
    This initializes the tensor of the design space.
    """
    def __init__(self, xspace: int, yspace: int, num_layers: int) -> None:
        global design_space_, design_space_nets_
        self.xspace         = xspace
        self.yspace         = yspace
        self.num_layers     = num_layers
        design_space_       = np.zeros((num_layers, int(yspace/pitch_)+1, int(xspace/pitch_)+1), dtype=np.bool_)
        design_space_nets_  = np.empty((num_layers, int(yspace/pitch_)+1, int(xspace/pitch_)+1), dtype=object)


class place:
    """
    This class takes a .def file with place information and can get the 2D components
    found in the file as well as the placement location and transform that information
    to openSCAD with the corresponding 3D components.
    """
    def __init__(self, def_file) -> None:
        self.def_file = def_file

    def get_components(self):
        f = open(self.def_file)
        index, flag = 0, 0
        list = []
        index_found = []
        for line in f:
            list.append(line.strip())
            index += 1
            if flag < 2:
                if 'COMPONENTS' in line:
                    flag += 1
                    index_found.append(index)
            else:
                break
        f.close()

        if flag == 2:
            list = list[index_found[0]:index_found[1]-1]
            replace_list = ['- ', '+ ', 'PLACED ', '( ', ') ', ';']
            for i in range(0, len(list)):
                for char in replace_list:
                    list[i] = list[i].replace(char, '')
                list[i] = list[i].strip().split(' ')
            return(list)
        else:
            return(list) # return the same for now but can add error later

    def place_components(self):
        list = self.get_components()
        components_placed = str()
        for i in range(0, len(list)):
            components_placed = components_placed + f"scad_std_cell.{list[i][1]}({list[i][2]}/{def_scale_}, {list[i][3]}/{def_scale_}, {bottom_layer_}/{layer_}, '{list[i][4]}') + "
        components_placed = components_placed[0:-3]
        if components_placed == "":
            components_placed = f"scad_std_cell.empty_obj('NO COMPONENTS')"
        return(eval(components_placed))


class component_offset:
    """
    Builds a tuple of the components and their layer offsets.
    """
    def __init__(self, name: str, layer: list, coord_offset: list) -> None:
        self.name           = name
        self.layer          = layer
        self.coord_offset   = coord_offset

    def build (self) -> tuple[str, dict]:
        output = {key: value for key, value in zip(self.layer, self.coord_offset)}
        return(self.name, output)


class design_space_place:
    """
    This fills the design space with the placed components.
    """
    def __init__(self, place_list) -> None:
        self.place_list = place_list

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
            if component[4] == 'N':
                for key in list(all_offset_N[component[1]][1].keys()):
                    for offset in all_offset_N[component[1]][1][key]:
                        design_space_[key-1, int((int(component[3])/def_scale_)/25):int((int(component[3])/def_scale_+offset[1])/25), int((int(component[2])/def_scale_)/25):int((int(component[2])/def_scale_+offset[0])/25)] = True
                        design_space_nets_[key-1, int((int(component[3])/def_scale_)/25):int((int(component[3])/def_scale_+offset[1])/25), int((int(component[2])/def_scale_)/25):int((int(component[2])/def_scale_+offset[0])/25)] = component[1]
            elif component[4] == 'FN':
                for key in list(all_offset_FN[component[1]][1].keys()):
                    for offset in all_offset_FN[component[1]][1][key]:
                        design_space_[key-1, int((int(component[3])/def_scale_+offset[1])/25), int((int(component[2])/def_scale_+offset[0])/25)] = True
                        design_space_nets_[key-1, int((int(component[3])/def_scale_+offset[1])/25), int((int(component[2])/def_scale_+offset[0])/25)] = component[1]
            elif component[4] == 'S':
                for key in list(all_offset_S[component[1]][1].keys()):
                    for offset in all_offset_S[component[1]][1][key]:
                        design_space_[key-1, int((int(component[3])/def_scale_+offset[1])/25), int((int(component[2])/def_scale_+offset[0])/25)] = True
                        design_space_nets_[key-1, int((int(component[3])/def_scale_+offset[1])/25), int((int(component[2])/def_scale_+offset[0])/25)] = component[1]
            else:
                for key in list(all_offset_FS[component[1]][1].keys()):
                    for offset in all_offset_FS[component[1]][1][key]:
                        design_space_[key-1, int((int(component[3])/def_scale_+offset[1])/25), int((int(component[2])/def_scale_+offset[0])/25)] = True
                        design_space_nets_[key-1, int((int(component[3])/def_scale_+offset[1])/25), int((int(component[2])/def_scale_+offset[0])/25)] = component[1]


class route:
    """
    This class takes a .def file with routing information and creates a SCAD model of the routing channels.
    """
    def __init__(self, def_file) -> None:
        self.def_file = def_file

    def snap_to_grid(self, value):
        snap_value = round(int(value)/pitch_/def_scale_) * pitch_ * def_scale_
        return(f"{snap_value}")

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
            i = 0
            length = len(routes)
            while i < length:
                if routes[i][0] == '-':
                    del routes[i]
                    i = 0
                    length = len(routes)
                else:
                    i += 1
            for net in routes:
                if (len(net) == 6 and net[5] != 'PIN') or len(net) == 7:
                    net[2] = self.snap_to_grid(net[2])
                    net[3] = self.snap_to_grid(net[3])
                    net[4] = self.snap_to_grid(net[4])
                    net[5] = self.snap_to_grid(net[5])
                else:
                    net[2] = self.snap_to_grid(net[2])
                    net[3] = self.snap_to_grid(net[3])
            i = 0
            length = len(routes)
            while i < length:
                if len(routes[i]) >= 6 and (routes[i][2]==routes[i][4] and routes[i][3]==routes[i][5]):
                    if 'PIN' in routes[i]:
                        if routes.count([routes[i][0], str(int(routes[i][1])-1), routes[i][2], routes[i][3], f"M{int(routes[i][1])-1}M{int(routes[i][1])}_PR", 'PIN']) == 2:
                            routes = list(filter(([routes[i][0], str(int(routes[i][1])-1), routes[i][2], routes[i][3], f"M{int(routes[i][1])-1}M{int(routes[i][1])}_PR", 'PIN']).__ne__, routes))
                    else:
                        if routes.count([routes[i][0], str(int(routes[i][1])-1), routes[i][2], routes[i][3], f"M{int(routes[i][1])-1}M{int(routes[i][1])}_PR"]) == 2:
                            routes = list(filter(([routes[i][0], str(int(routes[i][1])-1), routes[i][2], routes[i][3], f"M{int(routes[i][1])-1}M{int(routes[i][1])}_PR"]).__ne__, routes))
                    del routes[i]
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
        design_space_route(routes)
        if target == 'one_length':
            one_length_routes           = self.get_target_routing(target)
            for i in range(0, 9):
                for route in one_length_routes:
                    if  ([route[0], str(int(route[1])-1), route[2], route[3], f'M{int(route[1])-1}M{int(route[1])}_PR'] in routes or \
                        [route[0], str(int(route[1])-1), route[2], route[3], f'M{int(route[1])-1}M{int(route[1])}_PR', 'PIN'] in routes) and \
                        ([route[0], str(int(route[1])-1), route[4], route[5], f'M{int(route[1])-1}M{int(route[1])}_PR'] in routes or \
                        [route[0], str(int(route[1])-1), route[4], route[5], f'M{int(route[1])-1}M{int(route[1])}_PR', 'PIN'] in routes):

                        if len(route) == 6:
                            routes.remove([route[0], str(int(route[1])-1), route[2], route[3], f'M{int(route[1])-1}M{int(route[1])}_PR'])
                            routes.remove([route[0], str(int(route[1])-1), route[4], route[5], f'M{int(route[1])-1}M{int(route[1])}_PR'])
                        else:
                            routes.remove([route[0], str(int(route[1])-1), route[2], route[3], f'M{int(route[1])-1}M{int(route[1])}_PR', 'PIN'])
                            routes.remove([route[0], str(int(route[1])-1), route[4], route[5], f'M{int(route[1])-1}M{int(route[1])}_PR', 'PIN'])
                        
                        design_space_nets_[int(route[1])-1, int(int(route[3])/def_scale_/pitch_), int(int(route[2])/def_scale_/pitch_)] = ''
                        design_space_nets_[int(route[1])-1, int(int(route[5])/def_scale_/pitch_), int(int(route[4])/def_scale_/pitch_)] = ''

                        index = routes.index(route)
                        routes[index][1]             = str(int(route[1])-1)  # drop the length down one level
                        route[1]  = str(int(route[1])-1)  # update one_length_routes
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
            if nets[i] in nets_params:
                dimms.update({nets[i]:self.generate_dimm(route_params[nets[i]][0], route_params[nets[i]][1], route_params[nets[i]][2])})
            else:
                dimms.update({nets[i]:self.generate_dimm(14, 14, 10)})
        return(dimms)

    def report_route_lengths(self, nets, pins, output_dir, design):
        lengths = {}
        for net in nets:
            if net[0] not in list(lengths.keys()):
                lengths[net[0]] = 0
        for net in nets:
            if net[4][0] == 'M':
                lengths[net[0]] += lpv_*layer_
            elif net[2] == net[4]:
                lengths[net[0]] += (int(net[5])-int(net[3]))/def_scale_*px_
            else:
                lengths[net[0]] += (int(net[4])-int(net[2]))/def_scale_*px_
        for pin in pins:
            lengths[pin[0][0]] += z_bdim_ - (int(pin[0][1])-1)*lpv_*layer_+bottom_layer_
        writer = pd.ExcelWriter(os.path.join(output_dir, design + "_lengths.xlsx"), engine='xlsxwriter')
        df = pd.DataFrame(lengths, index=['length (mm)'])
        df = df.T
        df.to_excel(writer, sheet_name='lengths')
        writer.save()
        
    def get_ports(self):
        place_components    = place(self.def_file).get_components()
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
            if inst_placement[port][3] == 'N':
                ports[port] = {}
                for port1 in std_cells[inst_placement[port][0]][2]:
                    layer = std_cells[inst_placement[port][0]][2][port1][0]
                    xpos = int(inst_placement[port][1])/def_scale_ + std_cells[inst_placement[port][0]][2][port1][1]
                    ypos = int(inst_placement[port][2])/def_scale_ + std_cells[inst_placement[port][0]][2][port1][2]
                    ports[port].update({port1 : [layer, xpos, ypos]})
            if inst_placement[port][3] == 'FN':
                ports[port] = {}
                for port1 in std_cells[inst_placement[port][0]][2]:
                    layer = std_cells[inst_placement[port][0]][2][port1][0]
                    xpos = int(inst_placement[port][1])/def_scale_ + std_cells[inst_placement[port][0]][0] - std_cells[inst_placement[port][0]][2][port1][1]
                    ypos = int(inst_placement[port][2])/def_scale_ + std_cells[inst_placement[port][0]][2][port1][2]
                    ports[port].update({port1 : [layer, xpos, ypos]})
            if inst_placement[port][3] == 'FS':
                ports[port] = {}
                for port1 in std_cells[inst_placement[port][0]][2]:
                    layer = std_cells[inst_placement[port][0]][2][port1][0]
                    xpos = int(inst_placement[port][1])/def_scale_ + std_cells[inst_placement[port][0]][2][port1][1]
                    ypos = int(inst_placement[port][2])/def_scale_ + std_cells[inst_placement[port][0]][1] - std_cells[inst_placement[port][0]][2][port1][2]
                    ports[port].update({port1 : [layer, xpos, ypos]})
            if inst_placement[port][3] == 'S':
                ports[port] = {}
                for port1 in std_cells[inst_placement[port][0]][2]:
                    layer = std_cells[inst_placement[port][0]][2][port1][0]
                    xpos = int(inst_placement[port][1])/def_scale_ + std_cells[inst_placement[port][0]][0] - std_cells[inst_placement[port][0]][2][port1][1]
                    ypos = int(inst_placement[port][2])/def_scale_ + std_cells[inst_placement[port][0]][1] - std_cells[inst_placement[port][0]][2][port1][2]
                    ports[port].update({port1 : [layer, xpos, ypos]})
        return(ports)
    
    def perform_routing(self, output_dir, design, dimm_file = None, flatten = False):
        if dimm_file == None:
            route_dimms  = self.generate_dimms()
        else:
            route_dimms  = self.generate_dimms(dimm_file)
            route_params = self.get_route_params(dimm_file)
        routes        = self.get_routing()
        routing     = str()        
        if flatten:
            routes = self.flatten_routes(routes, 'one_length')
        self.report_route_lengths(routes, pin_place(self.def_file).get_pins(), output_dir, design)
        for route in routes:
            if (route[4][0] == 'M'):
                p0 =    [int(route[2])/def_scale_*px_,
                         int(route[3])/def_scale_*px_,
                         (int(route[1])-1)*lpv_*layer_+bottom_layer_]
                p1 =    [int(route[2])/def_scale_*px_,
                         int(route[3])/def_scale_*px_,
                         (int(route[4][3])-1)*lpv_*layer_+bottom_layer_]
                connect_matrix = [["z", p1, 2]]
                routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[route[0]] + ") + "
            elif route[2] == route[4]:
                p0 =    [int(route[2])/def_scale_*px_,
                         int(route[3])/def_scale_*px_ - 0.5 * (int(route_params[route[0]][0]) if (dimm_file != None and route[0] in route_params.keys()) else 14) * px_,
                         (int(route[1])-1)*lpv_*layer_+bottom_layer_]
                p1 =    [int(route[4])/def_scale_*px_,
                         int(route[5])/def_scale_*px_ + 0.5 * (int(route_params[route[0]][0]) if (dimm_file != None and route[0] in route_params.keys()) else 14) * px_,
                         (int(route[1])-1)*lpv_*layer_+bottom_layer_]
                connect_matrix = [["y", p1, 1]]
                routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[route[0]] + ") + "
            else:
                p0 =    [int(route[2])/def_scale_*px_ - 0.5 * (int(route_params[route[0]][0]) if (dimm_file != None and route[0] in route_params.keys()) else 14) * px_,
                         int(route[3])/def_scale_*px_,
                         (int(route[1])-1)*lpv_*layer_+bottom_layer_]
                p1 =    [int(route[4])/def_scale_*px_ + 0.5 * (int(route_params[route[0]][0]) if (dimm_file != None and route[0] in route_params.keys()) else 14) * px_,
                         int(route[5])/def_scale_*px_,
                         (int(route[1])-1)*lpv_*layer_+bottom_layer_]
                connect_matrix = [["x", p1, 0]]
                routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[route[0]] + ") + "  
        routing = routing[0:-3]
        if routing == "":
            routing = f"scad_std_cell.empty_obj('NO ROUTING')"
        return(eval(routing))

    
class design_space_route:
    """
    This fills the design space with the routed nets and pins.
    """
    def __init__(self, route_list) -> None:
        self.route_list = route_list

        for route in self.route_list:
            if (len(route) == 6 and route[5] != 'PIN') or len(route) == 7:
                if route[2] == route[4]:
                    design_space_[int(route[1])-1, int(int(route[3])/def_scale_/pitch_):int(int(route[5])/def_scale_/pitch_)+1, int(int(route[2])/def_scale_/pitch_)] = True
                    design_space_nets_[int(route[1])-1, int(int(route[3])/def_scale_/pitch_):int(int(route[5])/def_scale_/pitch_)+1, int(int(route[2])/def_scale_/pitch_)] = route[0]
                else:
                    design_space_[int(route[1])-1, int(int(route[3])/def_scale_/pitch_), int(int(route[2])/def_scale_/pitch_):int(int(route[4])/def_scale_/pitch_)+1] = True
                    design_space_nets_[int(route[1])-1, int(int(route[3])/def_scale_/pitch_), int(int(route[2])/def_scale_/pitch_):int(int(route[4])/def_scale_/pitch_)+1] = route[0]
            else:
                design_space_[int(route[4][1])-1:int(route[4][3]), int(int(route[3])/def_scale_/pitch_), int(int(route[2])/def_scale_/pitch_)] = True
                design_space_nets_[int(route[4][1])-1:int(route[4][3]), int(int(route[3])/def_scale_/pitch_), int(int(route[2])/def_scale_/pitch_)] = route[0]


class pin_place:
    """
    This class takes a .def file with pin information and places pins or pinholes accordingly.
    """
    def __init__(self, def_file) -> None:
        self.def_file = def_file

    def snap_to_grid(self, value):
        snap_value = round(int(value)/pitch_/def_scale_) * pitch_ * def_scale_
        return(f"{snap_value}")

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
            for pin in list:
                pin[0][2] = self.snap_to_grid(pin[0][2])
                pin[0][3] = self.snap_to_grid(pin[0][3])
            return(list)    
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
        list = self.get_pins()
        pinholes_placed = str()
        for i in range(0, len(list)):
            cond_x_left    = int(list[i][0][2]) <= (x_cdim_[0]+1) * def_scale_
            cond_x_right   = int(list[i][0][2]) >= (x_cdim_[1]-1) * def_scale_
            cond_y_bottom  = int(list[i][0][3]) <= (y_cdim_[0]+1) * def_scale_
            cond_y_top     = int(list[i][0][3]) >= (y_cdim_[1]-1) * def_scale_
            if (cond_x_left):
                pinholes_placed = pinholes_placed + f"scad_std_cell.pinhole_325px_0(0, {list[i][0][3]}/{def_scale_}, {(int(list[i][0][1])-1)*lpv_+bottom_layer_/layer_}, 'left') + "
            elif (cond_x_right):
                pinholes_placed = pinholes_placed + f"scad_std_cell.pinhole_325px_0({x_bdim_/px_}, {list[i][0][3]}/{def_scale_}, {(int(list[i][0][1])-1)*lpv_+bottom_layer_/layer_}, 'right') + "
            elif (cond_y_bottom):
                pinholes_placed = pinholes_placed + f"scad_std_cell.pinhole_325px_0({list[i][0][2]}/{def_scale_}, 0, {(int(list[i][0][1])-1)*lpv_+bottom_layer_/layer_}, 'bottom') + "
            elif (cond_y_top):
                pinholes_placed = pinholes_placed + f"scad_std_cell.pinhole_325px_0({list[i][0][2]}/{def_scale_}, {y_bdim_/px_}, {(int(list[i][0][1])-1)*lpv_+bottom_layer_/layer_}, 'top') + "
        pinholes_placed = pinholes_placed[0:-3]
        if pinholes_placed == "":
            pinholes_placed = f"scad_std_cell.empty_obj('NO PINHOLES')"
        return(eval(pinholes_placed))
    
    def place_pins(self, dimm_file = None):
        if dimm_file == None:
            route_dimms = self.generate_dimms()
        else:
            route_dimms = self.generate_dimms(dimm_file)
        list = self.get_pins()
        pins_placed = str()
        for i in range(0, len(list)):
            cond_x_left    = int(list[i][0][2]) <= (x_cdim_[0]+1) * def_scale_
            cond_x_right   = int(list[i][0][2]) >= (x_cdim_[1]-1) * def_scale_
            cond_y_bottom  = int(list[i][0][3]) <= (y_cdim_[0]+1) * def_scale_
            cond_y_top     = int(list[i][0][3]) >= (y_cdim_[1]-1) * def_scale_
            if (not cond_x_left and not cond_x_right and not cond_y_bottom and not cond_y_top):
                p0 = [int(list[i][0][2])*px_/def_scale_, int(list[i][0][3])*px_/def_scale_, (int(list[i][0][1])-1)*lpv_*layer_+bottom_layer_]
                p1 = [int(list[i][0][2])*px_/def_scale_, int(list[i][0][3])*px_/def_scale_, z_bdim_]
                connect_matrix = [["z", p1, 0]]
                pins_placed = pins_placed + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[list[i][0][0]] + ") + "        
        pins_placed = pins_placed[0:-3]
        if pins_placed == "":
            pins_placed = f"scad_std_cell.empty_obj('NO PINS')"
        return(eval(pins_placed))


class interconnect_place:
    """
    If pins are found inside of the boundary of the chip, this will place an interconnect for use with the interconnect module.
    """
    def __init__(self, def_file) -> None:
        self.def_file = def_file

    def place_interconnect(self):
        list                = pin_place(self.def_file).get_pins()
        interconnect_placed = str()
        xpos                = floor(x_bdim_/px_/2)
        ypos                = floor(y_bdim_/px_/2)
        for i in range(0, len(list)):
            cond_x_left    = int(list[i][0][2]) <= (x_cdim_[0]+1) * def_scale_
            cond_x_right   = int(list[i][0][2]) >= (x_cdim_[1]-1) * def_scale_
            cond_y_bottom  = int(list[i][0][3]) <= (y_cdim_[0]+1) * def_scale_
            cond_y_top     = int(list[i][0][3]) >= (y_cdim_[1]-1) * def_scale_
            if (not cond_x_left and not cond_x_right and not cond_y_bottom and not cond_y_top):
                print(f"Pin '{list[i][0][0]}' is located inside of the chip boundary.\nUsing interconnect module - ensure pins are alligned correctly in io_constraints.tcl.")
                interconnect_placed = f"scad_std_cell.interconnect_32channel({xpos}, {ypos}, {z_bdim_/layer_})"
                break
        if interconnect_placed == "":
            f"scad_std_cell.empty_obj('NO PINS')"
        return(eval(interconnect_placed))


class add_bulk:
    """
    This class creates the bulk chip.
    """
    def __init__(self, x_dim, y_dim, z_dim) -> None:
        self.x_dim = x_dim
        self.y_dim = y_dim
        self.z_dim = z_dim

    def bulk(self):
        bulk_chip = cube([self.x_dim, self.y_dim, self.z_dim])
        return(bulk_chip)


class add_marker:
    """
    This class creates a marker on the chip for orientation.
    """
    def __init__(self):
        pass
        
    def marker(xpos, ypos, zpos):     
        marker = f"scad_std_cell.marker({xpos}, {ypos}, {zpos})"
        return(eval(marker))


class scad_generation:
    """
    This class generates the dependent scad files for the design.
    """
    def __init__(self) -> None:
        pass

    def generate_routing_scad(self, output_dir, platform, design):
        """Generates the routing scad and writes to the results directory."""
        try:
            os.makedirs(output_dir)
        except FileExistsError:
            pass
        
        with open(f"{os.environ['SCAD_DIR']}/{platform}/routing_181220.scad") as f:
            with open(os.path.join(output_dir, design + "_routing.scad"), "a") as f1:
                for line in f:
                    f1.write(line)


    def generate_std_cell_scad(self, px, layer, lpv, output_dir, platform, design):
        """Generates the standard cell scad with the pixel and layers defined."""
        set_scale_parameters(px, layer)
        set_layers_per_via(lpv)
        self.generate_routing_scad(output_dir, platform, design)
    
        with open(os.path.join(output_dir, design + "_std_cells.scad"), "w") as f:
            f.write(f"include<{design}_routing.scad>\n\n")
    
        with open(os.path.join(output_dir, design + "_std_cells.scad"), "a") as f:
            f.write(f"px = {px_};\nlayer = {layer_};\nlpv = {lpv_};\n\n")
        
        with open(f"{os.environ['SCAD_DIR']}/{platform}/components_05052022.scad") as f:
            with open(os.path.join(output_dir, design + "_std_cells.scad"), "a") as f1:
                for line in f:
                    f1.write(line)

    def generate_interconnect_scad(self, output_dir, platform, design):
        """
        Generates the interconnect chip.
        """
        with open(os.path.join(output_dir, design + "_interconnect.scad"), "a") as f:
            f.write(f"px = {px_};\nlayer = {layer_};\n\n")
        
        with open(f"{os.environ['SCAD_DIR']}/{platform}/flushing_interface_32.scad") as f:
            with open(os.path.join(output_dir, design + "_interconnect.scad"), "a") as f1:
                for line in f:
                    f1.write(line)
                

def scad_pnr(platform, design, def_file, results_dir, px, layer, bottom_layer, lpv, xbulk, ybulk, zbulk, xchip, ychip, def_scale, pitch, res, dimm_file = None):
    """This function generates the entire SCAD flow by calling the classes above in their intended order."""
    
    print("------------------------------")
    print("SCAD Place and Route begin")
    print("------------------------------\n")
    
    print("Generating standard cell and routing SCAD...")
    scad_generation().generate_std_cell_scad(px, layer, lpv, results_dir, platform, design)
    scad_generation().generate_interconnect_scad(results_dir, platform, design)
    print("SCAD generation complete\n")

    print(f"Importing generated SCAD for design '{design}'")
    global scad_routing, scad_std_cell
    scad_routing    = import_scad(f"{results_dir}/{design}_routing.scad")
    scad_std_cell   = import_scad(f"{results_dir}/{design}_std_cells.scad")
    print(f"SCAD import for '{design}' complete\n")

    print(f"The design parameters for '{design}' are:")
    set_def_scale(def_scale)
    set_pitch(pitch)
    set_bulk_dimensions(xbulk, ybulk, zbulk)
    set_chip_dimensions(xchip, ychip)
    set_bottom_layer(bottom_layer)

    print("\nInitializing design space")
    design_space_init(xbulk, ybulk, 10)
    print("Initialization complete.")
    
    print(f"\nBuilding the design model for '{design}' from:\n'{def_file}'")
    model = add_bulk(x_bdim_, y_bdim_, z_bdim_).bulk() - (route(def_file).perform_routing(results_dir, design, dimm_file, flatten = True) + place(def_file).place_components() 
                    + pin_place(def_file).place_pinholes() + pin_place(def_file).place_pins(dimm_file) + add_marker.marker(x_bdim_-200*px_, y_bdim_-200*px, z_bdim_-80*layer_)) + interconnect_place(def_file).place_interconnect()
    print("Build complete\n")

    print(f"Rendering build for '{design}'")
    set_render_resolution(res)
    scad_render_to_file(model, f"{results_dir}/{design}.scad", file_header=f"$fn = {res_};", include_orig_code=False)
    print(f"Rendring complete\n")

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

    scad_pnr(args.platform,
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