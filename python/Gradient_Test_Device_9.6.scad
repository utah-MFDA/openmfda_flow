use <routing_181220.scad> //routing library
$fn = 50; //number of faces on an object

////v25 updates: cell input was lowered in the z direction, pumps are located above the bulk removal for the main chamber lid,  channels adjusted

// Printing Parameters
px = 0.0076; // size of one pixel in mm
layer = 0.01; // size of one layer in mm
max_x = 2560*px; //maximum value in x direction
max_y = 1600*px; //maximum value in y direction
z_burn_in = 50*layer; //number of layers in the burn in at the bottom of the device

//Well Parameters
well_x = 850*px; //size of well in x dierection
well_y = 750*px; //size of well in y dierection
well_z = 250*layer; //size of well in z dierection
r_edge = 30*px; //radius of the rounded edge
roof_angle = 40; //angle at which the roof will be built over the well. Measured relative to the xy plane
d_opening = 200*px; //diameter of the opening on top of the well
z_slant = 10*layer; //number of layers the bottom of the well will slant
variable_a = min(well_x/2 - d_opening/2, well_y/2 - d_opening/2); //filler variable to calculate height of the roof
h_roof = round(variable_a * tan(roof_angle)/layer)*layer; //calculate the height of the roof
wall_thickness = 200*px; //thickness of the device to the wells
approx_well_volume = (well_x * well_y * well_z) + (0.5 * z_slant * well_x * well_y) + (well_x * well_y * h_roof/3); //calculate an estimate of well volume
echo(approx_well_volume); //read out the volume estimate
echo(h_roof);

// DC parameterers
d_DC = 40*px;       // DC diameter
t_m_DC = layer;     // DC membrane thickness (2 layers of 5 um in JSON FILE)
h_f_DC = 3*layer;   // height of the fluid chamber (DC) (2.5 layers in JSON FILE)
h_c_DC = 6*layer;   // height of control chamber

// Pinholes
pos_fluid_pinholes_x = 300*px;
d_pin = 105*layer; // pinhole diameter 
d_pin2 = 54*layer; 
l_pin  = 350*px; // pinhole longitude
l_pin2 = 80*px; 
pin2pin_control = 335*px; // distance between control pinhole centers
pin2pin_fluid = 300*px; // distance between fluid pinhole centers (from the same pump)
pin2pin_z = 50*layer; // z-separation between control and fluid pinholes
dist_pin2pump = d_DC/2 + 200*px; // y-distance between pump center and pinholes
pin_from_center = 400*px; // distance the pins are from the center
pin_from_center2 = 250*px; // distance the pins are from the center
glass2pin = 70*layer; // distance between glass and pinholes bottom 

ctrl_chan_translation= -200*px; //translation of ctrl channels from x=0

// Main Chamber Dimensions
main_channel_y = 64*px; // 870µM
main_channel_x = 66*px; // 4000µM
main_channel_z = 10*layer; // 100µM
pillar_chan_y = 16*px; // 90µM
side_chan_y = 13*px; // 100µM
pillar_x = 2*px; //original is 6µM, this is roughly 15µM
x_output = 0*px; //output after main chamber
x_triangle = 40*px; //length of the triangle output
output_chan_w = 14*px; //width of output channel
main_channel_l = main_channel_x; //redunant variable to fix a mistake 
pillar_chan_x = 2*px; //width of pillar channels
main_channel_translation = -400*px;
main_channel_z_translation = glass2pin + d_pin/2 -d_pin2/2;
layers_above_main_channel = 20*layer;
chamber_wall = 18*px; //barrier at the end of the chamber

// Device Parameters
z_bulk = z_burn_in + 210*layer; //change later when coded

// Valve parameters
d_v = 20*px;        // valves diameter
t_m_v = layer;      // valves membrane thickness (layer of 5 um in JSON FILE)
h_f_v = 2*layer;    // height of fluid chamber (valves)
h_c_v = 4*layer;    // height of control chamber (valves) (3.5 layers in JSON FILE)

// Features relative locations
dist_v2v = d_DC + d_v + 20*px; // distance between valves centers
dist_v2chan = 5*layer; // distance between valves bottom and horizontal connection channel


////serpintine parameters
s_chan_x = 600*px;
s_chan_y = 30*px;


///wide channel parameters

widechan_start = -50*px; //distance between chamber that channel widens

widechan_width = 140*px; //width of channel (includes channel width)
widechan_end = 175*px; //distance after chamber that channel widens 


///support pillars parameters 
x_support = 10*px;
y_support = x_support;
z_support = 25*layer;
support_spacing = 120*px; //spacing in pillar line




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
       
       
    //pumps translations
pump_y = -main_channel_translation+ 275*px;
pump_x = main_channel_y/2 - Wchan/2 + pillar_chan_y + side_chan_y;
pump_z =main_channel_z_translation+Hchan-main_channel_z+hchan2-1*layer+40*layer;
roof_above_pumps = pump_z - z_bulk + 30*layer;

overlap_fluid_v_xy = 1*px;
overlap_fluid_v_z = 1*layer;
overlap_ctrl_v_xy = 6*px;   
       
       
       
       
       ///////////////////////////
       
       
       
       //module builds the bulk shape of the device
module bulk() {
    union() {
        //build main cube
        translate([0, 0, z_bulk/2])
        cube([max_x, max_y, z_bulk], center = true);
        
    }
    
}
       
       
       
       
       


//module to build the main diffusion chamber
module main_chamber(){
    rotate([0, 0, 0]) 
    translate ([main_channel_translation, 0, main_channel_z/2 + main_channel_z_translation+Hchan-main_channel_z]) {
        
        cube([main_channel_x, main_channel_y + 2*pillar_chan_y + 2*side_chan_y, main_channel_z], center = true);
        
        translate([main_channel_x/2 + x_output/2, 0, 0])
        cube([x_output, main_channel_y, main_channel_z], center = true);
        
        *hull(){
            
            translate([main_channel_x/2 + x_output - 1*px/2, 0, 0])
            cube([1*px, main_channel_y, main_channel_z], center = true);
            
            translate([main_channel_x/2 + x_output + x_triangle - 1*px/2, 0, ])
            cube([1*px, output_chan_w, main_channel_z], center = true);
            
        }
        
    }
    //route main chamber outputs
    /////channels mirrored
    
   for(i=[0:1]){
       
       mirror ([0,i,0]){
    
    //chamber side1 to pump 
    pi_0 = [-pump_y-dist_v2v/2-d_v/2+1*px ,main_channel_y/2 - Wchan/2 + pillar_chan_y + side_chan_y , pump_z-hchan2+layer];
            
            pf_0 = [-max_x/2,pin2pin_control, main_channel_z_translation+Hchan-main_channel_z+53*px];
    
           connect_0 = [
                         ["+xx", [-50*px,pump_y-max_x/2+600*px], [14,0]],
                         ["zyx", pf_0, [6,1,0]],
                        ];
            routing(pi_0, connect_0, dim);
    
    //pump to side chamber
    pi_1 = [-pump_y+dist_v2v/2+d_v/2-1*px ,main_channel_y/2 - Wchan/2 + pillar_chan_y + side_chan_y , pump_z-hchan2+layer];
    pf_1 = [main_channel_translation ,main_channel_y/2 - Wchan/2 + pillar_chan_y + side_chan_y , main_channel_z_translation+Hchan-main_channel_z];
            connect_1 = [
                         ["+x", [40*px], [14]],
                         ["zx", pf_1, [6,0]],
                        ];
            routing(pi_1, connect_1, dim);
            
        }
    }     
    
    //input to middle of chamber 
    pi_2 = [-max_x/2,0, main_channel_z_translation+Hchan-main_channel_z];
    pf_2 = [main_channel_translation ,0 , main_channel_z_translation+Hchan-main_channel_z];
            connect_2 = [
                         
                         ["x", pf_2, [0]],
                        ];
            routing(pi_2, connect_2, dim);
            
      


//2nd output
  pi_4 = [0,main_channel_translation+60*px,main_channel_z_translation];
    pf_4 = [pin2pin_control, max_y/2, main_channel_z_translation];
    
            connect_4 = [
                         ["+z", [50*layer],[6]],
                         ["xzy", pf_4, [4,6,5]],
                        ];
            *routing(pi_4, connect_4, dim);
            





    //output 
    
    pi_3 = [main_channel_translation ,main_channel_y/2 - Wchan/2 + pillar_chan_y + side_chan_y , main_channel_z_translation+Hchan-main_channel_z];
    pf_3 = [max_x/2 , 0, main_channel_z_translation];
    
            connect_3 = [
                         ["+xyxxyxyxyxyxyx", [main_channel_x/2+Wchan/2+chamber_wall,-main_channel_y/2+Wchan/2-pillar_chan_y-side_chan_y,50*px,530*px,s_chan_x/2,s_chan_y,-s_chan_x,s_chan_y,s_chan_x,s_chan_y,-s_chan_x,s_chan_y,s_chan_x,s_chan_y],[0,1,0,0,1,0,1,0,1,0,1,0,1,0]],
                         ["yx", pf_3, [1,0]],
                        ];
            routing(pi_3, connect_3, dim);
            
            
 
         
            
            
            
            
    //builds angled output
            
            color("rosybrown") {
            hull(){
                
                translate([main_channel_translation+main_channel_x/2+chamber_wall,-main_channel_y/2  - pillar_chan_y -side_chan_y, main_channel_z_translation])
                cube([1*px,main_channel_y+2*pillar_chan_y+2*Wchan,Hchan]);
                
                translate([main_channel_translation+main_channel_x/2+widechan_end,-main_channel_y/2  - pillar_chan_y -side_chan_y, main_channel_z_translation])
                cube ([1*px,main_channel_y+2*pillar_chan_y+2*Wchan,Hchan]);
                
                translate([main_channel_translation+main_channel_x/2+widechan_end+60*px,0, main_channel_z_translation])
                cube([1*px,1*px,Hchan]);
                
                
            }
            
            
            ///2nd angled output
            
            *hull(){
                
     translate ([0,main_channel_translation+main_channel_x/2+2*Wchan+x_output+x_triangle+8*px+98*px, main_channel_z_translation])
                cube ([main_channel_y/2 + pillar_chan_y+side_chan_y,1*px,Hchan]);
              
              
     translate ([0,main_channel_translation+main_channel_x/2+2*Wchan+x_output+x_triangle+200*px, main_channel_z_translation]) 
               cube([1*px,1*px,Hchan]);  
                
            }
            }

        
}



//module to build a valve
module valve(d, h_bot, h_top, t_memb, col_bot="SteelBlue", col_top="CadetBlue"){ 
    /*
    d :         diameter of the valve
    h_bot:      bottom chamber height
    h_top:      top chamber height
    t_memb:     membrane thickness
    col_bot:    bottom chamber color
    col_top:    top chamber color
    */    
    
    // Bottom chamber
    color(col_bot)
    cylinder(d = d, h = h_bot, $fn = 100);
    
    // Top chamber
    color(col_top)
    translate([0, 0, h_bot+t_memb])
    cylinder(d = d, h = h_top, $fn = 100);    
}

//module to build a pump
module pump() {
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
    
}

module pumps () {
    
    for (i=[0:1]){
        mirror ([0,i,0]){
            rotate([0,0,90]){
                
                translate([pump_x,pump_y,pump_z])
                pump();
            
            
            
            
            
            }
        }
    }
}


//module to build pillars
module pillars(){
     spacing = [for(i = [0:pillar_x/px:main_channel_l*2/pillar_x], j = [0:2*pillar_x/px:pillar_chan_x/pillar_x]) [i, j, 0]];
    
    for(i = [0:len(spacing) - 1]){
        if(i/2 == round(i/2)) {translate(px*spacing[i])
            cube([pillar_x, pillar_x, main_channel_z]);} 
        
    }
}

module support_pillars () {
    //+x pillar
    translate ([ main_channel_translation+main_channel_x/2,main_channel_y/2+widechan_width/2+pillar_chan_y,main_channel_z_translation])
    cube([x_support,y_support,z_support]);
    
    //-x pillar
     translate ([ main_channel_translation+main_channel_x/2,-main_channel_y/2-widechan_width/2-pillar_chan_y,main_channel_z_translation])
    cube([x_support,y_support,z_support]);
    
    //pillar line
    for (i = [-1:1])  {
       translate ([main_channel_translation+main_channel_x/2+80*px,i*support_spacing,main_channel_z_translation])
        cube([x_support,y_support,z_support]);
        
        
    }
    
    
}


//module builds the pillars and spacers in the diffusion channel
module build_additions(){
    rotate([0, 0, 0]) 
    translate ([main_channel_translation, 0, main_channel_z/2 + main_channel_z_translation+Hchan-main_channel_z]) {
        
        translate([- main_channel_x/2, -main_channel_y/2 - pillar_chan_y + px, -main_channel_z/2])
        color("red")
        *pillars();//pillars
        
        translate([- main_channel_x/2, main_channel_y/2 + pillar_chan_y + 10*px - side_chan_y, -main_channel_z/2])
        color("red")
        *pillars();//pillars
        
         }
     //posts to support roof
        *support_pillars();
    
    
    
}


module pinholes (){



  ///input channels
    for(j = [-1,1]){
        
        translate([-max_x/2, pin2pin_control*j  , d_pin/2 + glass2pin+50*px])
        rotate([0,90,0])
        cylinder(d = d_pin, h = l_pin, $fn = 100);
        
        translate([-max_x/2 + l_pin,pin2pin_control*j , d_pin/2 + glass2pin+50*px])
        rotate([0,90,0])
        cylinder(d = d_pin2, h = l_pin2, $fn = 100);
        
        
        ///cell channel
         translate([-max_x/2, 0  , d_pin/2 + glass2pin+0*px])
        rotate([0,90,0])
        cylinder(d = d_pin, h = l_pin, $fn = 100);
        
        translate([-max_x/2 + l_pin,0 , d_pin/2 + glass2pin+0*px])
        rotate([0,90,0])
        cylinder(d = d_pin2, h = l_pin2, $fn = 100);
    

//main output channel
         translate([ max_x/2 -l_pin, 0 , d_pin/2 + glass2pin])
        rotate([0,90,0])
        cylinder(d = d_pin, h = l_pin, $fn = 100);
        
             translate([ max_x/2 - l_pin - l_pin2,0 , d_pin/2 + glass2pin])
        rotate([0,90,0])
        cylinder(d = d_pin2, h = l_pin2, $fn = 100);
        
        /////ctrl channels input 
        
        for(k = [-1:1]){
        translate([ctrl_chan_translation+(pin2pin_control*k) , max_y/2 -l_pin , d_pin/2 + glass2pin])
        rotate([-90,0,0])
        cylinder(d = d_pin, h = l_pin, $fn = 100);
        
             translate([ctrl_chan_translation+(pin2pin_control*k) , max_y/2 - l_pin - l_pin2 , d_pin/2 + glass2pin])
        rotate([-90,0,0])
        cylinder(d = d_pin2, h = l_pin2, $fn = 100);
        
        }

}
}

module ctrl_channels () {
    //v1
    
      pi_5 = [ctrl_chan_translation-pin2pin_control,max_y/2,main_channel_z_translation+Hchan-main_channel_z];
    pf_5 = [max_x/2,-max_y/2,pump_z+h_f_v+t_m_v+h_c_v];
    
            connect_5 = [
                       ["+yx",[-500*px,-(ctrl_chan_translation-pin2pin_control)-pump_y-dist_v2v/2 ],[1,0]],
                         ["zy", pf_5, [6,1]],
                        ];
            routing(pi_5, connect_5, dim);
            
    
    
    //DC
    
    
      pi_6 = [ctrl_chan_translation,max_y/2,main_channel_z_translation+Hchan-main_channel_z];
    pf_6 = [-pump_y,-max_y/2,pump_z+h_f_DC+t_m_DC+h_c_DC];
    
            connect_6 = [
                       ["+y",[-475*px ],[1]],
                         ["zxy", pf_6, [6,0,1]],
                        ];
            routing(pi_6, connect_6, dim);
    
    
    //v2
      pi_7 = [ctrl_chan_translation+pin2pin_control,max_y/2,main_channel_z_translation+Hchan-main_channel_z];
    pf_7 = [max_x/2,-max_y/2,pump_z+h_f_v+t_m_v+h_c_v];
    
            connect_7 = [
                       ["+yx",[-550*px,-(ctrl_chan_translation+pin2pin_control)-pump_y+dist_v2v/2 ],[1,0]],
                         ["zy", pf_7, [6,1]],
                        ];
            routing(pi_7, connect_7, dim);
    
    
    
    
    
}

module wide_channels () {
    color("rosybrown") {
    for (i=[0:1]) {
        
        mirror([0,i,0]) {
        hull() {
            translate([main_channel_translation-main_channel_x/2+widechan_start,main_channel_y/2+pillar_chan_y-2*px+Wchan,main_channel_z_translation])
            cube ([1*px,1*px, Hchan]);
            
            translate ([main_channel_translation-main_channel_x/2,widechan_width +main_channel_y/2+pillar_chan_y,main_channel_z_translation])
            cube ([1*px,1*px, Hchan]);
            
            
            translate ([main_channel_translation+main_channel_x/2+widechan_end,main_channel_y/2+pillar_chan_y-2*px+Wchan,main_channel_z_translation])
            cube ([1*px,1*px, Hchan]);
            
            
    
            
            translate ([main_channel_translation+main_channel_x/2+120*px,widechan_width +main_channel_y/2+pillar_chan_y,main_channel_z_translation])
            cube ([1*px,1*px, Hchan]);
            
            
            
            
            
        }
        }
    }
        
    }
    
    
}

//module where all features that will be subtracted are built
module build_voids() {
    
    main_chamber();
    
    pinholes();
    
    wide_channels ();
    
    pumps();
    
    ctrl_channels();
}



/////modules to create replicates of the chamber



//module to view the device while it is being coded
module build_view() {
    %bulk();
    build_voids();
    build_additions();
}

//module to subtract the voids from the bulk material
module build_all() {
    translate([max_x/2, max_y/2,0]) {
        difference() {
            
            bulk();
            build_voids();
        }
        
        build_additions();
    }
    
}

module build_pillars(){
    translate([max_x/2, max_y/2,-96*layer])
    build_additions();
    }

build_all();
