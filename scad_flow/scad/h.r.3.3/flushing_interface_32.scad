// ^^^ routing and px/layer defines are added at runtime ^^^ //

// Parameters
// max size of the object: 19.45mm x 12.16mm x 11cm (x x y)

$fa = 1;
$fs = 0.04;

// Bulk size
bulk_x = 2500 * px; // 19mm
bulk_y = 1579 * px; // 12mm
bulk_z = 500 * layer; // 5mm

gasket_side_length = 50*px;
gasket_aperture_length = 20*px;
gasket_height = 1*layer;

gasket_grid = [2, 2];
block_gasket_offset = 150*px;
block_height = 200*layer;
block_long_side = 600*px;
block_short_side = 400*px;
gasket_offset = 40*px;

channel_width_thick = 20 * px;
channel_height_thick = 15 * layer;
channel_width_default = 12*px;
channel_height_default = 10*layer;

marker_height = 80*layer;
marker_diameter = 200*px;

module xchan(l, w = channel_width_default, h = channel_height_default) {
    color("lightblue")
    if (l < 0)
        mirror([1, 0, 0])
    translate([0, -floor(w / px / 2) * px, 0]) cube([-l, w, h]);
    else
    translate([0, -floor(w / px / 2) * px, 0]) cube([l, w, h]);
}

module ychan(l, w = channel_width_default, h = channel_height_default) {
    color("lightblue")
    if (l < 0)
        mirror([0, -1, 0])
    translate([-floor(w / px / 2) * px, 0, 0]) cube([w, -l, h]);
    else
    translate([-floor(w / px / 2) * px, 0, 0]) cube([w, l, h]);
}

module zchan(l, xy = channel_width_default) {
    color("lightblue")
    translate([-xy / 2, -xy / 2, 0]) {
        if (l < 0)
            mirror([0, 0, 1])
        cube([xy, xy, -l]);
        else
        cube([xy, xy, l]);
    }
}

module pinhole(d=106*layer, l=200*px, orth=0, ychan_z_angle=0) {
    // This module operates on a standard of 10um layers and 7.6 um pixels
    rotate([-90, 0, orth]){
        union(){
            cylinder(d = d, h = l, $fn = 100);
            translate([0, 0, l])
                cylinder(h=150*px, r1=d/4, r2=2*layer, $fn = 100);
        }
    }
}

module gasket(
    gasket_side_length=gasket_side_length, 
    aperture_side_length=gasket_aperture_length, 
    height=gasket_height
    ){

        gasket_width = (gasket_side_length - aperture_side_length)/2;
        difference(){
            cube([gasket_side_length, gasket_side_length, height]);
            translate([gasket_width, gasket_width, 0])
                cube([aperture_side_length, aperture_side_length, height]);
    }
}

module interconnect(
    gasket_grid=gasket_grid,
    gasket_side_length=gasket_side_length, 
    aperture_side_length=gasket_aperture_length, 
    gasket_height=gasket_height,
    gasket_offset = gasket_offset,
    block_gasket_offset=block_gasket_offset,
    block_height=block_height,
    block_long_side=block_long_side,
    block_short_side=block_short_side,
    ccim=false, // Flag to use the CCIM type of microgasket (SIM is the default)
    for_interface_chip=false // Interface chips are printed upside down for the burning layers to not clog entrance channels, also the gasket grid is displayed transparent
    ){
    gasket_group_x_lenght = gasket_grid[1] * gasket_side_length + (gasket_grid[1]-1) * gasket_offset;
    gasket_group_y_lenght = gasket_grid[0] * gasket_side_length + (gasket_grid[0]-1) * gasket_offset;
    x_centering_offset = gasket_group_x_lenght/2;
    y_centering_offset = gasket_group_y_lenght/2;
    if (ccim){
        cube([1, 1, 1]); // This section should implement an interconnect structure that uses SSIMs instead of SIMs (see 2018 paper for reference)
    }
    else {
        flip_angle = for_interface_chip ? 180:0;
        diff_interface_blocks = for_interface_chip ? 0:50*layer;
        rotate([flip_angle, 0, 0]){
            // Gasket grid
            translate([-x_centering_offset, -y_centering_offset, 0]){
                for (row=[0:gasket_grid[1]-1]){
                    for (col=[0:gasket_grid[0]-1]){
                        translate([(gasket_side_length + gasket_offset)*row, (gasket_side_length + gasket_offset)*col, 0])
                        if (for_interface_chip){
                            %gasket(gasket_side_length=gasket_side_length, aperture_side_length=aperture_side_length, height=gasket_height);
                        }
                        else {
                            gasket(gasket_side_length=gasket_side_length, aperture_side_length=aperture_side_length, height=gasket_height);
                        }
                    }
                }
            }
            // Right block
            translate([x_centering_offset + block_gasket_offset, -block_long_side/2, -block_height/3])
                cube([block_short_side, block_long_side, block_height - diff_interface_blocks]);
            // Left block
            translate([-x_centering_offset - block_gasket_offset - block_short_side, -block_long_side/2, -block_height/3])
                cube([block_short_side, block_long_side, block_height - diff_interface_blocks]);
        }
    }
}

module corner_connections(){
    // ========================== ROW 1 ==========================
    {
        // (1, 1) Path
        {
            1_1_x_offset_pinhole = 1*bulk_x/7;
            1_1_y_offset_pinhole = bulk_y;
            1_1_z_offset_pinhole = 1*bulk_z/3;   
            translate([1_1_x_offset_pinhole, 1_1_y_offset_pinhole, 1_1_z_offset_pinhole])
                pinhole(orth=180);
            translate([1_1_x_offset_pinhole, 1_1_y_offset_pinhole, 1_1_z_offset_pinhole - channel_height_thick/2])
                ychan(-470*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_1_x_offset_pinhole - channel_width_thick/2, 1_1_y_offset_pinhole - 470*px, 1_1_z_offset_pinhole - channel_height_thick/2])
                xchan(628*px-71*px+35*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_1_x_offset_pinhole - channel_width_thick/2 + 619*px - 71*px + 35*px, 1_1_y_offset_pinhole - 470*px + channel_width_thick/2, 1_1_z_offset_pinhole - channel_height_thick/2])
                ychan(-215*px+15*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1_1_x_offset_pinhole - channel_width_thick/2 + 619*px - 71*px + 35*px, 1_1_y_offset_pinhole - 340*px + channel_width_thick/2 - 335*px + 15*px, 1_1_z_offset_pinhole - channel_height_thick/2])
                    zchan(250*layer, xy=channel_width_thick);
                translate([1_1_x_offset_pinhole - channel_width_thick/2 + 624*px -71*px + 35*px, 1_1_y_offset_pinhole - 345*px + channel_width_thick/2 - 335*px + 15*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (1, 2) Path
        {
            1_2_x_offset_pinhole = 1*bulk_x/7;
            1_2_y_offset_pinhole = bulk_y;
            1_2_z_offset_pinhole = 2*bulk_z/3;   
            translate([1_2_x_offset_pinhole, 1_2_y_offset_pinhole, 1_2_z_offset_pinhole])
                pinhole(orth=180);
            translate([1_2_x_offset_pinhole, 1_2_y_offset_pinhole, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-470*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_2_x_offset_pinhole - channel_width_thick/2, 1_2_y_offset_pinhole - 470*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                xchan(700*px-51*px+22*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_2_x_offset_pinhole - channel_width_thick/2 + 700*px - 51*px + 22*px, 1_2_y_offset_pinhole - 470*px + channel_width_thick/2, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-215*px+15*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1_2_x_offset_pinhole - channel_width_thick/2 + 700*px -51*px + 22*px, 1_2_y_offset_pinhole - 340*px + channel_width_thick/2 - 335*px + 15*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                    zchan(83*layer, xy=channel_width_thick);
                translate([1_2_x_offset_pinhole - channel_width_thick/2 + 705*px - 51*px + 22*px, 1_2_y_offset_pinhole - 345*px + channel_width_thick/2 - 335*px + 15*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (1, 3) Path
        {
            1_3_x_offset_pinhole = 2*bulk_x/7;
            1_3_y_offset_pinhole = bulk_y;
            1_3_z_offset_pinhole = 2*bulk_z/3;   
            translate([1_3_x_offset_pinhole, 1_3_y_offset_pinhole, 1_3_z_offset_pinhole])
                pinhole(orth=180);
            translate([1_3_x_offset_pinhole, 1_3_y_offset_pinhole, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-410*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_3_x_offset_pinhole - channel_width_thick/2, 1_3_y_offset_pinhole - 410*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                xchan(430*px-31*px+11*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_3_x_offset_pinhole - channel_width_thick/2 + 422*px - 31*px + 11*px, 1_3_y_offset_pinhole - 410*px + channel_width_thick/2, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-275*px+15*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1_3_x_offset_pinhole - channel_width_thick/2 + 422*px - 31*px + 11*px, 1_3_y_offset_pinhole - 340*px + channel_width_thick/2 - 335*px + 15*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                    zchan(83*layer, xy=channel_width_thick);
                translate([1_3_x_offset_pinhole - channel_width_thick/2 + 427*px - 31*px + 11*px, 1_3_y_offset_pinhole - 345*px + channel_width_thick/2 - 335*px + 15*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (1, 4) Path
        {
            1_4_x_offset_pinhole = 3*bulk_x/7;
            1_4_y_offset_pinhole = bulk_y;
            1_4_z_offset_pinhole = 2*bulk_z/3;   
            translate([1_4_x_offset_pinhole, 1_4_y_offset_pinhole, 1_4_z_offset_pinhole])
                pinhole(orth=180);
            translate([1_4_x_offset_pinhole, 1_4_y_offset_pinhole, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-350*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_4_x_offset_pinhole - channel_width_thick/2, 1_4_y_offset_pinhole - 350*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                xchan(150*px-11*px+1*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_4_x_offset_pinhole - channel_width_thick/2 + 145*px - 11*px + 1*px, 1_4_y_offset_pinhole - 350*px + channel_width_thick/2, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-335*px+15*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1_4_x_offset_pinhole - channel_width_thick/2 + 145*px - 11*px + 1*px, 1_4_y_offset_pinhole - 340*px + channel_width_thick/2 - 335*px + 15*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                    zchan(83*layer, xy=channel_width_thick);
                translate([1_4_x_offset_pinhole - channel_width_thick/2 + 150*px - 11*px + 1*px, 1_4_y_offset_pinhole - 345*px + channel_width_thick/2 - 335*px + 15*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }
    }

    // ========================== ROW 2 ==========================
    {
        // (2, 1) Path -> side pinhole top
        {
            2_1_x_offset_pinhole = 0;
            2_1_y_offset_pinhole = 5*bulk_y/8;
            2_1_z_offset_pinhole = 2*bulk_z/3;   
            translate([2_1_x_offset_pinhole, 2_1_y_offset_pinhole, 2_1_z_offset_pinhole])
                pinhole(orth=-90);
            translate([2_1_x_offset_pinhole, 2_1_y_offset_pinhole, 2_1_z_offset_pinhole - channel_height_thick/2])
                xchan(500*px, w=channel_width_thick, h=channel_height_thick);
            translate([500*px, 2_1_y_offset_pinhole + channel_height_thick/2, 2_1_z_offset_pinhole - channel_height_thick/2])
                ychan(-160*px+10*px, w=channel_width_thick, h=channel_height_thick);
            translate([500*px - channel_height_thick/2, 2_1_y_offset_pinhole + channel_height_thick/2 - 163*px + 10*px -5*px, 2_1_z_offset_pinhole - channel_height_thick/2])
                xchan(485*px-71*px+35*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([976*px - channel_height_thick/2 - 71*px + 35*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 163*px + 10*px - 5*px, 2_1_z_offset_pinhole - channel_height_thick/2])
                    zchan(83*layer, xy=channel_width_thick);
                translate([981*px - channel_height_thick/2 - 71*px + 35*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 168*px + 10*px - 5*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (2, 2) Path -> side pinhole bottom
        {
            2_2_x_offset_pinhole = 0;
            2_2_y_offset_pinhole = 5*bulk_y/8;
            2_2_z_offset_pinhole = 1*bulk_z/3;   
            translate([2_2_x_offset_pinhole, 2_2_y_offset_pinhole, 2_2_z_offset_pinhole])
                pinhole(orth=-90);
            translate([2_1_x_offset_pinhole, 2_1_y_offset_pinhole, 2_2_z_offset_pinhole - channel_height_thick/2])
                xchan(500*px, w=channel_width_thick, h=channel_height_thick);
            translate([500*px, 2_1_y_offset_pinhole + channel_height_thick/2, 2_2_z_offset_pinhole - channel_height_thick/2])
                ychan(-160*px+10*px, w=channel_width_thick, h=channel_height_thick);
            translate([500*px - channel_height_thick/2, 2_1_y_offset_pinhole + channel_height_thick/2 - 163*px + 10*px - 5*px, 2_2_z_offset_pinhole - channel_height_thick/2])
                xchan(550*px-51*px + 22*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1056*px - channel_height_thick/2 - 51*px + 22*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 163*px + 10*px - 5*px, 2_2_z_offset_pinhole - channel_height_thick/2])
                    zchan(250*layer, xy=channel_width_thick);
                translate([1061*px - channel_height_thick/2 - 51*px + 22*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 168*px + 10*px - 5*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (2, 3) Path
        {
            2_3_x_offset_pinhole = 2*bulk_x/7;
            2_3_y_offset_pinhole = bulk_y;
            2_3_z_offset_pinhole = 1*bulk_z/3;   
            translate([2_3_x_offset_pinhole, 2_3_y_offset_pinhole, 2_3_z_offset_pinhole])
                pinhole(orth=180);
            translate([2_3_x_offset_pinhole, 2_3_y_offset_pinhole, 2_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-410*px, w=channel_width_thick, h=channel_height_thick);
            translate([2_3_x_offset_pinhole - channel_width_thick/2, 2_3_y_offset_pinhole - 410*px, 2_4_z_offset_pinhole - channel_height_thick/2])
                xchan(430*px-31*px+11*px, w=channel_width_thick, h=channel_height_thick);
            translate([2_3_x_offset_pinhole - channel_width_thick/2 + 422*px - 31*px +11*px, 2_3_y_offset_pinhole - 410*px + channel_width_thick/2, 2_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-355*px + 10*px - 5*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([2_3_x_offset_pinhole - channel_width_thick/2 + 422*px -31*px +11*px, 2_3_y_offset_pinhole - 420*px + channel_width_thick/2 - 335*px + 10*px - 5*px, 2_4_z_offset_pinhole - channel_height_thick/2])
                    zchan(250*layer, xy=channel_width_thick);
                translate([2_3_x_offset_pinhole - channel_width_thick/2 + 427*px -31*px+11*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 168*px + 10*px - 5*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (2, 4) Path
        {
            2_4_x_offset_pinhole = 3*bulk_x/7;
            2_4_y_offset_pinhole = bulk_y;
            2_4_z_offset_pinhole = 1*bulk_z/3;   
            translate([2_4_x_offset_pinhole, 2_4_y_offset_pinhole, 2_4_z_offset_pinhole])
                pinhole(orth=180);
            translate([1_4_x_offset_pinhole, 1_4_y_offset_pinhole, 2_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-350*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_4_x_offset_pinhole - channel_width_thick/2, 1_4_y_offset_pinhole - 350*px, 2_4_z_offset_pinhole - channel_height_thick/2])
                xchan(150*px-11*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_4_x_offset_pinhole - channel_width_thick/2 + 145*px - 11*px + 1*px, 1_4_y_offset_pinhole - 350*px + channel_width_thick/2, 2_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-415*px + 10*px-5*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1_4_x_offset_pinhole - channel_width_thick/2 + 145*px - 11*px + 1*px, 1_4_y_offset_pinhole - 420*px + channel_width_thick/2 - 335*px + 10*px -5*px, 2_4_z_offset_pinhole - channel_height_thick/2])
                    zchan(250*layer, xy=channel_width_thick);
                translate([1_4_x_offset_pinhole - channel_width_thick/2 + 150*px - 11*px + 1*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 168*px + 10*px - 5*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }
    } 

}

module flushing_interface(transparent=true) {
    if (transparent){
        // Bulk
        %cube([bulk_x, bulk_y, bulk_z]);

        // Interconnects
        translate([bulk_x/2, bulk_y/2, bulk_z])
            interconnect(gasket_grid=[4,8], for_interface_chip=true);

        // ======> Connection nomenclature: (row, column) <====== // (1,1) == top left, (4,8) == bottom right

        // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ TOP HALF +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        {
            // @@@@@@@@@@@@@@@ TOP LEFT QUARTER @@@@@@@@@@@@@@@
            corner_connections();
            
            // @@@@@@@@@@@@@@@ TOP RIGHT QUARTER @@@@@@@@@@@@@@@
            translate([bulk_x, 0, 0]){
                mirror([bulk_x/2, 0, 0]){
                    corner_connections();
                }
            }
        }

        // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ BOTTOM HALF ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        {
            translate([0, bulk_y, 0]){
                mirror([0, bulk_y/2, 0]){
                    // @@@@@@@@@@@@@@@ BOTTOM LEFT QUARTER @@@@@@@@@@@@@@@
                    corner_connections();
                    
                    // @@@@@@@@@@@@@@@ BOTTOM RIGHT QUARTER @@@@@@@@@@@@@@@
                    translate([bulk_x, 0, 0]){
                        mirror([bulk_x/2, 0, 0]){
                            corner_connections();
                        }
                    }
                }
            }
        }
    }
    else {
        difference(){
            cube([bulk_x, bulk_y, bulk_z]);
            
            translate([marker_diameter, bulk_y-marker_diameter, bulk_z-marker_height])
            cylinder(h = marker_height, d = marker_diameter);

            // Interconnects
            translate([bulk_x/2, bulk_y/2, bulk_z])
                interconnect(gasket_grid=[4,8], for_interface_chip=true);

            // ======> Connection nomenclature: (row, column) <====== // (1,1) == top left, (4,8) == bottom right
            
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ TOP HALF +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            {
                // @@@@@@@@@@@@@@@ TOP LEFT QUARTER @@@@@@@@@@@@@@@
                corner_connections();
                
                // @@@@@@@@@@@@@@@ TOP RIGHT QUARTER @@@@@@@@@@@@@@@
                translate([bulk_x, 0, 0]){
                    mirror([bulk_x/2, 0, 0]){
                        corner_connections();
                    }
                }
            }

            // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ BOTTOM HALF ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            {
                translate([0, bulk_y, 0]){
                    mirror([0, bulk_y/2, 0]){
                        // @@@@@@@@@@@@@@@ BOTTOM LEFT QUARTER @@@@@@@@@@@@@@@
                        corner_connections();
                        
                        // @@@@@@@@@@@@@@@ BOTTOM RIGHT QUARTER @@@@@@@@@@@@@@@
                        translate([bulk_x, 0, 0]){
                            mirror([bulk_x/2, 0, 0]){
                                corner_connections();
                            }
                        }
                    }
                }
            }
        }
    }
}

flushing_interface(false);