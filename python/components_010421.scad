include<routing_181220.scad>

layer = 0.01;
px = 0.0076;
$fn = 120;

// needs fixing
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

module valve_20px_1(xpos, ypos, orientation){
    
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
    pt_fluid_in         = [0, -d_valve/2 + overlap_v_xy, 1*layer - hchan];
    pt_fluid_in_next    = [
                            ["+y", -21.6*px],
                          ];
    color("Blue")
    routing(pt_fluid_in,pt_fluid_in_next, dimm);
    
    // Fluid out channel connection
    pt_fluid_out        = [0, d_valve/2 - overlap_v_xy, 1*layer - hchan];
    pt_fluid_out_next   = [
                            ["+y", 21.6*px],
                          ];
    color("Red")
    routing(pt_fluid_out,pt_fluid_out_next, dimm);
    
    // Air control channel connection
    pt_air_control      = [-d_valve/2 - xychan/2 + 6*px, 0, h_total];
    pt_air_control_next = [
                            ["+zx", [10*layer, -21*px]],
                          ];
    
    color("Red")
    routing(pt_air_control,pt_air_control_next, dimm);
    
    // Air flushing channel connection
    pt_air_flush        = [d_valve/2 + xychan/2 - 6*px, 0, h_total];
    pt_air_flush_next   = [
                            ["+zx", [10*layer, 21*px]],
                          ];
    color("Blue")
    routing(pt_air_flush,pt_air_flush_next, dimm);
    }
    
    if (orientation == "N"){
        rotate(270)
        translate([-25*px*2 - ypos*px, 25.6*px*2 + xpos*px, 4*layer])
        obj();
    }
    if (orientation == "FN"){
        mirror([1, 0 , 0])
        rotate(270)
        translate([-25*px*2 - ypos*px, -25.6*px*2 - xpos*px, 4*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        rotate(270)
        translate([25*px*2 + ypos*px, 25.6*px*2 + xpos*px, 4*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0 , 0])
        rotate(270)
        translate([25*px*2 + ypos*px, -25.6*px*2 - xpos*px, 4*layer])
        obj();
    }
    
}

// Test

//valve_20px_1(-21.6, 0, "N");
//valve_20px_1(51.2, 0, "FN");
//valve_20px_1(102.4, 0, "FS");
//valve_20px_1(153.6, 0, "S");


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
    dist_v2v = d_DC + d_v + 40*px; // distance between valves centers
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
        pi_1_0 = [0, 50*px, 7*layer];
        connect_1_0 = [["+x", -58.2*px, 0]];
        color("Red")
        routing(pi_1_0, connect_1_0, dim);
        
        pi_1_1 = [0, 50*px, 7*layer];
        connect_1_1 = [["+x", 58.2*px, 0]];
        color("Blue")
        routing(pi_1_1, connect_1_1, dim);
        
        pi_2 = [-58.2*px, -50*px, 7*layer];
        connect_2 = [["+x", 116.4*px, 0]];
        routing(pi_2, connect_2, dim);
        
        pi_3 = [-58.2*px, 0, 10*layer];
        connect_3 = [["+x", 116.4*px, 0]];
        routing(pi_3, connect_3, dim);
        
        pi_4 = [0, 59*px, -9*layer];
        connect_4 = [["+y", 23*px, 1]];
        routing(pi_4, connect_4, dim);
        
        pi_5 = [0, -59*px, -9*layer];
        connect_5 = [["+y", -23*px, 1]];
        routing(pi_5, connect_5, dim);
    }
    
    if (orientation == "N"){
        translate([76.8*px + xpos*px, 100*px + ypos*px, 15*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror()
        translate([-76.8*px - xpos*px, 100*px + ypos*px, 15*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([76.8*px + xpos*px, -100*px - ypos*px, 15*layer])
        obj();
    }
    if (orientation == "S"){
        mirror()
        mirror([0, 1, 0])
        translate([-76.8*px - xpos*px, -100*px - ypos*px, 15*layer])
        obj();
    }
    
}

// Test
//pump_40px_0(0, 0, "N");
//pump_40px_0(116.4+25.6, 0, "FN");
//pump_40px_0(116.4*2+25.6*2, 0, "FS");
//pump_40px_0(116.4*3+25.6*3, 0, "S");

module pump_40px_1(xpos, ypos, orientation){
    
    // Parameters
    d_DC = 40*px;       // DC diameter
    t_m_DC = layer;     // DC membrane thickness (2 layers of 5 um in JSON FILE)
    h_f_DC = 3*layer;   // height of the fluid chamber (DC) (2.5 layers in JSON FILE)
    h_c_DC = 6*layer;   // height of control chamber
    d_v = 20*px;        // valves diameter
    t_m_v = layer;      // valves membrane thickness (layer of 5 um in JSON FILE)
    h_f_v = 2*layer;    // height of fluid chamber (valves)
    h_c_v = 4*layer;    // height of control chamber (valves) (3.5 layers in JSON FILE)
    dist_v2v = d_DC + d_v + 42.4*px; // distance between valves centers
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
        pi_1_0 = [0, 51.2*px, 7*layer];
        connect_1_0 = [["+x", -57*px, 0]];
        color("Red")
        routing(pi_1_0, connect_1_0, dim);
        
        pi_1_1 = [0, 51.2*px, 7*layer];
        connect_1_1 = [["+x", 57*px, 0]];
        color("Blue")
        routing(pi_1_1, connect_1_1, dim);
        
        pi_2 = [-57*px, -51.2*px, 7*layer];
        connect_2 = [["+x", 114*px, 0]];
        routing(pi_2, connect_2, dim);
        
        pi_3 = [-57*px, 0, 10*layer];
        connect_3 = [["+x", 114*px, 0]];
        routing(pi_3, connect_3, dim);
        
        pi_4 = [0, 60.2*px, -9*layer];
        connect_4 = [["+y", 23.6*px, 1]];
        routing(pi_4, connect_4, dim);
        
        pi_5 = [0, -60.2*px, -9*layer];
        connect_5 = [["+y", -23.6*px, 1]];
        routing(pi_5, connect_5, dim);
    }
    
    if (orientation == "N"){
        rotate(a = 270)
        translate([-75*px - ypos*px, 102.4*px + xpos*px, 15*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror()
        rotate(a = 270)
        translate([-75*px - ypos*px, -102.4*px - xpos*px, 15*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        rotate(a = 270)
        translate([75*px + ypos*px, 102.4*px + xpos*px, 15*layer])
        obj();
    }
    if (orientation == "S"){
        mirror()
        mirror([0, 1, 0])
        rotate(a = 270)
        translate([75*px + ypos*px, -102.4*px - xpos*px, 15*layer])
        obj();
    }
    
}

// Test
//pump_40px_1(0, 0, "N");
//pump_40px_1(179.2, 0, "FN");
//pump_40px_1(179.2*2, 0, "FS");
//pump_40px_1(179.2*3, 0, "S");

module serpentine_150px_0(xpos, ypos, orientation){
    
    // Sub-modules
    module obj(){
        translate([-7*px, -7*px, 0])
        routing(dimm = [[[0, 0], [0, 14*px], [0, 10*layer]], [[0, 14*px], [0, 0], [0,       10*layer]]], p0 = [0, 0, 0], pf = [["+yx", [150*px, 25.6*px], [1, 0]], [        "+yx", [-150*px, 25.6*px], [1, 0]], ["+yx", [150*px, 25.6*px], [1, 0]], [       "+yx", [-150*px, 25.6*px], [1, 0]], ["+yx", [150*px, 25.6*px], [1, 0]], [       "+yx", [-150*px, 0], [1, 0]]]);
        
    }
    
    if (orientation == "N"){
        translate([xpos*px, ypos*px, 0])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-5*25.6*px - xpos*px, ypos*px, 0])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -6*25*px - ypos*px, 0])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-5*25.6*px - xpos*px, -6*25*px - ypos*px, 0])
        obj();
    }
    
}

// Test
//serpentine_150px_0(-5*25.6, 0, "N");
//serpentine_150px_0(5*25.6+25.6, 0, "FN");
//serpentine_150px_0(10*25.6+2*25.6, 0, "FS");
//serpentine_150px_0(15*25.6+3*25.6, 0, "S");


////////////////////////// SCRAP /////////////////////////////////////////

module pump_40px_scrap(xpos, ypos, orientation){
    
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
        pi_1_0 = [0, 40*px, 7*layer];
        connect_1_0 = [["+x", -38.4*px, 0]];
        color("Red")
        routing(pi_1_0, connect_1_0, dim);
        
        pi_1_1 = [0, 40*px, 7*layer];
        connect_1_1 = [["+x", 38.4*px, 0]];
        color("Blue")
        routing(pi_1_1, connect_1_1, dim);
        
        pi_2 = [-38.4*px, -40*px, 7*layer];
        connect_2 = [["+x", 76.8*px, 0]];
        routing(pi_2, connect_2, dim);
        
        pi_3 = [-38.4*px, 0, 10*layer];
        connect_3 = [["+x", 76.8*px, 0]];
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