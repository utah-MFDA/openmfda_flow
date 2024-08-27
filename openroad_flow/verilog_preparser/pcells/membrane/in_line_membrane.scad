
use <polychannel_v2_testing.scad>

module in_line_membrane(xpos, ypos, zpos, orientation,
    mem_r, mem_th, fl_chm_h, pn_chm_h, inport_center=false, 
    // length of channels extending outside of valve radius
    fl_out_len  = 30, pn_out_len=30, 
    // extra center spacing if needed when inport_center=false
    extra_sp = 0,
    px=7.6e-3, layer=10e-3, lpv=20, chan_h=10, chan_w=14, shape="cube", pitch=30, offset_layers=10, $fn=30, 
    rot=false, no_obj=false, floor_area=false)
{
    
    module obj()
    {
            chan_dimm = [chan_w*px, chan_w*px, chan_h*layer];
        translate([0,0,fl_chm_h/2*layer])
            cylinder(fl_chm_h*layer, r=mem_r*px, center=true);
        translate([0,0,(fl_chm_h+mem_th+pn_chm_h/2)*layer])
            cylinder(pn_chm_h*layer, r=mem_r*px, center=true);
        
        polychannel([
        ["cube", chan_dimm, [-(mem_r+fl_out_len)*px, 0, chan_h*layer/2], [0,[0,0,1]] ],
        ["cube", chan_dimm, [(mem_r+fl_out_len)*2*px, 0, 0], [0,[0,0,1]], ]]);
        
        z_chan_offset = (fl_chm_h+pn_chm_h+mem_th-chan_h/2)*layer;
        
        polychannel([
        ["cube", chan_dimm, [0, -(mem_r+fl_out_len)*px, z_chan_offset], [0,[0,0,1]] ],
        ["cube", chan_dimm, [0, (mem_r+fl_out_len)*2*px, 0], [0,[0,0,1]], ]]);
    }
    
    translate([pitch*px, pitch*px, offset_layers*layer])
        translate([(mem_r+fl_out_len+chan_w/2)*px, (mem_r+pn_out_len+chan_w/2)*px, 0])
            obj();
    
}

in_line_membrane(0,0,0,"N",
    50, 10, 20, 40);