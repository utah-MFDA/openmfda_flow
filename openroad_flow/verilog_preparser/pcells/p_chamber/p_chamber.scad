
use <polychannel_v2_testing.scad>

module p_chamber(xpos, ypos, zpos, orientation,
    chm_r, chm_h, chm_len=0,
    conn_ch_w=14, conn_ch_h=10, conn_ch_l=20, 
    px=7.6e-3, layer=10e-3, lpv=20, chan_h=10, chan_w=14, shape="cube", pitch=30, 
    rot=false, offset_layers=10, no_obj=false, floor_area=false)
    {
        
        module obj(){
        $fn=30;
        c_px_len = chm_len*px;
        c_px_r   = chm_r*px;
        c_lay_h  = chm_h*layer;
        
        real_conn_h = (conn_ch_h>chm_h?chm_h:conn_ch_h);
        
        if(chm_len > 2*chm_r)
        {
            
            translate([c_px_len/2-c_px_r, 0, 0])
                cylinder(c_lay_h, r=c_px_r, center= true) ;
            translate([-c_px_len/2+c_px_r, 0, 0])
                cylinder(c_lay_h, r=c_px_r, center= true) ;
            cube([c_px_len-c_px_r*2, c_px_r*2, c_lay_h], center= true) ;
        }
        else{
            cylinder(chm_h*px, r=chm_r*px, center= true) ;
        }
        translate([-c_px_len/2-conn_ch_l*px/2+c_px_r/2, 0, 0])
            cube([conn_ch_l*px+c_px_r, conn_ch_w*px, real_conn_h*layer], center=true);
        translate([c_px_len/2+conn_ch_l*px/2-c_px_r/2, 0, 0])
            cube([conn_ch_l*px+c_px_r, conn_ch_w*px, real_conn_h*layer], center=true);
        
        }
        
        x_off = chm_len/2*px+conn_ch_l*px ;
        y_off = chm_r*px ;
        
        translate([pitch*px, pitch*px, offset_layers*layer])
        translate([(rot?y_off:x_off), (rot?x_off:y_off), chm_h/2*layer])
        rotate([0,0,(rot?90:0)])
            mirror([(orientation=="FN"||orientation=="FS"?1:0),0,0])
            mirror([0,(orientation=="S"||orientation=="FS"?1:0), 0])
            obj();
        
    }
    
    
p_chamber(0,0,0,"S", 100, 10, chm_len=800, rot=false);