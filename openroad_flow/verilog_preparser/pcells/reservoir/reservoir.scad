use <polychannel_v2_testing.scad>

$fa = 1;
$fs = 0.04;
layer = 0.010;
px = 0.0076;
edge_rounding = 0.5;
cube_x = 500*px;
cube_y = 500*px;
cube_z = 380*layer;

module p_reservoir(xpos, ypox, zpos, orientation,
    size=[300, 300, 250], edge_rounding=0.5, 
    center=true, clr="gray",
    px=0.0076, layer=0.010, rot=false, pitch=30, layer_offset=10, $fs=0.04, $fa=1)
{
    n_size = [size[0]*px, size[1]*px, size[2]*layer];
    
    translate([pitch*px, pitch*px, layer_offset*layer])
    translate(n_size/2)
    rotate([0,0,(rot?90:0)])
    mirror([(orientation=="FN"||orientation=="FS"?1:0),0,0])
    mirror([0,(orientation=="S"||orientation=="FS"?1:0), 0])
        reservoir(size=n_size, edge_rounding=edge_rounding, center=center, clr=clr, px=px, layer=layer, $fs=$fs, $fa=$fa) ; 
}

module reservoir(size=[300*px, 300*px, 250*layer], edge_rounding=0.5, center=true, clr="gray",
    chan_w=14, chan_h=10,
    px=0.0076, layer=0.010, $fs=0.04, $fa=1) {
	module obj() {
        translate = (center == false) ?
		[edge_rounding, edge_rounding, edge_rounding] :
		[
			edge_rounding - (size[0] / 2),
			edge_rounding - (size[1] / 2),
			edge_rounding - (size[2] / 2)
	];

    color(clr){
        translate(v = translate)
        minkowski() {
            cube(size = [
                size[0] - (edge_rounding * 2),
                size[1] - (edge_rounding * 2),
                size[2] - (edge_rounding * 2)
            ]);
            sphere(r = edge_rounding);
        }
    }
    }
    module port (side, port_len=50, from_center=true, x_off=0, y_off=0)
    {
        i_orient = 
            (side[0]=="x"?
                (side[1]=="+"?
                    [[1,0,0],[0,-1,0],[0,0,1]]
                    :[[-1,0,0],[0,-1,0],[0,0,1]]
                ):
            (side[0]=="y"?
                (side[1]=="+"?
                    [[0,1,0], [1,0,0], [0,0,1]]
                    :[[0,-1,0], [1,0,0], [0,0,1]]
                ):
            (side[0]=="z"?
                (side[1]=="+"?
                    [[0,0,1], [1,0,0], [0,1,0]]
                    :[[0,0,-1], [1,0,0], [0,1,0]]
                )
                :"error")));
        
        
        i_pt_s = 
            (side[0]=="x"?
                size[0]/2
                :
            (side[0]=="y"?
                size[1]/2
                :
            (side[0]=="z"?
                size[2]/2
                :"error")));
                
        pt0 = i_orient[0]*i_pt_s+i_orient[1]*x_off*px+i_orient[2]*y_off*px;
        pt1 = i_orient[0]*port_len*px;
        polychannel([
            ["cube",[chan_w*px, chan_w*px, chan_h*layer], pt0, [0,[1,0,0]]],
            ["cube",[chan_w*px, chan_w*px, chan_h*layer], pt1, [0,[1,0,0]]]
            ], clr="crimson");

    }
        
        obj() ;
        port("z+", x_off=size[0]/4/px, y_off=0) ;
        port("z+", x_off=-size[0]/4/px, y_off=0) ;
}

p_reservoir(0,0,0,"N",size=[300, 300, 280], edge_rounding=edge_rounding, clr="lightblue");