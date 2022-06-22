from solid import *
from solid import scad_render_to_file
from solid.utils import *
import os


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


class serpentine_channel:
    """
    Special use of the openSAD module "routing_181220.scad" that generates the
    connect matrix as designed in the "connect" method. Creates a serpentine
    channel based on total length of the turns.
    """
    def __init__(self, x0, y0, z0, wchan, hchan, length) -> None:
        self.x0 = x0 * px_
        self.y0 = y0 * px_
        self.z0 = z0 * px_
        self.wchan = wchan * px_
        self.hchan = hchan * layer_
        self.length = length

    def dimensions (self):
        dim_matrix = [[[0, 0], [0, self.wchan], [0, self.hchan]], # assumes placement at the center of the dimension argument
            [[0, self.wchan], [0, 0], [0, self.hchan]]]
        return(dim_matrix)

    def connect(self):
        length_per_turn = 25
        x_length = 25
        y_length = self.length
        connect = []
        sign = 1
        for i in range(0, floor(self.length/length_per_turn)):
            connect.append(["+yx", [sign*y_length * px_, x_length * px_], [1, 0]])
            sign = -sign
        return(connect)

    def routing(self, design):
        b = f"scad_routing.routing([{self.x0}, {self.y0}, {self.z0}], {self.connect()}, {self.dimensions()})"
        return(b)


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
            list.append(line.strip().split('\n'))
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
                    list[i][0] = list[i][0].replace(char, '')
                list[i][0] = list[i][0].strip().split(' ')[1:5]
            return(list)
        else:
            return(list) # return the same for now but can add error later

    def place_components(self):
        list = self.get_components()
        components_placed = str()
        for i in range(0, len(list)):
            components_placed = components_placed + f"scad_std_cell.{list[i][0][0]}({list[i][0][1]}/{def_scale_}, {list[i][0][2]}/{def_scale_}, {bottom_layer_}/{layer_}, '{list[i][0][3]}') + "
        components_placed = components_placed[0:-3]
        if components_placed == "":
            components_placed = f"scad_std_cell.empty_obj('NO COMPONENTS')"
        return(eval(components_placed))


class route:
    """
    This class takes a .def file with routing information and creates a SCAD model of the routing channels.
    """
    def __init__(self, def_file) -> None:
        self.def_file = def_file

    def get_routing(self):
        f = open(self.def_file)
        index, flag = 0, 0
        list = []
        index_found = []
        for line in f:
            list.append(line.strip().split('\n'))
            index += 1
            if flag < 2:
                if 'NETS' in line:
                    flag += 1
                    index_found.append(index)
            else:
                break
        f.close()
        if flag == 2:
            list = list[index_found[0]:index_found[1]-1]
            index = 0
            index_found = []
            for net in list:
                if net[0][0] == '-':
                    index_found.append(index)
                index += 1
            index_found.append(index)
            replace_list = ['+ ', '( ', ') ', ' )', ';', 'NEW', 'ROUTED', 'met']
            for element in list:
                for char in replace_list:
                    element[0] = element[0].replace(char, '')
                element[0] = element[0].strip().split(' ')
            for j in range(0, len(index_found)-1):
                for i in range(index_found[j]+1, index_found[j+1]):
                    list[i][0].insert(0, list[index_found[j]][0][1])
                    if len(list[i][0]) >= 7:
                        if len(list[i][0]) == 7:
                            if list[i][0][4] == '0':
                                del list[i][0][4]
                            else:
                                del list[i][0][6]
                        else:
                            del list[i][0][4]
                            del list[i][0][6]
                    if '*' in list[i][0]:
                        star_index = list[i][0].index('*')
                        list[i][0][star_index] = list[i][0][star_index-2]
                    if 'PIN' in list[index_found[j]][0]:
                        list[i][0].append('PIN')
            i = 0
            length = len(list)
            while i < length:
                if list[i][0][0] == '-':
                    del list[i]
                    i = 0
                    length = len(list)
                else:
                    i += 1
            return(list)
        else:
            pass # add error later
    
    def snap_to_grid_and_scale(self, value, s = True):
        if int(value)/25/def_scale_ < 1/25:
            snap_value = 0.5 * 14 * px_
        else:
            snap_value = round(int(value)/25/def_scale_) * 25 * px_
        if s:
            return(f"{snap_value}")
        else:
            return(snap_value)

    def get_nets(self):
        list = self.get_routing()
        nets_repeat = []
        nets = []
        for line in list:
            nets_repeat.append(line[0][0])
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
        
    def perform_routing(self, dimm_file = None, flatten = False):
        if dimm_file == None:
            route_dimms  = self.generate_dimms()
        else:
            route_dimms  = self.generate_dimms(dimm_file)
            route_params = self.get_route_params(dimm_file)
        list        = self.get_routing()
        routing     = str()
        if not flatten:
            for i in range(0, len(list)):
                if (list[i][0][4][0] == 'M'):
                    p0 =    [self.snap_to_grid_and_scale(list[i][0][2], False),
                             self.snap_to_grid_and_scale(list[i][0][3], False),
                             (int(list[i][0][1])-1)*lpv_*layer_+bottom_layer_]
                    p1 =    [self.snap_to_grid_and_scale(list[i][0][2], False),
                             self.snap_to_grid_and_scale(list[i][0][3], False),
                             (int(list[i][0][4][3])-1)*lpv_*layer_+bottom_layer_]
                    connect_matrix = [["z", p1, 2]]
                    routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[list[i][0][0]] + ") + "
                else:
                    if list[i][0][2] == list[i][0][4]:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][2], False),
                                 self.snap_to_grid_and_scale(list[i][0][3], False)- 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 (int(list[i][0][1])-1)*lpv_*layer_+bottom_layer_]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][4], False),
                                 self.snap_to_grid_and_scale(list[i][0][5], False)+ 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 (int(list[i][0][1])-1)*lpv_*layer_+bottom_layer_]
                        connect_matrix = [["y", p1, 1]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[list[i][0][0]] + ") + "
                    else:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][2], False)- 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 self.snap_to_grid_and_scale(list[i][0][3], False),
                                 (int(list[i][0][1])-1)*lpv_*layer_+bottom_layer_]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][4], False)+ 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 self.snap_to_grid_and_scale(list[i][0][5], False),
                                 (int(list[i][0][1])-1)*lpv_*layer_+bottom_layer_]
                        connect_matrix = [["x", p1, 0]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[list[i][0][0]] + ") + "
        if flatten:
            for i in range(0, len(list)):
                if (list[i][0][4][0] == 'M') and ('PIN' in list[i][0]):
                    p0 =    [self.snap_to_grid_and_scale(list[i][0][2], False),
                             self.snap_to_grid_and_scale(list[i][0][3], False),
                             (int(list[i][0][1])-1)*lpv_*layer_+bottom_layer_]
                    p1 =    [self.snap_to_grid_and_scale(list[i][0][2], False),
                             self.snap_to_grid_and_scale(list[i][0][3], False),
                             (int(list[i][0][4][3])-1)*lpv_*layer_+bottom_layer_]
                    connect_matrix = [["z", p1, 2]]
                    routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[list[i][0][0]] + ") + "
                elif (list[i][0][4][0] == 'M') and not('PIN' in list[i][0]):
                    pass
                elif (list[i][0][4][0] != 'M') and ('PIN' in list[i][0]):
                    if list[i][0][2] == list[i][0][4]:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][2], False),
                                 self.snap_to_grid_and_scale(list[i][0][3], False)- 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 (int(list[i][0][1])-1)*lpv_*layer_+bottom_layer_]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][4], False),
                                 self.snap_to_grid_and_scale(list[i][0][5], False)+ 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 (int(list[i][0][1])-1)*lpv_*layer_+bottom_layer_]
                        connect_matrix = [["y", p1, 1]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[list[i][0][0]] + ") + "
                    else:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][2], False)- 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 self.snap_to_grid_and_scale(list[i][0][3], False),
                                 (int(list[i][0][1])-1)*lpv_*layer_+bottom_layer_]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][4], False)+ 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 self.snap_to_grid_and_scale(list[i][0][5], False),
                                 (int(list[i][0][1])-1)*lpv_*layer_+bottom_layer_]
                        connect_matrix = [["x", p1, 0]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[list[i][0][0]] + ") + "
                elif (list[i][0][4][0] != 'M') and not('PIN' in list[i][0]):
                    if list[i][0][2] == list[i][0][4]:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][2], False),
                                 self.snap_to_grid_and_scale(list[i][0][3], False)- 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 bottom_layer_]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][4], False),
                                 self.snap_to_grid_and_scale(list[i][0][5], False)+ 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 bottom_layer_]
                        connect_matrix = [["y", p1, 1]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[list[i][0][0]] + ") + "
                    else:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][2], False)- 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 self.snap_to_grid_and_scale(list[i][0][3], False),
                                 bottom_layer_]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][4], False)+ 0.5 * (int(route_params[list[i][0][0]][0]) if (dimm_file != None and list[i][0][0] in route_params.keys()) else 14) * px_,
                                 self.snap_to_grid_and_scale(list[i][0][5], False),
                                 bottom_layer_]
                        connect_matrix = [["x", p1, 0]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[list[i][0][0]] + ") + "
        routing = routing[0:-3]
        if routing == "":
            routing = f"scad_std_cell.empty_obj('NO ROUTING')"
        return(eval(routing))


class pin_place:
    """
    This class takes a .def file with pin information and places pinholes accordingly.
    """
    def __init__(self, def_file) -> None:
        self.def_file = def_file

    def snap_to_grid(self, value):
        snap_value = round(int(value)/25/def_scale_) * 25 * def_scale_
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
                    net_params_keys.update({param[0]:list(param[1])})
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
        pins_placed = str()
        for i in range(0, len(list)):
            cond_x_left    = int(list[i][0][2]) <= (x_cdim_[0]+1) * def_scale_
            cond_x_right   = int(list[i][0][2]) >= (x_cdim_[1]-1) * def_scale_
            cond_y_bottom  = int(list[i][0][3]) <= (y_cdim_[0]+1) * def_scale_
            cond_y_top     = int(list[i][0][3]) >= (y_cdim_[1]-1) * def_scale_
            if (cond_x_left):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0(0, {list[i][0][3]}/{def_scale_}, {(int(list[i][0][1])-1)*lpv_+bottom_layer_/layer_}, 'left') + "
            elif (cond_x_right):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0({x_bdim_/px_}, {list[i][0][3]}/{def_scale_}, {(int(list[i][0][1])-1)*lpv_+bottom_layer_/layer_}, 'right') + "
            elif (cond_y_bottom):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0({list[i][0][2]}/{def_scale_}, 0, {(int(list[i][0][1])-1)*lpv_+bottom_layer_/layer_}, 'bottom') + "
            elif (cond_y_top):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0({list[i][0][2]}/{def_scale_}, {y_bdim_/px_}, {(int(list[i][0][1])-1)*lpv_+bottom_layer_/layer_}, 'top') + "
        pins_placed = pins_placed[0:-3]
        if pins_placed == "":
            pins_placed = f"scad_std_cell.empty_obj('NO PINHOLES')"
        return(eval(pins_placed))

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
                p1 = [int(list[i][0][2])*px_/def_scale_, int(list[i][0][3])*px_/def_scale_, 0]
                connect_matrix = [["z", p1, 0]]
                pins_placed = pins_placed + f"scad_routing.routing({p0}, {connect_matrix}, " + route_dimms[list[i][0][0]] + ") + "        
        pins_placed = pins_placed[0:-3]
        if pins_placed == "":
            pins_placed = f"scad_std_cell.empty_obj('NO PINS')"
        return(eval(pins_placed))


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


class scad_generation:
    """
    This class generates the dependent scad files for the design.
    """
    def __init__(self) -> None:
        pass

    def generate_routing_scad(self, output_dir, design):
        """Generates the routing scad and writes to the results directory."""
        try:
            os.makedirs(output_dir)
        except FileExistsError:
            pass
        
        with open(f"{os.environ['SCAD_ROUTING']}") as f:
            with open(os.path.join(output_dir, design + "_routing.scad"), "a") as f1:
                for line in f:
                    f1.write(line)


    def generate_std_cell_scad(self, px, layer, output_dir, design):
        """Generates the standard cell scad with the pixel and layers defined."""
        set_scale_parameters(px, layer)
        self.generate_routing_scad(output_dir, design)
    
        with open(os.path.join(output_dir, design + "_std_cells.scad"), "w") as f:
            f.write(f"include<{design}_routing.scad>\n\n")
    
        with open(os.path.join(output_dir, design + "_std_cells.scad"), "a") as f:
            f.write(f"px = {px_};\nlayer = {layer_};\n\n")
        
        with open(f"{os.environ['SCAD_STANDARD_CELLS']}") as f:
            with open(os.path.join(output_dir, design + "_std_cells.scad"), "a") as f1:
                for line in f:
                    f1.write(line)
                

def scad_pnr(design, def_file, results_dir, px, layer, bottom_layer, lpv, xbulk, ybulk, zbulk, xchip, ychip, def_scale, res, dimm_file = None):
    """This function generates the entire SCAD flow by calling the classes above in their intended order."""
    
    print("------------------------------")
    print("SCAD Place and Route begin")
    print("------------------------------\n")
    
    print("Generating standard cell and routing SCAD...")
    scad_generation().generate_std_cell_scad(px, layer, results_dir, design)
    print("SCAD generation complete\n")

    print(f"Importing generated SCAD for design '{design}'")
    global scad_routing, scad_std_cell
    scad_routing    = import_scad(f"{os.environ['RESULTS_DIR']}/{design}_routing.scad")
    scad_std_cell   = import_scad(f"{os.environ['RESULTS_DIR']}/{design}_std_cells.scad")
    print(f"SCAD import for '{design}' complete\n")

    print(f"The design parameters for '{design}' are:")
    set_def_scale(def_scale)
    set_bulk_dimensions(xbulk, ybulk, zbulk)
    set_chip_dimensions(xchip, ychip)
    set_bottom_layer(bottom_layer)
    set_layers_per_via(lpv)
    
    print(f"\nBuilding the design model for '{design}' from:\n'{def_file}'")
    model = add_bulk(x_bdim_, y_bdim_, z_bdim_).bulk() - (route(def_file).perform_routing(dimm_file) + place(def_file).place_components() 
                    + pin_place(def_file).place_pinholes() + pin_place(def_file).place_pins(dimm_file))
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
    ap.add_argument('--res', metavar='<value>', dest='res', type=int,
                    help="Resolution of the scad rendering.")
    ap.add_argument('--dimm_file', metavar='<path>', dest='dimm_file', type=str,
                    help="Optional .csv file with routing dimensions.", default = None)
    args = ap.parse_args()

    scad_pnr(args.design,
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
             args.res,
             args.dimm_file)