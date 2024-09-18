
use <../scad_base_src/p_serpentine_obj.scad>

module p_serpentine_2(xpos, ypos, zpos, orientation, L1, L2, turns,
    px=7.6e-3, layer=10e-3, lpv=20, chan_h=10, chan_w=14, shape="cube", pitch=30, 
    no_obj=false, floor_area=false, clr="RosyBrown", layer_offset=20)
{
    p_serpentine_obj(xpos, ypos, zpos, orientation, L1, L2, turns, px, layer, lpv, chan_h, chan_w, shape, pitch, no_obj, floor_area, 3, clr, layer_offset, 0, 0);
}

p_serpentine_2(0, 0, 0, "N", 200, 50, 4);