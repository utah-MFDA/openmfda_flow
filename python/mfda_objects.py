from solid import *
from solid import scad_render_to_file
from solid.utils import *

routing_scadfile = import_scad('python/routing_181220.scad')
component_scadfile = import_scad('python/components_010421.scad')
output_file = 'python/test.scad'
def_file = 'python/test_def/6_final copy 9.def'

class set_pixel_size:
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
        px = xy_scale
        layer = z_scale

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
    This sets the phyical layer that the bottom routing layer is placed.
    """
    def __init__(self, b_layer) -> None:
        global bottom_layer
        bottom_layer = b_layer * layer

class serpentine_channel():
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

    def routing(self):
        b = f"routing_scadfile.routing([{self.x0}, {self.y0}, {self.z0}], {self.connect()}, {self.dimensions()})"
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
            components_placed = components_placed + f"component_scadfile.{list[i][0][0]}({list[i][0][1]}/{scale_factor}, {list[i][0][2]}/{scale_factor}, {bottom_layer}/{layer}, '{list[i][0][3]}') + "
        components_placed = components_placed + f"component_scadfile.{list[-1][0][0]}({list[-1][0][1]}/{scale_factor}, {list[-1][0][2]}/{scale_factor}, {bottom_layer}/{layer}, '{list[-1][0][3]}')"
        return(eval(components_placed))

class route:
    """
    This class takes a .def file with routing information and creates a SCAD model of the routing channels
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

    def perform_routing(self):
        list = self.get_routing()
        routing = str()
        for i in range(0, len(list)-1):
            if (list[i][0][3][0] == 'M') and ('PIN' in list[i][0]):
                p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                            self.snap_to_grid_and_scale(list[i][0][2], False),
                            (int(list[i][0][0])-1)*20*layer+bottom_layer]
                p1 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                            self.snap_to_grid_and_scale(list[i][0][2], False),
                            (int(list[i][0][3][3])-1)*20*layer+bottom_layer]
                connect_matrix = [["z", p1, 2]]
                routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
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
                    routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
                else:
                    p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False)-0.5*self.wchan,
                                self.snap_to_grid_and_scale(list[i][0][2], False),
                                (int(list[i][0][0])-1)*20*layer+bottom_layer]
                    p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False)+0.5*self.wchan,
                                self.snap_to_grid_and_scale(list[i][0][4], False),
                                (int(list[i][0][0])-1)*20*layer+bottom_layer]
                    connect_matrix = [["x", p1, 0]]
                    routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
            elif (list[i][0][3][0] != 'M') and not('PIN' in list[i][0]):
                if list[i][0][1] == list[i][0][3]:
                    p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False),
                                self.snap_to_grid_and_scale(list[i][0][2], False)-0.5*self.wchan,
                                bottom_layer]
                    p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False),
                                self.snap_to_grid_and_scale(list[i][0][4], False)+0.5*self.wchan,
                                bottom_layer]
                    connect_matrix = [["y", p1, 1]]
                    routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
                else:
                    p0 =    [self.snap_to_grid_and_scale(list[i][0][1], False)-0.5*self.wchan,
                                self.snap_to_grid_and_scale(list[i][0][2], False),
                                bottom_layer]
                    p1 =    [self.snap_to_grid_and_scale(list[i][0][3], False)+0.5*self.wchan,
                                self.snap_to_grid_and_scale(list[i][0][4], False),
                                bottom_layer]
                    connect_matrix = [["x", p1, 0]]
                    routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()}) + "
        if (list[-1][0][3][0] == 'M') and ('PIN' in list[-1][0]):
            p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                        self.snap_to_grid_and_scale(list[-1][0][2], False),
                        (int(list[-1][0][0])-1)*20*layer+bottom_layer]
            p1 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                        self.snap_to_grid_and_scale(list[-1][0][2], False),
                        (int(list[-1][0][3][3])-1)*20*layer+bottom_layer]
            connect_matrix = [["z", p1, 2]]
            routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
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
                routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
            else:
                p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False)-0.5*self.wchan,
                            self.snap_to_grid_and_scale(list[-1][0][2], False),
                            (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False)+0.5*self.wchan,
                            self.snap_to_grid_and_scale(list[-1][0][4], False),
                            (int(list[-1][0][0])-1)*20*layer+bottom_layer]
                connect_matrix = [["x", p1, 0]]
                routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
        elif (list[-1][0][3][0] != 'M') and not('PIN' in list[-1][0]):
            if list[-1][0][1] == list[-1][0][3]:
                p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False),
                            self.snap_to_grid_and_scale(list[-1][0][2], False)-0.5*self.wchan,
                            bottom_layer]
                p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False),
                            self.snap_to_grid_and_scale(list[-1][0][4], False)+0.5*self.wchan,
                            bottom_layer]
                connect_matrix = [["y", p1, 1]]
                routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
            else:
                p0 =    [self.snap_to_grid_and_scale(list[-1][0][1], False)-0.5*self.wchan,
                            self.snap_to_grid_and_scale(list[-1][0][2], False),
                            bottom_layer]
                p1 =    [self.snap_to_grid_and_scale(list[-1][0][3], False)+0.5*self.wchan,
                            self.snap_to_grid_and_scale(list[-1][0][4], False),
                            bottom_layer]
                connect_matrix = [["x", p1, 0]]
                routing = routing + f"routing_scadfile.routing({p0}, {connect_matrix}, {self.dimensions()})"
        return(eval(routing))

set_pixel_size(0.0076, 0.01)
set_render_resolution(120)
set_lef_scale(1*1000)
set_bottom_layer(10)
#components = place(def_file).place_components()
components1 = route(def_file, 14, 14, 10).get_routing()
#components = eval(serpentine_channel(18/px, 18/px, 0, 14/px, 10/layer, 75).routing())
#scad_render_to_file(components, output_file ,file_header=f'$fn = {segments};\npx = {px};\nlayer = {layer};', include_orig_code=False)
index = 0
for i in components1:
    print(index, i[0])
    index += 1



#print(components1[1][0][3][1])
#route(def_file, 14, 14, 10).perform_routing() + 
all = route(def_file, 14, 14, 10).perform_routing() + place(def_file).place_components()
scad_render_to_file(all, output_file ,file_header=f'$fn = {segments};\npx = {px};\nlayer = {layer};', include_orig_code=False)
#print(components1[0][0])