from solid import *
from solid import scad_render_to_file
from solid.utils import *

routing_scadfile = import_scad('routing_181220.scad')
output_file = 'test.scad'

class set_pixel_size:
    """
    This sets the pixel size scale unique to the printer.
    All x,y dimensions are scalar multiples of the "px" value and
    z dimensions are scalar multiples of the "layer" value. For example,
    if a standard cell is instatntiated and needs x, y, or z dimensional 
    arguments, the arguments will be the number of pixels and the 
    physical value will be the argument mutliplied by the pixel scalar.
    """
    def __init__(self, xy, z) -> None:
        global px, layer
        px = xy
        layer = z

class set_render_resolution:
    """
    This sets the render resoultion when exported to openSCAD.
    """
    def __init__(self, res) -> None:
        global segments
        segments = res

class resistive_channel():
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
        self.hchan = hchan * px
        self.length = length

    def dimensions (self):
        dim_matrix = [[[0, 0], [-self.wchan/2, self.wchan/2], [-self.hchan/2, self.hchan/2]], # assumes placement at the center of the dimension argument
            [[-self.wchan/2, self.wchan/2], [0, 0], [-self.hchan/2, self.hchan/2]]]
        return(dim_matrix)

    def connect (self):
        length_per_turn = 1                 # these are arbitrary for now. need more information
        x_length = (1/4)*length_per_turn/2  # 
        y_length = (3/4)*length_per_turn/2  #
        connect = [["+x", x_length, 0]]
        for i in range(0, floor(self.length/length_per_turn)):
            connect.append(["+yx", [y_length, x_length], [1, 0]])
            connect.append(["+yx", [-y_length, x_length], [1, 0]])
        connect.append(["+x", [x_length], [0]])
        return(connect)

    def routing (self):
        b = routing_scadfile.routing([self.x0, self.y0, self.z0], self.connect(), self.dimensions())
        scad_render_to_file(b, output_file ,file_header=f'$fn = {segments};', include_orig_code=False)

"""
Valve information:

    d_valve     = 20*px;
    h_fluid     = 2*layer;
    t_memb      = layer;
    h_air       = 4*layer;
    pin2valv_y  = 50*px;
    pin2valv_z  = 8*layer;
    pin2pin     = 250*px;
    l_pin       = 300*px;
    d_pin       = 104*layer;
    overlap_v_xy  = 2*px;

module valve_and_pinholes(d_valve = d_valve, h_fluid = h_fluid, t_memb = t_memb, h_air = h_air, l_pin = l_pin, d_pin = d_pin, pin2pin = pin2pin, pin2valv_y = pin2valv_y, pin2valv_z = pin2valv_z, xychan = xychan, chip_x_dimm = chip_x_dimm, pos = 1){
    
    h_total = h_fluid + t_memb + h_air;
    
    // Fluid compartment
    color("CadetBlue")
    cylinder(d = d_valve, h = h_fluid, $fn = 100);
    
    // Air compartment
    color("SteelBlue")
    translate([0,0,h_fluid + t_memb])
    cylinder(d = d_valve, h = h_air, $fn = 100);    
        
        
    for(i = [-1:1]){
        
        // pinholes
        translate([i*pin2pin, -(l_pin + pin2valv_y), -pin2valv_z])
        rotate([-90,0,0])
        cylinder(d = d_pin, h = l_pin, $fn = 100);       
    }
    
    
    // Fluid in channel connection
    pt_fluid_in         = [0, 0, 0];
    pt_fluid_in_next    = [
                            ["+zy",[-(7*layer+Hchan), -pin2valv_y],[3,5]],
                          ];
    
    routing(pt_fluid_in,pt_fluid_in_next, dimm);
    
    // Fluid out channel connection
    pt_fluid_out        = [d_valve/2 - overlap_v_xy, 0, 1*layer - hchan];
    pt_fluid_out_next   = [
                            ["+x", 50*px],
                            ["xy", [pin2pin, -pin2valv_y], [4,5]],
                          ];
    
    routing(pt_fluid_out,pt_fluid_out_next, dimm);
    
    // Air control channel connection
    pt_air_control      = [-d_valve/2 - xychan/2 + 6*px, 0, h_total];
    pt_air_control_next = [
                            ["+zx", [10*layer, -50*px]],
                            ["x", -pin2pin, 4],
                            ["+z", -2*pin2valv_z-h_total,6],
                            ["y", -pin2valv_y,5],
                          ];
    
    routing(pt_air_control,pt_air_control_next, dimm);
    
    // Air flushing channel connection
    pt_air_flush        = [d_valve/2 + xychan/2 - 6*px, 0, h_total];
    pt_air_flush_next   = [
                            ["+zyzx", [10*layer,100*px - abs(pos)*50*px,pin2surf - pin2valv_z, sign(pos*2 + 1)*chip_x_dimm/2], [2,1,6,4]],
                          ];
    
    routing(pt_air_flush,pt_air_flush_next, dimm);  
}

"""

"""
Testing
"""

set_pixel_size(0.0076, 0.01)
set_render_resolution(120)
resistive_channel(0, 0 , 0, 6, 6, 10).routing()


"""
End testing
"""

"""
Maybe need classes for these:

max_y_dimm  = 1600*px;
max_x_dimm  = 2560*px;
chip_y_dimm = max_y_dimm;
chip_x_dimm = max_x_dimm;
glass2feat  = 70*layer;
pin2surf    = 50*layer;


"""
