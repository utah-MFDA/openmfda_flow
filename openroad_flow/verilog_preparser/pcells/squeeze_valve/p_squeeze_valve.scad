 
use <polychannel_v2_testing.scad>

module p_squeeze_valve(xpos, ypos, zpos, orientation,
    mem_th, fl_chm_h,
    // fluid channel parameters
    fl_ext_len=30, fl_tran_len=5, fl_ext_th_len=4, 
    // pneumatic channel parameters
    pn_ch_w=14, pn_pad = 10, pn_len = 30, pn_bttm_chm_h=20, 
    // set if transition state
    no_out_transition=false, no_in_transition=false,
    // extra center spacing if needed when inport_center=false
    extra_sp = 0,
    px=7.6e-3, layer=10e-3, lpv=20, chan_h=10, chan_w=14, shape="cube", pitch=30, offset_layers=10, 
    rot=false, no_obj=false, floor_area=false)
{
    no_rot = [0,[0,0,1]];
    
    pn_chan_dimm = [pn_ch_w*px, chan_w*px, chan_h*layer];
    pn_chm_offset= (mem_th*2+fl_chm_h)*layer;
    pn_chm_h = pn_bttm_chm_h;
    
    //fl_ext_len  = 30;
    //fl_tran_len = 5;
    ifl_chan_dimm = [px, chan_w*px, chan_h*layer] ;
    fl_chan_dimm  = [px, chan_w*px, fl_chm_h*layer] ;
    
    module obj() {
        
        //pneumatic channel
        polychannel([
            [shape, pn_chan_dimm, [0,-pn_len*px,0], no_rot],
            [shape, pn_chan_dimm, [0,2*pn_len*px,0], no_rot]
        ]);
        translate([0,(chan_w/2+pn_pad)*px,-pn_chm_offset/2-chan_h/2*layer])
            cube([pn_ch_w*px, chan_w*px, pn_chm_offset], center=true);
        translate([0,-(chan_w/2+pn_pad)*px,-pn_chm_offset/2-chan_h/2*layer])
            cube([pn_ch_w*px, chan_w*px, pn_chm_offset], center=true);
        bttm_chm_l = (chan_w*2+pn_pad*2);
        translate([0,0,-pn_chm_offset-(chan_h/2+pn_chm_h/2)*layer])
            cube([pn_ch_w*px, bttm_chm_l*px, pn_chm_h*layer], center=true);
        
        //fluid channel
        
        fl_z_offset = (chan_h/2+mem_th+fl_chm_h/2)*layer ;
        fl_pt_1 = (fl_ext_len-fl_tran_len-pn_ch_w/2-fl_ext_th_len)*px ;
        
        polychannel([
            [shape, (no_in_transition?fl_chan_dimm:ifl_chan_dimm), [-fl_ext_len*px, 0, -fl_z_offset], no_rot],
            [shape, (no_in_transition?fl_chan_dimm:ifl_chan_dimm), [fl_pt_1, 0,0], no_rot],
            [shape, fl_chan_dimm, [fl_tran_len*px, 0,0], no_rot],
            [shape, fl_chan_dimm, [(pn_ch_w+fl_ext_th_len*2)*px, 0,0], no_rot],
            [shape, (no_out_transition?fl_chan_dimm:ifl_chan_dimm), [fl_tran_len*px, 0,0], no_rot],
            [shape, (no_out_transition?fl_chan_dimm:ifl_chan_dimm), [fl_pt_1, 0,0], no_rot],
            
        ]);
    }
    
    obj_z_offset = (chan_h/2+mem_th*2+fl_chm_h+pn_bttm_chm_h)*layer ;
    obj_x_off = (fl_ext_len+0.5)*px ;
    obj_y_off = (pn_len+chan_w/2)*px ;
    
    translate([pitch*px, pitch*px, offset_layers*layer])
    translate([xpos, ypos, zpos])
    translate([(rot?obj_y_off:obj_x_off),(rot?obj_x_off:obj_y_off),obj_z_offset])
        rotate([0,0,(rot?90:0)])
        mirror([(orientation=="FN"||orientation=="FS"?1:0),0,0])
        mirror([0,(orientation=="S"||orientation=="FS"?1:0), 0])
        obj();
    
}

p_squeeze_valve(0,0,0,"N", 4, fl_chm_h=8, rot=true);