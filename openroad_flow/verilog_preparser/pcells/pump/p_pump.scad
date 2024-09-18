
use <polychannel_v2_testing.scad>
use <p_pvalve.scad>

module p_pump(xpos, ypos, zpos, orientation,
    r1=46, r2=46, r3=46,
    pn_out_len=20,
    px=7.6e-3, layer=10e-3, lpv=20, chan_h=10, chan_w=14, shape="cube", pitch=30, 
    rot=false, no_obj=false, floor_area=false)
{
    //r1 = 46; r2 = 76; r3 = 46;
    th1 = 10; th2 = 10; th3 = 10;
    len_sp = 30;
    
    r_max = max(r1, r2, r3);
    
    
    module obj() {
        // check 1      
        //translate([0,(r_max-r1)*px,0])
        translate([0,0,0])
            p_valve(0,0,0,"N",
            valve_r=r1, 
            mem_th=th1, 
            fl_chm_h=20, 
            pn_chm_h=20, 
            inport_center=false,
            pitch=0,
            pn_out_len=r_max-r1+pn_out_len);
        // pump
        translate([(r1+len_sp*2.25)*px,0,0])
            p_valve(0,0,0,"N",
            valve_r=r2, 
            mem_th=th2, 
            fl_chm_h=20, 
            pn_chm_h=20, 
            inport_center=false,
            pitch=0, 
            pn_out_len=r_max-r2+pn_out_len);
        // check 2
        translate([(r1+r2*2+len_sp*3)*px,0,0])
            p_valve(0,0,0,"N",
            valve_r=r3, 
            mem_th=th3, 
            fl_chm_h=20, 
            pn_chm_h=20, 
            inport_center=false,
            pitch=0,
            pn_out_len=r_max-r3+pn_out_len);
    }
    translate([pitch*px, pitch*px, 0])
        rotate([0,0,(rot?90:0)])
        mirror([(orientation=="FN"||orientation=="FS"?1:0),0,0])
        mirror([0,(orientation=="S"||orientation=="FS"?1:0), 0])
            obj() ;
}

p_pump(0,0,0,"N", r2=80);