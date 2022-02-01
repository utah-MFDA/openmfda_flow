include<routing_181220.scad>

layer = 0.01/0.0076;
px = 0.0076/0.0076;
$fn = 120;

module valve_20px_0(xpos, ypos, orientation){
    
    // Parameteres
    h_fluid = 2*layer;
    t_memb = layer;
    h_air = 4*layer;
    h_total = h_fluid + t_memb + h_air;
    d_valve = 20*px;
    
    // Valve connection channels
    xychan0 = 6*px;
    xychan = 8*px;
    hchan = 5*layer;
    wchan = 8*px;

    dimm        =   [  
                        [[0,0],[-wchan/2,wchan/2],[0, hchan]], // 0
                        [[-wchan/2,wchan/2],[0,0],[0, hchan]], // 1
                        [[-xychan/2,xychan/2],[-xychan/2,xychan/2],[0,0]], // 2
                        [[-xychan0/2,xychan0/2],[-xychan0/2,xychan0/2],[0,0]], // 3
                    ];
                    
    overlap_v_xy  = 2*px;
    
    module obj(){
    // Fluid compartment
    color("CadetBlue")
    cylinder(d = d_valve, h = h_fluid);
    
    // Air compartment
    color("SteelBlue")
    translate([0,0,h_fluid + t_memb])
    cylinder(d = d_valve, h = h_air);    
        
    // Fluid in channel connection
    pt_fluid_in         = [0, 0, 0];
    pt_fluid_in_next    = [
                            ["+z", -7*layer, 3],
                          ];
    
    routing(pt_fluid_in,pt_fluid_in_next, dimm);
    
    // Fluid out channel connection
    pt_fluid_out        = [d_valve/2 - overlap_v_xy, 0, 1*layer - hchan];
    pt_fluid_out_next   = [
                            ["+x", 50*px],
                          ];
    
    routing(pt_fluid_out,pt_fluid_out_next, dimm);
    
    // Air control channel connection
    pt_air_control      = [-d_valve/2 - xychan/2 + 6*px, 0, h_total];
    pt_air_control_next = [
                            ["+zx", [10*layer, -50*px]],
                          ];
    
    routing(pt_air_control,pt_air_control_next, dimm);
    
    // Air flushing channel connection
    pt_air_flush        = [d_valve/2 + xychan/2 - 6*px, 0, h_total];
    pt_air_flush_next   = [
                            ["+zy", [10*layer, 50*px], [2,1]],
                          ];
    
    routing(pt_air_flush,pt_air_flush_next, dimm);
    }
    
    if (orientation == "N"){
        translate([68*px + xpos*px, 20*px + ypos*px, 7*layer])
        obj();
    }
    if (orientation == "FN"){
        mirror()
        translate([-68*px - xpos*px, 20*px + ypos*px, 7*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([68*px + xpos*px, -60*px - ypos*px, 7*layer])
        obj();
    }
    if (orientation == "S"){
        mirror()
        mirror([0, 1, 0])
        translate([-68*px - xpos*px, -60*px - ypos*px, 7*layer])
        obj();
    }
    
}

module pinhole_300px_0(xpos, ypos, orientation){
    
    // Parameters
    d_pin = 137*px;//104*layer;
    l_pin = 300*px;
    
    // Pin connection channels
    XYchan = 14*px;
    Hchan  = 10*layer;
    Wchan = 14*px;
    
    dimm        =   [    
                    [[0,0],[-Wchan/2,Wchan/2],[0, Hchan]], // 0
                    [[-Wchan/2,Wchan/2],[0,0],[0, Hchan]], // 1
                    [[-XYchan/2,XYchan/2],[-XYchan/2,XYchan/2],[0,0]], // 2
                ];

    module obj(){
        rotate([-90, 0, 0])
        translate([0, 0, XYchan])
        cylinder(d = d_pin, h = l_pin);
        routing([0, 0, 0], [["+y", XYchan, 1]], dimm); 
    }
    
    if (orientation == "N"){
        translate([68.5*px + xpos*px, ypos*px, 68.5*px])
        obj();
    }

}

module pump_40px_0(xpos, ypos, orientation){
    
    // Parameters
    d_DC = 40*px;       // DC diameter
    t_m_DC = layer;     // DC membrane thickness (2 layers of 5 um in JSON FILE)
    h_f_DC = 3*layer;   // height of the fluid chamber (DC) (2.5 layers in JSON FILE)
    h_c_DC = 6*layer;   // height of control chamber
    d_v = 20*px;        // valves diameter
    t_m_v = layer;      // valves membrane thickness (layer of 5 um in JSON FILE)
    h_f_v = 2*layer;    // height of fluid chamber (valves)
    h_c_v = 4*layer;    // height of control chamber (valves) (3.5 layers in JSON FILE)
    dist_v2v = d_DC + d_v + 20*px; // distance between valves centers
    dist_v2chan = 5*layer; // distance between valves bottom and horizontal connection channel
    
    // Channel Dimensions
    xychan0 = 6*px;  
    hchan = 10*layer;
    wchan = 12*px;
    xychan = 12*px;
    Wchan = 14*px;
    Hchan = 25*layer;
    hchan2 = 10*layer;
    ochan = 70*px;


    dim  = [
            [[0,0],[-Wchan/2,Wchan/2],[0,hchan]], // 0
            [[-Wchan/2,Wchan/2],[0,0],[0,hchan]], // 1
            [[-xychan/2,xychan/2],[-xychan/2,xychan/2],[0,0]], // 2
            [[-xychan0/2,xychan0/2],[-xychan0/2,xychan0/2],[0,0]], // 3
            [[0,0],[-Wchan/2,Wchan/2],[0,Hchan]], // 4
            [[-Wchan/2,Wchan/2],[0,0],[0,Hchan]], // 5
            [[-Wchan/2,Wchan/2],[-Wchan/2,Wchan/2],[0,0]], // 6
            [[0,0],[-Wchan/2,Wchan/2],[hchan-Hchan,hchan]], // 7
            [[-Wchan/2,Wchan/2],[0,0],[hchan-Hchan,hchan]], // 8
            [[0,0],[-Wchan,Wchan],[0,2*Hchan]], // 9
            [[-Wchan/2,3*Wchan/2],[0,0],[0,2*Hchan]], // 10
            [[0,0],[-3*Wchan/2,Wchan/2],[0,2*Hchan]], // 11
            [[-Wchan,Wchan],[0,0],[0,2*Hchan]], // 12
            [[-ochan,ochan],[0,0],[0,Hchan]], // 13
            [[0,0],[-Wchan/2,Wchan/2],[0,hchan2]], // 14
            [[-wchan/2,wchan/2],[0,0],[0,hchan2]], // 15
            [[-wchan/2,wchan/2],[-wchan/2,wchan/2],[0,0]], // 16
            
            
           ];
    
    // Submodules
    module valve(d, h_bot, h_top, t_memb){ 
        /*
        d :         diameter of the valve
        h_bot:      bottom chamber height
        h_top:      top chamber height
        t_memb:     membrane thickness
        */    
        
        // Bottom chamber
        color("SteelBlue")
        cylinder(d = d, h = h_bot, $fn = 100);
        
        // Top chamber
        color("CadetBlue")
        translate([0, 0, h_bot+t_memb])
        cylinder(d = d, h = h_top, $fn = 100);    
    }
    
    module obj(){
        //build DC
        valve(d_DC, h_f_DC, h_c_DC, t_m_DC);
        
        for (j = [0:1]){
            mirror([0, j, 0]){
                translate([0, dist_v2v/2, 0])
                
                // inlet and outlet 20 px valves
                valve(d_v, h_f_v, h_c_v, t_m_v);
                
                // fluid connection between valves and DC
                pi_0 = [0 , d_DC/2 - xychan/2, 0];
                pf_0 = [0, dist_v2v/2, 0];
                connect_0 = [
                             ["+z", -(dist_v2chan+hchan)],
                             ["yz", pf_0, [15,3]]
                            ];
                routing(pi_0, connect_0, dim);
            }
            
        }
        pi_1 = [-30*px, 40*px, 7*layer];
        connect_1 = [["+x", 60*px, 0]];
        routing(pi_1, connect_1, dim);
        
        pi_2 = [-30*px, -40*px, 7*layer];
        connect_2 = [["+x", 60*px, 0]];
        routing(pi_2, connect_2, dim);
        
        pi_3 = [-30*px, 0, 10*layer];
        connect_3 = [["+x", 60*px, 0]];
        routing(pi_3, connect_3, dim);
        
        pi_4 = [0, 49*px, -9*layer];
        connect_4 = [["+y", 11*px, 1]];
        routing(pi_4, connect_4, dim);
        
        pi_5 = [0, -60*px, -9*layer];
        connect_5 = [["+y", 11*px, 1]];
        routing(pi_5, connect_5, dim);
    }
    
    if (orientation == "N"){
        translate([40*px + xpos*px, 70*px + ypos*px, 15*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror()
        translate([-40*px - xpos*px, 70*px + ypos*px, 15*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([40*px + xpos*px, -70*px - ypos*px, 15*layer])
        obj();
    }
    if (orientation == "S"){
        mirror()
        mirror([0, 1, 0])
        translate([-40*px - xpos*px, -70*px - ypos*px, 15*layer])
        obj();
    }
    
}

valve_20px_0(0,0,"N");