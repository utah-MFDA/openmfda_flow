// routing library
include <routing_181220.scad>

// printing parameters
px = 0.0076;
layer = 0.01;
max_x = 2560*px;
max_y = 1600*px;

// Valves parameters
d_v = 20*px;
t_m_v = layer;
h_f_v = 2*layer;
h_c_v = 4*layer;

// DC parameterers
d_DC = 40*px;
t_m_DC = layer;
h_f_DC = 3*layer;
h_c_DC = 6*layer;

// overlaps
overlap_fluid_v_xy = 1*px;
overlap_fluid_v_z = 1*layer;
overlap_ctrl_v_xy = 6*px;
overlap_ctrl_DC_xy = 8*px;


// channels dimensions
wchan0 = 6*px; 
xychan0 = 6*px;  
hchan = 7*layer;
hchan2 = 5*layer;
wchan = 8*px;
xychan = 8*px;
Wchan = 14*px;
Hchan = 12*layer;
diff_chan_l = 125*px;
out_channel_width = 30*px; 
out_channel_height = hchan2+18*layer;


dim  = [
        [[0,0],[-wchan/2,wchan/2],[0,hchan]], // 0
        [[-wchan/2,wchan/2],[0,0],[0,hchan]], // 1
        [[-xychan/2,xychan/2],[-xychan/2,xychan/2],[0,0]], // 2
        [[0,0],[-wchan0/2,wchan0/2],[0,hchan]], // 3
        [[-xychan0/2,xychan0/2],[-xychan0/2,xychan0/2],[0,0]], // 4
        [[0,0],[-Wchan/2,Wchan/2],[0,Hchan]], // 5
        [[-Wchan/2,Wchan/2],[0,0],[0,Hchan]], // 6
        [[-Wchan/2,Wchan/2],[-Wchan/2,Wchan/2],[0,0]], // 7
        [[0,0],[-wchan/2,wchan/2],[overlap_fluid_v_z-hchan2,overlap_fluid_v_z]], // 8
        [[-wchan/2,wchan/2],[0,0],[overlap_fluid_v_z-hchan2,overlap_fluid_v_z]], // 9
        [[-out_channel_width/2,out_channel_width/2],[0,0],[overlap_fluid_v_z+9*layer-out_channel_height,overlap_fluid_v_z+9*layer]], // 10
       ];


sep_v2chan = 5*layer; // separation between bottom of valve and channel below
dist_iv2iv = d_v + xychan - overlap_fluid_v_xy*2; // distance between centers of inlet valves
dist_watvalv2watchan_x = d_v*3/2;

// Features relative locations
glass2pin = 80*layer; // distance between glass and pinholes bottom 
pin2surf = 90*layer;  // distance between pinholes top and surface
flush2surf = Hchan + 25*layer; // distance between top of flushing 

// Pinholes
d_pin = 106*layer; // pinhole diameter 
l_pin_1  = 250*px; // pinhole longitude 
l_pin_2  = 250*px; // pinhole longitude 
pin2pin_1 = 440*px; // distance between pinholes centers
pin2pin_2 = 300*px; // distance between pinholes centers

////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

module box(x_dim, y_dim, z_dim){
    translate([x_dim[0], y_dim[0], z_dim[0]])
    cube([x_dim[1]-x_dim[0], y_dim[1]-y_dim[0], z_dim[1]-z_dim[0]]);
}


module valve(d_v, h_bot, h_top, t_m, col_bot="SteelBlue", col_top="CadetBlue"){
    // bottom chamber
    color(col_bot)
    cylinder(d = d_v, h = h_bot, $fn = 100);
    // top chamber
    translate([0, 0, h_bot + t_m])
    color(col_top)
    cylinder( d = d_v, h = h_top, $fn = 100); 
}

module diffusion_channel(){
    color("RosyBrown")
    rotate([90,0,0])
    linear_extrude(height = 4*px, center = true)
    polygon(points=[[0,0], [0,hchan], [25*px,21*layer], [diff_chan_l-25*px,21*layer], [diff_chan_l,hchan],[diff_chan_l,0],[diff_chan_l-25*px,-16*layer],[25*px,-16*layer]]);
}


pos_outlet_valve = [diff_chan_l+d_v, 0, 0];
pos_dye_DC = [d_DC/2+d_v*3/2, d_DC/2+d_v, 0];
pos_dye_valve = pos_dye_DC + [d_DC/2+d_v*3/2, 0, 0];
pos_water_DC = [-d_DC/2-d_v*3/2, -dist_iv2iv/2, 0];
pos_water_valve = pos_water_DC - [d_DC/2+d_v*3/2, 0, 0];



module mixer(){
    
    // inlet valves
    for (j = [-0.5:0.5]){
        translate([0, dist_iv2iv*j, 0])
        valve(d_v, h_f_v, h_c_v, t_m_v);
    }
    // control interconnection - inlet valve to inlet valve
    pi_0 = [0, (dist_iv2iv-d_v)/2+overlap_ctrl_v_xy, h_f_v+h_c_v+t_m_v];
    pf_0_y = (d_v-dist_iv2iv)/2-overlap_ctrl_v_xy;
    connect_0 = [["y", pf_0_y]];
    routing(pi_0, connect_0, dim);
    
    // diffusion channel
    translate([d_v/2,0,-(sep_v2chan+hchan)])
    diffusion_channel();
    // fluid connection - inlet valves to diffusion channel
    pi_1 = [0, 0, overlap_fluid_v_z];
    pf_1 = [d_v/2, 0, -(sep_v2chan+hchan)];
    connect_1 = [["zx", pf_1, [2,3]]];
    routing(pi_1, connect_1, dim);
    // outlet valve
    translate(pos_outlet_valve)
    valve(d_v, h_f_v, h_c_v, t_m_v);
    // fluid connection - outlet valve to diffusion channel
    pi_2 = pos_outlet_valve;
    pf_2 = pos_outlet_valve - [d_v/2, 0, sep_v2chan+hchan];
    connect_2 = [["zx", pf_2, [4,3]]];
    routing(pi_2, connect_2, dim);
    // dye and water DCs
    for (pos = [pos_dye_DC, pos_water_DC]){
        translate(pos)
        valve(d_DC, h_f_DC, h_c_DC, t_m_DC);
    }
    // dye and water valves
    for (pos = [pos_dye_valve, pos_water_valve]){
        translate(pos)
        valve(d_v, h_f_v, h_c_v, t_m_v);
    }
    // fluid connection - inlet valve to dye DC
    pi_3 = [0, dist_iv2iv/2, 0];
    pf_3 = pos_dye_DC + [xychan/2-d_DC/2, 0, overlap_fluid_v_z];
    connect_3 = [["+z", -(sep_v2chan+hchan), 4],
                 ["yxz", pf_3]];
    routing(pi_3, connect_3, dim);
    // fluid connection - dye DC to dye valve
    pi_4 = pos_dye_DC + [d_DC/2-xychan/2, 0, overlap_fluid_v_z];
    pf_4 = pos_dye_valve;
    connect_4 = [["+z", -(sep_v2chan+hchan+pi_4[2])],
                 ["xz", pf_4, [0,4]]];
    routing(pi_4, connect_4, dim);
    // fluid connection - inlet valve to water DC
    pi_5 = [0, -dist_iv2iv/2, 0];
    pf_5 = pos_water_DC + [d_DC/2-xychan/2, 0, overlap_fluid_v_z];
    connect_5 = [["+z", -(sep_v2chan+hchan), 4],
                 ["xz", pf_5]];
    routing(pi_5, connect_5, dim);
    // fluid connection - water DC to water valve
    pi_6 = pos_water_DC + [xychan/2-d_DC/2, 0, overlap_fluid_v_z];
    pf_6 = pos_water_valve;
    connect_6 = [["+z", -(sep_v2chan+hchan+pi_4[2])],
                 ["xz", pf_6, [0,4]]];
    routing(pi_6, connect_6, dim);
    // fluid connection - water valve to water channel (for serial diluter)
    pi_7 = pos_water_valve + [overlap_fluid_v_xy-d_v/2, 0, overlap_fluid_v_z-hchan];
    connect_7 = [["+x", -dist_watvalv2watchan_x]];
    routing(pi_7, connect_7, dim);

}

water_chan_width = 180*px;
module water_channel(){    
    color("RosyBrown")
    linear_extrude(height = hchan + 4*layer)
    polygon(points =
    [
        [0, pos_water_valve[1]+pos_dye_DC[1]*9+wchan/2],
        [0, pos_water_valve[1]-pos_dye_DC[1]*9-wchan/2],
        [-30*px, pos_water_valve[1]-pos_dye_DC[1]*9-wchan/2],
        [80*px-water_chan_width, -20*px],
        [-water_chan_width, -20*px],
        [-water_chan_width, 20*px],
        [80*px-water_chan_width, 20*px],
        [-30*px, pos_water_valve[1]+pos_dye_DC[1]*9+wchan/2],
    ]);
}


module serial_dilution_mixer_10_stages(){
    for (j=[-4.5:4.5]){
        translate([0,pos_dye_DC[1]*2*j,0])
        mixer();
    }
    // fluid connection - dye valve to outlet valve
    pi_0 = [pos_dye_valve[0]+d_v/2-overlap_fluid_v_xy, 0, overlap_fluid_v_z-hchan];
    pf_0 = pos_outlet_valve + [0, pos_dye_DC[1]-d_v/2+overlap_fluid_v_xy, overlap_fluid_v_z-hchan];
    connect_0 = [["xy", pf_0]];
    for (j=[-4:4]){
        translate([0,pos_dye_DC[1]*2*j,0])
        routing(pi_0, connect_0, dim);
    }
    // water channel
    translate([pos_water_valve[0]-dist_watvalv2watchan_x, 0, overlap_fluid_v_z-hchan-2*layer])
    water_channel();
    // left y-side pinholes 
    water_pinholes_x = pos_water_valve[0]-dist_watvalv2watchan_x-water_chan_width;
    for(j = [-1:1]){
        translate([water_pinholes_x, pin2pin_1*j, 0])
        rotate([0,-90,0])
        cylinder(d = d_pin, h = l_pin_1, $fn = 100);
    }
    // x-sides pinholes
    x_sides_pinholes_x0 = water_pinholes_x + 64*px + floor(d_pin/2/px)*px;
    for(i = [0:2], j = [0:1]){
        j = (i == 2)? 0:j;
        mirror([0,j,0])
        translate([x_sides_pinholes_x0+pin2pin_2*i,max_y/2-l_pin_2,0])
        rotate([-90,0,0])
        cylinder(d = d_pin, h = l_pin_2, $fn = 100);
    }
    
    /////////////////
    // WATER VALVE //
    /////////////////
    // control interconnection
    pos_water_valve_0 = pos_water_valve + [0, pos_dye_DC[1]*9, 0];
    pi_1 = pos_water_valve_0 + [0, overlap_ctrl_v_xy-(d_v+xychan)/2, h_f_v+h_c_v+t_m_v];
    pf_1 = pi_1 + [0, -pos_dye_DC[1]*2+d_v+xychan-overlap_ctrl_v_xy*2, 0];
    connect_1 = [
                 ["+z", 10*layer],
                 ["yz", pf_1, [6,2]]
                ];
    for(j=[0:8]){
        translate([0,-pos_dye_DC[1]*2*j,0])
        routing(pi_1, connect_1, dim);
    }
    // connection to pinhole
    pi_1_c = pi_1 - [0, pos_dye_DC[1]*18, 0];
    pf_1_c = [water_pinholes_x, -pin2pin_1, 0];
    connect_1_c = [
                   ["+z", 10*layer],
                   ["yzx", pf_1_c, [6,7,5]]
                  ];
    routing(pi_1_c, connect_1_c, dim);
    // flushing connection
    pi_1_f = pi_1 + [0, d_v+xychan-overlap_ctrl_v_xy*2, 0];
    pf_1_f = ["-", max_y/2, d_pin/2+pin2surf-flush2surf];
    connect_1_f = [
                   ["+zy", [10*layer,20*px], [2,6]],
                   ["zy", pf_1_f, [7,6]]
                  ];
    routing(pi_1_f, connect_1_f, dim);
    //////////////
    // WATER DC //
    //////////////
    // control interconnection
    pos_water_DC_0 = pos_water_DC + [0, pos_dye_DC[1]*9, 0];
    pi_2 = pos_water_DC_0 + [0, (Wchan-d_DC)/2, h_f_DC+h_c_DC+t_m_DC];
    pf_2 = pi_2 + [0, -pos_dye_DC[1]*2+d_DC-Wchan, 0];
    connect_2 = [
                 ["+z", 10*layer, 7],
                 ["yz", pf_2, [6,7]]
                ];
    for(j=[0:8]){
        translate([0,-pos_dye_DC[1]*2*j,0])
        routing(pi_2, connect_2, dim);
    }
    // control connection
    pi_2_c = pi_2 - [0, pos_dye_DC[1]*18, 0];
    pf_2_c = [x_sides_pinholes_x0, l_pin_2-max_y/2, 0];
    connect_2_c = [
                   ["+z", 10*layer, 7],
                   ["y", pf_2_c[1]+60*px, 6],
                   ["xzy", pf_2_c, [5,7,6]]
                  ];
    routing(pi_2_c, connect_2_c, dim);
    // flushing connection
    pi_2_f = pi_2 + [0, d_DC-Wchan, 0];
    pf_2_f = ["-", max_y/2, d_pin/2+pin2surf-flush2surf];
    connect_2_f = [
                   ["+zy", [10*layer,20*px], [7,6]],
                   ["zy", pf_2_f, [7,6]]
                  ];
    routing(pi_2_f, connect_2_f, dim);
    ///////////////
    // DYE VALVE //
    ///////////////
    // control interconnection
    pos_dye_valve_0 = pos_dye_valve + [0, pos_dye_DC[1]*9, 0];
    pi_3 = pos_dye_valve_0 + [0, overlap_ctrl_v_xy-(d_v+xychan)/2, h_f_v+h_c_v+t_m_v];
    pf_3 = pi_3 + [0, -pos_dye_DC[1]*2+d_v+xychan-overlap_ctrl_v_xy*2, 0];
    connect_3 = [
                 ["+z", 10*layer],
                 ["yz", pf_3, [6,2]]
                ];
    for(j=[0:8]){
        translate([0,-pos_dye_DC[1]*2*j,0])
        routing(pi_3, connect_3, dim);
    }
    // fluid inlet connection to pinhole
    pi_3_in = pos_dye_valve_0 + [0, d_v/2-overlap_fluid_v_xy, overlap_fluid_v_z-hchan];
    pin_dye_in = [water_pinholes_x, pin2pin_1, 0];
    connect_3_in = [["yx", pin_dye_in, [1,5]]];
    routing(pi_3_in, connect_3_in, dim);
    // control connection
    pi_3_c = pi_3 + [0, d_v+xychan-overlap_ctrl_v_xy*2, 0];
    pf_3_c = [x_sides_pinholes_x0+pin2pin_2, max_y/2-l_pin_2, 0];
    connect_3_c = [
                   ["+zy", [10*layer,20*px], [2,6]],
                   ["y", pf_3_c[1]-60*px, 6],
                   ["xzy", pf_3_c, [5,7,6]]
                  ];
    routing(pi_3_c, connect_3_c, dim);
    // flushing connection
    pi_3_f = pi_3 - [0, pos_dye_DC[1]*18, 0];
    pf_3_f = ["-", -max_y/2, d_pin/2+pin2surf-flush2surf];
    connect_3_f = [
                   ["+zy", [10*layer,-20*px], [2,6]],
                   ["zy", pf_3_f, [7,6]]
                  ];
    routing(pi_3_f, connect_3_f, dim);
    ////////////
    // DYE DC //
    ////////////
    // control interconnection
    pos_dye_DC_0 = pos_dye_DC + [0, pos_dye_DC[1]*9, 0];
    pi_4 = pos_dye_DC_0 + [0, (Wchan-d_DC)/2, h_f_DC+h_c_DC+t_m_DC];
    pf_4 = pi_4 + [0, -pos_dye_DC[1]*2+d_DC-Wchan, 0];
    connect_4 = [
                 ["+z", 10*layer, 7],
                 ["yz", pf_4, [6,7]]
                ];
    for(j=[0:8]){
        translate([0,-pos_dye_DC[1]*2*j,0])
        routing(pi_4, connect_4, dim);
    }
    // control connection
    pi_4_c = pi_4 + [0, d_DC-Wchan, 0];
    pf_4_c = [x_sides_pinholes_x0, max_y/2-l_pin_2, 0];
    connect_4_c = [
                   ["+z", 10*layer, 7],
                   ["y", pf_4_c[1]-60*px, 6],
                   ["xzy", pf_4_c, [5,7,6]]
                  ];
    routing(pi_4_c, connect_4_c, dim);
    // flushing connection
    pi_4_f = pi_4 - [0, pos_dye_DC[1]*18, 0];
    pf_4_f = ["-", -max_y/2, d_pin/2+pin2surf-flush2surf];
    connect_4_f = [
                   ["+zy", [10*layer,-20*px], [7,6]],
                   ["zy", pf_4_f, [7,6]]
                  ];
    routing(pi_4_f, connect_4_f, dim);
    /////////////////
    // INLET VALVE //
    /////////////////
    // control interconnection
    pos_inlet_valve_0 = [0, pos_dye_DC[1]*9-dist_iv2iv/2, 0];
    pi_5 = pos_inlet_valve_0 + [0, overlap_ctrl_v_xy-(d_v+xychan)/2, h_f_v+h_c_v+t_m_v];
    pf_5 = pi_5 + [0, -pos_dye_DC[1]*2+d_v+xychan-overlap_ctrl_v_xy*2+dist_iv2iv, 0];
    connect_5 = [
                 ["+z", 10*layer],
                 ["yz", pf_5, [6,2]]
                ];
    for(j=[0:8]){
        translate([0,-pos_dye_DC[1]*2*j,0])
        routing(pi_5, connect_5, dim);
    }
    // control connection
    pi_5_c = pi_5 - [0, pos_dye_DC[1]*18, 0];
    pf_5_c = [x_sides_pinholes_x0+pin2pin_2, l_pin_2-max_y/2, 0];
    connect_5_c = [
                   ["+z", 10*layer],
                   ["y", pf_5_c[1]+60*px, 6],
                   ["xzy", pf_5_c, [5,7,6]]
                  ];
    routing(pi_5_c, connect_5_c, dim);
    // flushing connection
    pi_5_f = pi_5 + [0, dist_iv2iv+d_v+xychan-overlap_ctrl_v_xy*2, 0];
    pf_5_f = ["-", max_y/2, d_pin/2+pin2surf-flush2surf];
    connect_5_f = [
                   ["+zy", [10*layer,20*px], [2,6]],
                   ["zy", pf_5_f, [7,6]]
                  ];
    routing(pi_5_f, connect_5_f, dim);
    //////////////////
    // OUTLET VALVE //
    //////////////////
    // control interconnection
    pos_outlet_valve_0 = pos_outlet_valve + [0, pos_dye_DC[1]*9, 0];
    pi_6 = pos_outlet_valve_0 + [0, overlap_ctrl_v_xy-(d_v+xychan)/2, h_f_v+h_c_v+t_m_v];
    pf_6 = pi_6 + [0, -pos_dye_DC[1]*2+d_v+xychan-overlap_ctrl_v_xy*2, 0];
    connect_6 = [
                 ["+z", 10*layer],
                 ["yz", pf_6, [6,2]]
                ];
    for(j=[0:8]){
        translate([0,-pos_dye_DC[1]*2*j,0])
        routing(pi_6, connect_6, dim);
    }
    // control connection
    pi_6_c = pi_6 + [0, d_v+xychan-overlap_ctrl_v_xy*2, 0];
    pf_6_c = [x_sides_pinholes_x0+pin2pin_2*2, max_y/2-l_pin_2, 0];
    connect_6_c = [
                   ["+zy", [10*layer,20*px], [2,6]],
                   ["y", pf_6_c[1]-100*px, 6],
                   ["xzy", pf_6_c, [5,7,6]]
                  ];
    routing(pi_6_c, connect_6_c, dim); 
    // flushing connection
    pi_6_f = pi_6 - [0, pos_dye_DC[1]*18, 0];
    pf_6_f = ["-", -max_y/2, d_pin/2+pin2surf-flush2surf];
    connect_6_f = [
                   ["+zy", [10*layer,-20*px], [2,6]],
                   ["zy", pf_6_f, [7,6]]
                  ];
    routing(pi_6_f, connect_6_f, dim);
    ///////////////////
    // FLUID OUTLETS //
    ///////////////////
    roi_end_x = pos_outlet_valve[0]+300*px;
    roi_center_y = pos_dye_valve[1]-pos_dye_DC[1];
    sep_roi_chan_x = 10*px;
    sep_roi_chan_y = 6*px;
    chan2chan_x = wchan + sep_roi_chan_x;
    chan2chan_y = wchan + sep_roi_chan_y;
    ov2outchan_x = 30*px;
    // outlet Pinhole
    translate([roi_end_x,l_pin_2-max_y/2,0])
    rotate([90,0,0])
    cylinder(d = d_pin, h = l_pin_2, $fn = 100);
    // output - 1:2
    out_1_2 = [pos_outlet_valve[0], pos_dye_valve[1]+pos_dye_DC[1]*7, 0];
    output_pin_y = l_pin_2 - max_y/2;
    connect_1_2 = [
                   ["+x", ov2outchan_x+chan2chan_x*3, 8],
                   ["yx", [roi_end_x,roi_center_y+chan2chan_y*4], [9,8]],
                   ["y", output_pin_y, 10],
                  ];
    routing(out_1_2, connect_1_2, dim);    
    // output - 1:4
    out_1_4 = [pos_outlet_valve[0], pos_dye_valve[1]+pos_dye_DC[1]*5, 0];
    connect_1_4 = [
                   ["+x", ov2outchan_x+chan2chan_x*2, 8],
                   ["yx", [roi_end_x,roi_center_y+chan2chan_y*3], [9,8]],
                  ];
    routing(out_1_4, connect_1_4, dim);
    // output - 1:8
    out_1_8 = [pos_outlet_valve[0], pos_dye_valve[1]+pos_dye_DC[1]*3, 0];
    connect_1_8 = [
                   ["+x", ov2outchan_x+chan2chan_x, 8],
                   ["yx", [roi_end_x,roi_center_y+chan2chan_y*2], [9,8]],
                  ];
    routing(out_1_8, connect_1_8, dim);
    // output - 1:16
    out_1_16 = [pos_outlet_valve[0], pos_dye_valve[1]+pos_dye_DC[1], 0];
    connect_1_16 = [
                    ["+x", ov2outchan_x, 8],
                    ["yx", [roi_end_x,roi_center_y+chan2chan_y], [9,8]],
                   ];
    routing(out_1_16, connect_1_16, dim);
    // output - 1:32
    out_1_32 = [pos_outlet_valve[0], pos_dye_valve[1]-pos_dye_DC[1], 0];
    connect_1_32 = [
                    ["x", roi_end_x, 8],
                   ];
    routing(out_1_32, connect_1_32, dim);
    // output - 1:64
    out_1_64 = [pos_outlet_valve[0], pos_dye_valve[1]-pos_dye_DC[1]*3, 0];
    connect_1_64 = [
                    ["+x", ov2outchan_x, 8],
                    ["yx", [roi_end_x,roi_center_y-chan2chan_y], [9,8]],
                   ];
    routing(out_1_64, connect_1_64, dim);
    // output - 1:128
    out_1_128 = [pos_outlet_valve[0], pos_dye_valve[1]-pos_dye_DC[1]*5, 0];
    connect_1_128 = [
                     ["+x", ov2outchan_x+chan2chan_x, 8],
                     ["yx", [roi_end_x,roi_center_y-chan2chan_y*2], [9,8]],
                    ];
    routing(out_1_128, connect_1_128, dim);
    // output - 1:256
    out_1_256 = [pos_outlet_valve[0], pos_dye_valve[1]-pos_dye_DC[1]*7, 0];
    connect_1_256 = [
                     ["+x", ov2outchan_x+chan2chan_x*2, 8],
                     ["yx", [roi_end_x,roi_center_y-chan2chan_y*3], [9,8]],
                    ];
    routing(out_1_256, connect_1_256, dim);
    // output - 1:512
    out_1_512 = [pos_outlet_valve[0], pos_dye_valve[1]-pos_dye_DC[1]*9, 0];
    connect_1_512 = [
                     ["+x", ov2outchan_x+chan2chan_x*3, 8],
                     ["yx", [roi_end_x,roi_center_y-chan2chan_y*4], [9,8]],
                    ];
    routing(out_1_512, connect_1_512, dim);
    // output - 1:1024
    out_1_1024 = [pos_outlet_valve[0]+d_v/2-overlap_fluid_v_xy, pos_outlet_valve[1]-pos_dye_DC[1]*9, 0];
    connect_1_1024 = [
                      ["+x", ov2outchan_x+chan2chan_x*4+overlap_fluid_v_xy-d_v/2, 8],
                      ["yx", [roi_end_x,roi_center_y-chan2chan_y*5], [9,8]],
                     ];
    routing(out_1_1024, connect_1_1024, dim);
}

water_pinholes_x = pos_water_valve[0]-dist_watvalv2watchan_x-water_chan_width;
// Chip dimensions
chip_x_i = water_pinholes_x - l_pin_1;
chip_x_f = max_x + chip_x_i;
chip_y_i = -max_y/2;
chip_y_f = max_y/2;
chip_z_i = -(d_pin/2 + glass2pin);
chip_z_f = d_pin/2 + pin2surf;

translate(-[chip_x_i,chip_y_i,chip_z_i])
difference(){
    box([chip_x_i, chip_x_f], [chip_y_i, chip_y_f], [chip_z_i, chip_z_f]);
    for (i = [0:1]){
        translate([(chip_x_f+chip_x_i)*i,0,0])
        mirror([0,i,0])
        mirror([i,0,0])
        serial_dilution_mixer_10_stages();
    }
}
























