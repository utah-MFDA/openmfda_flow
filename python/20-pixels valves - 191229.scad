include<routing_181112.scad>

layer       = 0.01;
px          = 0.0076;


max_y_dimm  = 1600*px;
max_x_dimm  = 2560*px;
chip_y_dimm = max_y_dimm;
chip_x_dimm = max_x_dimm;
glass2feat  = 70*layer;
pin2surf    = 50*layer;


//chip_z_dimm = 230*layer;


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

valv2valv   = 750*px;

valv2glass  = pin2valv_z + floor(d_pin/2/layer)*layer + glass2feat;

chip_z_dimm = valv2glass + floor(d_pin/2/layer)*layer + pin2surf;


echo(chip_z_dimm/layer);

// Valve connection channels
xychan0     = 6*px;
xychan      = 8*px;
hchan       = 5*layer;
wchan       = 8*px;

// Pin connection channels
XYchan      = 14*px;
Hchan       = 8*layer;
Wchan       = 14*px;


dimm        =   [  
                    [[0,0],[-wchan/2,wchan/2],[0, hchan]], // 0
                    [[-wchan/2,wchan/2],[0,0],[0, hchan]], // 1
                    [[-xychan/2,xychan/2],[-xychan/2,xychan/2],[0,0]], // 2
                    [[-xychan0/2,xychan0/2],[-xychan0/2,xychan0/2],[0,0]], // 3  
                    [[0,0],[-Wchan/2,Wchan/2],[0, Hchan]], // 4
                    [[-Wchan/2,Wchan/2],[0,0],[0, Hchan]], // 5
                    [[-XYchan/2,XYchan/2],[-XYchan/2,XYchan/2],[0,0]], // 6
                ];



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

translate([max_x_dimm/2, max_y_dimm/2, valv2glass])
difference(){
    translate([-chip_x_dimm/2, -chip_y_dimm/2, -valv2glass])
    %cube([chip_x_dimm, chip_y_dimm, chip_z_dimm]);

    for (i = [-1,0,1], j = [0:1]){
        
        rotate([0,0,180*j])
        translate([i * valv2valv,-chip_y_dimm/2 + l_pin + pin2valv_y ,0])
        valve_and_pinholes(pos = i);
    }
}




