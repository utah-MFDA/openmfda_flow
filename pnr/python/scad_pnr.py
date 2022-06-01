from solid import *
from solid import scad_render_to_file
from solid.utils import *
import os


class set_render_parameters:
    """
    This sets the pixel size scale unique to the printer.
    All x,y dimensions are scalar multiples of the "px" value and
    z dimensions are scalar multiples of the "layer" value. For example,
    if a standard cell is instatntiated and needs x, y, or z dimensional 
    arguments, the arguments will be the number of pixels and the 
    physical value will be the argument mutliplied by the pixel scalar.
    """
    def __init__(self, xy_scale, z_scale) -> None:
        global px, layer
        px      = xy_scale
        layer   = z_scale


class set_render_resolution:
    """
    This sets the render resoultion when exported to openSCAD.
    """
    def __init__(self, res) -> None:
        global segments
        segments = res


class set_lef_scale:
    """
    This sets the scale used in the lef/def files for 1 pixel. For example,
    if 1 pixel is equivalent to 0.5 units in the lef/def file then this value
    should be set to 0.5.
    """
    def __init__(self, lef_scale) -> None:
        global scale_factor
        scale_factor = lef_scale


class set_bottom_layer:
    """
    This sets the phyical location that the bottom routing layer is placed.
    """
    def __init__(self, b_layer) -> None:
        global bottom_layer
        bottom_layer = b_layer * layer


class set_bulk_dimensions:
    """
    This sets the dimensions of the bulk chip.
    """
    def __init__(self, x_dim, y_dim, z_dim) -> None:
        global max_x_dim, max_y_dim, max_z_dim
        max_x_dim = x_dim * px
        max_y_dim = y_dim * px
        max_z_dim = z_dim * layer


class serpentine_channel:
    """
    Special use of the openSAD module "routing_181220.scad" that generates the
    connect matrix as designed in the "connect" method. Creates a serpentine
    channel based on total length of the turns.
    """
    def __init__(self, x0, y0, z0, wchan, hchan, length) -> None:
        self.x0 = x0 * px
        self.y0 = y0 * px
        self.z0 = z0 * px
        self.wchan = wchan * px
        self.hchan = hchan * layer
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
            connect.append(["+yx", [sign*y_length * px, x_length * px], [1, 0]])
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
        self.file = def_file

    def get_components(self):
        f = open(self.file)
        index, flag = 0, 0
        list = []
        index_found = []
        for line in f:
            list.append(line.strip().split('\n'))
            line.strip().split('\n')
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
        for i in range(0, len(list)-1):
            components_placed = components_placed + f"scad_std_cell.{list[i][0][0]}({list[i][0][1]}/{scale_factor}, {list[i][0][2]}/{scale_factor}, {bottom_layer}/{layer}, '{list[i][0][3]}') + "
        components_placed = components_placed + f"scad_std_cell.{list[-1][0][0]}({list[-1][0][1]}/{scale_factor}, {list[-1][0][2]}/{scale_factor}, {bottom_layer}/{layer}, '{list[-1][0][3]}')"
        return(eval(components_placed))


class route:
    """
    This class takes a .def file with routing information and creates a SCAD model of the routing channels.
    """
    def __init__(self, def_file, wchan, xychan, hchan) -> None:
        self.file = def_file
        self.wchan = wchan * px
        self.xychan = xychan * px
        self.hchan = hchan * layer

    def dimensions (self):
        dim_matrix =   [[[0, 0], [-self.wchan/2, self.wchan/2], [0, self.hchan]], # assumes placement at the center of the dimension argument
                        [[-self.wchan/2, self.wchan/2], [0, 0], [0, self.hchan]],
                        [[-self.xychan/2, self.xychan/2], [-self.xychan/2, self.xychan/2], [0, 0]]]
        return(dim_matrix)

    def get_routing(self):
        f = open(self.file)
        index, flag = 0, 0
        list = []
        index_found = []
        for line in f:
            list.append(line.strip().split('\n'))
            line.strip().split('\n')
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
            for j in range(0, len(index_found)-1):
                for i in range(index_found[j]+1, index_found[j+1]):
                    for char in replace_list:
                        list[i][0] = list[i][0].replace(char, '')
                    list[i][0] = list[i][0].strip().split(' ')
                    if len(list[i][0]) >= 6:
                        if len(list[i][0]) == 6:
                            if list[i][0][3] == '0':
                                del list[i][0][3]
                            else:
                                del list[i][0][5]
                        else:
                            del list[i][0][3]
                            del list[i][0][5]
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
        if int(value)/25/scale_factor < 1/25:
            snap_value = 0.5 * self.wchan
        else:
            snap_value = round(int(value)/25/scale_factor) * 25 * px
        if s:
            return(f"{snap_value}")
        else:
            return(snap_value)

    def perform_routing(self, flatten = False):
        list = self.get_routing()
        routing = str()
        if not flatten:
            for i in range(0, len(list)-1):
                if (list[i][0][3][0] == 'M'):
                    p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                             self.snap_to_grid_and_scale(list[i][0][2], False),
                             (int(list[i][0][0])-1)*20*layer+bottom_layer]
                    p1 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                             self.snap_to_grid_and_scale(list[i][0][2], False),
                             (int(list[i][0][3][3])-1)*20*layer+bottom_layer]
                    connect_matrix = [["z", p1, 2]]
                    routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
                else:
                    if list[i][0][1] == list[i][0][3]:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                                 self.snap_to_grid_and_scale(list[i][0][2], False)-0.5*self.wchan,
                                 (int(list[i][0][0])-1)*20*layer+bottom_layer]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False),
                                 self.snap_to_grid_and_scale(list[i][0][4], False)+0.5*self.wchan,
                                 (int(list[i][0][0])-1)*20*layer+bottom_layer]
                        connect_matrix = [["y", p1, 1]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
                    else:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False)-0.5*self.wchan,
                                 self.snap_to_grid_and_scale(list[i][0][2], False),
                                 (int(list[i][0][0])-1)*20*layer+bottom_layer]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False)+0.5*self.wchan,
                                 self.snap_to_grid_and_scale(list[i][0][4], False),
                                 (int(list[i][0][0])-1)*20*layer+bottom_layer]
                        connect_matrix = [["x", p1, 0]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
            if (list[-1][0][3][0] == 'M'):
                p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                         self.snap_to_grid_and_scale(list[-1][0][2], False),
                         (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                p1 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                         self.snap_to_grid_and_scale(list[-1][0][2], False),
                         (int(list[-1][0][3][3])-1)*20*layer+bottom_layer]
                connect_matrix = [["z", p1, 2]]
                routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()})"
            else:
                if list[-1][0][1] == list[-1][0][3]:
                    p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                             self.snap_to_grid_and_scale(list[-1][0][2], False)-0.5*self.wchan,
                             (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                    p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False),
                             self.snap_to_grid_and_scale(list[-1][0][4], False)+0.5*self.wchan,
                             (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                    connect_matrix = [["y", p1, 1]]
                    routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()})"
                else:
                    p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False)-0.5*self.wchan,
                             self.snap_to_grid_and_scale(list[-1][0][2], False),
                             (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                    p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False)+0.5*self.wchan,
                             self.snap_to_grid_and_scale(list[-1][0][4], False),
                             (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                    connect_matrix = [["x", p1, 0]]
                    routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()})"
        if flatten:
            for i in range(0, len(list)-1):
                if (list[i][0][3][0] == 'M') and ('PIN' in list[i][0]):
                    p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                             self.snap_to_grid_and_scale(list[i][0][2], False),
                             (int(list[i][0][0])-1)*20*layer+bottom_layer]
                    p1 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                             self.snap_to_grid_and_scale(list[i][0][2], False),
                             (int(list[i][0][3][3])-1)*20*layer+bottom_layer]
                    connect_matrix = [["z", p1, 2]]
                    routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
                elif (list[i][0][3][0] == 'M') and not('PIN' in list[i][0]):
                    pass
                elif (list[i][0][3][0] != 'M') and ('PIN' in list[i][0]):
                    if list[i][0][1] == list[i][0][3]:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                                 self.snap_to_grid_and_scale(list[i][0][2], False)-0.5*self.wchan,
                                 (int(list[i][0][0])-1)*20*layer+bottom_layer]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False),
                                 self.snap_to_grid_and_scale(list[i][0][4], False)+0.5*self.wchan,
                                 (int(list[i][0][0])-1)*20*layer+bottom_layer]
                        connect_matrix = [["y", p1, 1]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
                    else:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False)-0.5*self.wchan,
                                 self.snap_to_grid_and_scale(list[i][0][2], False),
                                 (int(list[i][0][0])-1)*20*layer+bottom_layer]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False)+0.5*self.wchan,
                                 self.snap_to_grid_and_scale(list[i][0][4], False),
                                 (int(list[i][0][0])-1)*20*layer+bottom_layer]
                        connect_matrix = [["x", p1, 0]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
                elif (list[i][0][3][0] != 'M') and not('PIN' in list[i][0]):
                    if list[i][0][1] == list[i][0][3]:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                                 self.snap_to_grid_and_scale(list[i][0][2], False)-0.5*self.wchan,
                                 bottom_layer]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False),
                                 self.snap_to_grid_and_scale(list[i][0][4], False)+0.5*self.wchan,
                                 bottom_layer]
                        connect_matrix = [["y", p1, 1]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
                    else:
                        p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False)-0.5*self.wchan,
                                 self.snap_to_grid_and_scale(list[i][0][2], False),
                                 bottom_layer]
                        p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False)+0.5*self.wchan,
                                 self.snap_to_grid_and_scale(list[i][0][4], False),
                                 bottom_layer]
                        connect_matrix = [["x", p1, 0]]
                        routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
            if (list[-1][0][3][0] == 'M') and ('PIN' in list[-1][0]):
                p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                         self.snap_to_grid_and_scale(list[-1][0][2], False),
                         (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                p1 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                         self.snap_to_grid_and_scale(list[-1][0][2], False),
                         (int(list[-1][0][3][3])-1)*20*layer+bottom_layer]
                connect_matrix = [["z", p1, 2]]
                routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()})"
            elif (list[-1][0][3][0] == 'M') and not('PIN' in list[-1][0]):
                pass
            elif (list[-1][0][3][0] != 'M') and ('PIN' in list[-1][0]):
                if list[-1][0][1] == list[-1][0][3]:
                    p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                             self.snap_to_grid_and_scale(list[-1][0][2], False)-0.5*self.wchan,
                             (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                    p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False),
                             self.snap_to_grid_and_scale(list[-1][0][4], False)+0.5*self.wchan,
                             (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                    connect_matrix = [["y", p1, 1]]
                    routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()})"
                else:
                    p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False)-0.5*self.wchan,
                             self.snap_to_grid_and_scale(list[-1][0][2], False),
                             (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                    p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False)+0.5*self.wchan,
                             self.snap_to_grid_and_scale(list[-1][0][4], False),
                             (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                    connect_matrix = [["x", p1, 0]]
                    routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()})"
            elif (list[-1][0][3][0] != 'M') and not('PIN' in list[-1][0]):
                if list[-1][0][1] == list[-1][0][3]:
                    p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                             self.snap_to_grid_and_scale(list[-1][0][2], False)-0.5*self.wchan,
                             bottom_layer]
                    p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False),
                             self.snap_to_grid_and_scale(list[-1][0][4], False)+0.5*self.wchan,
                             bottom_layer]
                    connect_matrix = [["y", p1, 1]]
                    routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()})"
                else:
                    p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False)-0.5*self.wchan,
                             self.snap_to_grid_and_scale(list[-1][0][2], False),
                             bottom_layer]
                    p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False)+0.5*self.wchan,
                             self.snap_to_grid_and_scale(list[-1][0][4], False),
                             bottom_layer]
                    connect_matrix = [["x", p1, 0]]
                    routing = routing + f"scad_routing.routing({p0}, {connect_matrix}, {self.dimensions()})"
        return(eval(routing))


class pinhole_place:
    """
    This class takes a .def file with pin information and palces pinholes accordingly.
    """
    def __init__(self, def_file) -> None:
        self.file = def_file

    def dimensions (self):
        dim_matrix =   [[[0, 0], [-self.wchan/2, self.wchan/2], [0, self.hchan]], # assumes placement at the center of the dimension argument
                        [[-self.wchan/2, self.wchan/2], [0, 0], [0, self.hchan]],
                        [[-self.xychan/2, self.xychan/2], [-self.xychan/2, self.xychan/2], [0, 0]]]
        return(dim_matrix)

    def get_pins(self):
        f = open(self.file)
        index, flag = 0, 0
        list = []
        index_found = []
        for line in f:
            list.append(line.strip().split('\n'))
            line.strip().split('\n')
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
            for j in range(0, len(index_found)-1):
                for i in range(index_found[j]+1, index_found[j+1]):
                    for char in replace_list:
                        list[i][0] = list[i][0].replace(char, '')
                    list[i][0] = list[i][0].strip().split(' ')
                    if len(list[i][0]) >= 6:
                        if len(list[i][0]) == 6:
                            if list[i][0][3] == '0':
                                del list[i][0][3]
                            else:
                                del list[i][0][5]
                        else:
                            del list[i][0][3]
                            del list[i][0][5]
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
            i = 0
            length = len(list)
            while i < length:
                if (list[i][0][-1] != 'PIN'):
                    del list[i]
                    i = 0
                    length = len(list)
                else:
                    i += 1
            i = 0
            length = len(list)
            while i < length:
                if (len(list[i][0]) == 5):
                    del list[i]
                    i = 0
                    length = len(list)
                else:
                    i += 1
            i = 0
            length = len(list)
            while i < length:
                cond_x1 = (int(list[i][0][1]) >= 326*scale_factor and int(list[i][0][1]) <= 2224*scale_factor)
                cond_y1 = (int(list[i][0][2]) >= 326*scale_factor and int(list[i][0][2]) <= 1274*scale_factor)
                cond_x2 = (int(list[i][0][3]) >= 326*scale_factor and int(list[i][0][3]) <= 2224*scale_factor)
                cond_y2 = (int(list[i][0][4]) >= 326*scale_factor and int(list[i][0][4]) <= 1274*scale_factor)
                if (cond_x1 and cond_y1 and cond_x2 and cond_y2):
                    del list[i]
                    i = 0
                    length = len(list)
                else:
                    i += 1
            return(list)
        else:
            pass # add error later    

    def place_pinholes(self):
        list = self.get_pins()
        pins_placed = str()
        for i in range(0, len(list)-1):
            cond_x1_left    = int(list[i][0][1]) <= 326*scale_factor
            cond_x1_right   = int(list[i][0][1]) >= 2224*scale_factor
            cond_y1_bottom  = int(list[i][0][2]) <= 326*scale_factor
            cond_y1_top     = int(list[i][0][2]) >= 1274*scale_factor
            cond_x2_left    = int(list[i][0][3]) <= 326*scale_factor
            cond_x2_right   = int(list[i][0][3]) >= 2224*scale_factor
            cond_y2_bottom  = int(list[i][0][4]) <= 326*scale_factor
            cond_y2_top     = int(list[i][0][4]) >= 1274*scale_factor
            if (cond_x1_left):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0(0, {list[i][0][2]}/{scale_factor}, {(int(list[i][0][0])-1)*20+bottom_layer/layer}, 'left') +"
            elif (cond_x1_right):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0(2550, {list[i][0][2]}/{scale_factor}, {(int(list[i][0][0])-1)*20+bottom_layer/layer}, 'right') +"
            elif (cond_y1_bottom):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0({list[i][0][1]}/{scale_factor}, 0, {(int(list[i][0][0])-1)*20+bottom_layer/layer}, 'bottom') +"
            elif (cond_y1_top):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0({list[i][0][1]}/{scale_factor}, 1600, {(int(list[i][0][0])-1)*20+bottom_layer/layer}, 'top') +"
            elif (cond_x2_left):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0(0, {list[i][0][4]}/{scale_factor}, {(int(list[i][0][0])-1)*20+bottom_layer/layer}, 'left') +"
            elif (cond_x2_right):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0(2550, {list[i][0][4]}/{scale_factor}, {(int(list[i][0][0])-1)*20+bottom_layer/layer}, 'right') +"
            elif (cond_y2_bottom):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0({list[i][0][3]}/{scale_factor}, 0, {(int(list[i][0][0])-1)*20+bottom_layer/layer}, 'bottom') +"
            elif (cond_y2_top):
                pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0({list[i][0][3]}/{scale_factor}, 1600, {(int(list[i][0][0])-1)*20+bottom_layer/layer}, 'top') +"
        cond_x1_left    = int(list[-1][0][1]) <= 326*scale_factor
        cond_x1_right   = int(list[-1][0][1]) >= 2224*scale_factor
        cond_y1_bottom  = int(list[-1][0][2]) <= 326*scale_factor
        cond_y1_top     = int(list[-1][0][2]) >= 1274*scale_factor
        cond_x2_left    = int(list[-1][0][3]) <= 326*scale_factor
        cond_x2_right   = int(list[-1][0][3]) >= 2224*scale_factor
        cond_y2_bottom  = int(list[-1][0][4]) <= 326*scale_factor
        cond_y2_top     = int(list[-1][0][4]) >= 1274*scale_factor
        if (cond_x1_left):
            pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0(0, {list[-1][0][2]}/{scale_factor}, {(int(list[-1][0][0])-1)*20+bottom_layer/layer}, 'left')"
        elif (cond_x1_right):
            pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0(2550, {list[-1][0][2]}/{scale_factor}, {(int(list[-1][0][0])-1)*20+bottom_layer/layer}, 'right')"
        elif (cond_y1_bottom):
            pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0({list[-1][0][1]}/{scale_factor}, 0, {(int(list[-1][0][0])-1)*20+bottom_layer/layer}, 'bottom')"
        elif (cond_y1_top):
            pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0({list[-1][0][1]}/{scale_factor}, 1600, {(int(list[-1][0][0])-1)*20+bottom_layer/layer}, 'top')"
        elif (cond_x2_left):
            pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0(0, {list[-1][0][4]}/{scale_factor}, {(int(list[-1][0][0])-1)*20+bottom_layer/layer}, 'left')"
        elif (cond_x2_right):
            pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0(2550, {list[-1][0][4]}/{scale_factor}, {(int(list[-1][0][0])-1)*20+bottom_layer/layer}, 'right')"
        elif (cond_y2_bottom):
            pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0({list[-1][0][3]}/{scale_factor}, 0, {(int(list[-1][0][0])-1)*20+bottom_layer/layer}, 'bottom')"
        elif (cond_y2_top):
            pins_placed = pins_placed + f"scad_std_cell.pinhole_325px_0({list[-1][0][3]}/{scale_factor}, 1600, {(int(list[-1][0][0])-1)*20+bottom_layer/layer}, 'top')"
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


def generate_routing_scad(output_dir, design):
    """Generates the routing scad and writes to the results directory."""
    
    try:
        os.makedirs(output_dir)
    except FileExistsError:
        pass
    
    with open(f"{os.environ['SCAD_ROUTING']}") as f:
        with open(os.path.join(output_dir, design + "_routing.scad"), "a") as f1:
            for line in f:
                f1.write(line)


def generate_std_cell_scad(px_value, layer_value, output_dir, design):
    """Generates the standard cell scad with the pixel and layers defined."""
    set_render_parameters(px_value, layer_value)
    generate_routing_scad(output_dir, design)
 
    with open(os.path.join(output_dir, design + "_std_cells.scad"), "w") as f:
        f.write(f"include<{design}_routing.scad>\n\n")
 
    with open(os.path.join(output_dir, design + "_std_cells.scad"), "a") as f:
        f.write(f"px = {px};\nlayer = {layer};\n\n")
    
    with open(f"{os.environ['SCAD_STANDARD_CELLS']}") as f:
        with open(os.path.join(output_dir, design + "_std_cells.scad"), "a") as f1:
            for line in f:
                f1.write(line)


def scad_pnr(design, def_file, results_dir, wchan_val, xychan_val, hchan_val, px_val, layer_val, bot_layer_val, xbulk_val, ybulk_val, zbulk_val, lef_scale_val, res_val):
    """Description"""

    generate_std_cell_scad(px_val, layer_val, results_dir, design)
    global scad_routing, scad_std_cell
    scad_routing    = import_scad(f"{os.environ['RESULTS_DIR']}/{design}_routing.scad")
    scad_std_cell   = import_scad(f"{os.environ['RESULTS_DIR']}/{design}_std_cells.scad")
    set_render_resolution(res_val)
    set_lef_scale(lef_scale_val)
    set_bottom_layer(bot_layer_val)
    set_bulk_dimensions(xbulk_val, ybulk_val, zbulk_val)
    model = add_bulk(max_x_dim, max_y_dim, max_z_dim).bulk() - (route(def_file, wchan_val, xychan_val, hchan_val).perform_routing() + place(def_file).place_components() + pinhole_place(def_file).place_pinholes())
    scad_render_to_file(model, f"{results_dir}/{design}.scad", file_header=f"$fn = {segments};", include_orig_code=False)


if __name__ == "__main__":
    import argparse

    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--design', metavar='<design_name>', dest='design', type=str,
                    help="The design name.")
    ap.add_argument('--def_file', metavar='<path>', dest='def_file', type=str,
                    help="Path to the .def file from OpenROAD flow.")
    ap.add_argument('--results_dir', metavar='<path>', dest='results_dir', type=str,
                    help="Path where the results are generated.")
    ap.add_argument('--wchan_val', metavar='<value>', dest='wchan_val', type=int,
                    help="Width of the channels used for xy routing.")
    ap.add_argument('--xychan_val', metavar='<value>', dest='xychan_val', type=int,
                    help="Width of the channels used for z routing.")
    ap.add_argument('--hchan_val', metavar='<value>', dest='hchan_val', type=int,
                    help="Height of the routing channels for xy routing.")
    ap.add_argument('--px_val', metavar='<value>', dest='px_val', type=float,
                    help="Metric pixel size.")
    ap.add_argument('--layer_val', metavar='<value>', dest='layer_val', type=float,
                    help="Metric layer size.")
    ap.add_argument('--bot_layer_val', metavar='<value>', dest='bot_layer_val', type=int,
                    help="Value of bottom layer (routing).")
    ap.add_argument('--xbulk_val', metavar='<value>', dest='xbulk_val', type=int,
                    help="Horizontal length of the bulk in pixels.")
    ap.add_argument('--ybulk_val', metavar='<value>', dest='ybulk_val', type=int,
                    help="Vertical length of the bulk in pixels.")
    ap.add_argument('--zbulk_val', metavar='<value>', dest='zbulk_val', type=int,
                    help="Height of the bulk in layers.")
    ap.add_argument('--lef_scale_val', metavar='<value>', dest='lef_scale_val', type=int,
                    help="Multiplier used in the def file for unit precision.")
    ap.add_argument('--res_val', metavar='<value>', dest='res_val', type=int,
                    help="Resolution of the scad rendering.")
    args = ap.parse_args()

    scad_pnr(args.design,
             args.def_file,
             args.results_dir,
             args.wchan_val,
             args.xychan_val,
             args.hchan_val,
             args.px_val,
             args.layer_val,
             args.bot_layer_val,
             args.xbulk_val,
             args.ybulk_val,
             args.zbulk_val,
             args.lef_scale_val,
             args.res_val)