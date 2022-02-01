$fn = 50; //number of faces on an object

// Printing Parameters
px = 0.0076; // size of one pixel in mm
layer = 0.01; // size of one layer in mm
eps = 0.0001;
max_x = 2560 * px; //maximum value in x direction
max_y = 1600 * px; //maximum value in y direction
hchan = 10 * layer;
wchan = 14 * px;
xychan = 14 * px;
z_burn_in = 50 * layer; //number of layers in the burn in at the bottom of the device
z_bulk = 600 * layer; //change later when coded

// Well Parameters
well_x = 900 * px; //size of well in x dierection
well_y = 800 * px; //size of well in y dierection
well_z = 250 * layer; //size of well in z dierection
wall_thickness = 150 * px; //thickness of the device to the wells

// Pumps positions
pump_x = 104 * px;
pump_y = 300*px;
pump_z = 150 * layer;

// // DC parameterers
// d_DC = 40 * px;       // DC diameter
// t_m_DC = layer;     // DC membrane thickness (2 layers of 5 um in JSON FILE)
// h_f_DC = 3 * layer;   // height of the fluid chamber (DC) (2.5 layers in JSON FILE)
// h_c_DC = 6 * layer;   // height of control chamber


module centered_cube(x, y, z) {
    translate([-x / 2, -y / 2, 0]) cube([x, y, z]);
}


module xchan(l, w = wchan, h = hchan) {
    color("lightblue")
    if (l < 0)
        mirror([1, 0, 0])
    translate([0, -floor(w / px / 2) * px, 0]) cube([-l, w, h]);
    else
    translate([0, -floor(w / px / 2) * px, 0]) cube([l, w, h]);
}

module ychan(l, w = wchan, h = hchan) {
    color("lightblue")
    if (l < 0)
        mirror([0, -1, 0])
    translate([-floor(w / px / 2) * px, 0, 0]) cube([w, -l, h]);
     else
    translate([-floor(w / px / 2) * px, 0, 0]) cube([w, l, h]);
}

module zchan(l, xy = xychan) {
    color("lightblue")
    translate([-xy / 2, -xy / 2, 0]) {
        if (l < 0)
            mirror([0, 0, 1])
        cube([xy, xy, -l]);
          else
        cube([xy, xy, l]);
    }
}

module bulk() {
    translate([0, 0, z_bulk / 2]) cube([max_x, max_y, z_bulk], center = true);
}

module pinhole(d=106*layer, l=300*px, orth=0) {
    rotate([-90, 0, orth]) cylinder(d = d, h = l, $fn = 100);
    translate([0,px,-hchan/2]) ychan(-33*px);
}

module alignment(){
    x = 300 * px;
    height = 50 * layer;
    offset = 1000 * px;
    translate([0, 0, z_bulk]) {
        translate([offset, 500 * px, -height+eps]) centered_cube(x, x,height);
        translate([offset, -500 * px, -height+eps]) centered_cube(x, x,height);
        translate([-offset, 0, -height+eps]) centered_cube(x, x,height);
    }
}

module dc(
    diameter = 40 * px,     // dc diameter
    h_fluid = 5 * layer,    // height of fluid chamber
    h_air = 10 * layer,     // height of air chamber
    t_memb = 2 * layer,     // membrane thickness
    l_chan_bottom = 30*px,  // length of input/ouput fluid channels
    l_chan_top = 30*px,     // length of input/ouput air channels
    orth = 90               // rotate air chamber orth degrees relative to fluid chamber
    ) {

    // fluid chamber
    color("dodgerblue") cylinder(d = diameter, h = h_fluid, $fn = 100);

    // air chamber
    color("white") translate([0, 0, h_fluid + t_memb]) cylinder(d = diameter, h = h_air, $fn = 100);

    // fluid channels
    translate([diameter / 2 - xychan / 2, 0, layer]) zchan(l = -l_chan_bottom-layer);
    translate([-diameter / 2 + xychan / 2, 0, layer]) zchan(l = -l_chan_bottom-layer);

    // air channels
    h_total_valve = h_fluid + h_air + t_memb;
    rotate([0, 0, orth]) {
        translate([diameter / 2 - xychan / 2 - 1*px, 0, h_total_valve-5*layer]) zchan(l = l_chan_top+5*layer);
        translate([-diameter / 2 + xychan / 2 + px, 0, h_total_valve-5*layer]) zchan(l = l_chan_top+5*layer);
    }
}

module valve(
    d_valve = 40 * px,          // valve diameter
    h_fluid = 5 * layer,        // height of fluid chamber
    xy_fluid = 6 * px,          // width of vertical exit channel
    h_air = 10 * layer,          // height of air chamber
    t_memb = 2 * layer,         // membrane thickness
    l_chan_bottom = 10 * layer,   // length of input/ouput fluid channels
    l_chan_top = 10*layer,    // length of input/ouput air channels
    l_overhang = 7 * px,        // offset of outer fluid channel
    orth = 90                 // rotate air chamber orth degrees relative to fluid chamber
    ) {

    // fluid chamber
    color("dodgerblue") cylinder(d = d_valve, h = h_fluid, $fn = 100);

    // air chamber
    color("white") translate([0, 0, h_fluid + t_memb]) cylinder(d = d_valve, h = h_air, $fn = 100);

    // inner fluid channel
    zchan(l = -l_chan_bottom - layer, xy = xy_fluid);

    // outer fluid channel
    translate([d_valve / 2 - l_overhang, 0, -hchan+layer]) xchan(l = l_chan_top);

    // air channels
    h_total_valve = h_fluid + h_air + t_memb;
    rotate([0, 0, orth]) {
        translate([d_valve / 2 - 8*px, 0, h_total_valve - 3*layer]) zchan(l = l_chan_top+3*layer);
        translate([-d_valve / 2 + 8*px, 0, h_total_valve - 3*layer]) zchan(l = l_chan_top+3*layer);
    }
}

module pump() {
    translate([0,-50*px,14*layer]) {
        rotate([0,0,-90]) valve(l_chan_bottom=5*layer);
        translate([0,50*px,-0*layer]) rotate([0,0,90]) dc(l_chan_bottom=11*layer, l_chan_top=hchan);
        translate([0,100*px,0]) rotate([0,0,90]) valve(l_chan_bottom=5*layer);
        translate([0,-3*px,-14*layer]) ychan(47*px);
        translate([0,56*px,-14*layer]) ychan(47*px);
    }
}

module pillar_array(num_x = 10, num_y = 10, xy = 1*px, gap = 3*px, z = 5*layer){
    half_width = (num_x*xy + (num_x + 1)*gap) / 2;

    translate([-half_width, -half_width, 0])
    for (i = [1: num_x]) {
        for (j = [1: num_y]) {
            // centered_cube(xy, xy, z);
            translate([i*(gap + xy), j*(gap + xy), 0]) zchan(l = z, xy = xy);
        }
    }
}

module porous_membrane(
    n = 10,                   // number of pores in x and y direction
    d = 40*px,                // diameter of membrane
    pore_xy = 1*px,           // size of pores
    gap = 3*px,               // gap between adjacent pores
    t_memb = layer            // membrane thickness
){

    color("green") intersection(){
        translate([0, 0, -eps]) cylinder(r = d / 2, h = t_memb + 2*eps, $fn = 50);
        translate([0, 0, -eps]) pillar_array(num_x = n, num_y = n, gap = 3*px, z = t_memb + 2*eps);
    }
}

module porous_valve(
    d_valve = 40*px,              // valve diameter
    h_top = 10*layer,              // height of open top chamber
    h_bottom = 5*layer,           // height of bottom support chamber
    t_memb = layer,               // membrane thickness
    chan_xy = xychan,             // width of entrance and exit channels
    l_chan_top = 5*layer,        // length of input/ouput air channels
    l_chan_bottom = 0*layer,     // length of input/ouput fluid channels
    bottom_chan_offset = 2*px,    // distance to offset bottom channels (to not hit pillars, towards outside of chamber)
    orth = 0                      // rotate top chamber orth degrees relative to bottom chamber
){

    // top channels
    h_total_valve = h_bottom + h_top + t_memb;
    rotate([0,0,orth]) {
        translate([d_valve/2, 0, h_total_valve-layer]) zchan(l=l_chan_top+layer, xy=chan_xy);
        translate([-d_valve/2, 0, h_total_valve-layer]) zchan(l=l_chan_top+layer, xy=chan_xy);
    }

    // top chamber
    color("white") translate([0, 0, h_bottom+t_memb]) cylinder(d=d_valve, h=h_top, $fn=100);

    // membrane
    translate([0, 0, h_bottom]) porous_membrane(t_memb = t_memb);

    // bottom chamber
    difference(){
        color("dodgerblue") cylinder(d = d_valve, h = h_bottom, $fn = 100);
        color("red") translate([-px, -px, -eps]) pillar_array(num_x = 4, num_y = 4, xy = 3*px, gap = 5*px, z = h_bottom + 2*eps);
    }

    // bottom channels
    // translate([-d_valve/2+chan_xy/2,0,-layer]) xchan(l=-50*px, w=chan_xy, h=h_bottom);
    // translate([d_valve/2-chan_xy/2,0,-layer]) xchan(l=50*px, w=chan_xy, h=h_bottom);
    translate([-d_valve / 2, 0, layer]) zchan(l = -l_chan_bottom - layer, xy = chan_xy);
    translate([d_valve / 2, 0, layer]) zchan(l = -l_chan_bottom - layer, xy = chan_xy);
}


module well() {
    r_edge = 30 * px; //radius of the rounded edge
    roof_angle = 40; //angle at which the roof will be built over the well. Measured relative to the xy plane
    d_opening = 160 * px; //diameter of the opening on top of the well
    z_slant = 10 * layer; //number of layers the bottom of the well will slant
    variable_a = min(well_x / 2 - d_opening / 2, well_y / 2 - d_opening / 2); //filler variable to calculate height of the roof
    h_roof = round(variable_a * tan(roof_angle) / layer) * layer; //calculate the height of the roof
    approx_well_volume = (well_x * well_y * well_z) + (0.5 * z_slant * well_x * well_y) + (well_x * well_y * h_roof / 3); //calculate an estimate of well volume
    // echo(approx_well_volume); //read out the volume estimate
    // echo(h_roof);

    $fn = 100;
    port_tilt = 120;
    well_height_adjust = -120 * layer;

    //matrix determines translation of cylinders to make main bulk.
    matrix = [[-well_x / 2 + r_edge, -well_y / 2 + r_edge, z_slant], [well_x / 2 - r_edge, -well_y / 2 + r_edge, z_slant], [-well_x / 2 + r_edge, well_y / 2 - r_edge, z_slant], [well_x / 2 - r_edge, well_y / 2 - r_edge, z_slant]];
    hull() {

        //main bulk of the cube (hulls together 8 cylinders)
        translate([0, 0, r_edge]) for (i = [0: len(matrix) - 1]) translate(matrix[i]) sphere(r = r_edge);

        //main bulk of the cube
        translate([0, 0, well_z - r_edge]) for (i = [0: len(matrix) - 1]) translate(matrix[i]) sphere(r = r_edge);

        //make slant at the bottom of the well
        translate([well_x / 2 - px, well_y / 2, 0]) cube([px, 14 * px, z_slant], center = false);

        //make the roof of the well
        // translate([-well_x / 2 - 150 * px, 0, z_slant + well_z + h_roof + well_height_adjust]) rotate([0, 90, 00]) cylinder(layer, d = d_opening); // flat to face, high
        // translate([-well_x/2+60*px, 0, z_slant + well_z + h_roof + well_height_adjust]) rotate([0, port_tilt, 00]) cylinder(layer, d = d_opening); // angled to face, high
        translate([-well_x / 2 - 100 * px, 0, z_slant + well_z + h_roof + well_height_adjust]) rotate([0, 90, 00]) cylinder(500*px, d = d_opening); // flat to face, high
        translate([well_x / 2 - 537*px, 0, z_slant + well_z + h_roof + well_height_adjust]) rotate([0, 90, 00]) sphere(r = d_opening/2); // flat to face, high
    }
    translate([-well_x / 2 - 151 * px, 0, z_slant + well_z + h_roof + well_height_adjust]) rotate([0, 90, 00]) cylinder(300*px, d = d_opening); // flat to face, high
    translate([-well_x / 2 - 151 * px, 0, z_slant + well_z + h_roof + well_height_adjust-92*px]) xchan(300*px); // flat to face, high
}

module pressure_relief() {
    // translate([max_x - wall_thickness - r_edge, -well_y + 55 * px, z_burn_in + z_slant + 36 * layer])
    // translate([max_x/2, max_y/4]) cube([wall_thickness + r_edge, 200 * px, 152 * layer]);
    len = wall_thickness + 30*px;
    z = z_burn_in + 26 * layer;
    translate([max_x/2-len+eps, -350*px, z]) cube([len, 200 * px, 152 * layer]);
    translate([-max_x/2-eps, -350*px, z]) cube([len, 200 * px, 152 * layer]);

    // mirror([1, 0, 0])
    // translate([max_x / 2 - wall_thickness - r_edge, -well_y / 2 + 55 * px, z_burn_in + z_slant + 36 * layer])
    // cube([wall_thickness + r_edge, 200 * px, 152 * layer]);
}

module interface_connections(){
    z_len = 30*layer;

    // top membrane connections
    translate([1088*px,190*px,z_bulk-20*layer+eps]) zchan(l=-z_len);
    translate([1048*px,190*px,z_bulk-20*layer+eps]) zchan(l=-z_len);
    translate([1048*px,190*px,z_bulk-30*layer]) ychan(l=-57*px);
    translate([1088*px,190*px,z_bulk-30*layer]) ychan(l=-57*px);

    // bottom membrane connections
    translate([1068*px,140*px,z_bulk-50*layer+eps]) porous_valve();
    // translate([1068*px,140*px,z_bulk-5*layer+eps]) cylinder(r=22*px, h=5*layer);
    // translate([1088*px,140*px,z_bulk-z_len-3*layer]) zchan(l=z_len);
    // translate([1048*px,140*px,z_bulk-z_len-3*layer]) zchan(l=z_len);
}

module pump_connections() {
    well_leg_1 = 132*px;
    well_leg_2 = 74*px;
    well_leg_3 = pump_z-35*layer;

    pump_zz = pump_z+hchan/2;
    mem_chan_z = pump_zz+100*layer;
    mem_chan_z2 = mem_chan_z + 150*layer;

    // from well leg 1
    translate([-235*px,157*px,z_burn_in]) xchan(well_leg_1);
    translate([235*px,157*px,z_burn_in]) xchan(-well_leg_1);

    // leg 2
    translate([229*px-well_leg_1+xychan/2,157*px,z_burn_in+well_leg_3-hchan]) ychan(well_leg_2);
    translate([-229*px+well_leg_1-xychan/2,157*px,z_burn_in+well_leg_3-hchan]) ychan(well_leg_2);

    // leg 3
    translate([-229*px+well_leg_1-xychan/2,157*px,z_burn_in]) zchan(well_leg_3);
    translate([229*px-well_leg_1+xychan/2,157*px,z_burn_in]) zchan(well_leg_3);

    // pump outputs
    translate([pump_x, pump_y+71*px, pump_zz]) ychan(10*px);
    translate([pump_x-wchan/2, pump_y+87*px, pump_zz]) xchan(310*px);

    translate([-pump_x, pump_y+71*px, pump_zz]) ychan(62*px);
    translate([-pump_x, pump_y+126*px, pump_zz]) xchan(999*px);
}

module pneumatic_connections(){
    z1 = pump_z + 31*layer;
    z2 = 95*layer;
    z_diff = z1 - z2;

    // valve 1
    l1 = 150*px;
    r1 = -700*px;
    translate([pump_x+l1,pump_y-55*px,z1]) ychan(556*px);
    // translate([pump_x+l1,pump_y-50*px,z2]) zchan(z_diff);
    translate([pump_x+5*px,pump_y-50*px,z1]) xchan(l1+2*px);
    translate([pump_x-203*px,pump_y-50*px,z1]) xchan(198*px);
    translate([pump_x-213*px,pump_y-50*px,z1]) xchan(r1+206*px);
    // translate([pump_x+r1,pump_y+141*px-191*px,100*layer]) zchan(z_diff);
    translate([pump_x+r1,pump_y+170*px,z1]) ychan(-227*px);

    // DC
    l2 = 100*px;
    r2 = -500*px;
    translate([pump_x+l2,pump_y+0*px,z1]) ychan(501*px);
    // translate([pump_x+l2,pump_y+0*px,z2]) zchan(z_diff);
    translate([pump_x+5*px,pump_y,z1]) xchan(l2+2*px);
    translate([pump_x-203*px,pump_y,z1]) xchan(198*px);
    translate([pump_x-213*px,pump_y,z1]) xchan(r2+206*px);
    // translate([pump_x+r2,pump_y+141*px-141*px,z2]) zchan(z_diff);
    translate([pump_x+r2,pump_y+170*px,z1]) ychan(-177*px);

    // valve 2
    l3 = 50*px;
    r3 = -300*px;
    translate([pump_x+l3,pump_y+50*px,z1]) ychan(451*px);
    // translate([pump_x+l3,pump_y+50*px,z2]) zchan(z_diff);
    translate([pump_x+5*px,pump_y+50*px,z1]) xchan(l3+2*px);
    translate([pump_x-203*px,pump_y+50*px,z1]) xchan(198*px);
    translate([pump_x-213*px,pump_y+50*px,z1]) xchan(r3+206*px);
    // translate([pump_x+r3,pump_y+141*px-91*px,z2]) zchan(z_diff);
    translate([pump_x+r3,pump_y+170*px,z1]) ychan(-127*px);
}

module membrane_chip_connections() {
    z1 = pump_z + 31*layer;

    translate([1048*px,190*px,550*layer]) zchan(-100*layer);
    translate([1048*px,190*px,450*layer]) xchan(-650*px);
    translate([400*px,183*px,450*layer]) ychan(211*px);
    translate([400*px,387*px,450*layer]) zchan(-295*layer);
    translate([400*px,387*px,z1]) ychan(100*px);

    translate([1088*px,190*px,550*layer]) zchan(-100*layer);
    translate([1088*px,190*px,450*layer]) ychan(204*px);
    translate([1088*px,387*px,450*layer]) xchan(-495*px);
    translate([600*px,387*px,450*layer]) zchan(-269*layer);
    translate([600*px,387*px,z1]) ychan(100*px);
}

module membrane_chamber_connections() {
    z1 = pump_z + 31*layer;

    translate([1048*px,140*px,550*layer]) zchan(l=-200*layer);
    translate([1048*px,140*px,350*layer]) xchan(l=-167*px);
    translate([1048*px-160*px,140*px,350*layer]) ychan(l=293*px);
    translate([1048*px-160*px,426*px,350*layer]) zchan(l=-195*layer);
    translate([1048*px-160*px,420*px,z1]) ychan(l=60*px);

    translate([1088*px,140*px,550*layer]) zchan(l=-200*layer);
    translate([1088*px,140*px,350*layer]) ychan(l=293*px);
    translate([1088*px,426*px,350*layer]) zchan(l=-169*layer);
    translate([1088*px,426*px,z1]) ychan(l=60*px);
}

module build_pinholes() {
    spacing = 200*px;
    z = pump_z-64*layer;
    translate([0,max_y/2-299*px,100*layer]){
        color("green") for (j = [0: 1]) translate([-spacing*j+1088*px, 0,z]) pinhole();
        color("blue") for (j = [0: 1]) translate([-spacing*j+600*px, 0,z]) pinhole();
        color("pink") for (j = [0: 2]) translate([-spacing*j-196*px, 0,z]) pinhole();
    }
}

module build_wells() {
    x = -max_x / 2 + wall_thickness + well_x / 2;
    y = -max_y / 2 + wall_thickness + well_y / 2;
    translate([x, y, z_burn_in]) well();
    mirror([1, 0, 0]) translate([x, y, z_burn_in]) well();
}

module new_pinholes() {
    translate([0,0,100*layer]){
        translate([-100*px, -max_y / 2+351*px,0]) rotate([180,0,0]) pinhole();
        translate([100*px, -max_y / 2+351*px,0]) rotate([180,0,0]) pinhole();
        translate([0, -max_y / 2+351*px,130*layer]) rotate([180,0,0]) pinhole();
    }

}

module build_voids() {
    build_wells();
    for (i = [0: 1]) mirror([i, 0, 0]) translate([pump_x, pump_y, pump_z]) pump();
    build_pinholes();
    // alignment();
    color("yellow") interface_connections();
    color("purple") pump_connections();
    color("pink") pneumatic_connections();
    color("blue") membrane_chip_connections();
    color("green") membrane_chamber_connections();
    pressure_relief();
    // color("red") new_pinholes();
}

//module to view the device while it is being coded
module build_view() {
    translate([max_x/2, max_y/2, 0]){
        %bulk();
        build_voids();
    }
}

//module to subtract the voids from the bulk material
module build_all() {
    translate([max_x/2, max_y/2, 0]) difference() {
        bulk();
        build_voids();
    }
}

build_view();
// build_all();


// color("red") rotate([0, 180, 0]) translate([-max_x, 0, -720 * layer])   import("membrane_device.stl", convexity = 3);

// color("mistyrose") translate([max_x / 2, -max_y / 2, z_bulk+58*layer]) rotate([0, 180, 0]) import("membrane.stl", convexity = 3);
// color("azure") cube([30, 30, 100 * layer], center = true); // bottom glass
// color("azure") translate([0, 0, z_bulk + 150 * layer]) cube([22, 15, 100 * layer], center = true); // top glass
