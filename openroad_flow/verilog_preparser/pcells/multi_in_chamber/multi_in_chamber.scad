
use <polychannel_v2_testing.scad>

module multi_in_chamber(xpos, ypos, zpos, orientation,
    num_inputs, input_sp, chm_h, chm_l,
    chan_out_w, chan_out_h, has_nozzle=false, nozzle_l,
    px=7.6e-3, layer=10e-3, lpv=20, chan_h=10, chan_w=14, shape="cube", pitch=30, rot=false,
    no_obj=false, floor_area=false
)
{
    chm_w = (input_sp*(num_inputs-1)+chan_w)*px;
    chm_l_s1 = (has_nozzle?chm_l - nozzle_l:chm_l);
    chm_l_s2 = (has_nozzle?nozzle_l:0);
    chan_in_l  = 30*px;
    chan_out_l = 30*px;

    
    module obj(){
        translate([0,(chm_l-chm_l_s1)/2*px,0])
        cube([chm_w, 
            chm_l_s1*px, 
            chm_h*layer], center=true) ;
        translate([chm_w/2-chan_w/2*px, chm_l/2*px, 0])
            for(i = [0:num_inputs-1])
                translate([-input_sp*px*i, chan_in_l/2, 0])
                    cube([chan_w*px, chan_in_l, chan_h*layer], center=true);
        if(has_nozzle)
        {
            polychannel(
                [["cube", [chm_w, px/10, chm_h*layer], [0,-(chm_l/2-chm_l_s2)*px,0], [0,[0,0,1]]],
                ["cube", [chan_w*px, px/10, chan_h*layer],  [0,-chm_l_s2*px,0], [0,[0,0,1]]]]);
        }
        translate([0,-chm_l*px/2-chan_out_l/2, 0])
            cube([chan_w*px, chan_out_l, chan_h*layer], center=true);
    }
    
    x_off = chm_w/2;
    y_off = chan_out_l+chm_l*px/2;
    
    translate([pitch*px,pitch*px,0])
        translate([(rot?y_off:x_off),(rot?x_off:y_off),chm_h*layer/2])
            rotate([0,0,(rot?-90:0)])
            mirror([(orientation=="FN"||orientation=="FS"?1:0),0,0])
            mirror([0,(orientation=="S"||orientation=="FS"?1:0), 0])
            obj() ;
    if (floor_area)
        color("blue")
        translate([0,0,-layer/10])
            cube([(pitch*2+chm_l)*px+chan_in_l+chan_out_l,
                    (pitch*2)*px+chm_w,
                    (layer/10)]);
}

//multi_in_chamber(0,0,0,"N",3,50,10,20);
multi_in_chamber(0,0,0,"FS",4,50,10,30, has_nozzle=true, nozzle_l=10,rot=true, floor_area=true);