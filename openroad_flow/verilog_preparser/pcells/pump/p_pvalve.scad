
use <polychannel_v2_testing.scad>

module p_valve(xpos, ypos, zpos, orientation,
    valve_r, mem_th, fl_chm_h, pn_chm_h, inport_center=false, 
    // length of channels extending outside of valve radius
    fl_out_len  = 30, pn_out_len=30, 
    // extra center spacing if needed when inport_center=false
    fl_extra_sp = 0, pn_extra_sp = 0, rot_pn="true",
    px=7.6e-3, layer=10e-3, lpv=20, chan_h=10, chan_w=14, shape="cube", pitch=30, $fn=30, 
    no_obj=false, floor_area=false)
{
   
    
    module obj()
    {
        chan_dimm = [chan_w*px, chan_w*px, chan_h*layer];
        translate([0,0,fl_chm_h/2*layer])
            cylinder(fl_chm_h*layer, r=valve_r*px, center=true);
        translate([0,0,(fl_chm_h+mem_th+pn_chm_h/2)*layer])
            cylinder(pn_chm_h*layer, r=valve_r*px, center=true);
        
        // fluid connection channel definitions
        
        inp_pos = (inport_center?
            0:
            (fl_extra_sp=="fill"?-(valve_r-chan_w/2-1)*px:-((valve_r/4+fl_extra_sp)*px)));
        outp_pos= (inport_center?
            (valve_r-chan_w/2)*px:
            -inp_pos);
        
        fl_len_0 = (inport_center?
            (valve_r/2+chan_w-fl_extra_sp+out_len)*px:
            (fl_extra_sp=="fill"?(fl_out_len+1)*px:(valve_r*3/4-chan_w/2-fl_extra_sp+fl_out_len)*px));
        fl_len_1 = (inport_center?
            (out_len-chan_w/4)*px:
            (fl_extra_sp=="fill"?(fl_out_len+1)*px:(valve_r*3/4-chan_w/2-fl_extra_sp+fl_out_len)*px));
        
        polychannel(
            [[shape, chan_dimm, [inp_pos,0,0], [0,[0,0,1]]],
            [shape, chan_dimm, [0,0,-20*layer], [0,[0,0,1]]],
            [shape, chan_dimm, [-fl_len_0,0,0], [0,[0,0,1]]]
        ]);
        polychannel(
            [[shape, chan_dimm, [outp_pos,0,0], [0,[0,0,1]]],
            [shape, chan_dimm, [0,0,-20*layer], [0,[0,0,1]]],
            [shape, chan_dimm, [fl_len_1,0,0], [0,[0,0,1]]]
        ]);
        
        // pneumatic channel definitions
        init_z_off = (fl_chm_h/2+mem_th+pn_chm_h)*layer;
        pn_pos_lat = (pn_extra_sp=="fill"?(valve_r-chan_w/2-1)*px:(valve_r/4+chan_w/2)*px);
        pn_len     = (pn_extra_sp=="fill"?(pn_out_len+1)*px:(valve_r*3/4-chan_w+pn_out_len)*px);
        
        rotate([0,0,(rot_pn?90:0)])
        {
        polychannel(
            [[shape, chan_dimm, [0,pn_pos_lat,init_z_off], [0,[0,0,1]]],
            [shape, chan_dimm, [0,0,20*layer], [0,[0,0,1]]],
            [shape, chan_dimm, [0,pn_len,0], [0,[0,0,1]]]
        ]);
        polychannel(
            [[shape, chan_dimm, [0,-pn_pos_lat,init_z_off], [0,[0,0,1]]],
            [shape, chan_dimm, [0,0,20*layer], [0,[0,0,1]]],
            [shape, chan_dimm, [0,-pn_len,0], [0,[0,0,1]]]
        ]);
        }
    }
    
    tran_x_offset = (valve_r+fl_out_len)*px;
    tran_y_offset = (valve_r+pn_out_len)*px;
    
    translate([pitch*px,pitch*px,0])
    translate([tran_x_offset,tran_y_offset,(20+chan_h/2)*layer])
        obj();
}

p_valve(0,0,0,"N", 
    46,4,10,20, false, pitch=0, fl_extra_sp="fill", pn_extra_sp="fill");