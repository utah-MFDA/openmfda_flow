/*--------------------------------------------------------------------------------------
/ General purpose multi-segment channel module: polychannel.
/
/ Given a list of sizes and positions, a series of connected channels is constructed
/ using the hull() operation to connect sequential pairs of cubes with specified
/ size and position as given in the sizes and positions list.
/
/ Rev. 1, 9/28/22, by G. Nordin - Initial version
/ Rev. 1.5, 9/29/22, by Dallin Miner - Modify to select sphere as well as cube shapes
/ Rev. 2, 10/1/22, by G. Nordin - Generalize to include rotation of shapes
/ Rev. 3, 10/4/22, by G. Nordin
/ Rev. 4, 10/5/22, by G. Nordin - Add uniformly_increase functions
/ Rev. 4.1, 10/7/22, by G. Nordin - Add rot_* functions
/ Rev. 4.2, 10/12/2, by G. Nordin - Add cube_shape(), sphere_shape()
/ Rev. 4.3, 10/12/2, by G. Nordin - Add arc_xy, arc_xz, arc_yz and associated functions
/ Rev. 4.4, 10/12/2, by G. Nordin - Clean up example code
--------------------------------------------------------------------------------------*/
$fn=50;

echo();
echo();


/*---------------------------------------------------------------------------------------
// polychannel module.
/--------------------------------------------------------------------------------------*/
// This is the module that should always be used. It is set by default to operate on
// shape-position lists that use relative positions for the elements.

function insert(list,value,position) = 
    let (l1 = partial(list,0,position-1), 
    l2 = partial(list,position,len(list)-1)) 
    concat(add_value(l1,value),l2);

//function _get_last_absolute_value(p, n, a_flag_ind) = 
//    for(i=[n:-1:0]) [(p[i][pos_index]

function _extract_rel_pos_vectors_up_to_n_mixed(p, n, a, pos_index=3) = [
    for (i=[a:1:n]) p[i][pos_index]
];

function rel_to_abs_position_oneline_mixed(p, line_index) = (p[line_index][0] == "r"?[
    //p[line_index][0],
    p[line_index][1],
    p[line_index][2],
    _add_list_of_vecs(_extract_rel_pos_vectors_up_to_n_mixed(p, line_index, _get_last_abs_index(p,line_index)[line_index])) ,
    p[line_index][4]]
    :
    [
    p[line_index][1],
    p[line_index][2],
    p[line_index][3],
    p[line_index][4]]);
    

function _extract_rel_pos_vectors_up_to_n_mixed2(p, n, a, ind, pos_index=3) = [
    for (i=[a[ind]:1:n]) p[i][pos_index][ind]
];
   
function rel_to_abs_position_oneline_mixed2(p, line_index) = [
    //p[line_index][0] == "r"?[
    //p[line_index][0],
    p[line_index][1],
    p[line_index][2],
    [for(i=[0:1:2]) _add_list_of_vecs(_extract_rel_pos_vectors_up_to_n_mixed2(p, line_index, _get_last_abs_index2(p,line_index+2)[line_index], i)) ],
    p[line_index][4]];
    //:
    //[
    //p[line_index][1],
    //p[line_index][2],
    //p[line_index][3],
    //p[line_index][4]]);


// unused ------------
function _get_last_abs_pos(p,n,i_val=0,a_ind=0,abs_ind=0,pos_ind=3) = (i_val==n?[p[a_ind][pos_ind]]:
    (p[i_val][abs_ind]=="a"?
        concat([p[a_ind][pos_ind]],_get_last_abs_pos(p,n,i_val+1,i_val)):
        concat([p[a_ind][pos_ind]],_get_last_abs_pos(p,n,i_val+1,a_ind))
    )
    );
// ------------
    
function _get_last_abs_index2(p,n,i_val=0,a_ind=[0,0,0],abs_ind=0,pos_ind=3) = (i_val==n?[a_ind]:
    (p[i_val][abs_ind]=="a"?
        let(nv=[i_val,i_val,i_val]) concat([nv],_get_last_abs_index2(p,n,i_val+1,nv)):
         (p[i_val][abs_ind]=="ax"?
         let(nv=[i_val,a_ind[1],a_ind[2]]) 
            concat([nv],_get_last_abs_index2(p,n,i_val+1,nv)):
          (p[i_val][abs_ind]=="ay"?
          let(nv=[a_ind[0],i_val,a_ind[2]]) 
            concat([nv],_get_last_abs_index2(p,n,i_val+1,nv)):
          (p[i_val][abs_ind]=="az"?
          let(nv=[a_ind[0],a_ind[1],i_val]) 
            concat([nv],_get_last_abs_index2(p,n,i_val+1,nv)):
           concat([a_ind],_get_last_abs_index2(p,n,i_val+1,a_ind))
    )))));

function _get_last_abs_index(p,n,i_val=0,a_ind=0,abs_ind=0,pos_ind=3) = 
    (i_val==n?[a_ind]:
    (p[i_val][abs_ind]=="a"?
        concat(i_val,_get_last_abs_index(p,n,i_val+1,i_val)):
        concat(a_ind,_get_last_abs_index(p,n,i_val+1,a_ind))
    ));


params_absolute = [
    ["r", "cube", [1, 1, 2], [0, 0, 0], [0, [0, 0, 1]]],
    ["r", "cube", [1, 1, 2], [5, 0, 0], [0, [0, 0, 1]]],
    ["a", "cube", [1, 1, 2], [3, 4, 0], [0, [0, 0, 1]]],
    ["r", "cube", [1, 1, 2], [8, 4, 0], [0, [0, 0, 1]]],
    ["r", "cube", [1, 1, 2], [4, 4, 0], [0, [0, 0, 1]]],
];

params_absolute2 = [
    ["r", "cube", [1, 1, 2],  [0, 0, 5], [0, [0, 0, 1]]], //0
    ["az", "cube", [1, 1, 2], [5, 5, 1], [0, [0, 0, 1]]], //1
    ["ay", "cube", [1, 1, 2], [0, 0, 2], [0, [0, 0, 1]]], //2
    ["ax", "cube", [1, 1, 2], [3, 4, 0], [0, [0, 0, 1]]], //3
    ["r", "cube", [1, 1, 2],  [0, 0, 0], [0, [0, 0, 1]]], //4
    ["ax", "cube", [1, 1, 2], [8, 4, 0], [0, [0, 0, 1]]], //5
    ["a", "cube", [1, 1, 2],  [4, 4, 0], [0, [0, 0, 1]]], //6
    ["r", "cube", [1, 1, 2],  [4, 4, 0], [0, [0, 0, 1]]], //7
];



params_relative = [
    ["cube", [1, 1, 2], [3, 3, 3], [0, [0, 0, 1]]],
    ["g2z", "cube", [1, 1, 2], [5, 0, 2], [0, [0, 0, 1]]],
    ["g2y", "cube", [1, 1, 2], [0, 4, 1], [0, [0, 0, 1]]],
    ["g2x", "cube", [1, 1, 2], [0, 4, 0], [0, [0, 0, 1]]],
    ["cube", [1, 1, 2], [3, 0, 0], [0, [0, 0, 1]]],
];

let(p=params_absolute2, line_index=7) 
{
    s4 = [for(i=[0:2]) _extract_rel_pos_vectors_up_to_n_mixed2(p, line_index, _get_last_abs_index2(p,line_index+1)[line_index], i)];
    
    s3 = _get_last_abs_index2(p,line_index)[line_index];

    echo("s3");
    echo(s3);
    echo("s4");
    echo(s4);
}


//s = _test2(params_absolute,len(params_absolute)-1);
s1= _get_last_abs_index(params_absolute, len(params_absolute)-1);

s2= _get_last_abs_index2(params_absolute2, len(params_absolute2)-1);

//echo(s);
echo(s1);
echo(s2);


//function _track_last_absolute(p, i, a_pos=0) = 
//    (for(0:1:i) 


function rel_to_abs_positions_mixed(p,p_offset) = [
    for (i=[0:1:len(p)-1]) rel_to_abs_position_oneline_mixed2(p, i)
];

function _g2_indexer(p) = [for(i=[0:1:len(p)-1]) 
    (p[i][0]=="g2"?
        concat(["a"],[for(j=[1:1:len(p[i])]) p[i][j]])
            :(p[i][0]=="g2x"?
            concat(["ax"],[for(j=[1:1:len(p[i])]) p[i][j]])
            :(p[i][0]=="g2y"?
            concat(["ay"],[for(j=[1:1:len(p[i])]) p[i][j]])
            :(p[i][0]=="g2z"?
            concat(["az"],[for(j=[1:1:len(p[i])]) p[i][j]])
            :concat(["r"],p[i])
            ))))];
            
function polychannel_vol_calc(params, 
    relative_positions=true) = 
            (relative_positions?
                channel_vol_calc(params):
                channel_vol_calc(rel_to_abs_positions_mixed(_g2_indexer(params))));

function polychannel_len_calc(params, 
    relative_positions=true) = 
            (relative_positions?
             //true - relative pos
                channel_len_calc(rel_to_abs_positions_mixed(_g2_indexer(params)))
            ://false
            channel_len_calc(params));
            
function channel_vol_calc(params, pos_index=3) = 
    _add_list_of_vecs(
        [for(i = [1:1:len(param)])  
            1 //place holder
        ]
    );
       
      
       /* 
function channel_len_calc(params,pos_index=2) = [for(i = [1:1:len(params)-1])  
            let(x1 = params[i][pos_index][0],
                y1 = params[i][pos_index][1],
                z1 = params[i][pos_index][2],
                x2 = params[i-1][pos_index][0],
                y2 = params[i-1][pos_index][1],
                z2 = params[i-1][pos_index][2])
    [x1, x2, y1, y2, z1, z2]];*/

    
function channel_len_calc(params, pos_index=2) = 
    _add_list_of_vecs(
         [for(i = [1:1:len(params)-1])  
            let(x1 = params[i][pos_index][0],
                y1 = params[i][pos_index][1],
                z1 = params[i][pos_index][2],
                x2 = params[i-1][pos_index][0],
                y2 = params[i-1][pos_index][1],
                z2 = params[i-1][pos_index][2])
            sqrt((x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2)
        ]
    );
  
function polychannel_final_pos(params, relative_positions=true,pos_index=2) = 
         (relative_positions?
            rel_to_abs_positions_mixed(_g2_indexer(params))[len(params)-1][pos_index]
         :
         params[len(params)-1][pos_index]);

module polychannel_g2(params, 
    relative_positions=true, 
    clr="lightblue", 
    center=true, 
    show_only_shapes=false)
    {
        // needs an additional 0 relative route to 
        // perform correctly
        p = _g2_indexer(params);
        
        polychannel_mixed(p,
            relative_positions=true, 
            clr=clr, 
            center=true, 
            show_only_shapes=false);
    }

module polychannel_mixed(params, 
    relative_positions=true, 
    clr="lightblue", 
    center=true, 
    show_only_shapes=false)
{
    pos = [0,0,0];
    
    params_abs = rel_to_abs_positions_mixed(params);
    
    /*
    for(i=[0:1:len(params)-1])
    {
        if(params[i][0]=="r")
        {
            echo(params[i]);
            params = insert(params,rel_to_abs_positions(params[i]),i);
            pos =+ params[i][1];
        } 
        else if(params[i][0]=="a")
        {
            params = insert(params,rel_to_abs_positions(params[i]),i);
            pos = params[i][1];
        }    
        else
        {
        }
        
    }*/
    
    polychannel_absolute_positions(params_abs, 
        clr=clr, 
        center=center, 
        show_only_shapes=show_only_shapes);  
    //pos_end = [0,0,0];
    //for([0:len(params)-1]){pos_end=+params[0];}
    //return pos_end;
}

module polychannel_route(
    net,
    dev1,
    dev2,
    params,
    relative_positions=false, 
    clr="lightblue", 
    center=true, 
    show_only_shapes=false
    )
{
    polychannel(params,relative_positions,clr,center,show_only_shapes);
}


module polychannel(
    params, 
    relative_positions=true, 
    clr="lightblue", 
    center=true, 
    show_only_shapes=false) {
        if (relative_positions) {
            params_abs = rel_to_abs_positions(params);
            polychannel_absolute_positions(params_abs, 
            clr=clr, 
            center=center, 
            show_only_shapes=show_only_shapes);
        } else {
            polychannel_absolute_positions(params, 
            clr=clr, 
            center=center, 
            show_only_shapes=show_only_shapes);
        }
}

//Sum the elements of a list.
function SubSum(x=0,Index=0)=x[Index]+((Index<=0)?0:SubSum(x=x,Index=Index-1));
function Sum(x)=SubSum(x=x,Index=len(x)-1);

// Module that does the heavy lifting of creating a polychannel. Should be used by calling
// the polychannel() module.
module polychannel_absolute_positions(params, clr="lightblue", center=true, show_only_shapes=false) {
    // echo("len(params)", len(params));
    // echo("params", params);
    if (show_only_shapes) {
        for (i = [0:1:len(params)-1]) {
            // echo("shapes only", i, params[i]);
            color(clr) shape3D(params[i][0], params[i][1], params[i][2], params[i][3], center=center);
        }
    } else {
        for (i = [1:1:len(params)-1]) {
            // echo("with hull", i, params[i-1], params[i]);
            color(clr) hull() {
                shape3D(params[i-1][0], params[i-1][1], params[i-1][2], params[i-1][3], center=center);
                shape3D(params[i][0], params[i][1], params[i][2], params[i][3], center=center);
            };
        };
    }
}


/*---------------------------------------------------------------------------------------
// Fundamental shape creation module for polychannel module.
/--------------------------------------------------------------------------------------*/
module shape3D(shape, size, position, rotation, center=true) {
    a = rotation[0];
    v = rotation[1];
    if(shape=="cube"){
        translate(position) rotate(a=a, v=v) cube(size, center=center);
    }
    else if(shape=="sphr" || shape=="sphere"){
        translate(position) rotate(a=a, v=v)  scale(size) sphere(d=1);
    }
    else {
        assert(false, "invalid shape");
    }
}


/*---------------------------------------------------------------------------------------
// Utility functions.
--------------------------------------------------------------------------------------*/

// Convenience functions to reduce verbosity of creating a shape-position data structure.
// See examples/shorter_shape_pos_approach.scad.
// To reduce verbosity even further you can define:
// function cs(size, position, ang=[0, [0,0,1]]) = cube_shape(size, position, ang);
// function ss(size, position, ang=[0, [0,0,1]]) = sphere_shape(size, position, ang);
function cube_shape(size, position, ang=[0, [0,0,1]]) = [
    "cube", size, position, ang
];
function sphere_shape(size, position, ang=[0, [0,0,1]]) = [
    "sphr", size, position, ang
];

// Return the final position of the center of the last element for a 
// list of parameters that uses relative position vectors.
function get_final_position(p) = rel_to_abs_positions(p)[len(p)-1][2];

// Exactly what the name says for the first element in a shape/position list data structure.
function set_first_position(p, pos=[0, 0, 0]) = [
    for (i=[0:1:len(p)-1]) 
        i==0
            ? [p[i][0], p[i][1], pos, p[i][3]]
            : p[i]
];

// Helper functions for rotations in the shape/position data structure list.
function rot_x(angle) = [angle, [1, 0, 0]];
function rot_y(angle) = [angle, [0, 1, 0]];
function rot_z(angle) = [angle, [0, 0, 1]];
function no_rot() = rot_z(0);

// Get all of the relative position vectors from list of parameters.
function extract_all_rel_position_vectors(p) =
    _extract_rel_pos_vectors_up_to_n(params_pos_relative, len(params_pos_relative)-1);

// Reverse the order of a list of parameters with relative positions.
function reverse_order(p) = [
    for (i=[len(p)-1:-1:0]) [
        p[i][0], 
        p[i][1],
        i==len(p)-1
            ? p[0][2]
            : p[i+1][2],
        p[i][3]
    ]
];


/*---------------------------------------------------------------------------------------
// Functions to convert between relative and absolute positions and vice versa in
// a list of shape/size/position/rotation parameters. Note that 
// 'abs_to_rel_positions_keep_first_position()' will keep the first position and
// make all of the other positions relative to it while 'abs_to_rel_positions()'
// will create a relative positions result with the first position at [0,0,0].
//
// Examples
// --------
// params_absolute = [
//   ["cube", [1, 1, 2], [0, 0, 0], [0, [0, 0, 1]]],
//   ["cube", [1, 1, 2], [5, 0, 0], [0, [0, 0, 1]]],
//   ["cube", [1, 1, 2], [5, 4, 0], [0, [0, 0, 1]]],
//   ["cube", [1, 1, 2], [8, 4, 0], [0, [0, 0, 1]]],
// ];
// params_relative = [
//   ["cube", [1, 1, 2], [0, 0, 0], [0, [0, 0, 1]]],
//   ["cube", [1, 1, 2], [5, 0, 0], [0, [0, 0, 1]]],
//   ["cube", [1, 1, 2], [0, 4, 0], [0, [0, 0, 1]]],
//   ["cube", [1, 1, 2], [3, 0, 0], [0, [0, 0, 1]]],
// ];
//
// // Will be equal to params_relative:
// p_relative_test = abs_to_rel_positions(params_absolute);
// echo(p_relative_test);
// echo(params_relative);
//
// // Will be equal to params_absolute:
// p_absolute_test = rel_to_abs_positions(params_relative);  
// echo(p_absolute_test);
// echo(params_absolute);
/--------------------------------------------------------------------------------------*/
// function abs_to_rel_positions(p) = [
//     for (i=[0:1:len(p)-1]) [
//         p[i][0], 
//         p[i][1],
//         i==0
//             ? p[i][2] - p[i][2]
//             : p[i][2] - p[i-1][2],
//         p[i][3]
//     ]
// ];
function abs_to_rel_positions(p, keep_first_position=false) = [
    for (i=[0:1:len(p)-1]) [
        p[i][0], 
        p[i][1],
        i==0
            ? keep_first_position==true
                ? p[i][2]
                : p[i][2] - p[i][2]
            : p[i][2] - p[i-1][2],
        p[i][3]
    ]
];
function abs_to_rel_positions_keep_first_position(p) = 
    abs_to_rel_positions(p, keep_first_position=true);
// Function to add list of vectors. See add2() at 
// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Tips_and_Tricks#Add_all_values_in_a_list
function _add_list_of_vecs(v) = [for(i=v) 1]*v;
function _extract_rel_pos_vectors_up_to_n(p, n, pos_index=2) = [
    for (i=[0:1:n]) p[i][pos_index]
];
function rel_to_abs_position_oneline(p, line_index) = [
    p[line_index][0],
    p[line_index][1],
    _add_list_of_vecs(_extract_rel_pos_vectors_up_to_n(p, line_index)),
    p[line_index][3]
];
function rel_to_abs_positions(p) = [
    for (i=[0:1:len(p)-1]) rel_to_abs_position_oneline(p, i)
];


/*---------------------------------------------------------------------------------------
// Functions to uniformly increment relative positions. See examples/ascending_arcs.scad.
/--------------------------------------------------------------------------------------*/
function uniformly_increase_rel_pos(p, change_vec) = [
    for (i=[0:1:len(p)-1]) let (delta = change_vec/(len(p)-1))[
        p[i][0], 
        p[i][1],
        i==0
            ? p[i][2]
            : p[i][2] + delta,
        p[i][3]
    ]
];
function uniformly_increase_rel_pos_in_z(p, total_pos_change) = 
    uniformly_increase_rel_pos(p, [0, 0, total_pos_change]);
function uniformly_increase_rel_pos_in_y(p, total_pos_change) = 
    uniformly_increase_rel_pos(p, [0, total_pos_change, 0]);
function uniformly_increase_rel_pos_in_x(p, total_pos_change) = 
    uniformly_increase_rel_pos(p, [total_pos_change, 0, 0]);


/*---------------------------------------------------------------------------------------
// Circular arc functions to calculate relative positions along an arc in xy.
// n is the number of segments in arc, so number of points in arc is n+1.
/--------------------------------------------------------------------------------------*/
function _calc_arc_rot_i(angle1, delta_angle, n, i, rot_axis) = [
    angle1 + i*delta_angle/n, 
    rot_axis
];
function _calc_arc_xy_rot_deltaang_i(angle1, delta_angle, n, i) = 
    _calc_arc_rot_i(angle1, delta_angle, n, i, [0, 0, 1]);
function _calc_arc_xy_pos_deltaang_i(radius, angle1, delta_angle, n, i) = [
    radius*cos(angle1 + i*delta_angle/n), 
    radius*sin(angle1 + i*delta_angle/n),
    0
];
function _arc_xy_pos_rot_deltaang_oneline(shape, size, radius, angle1, delta_angle, n, i) = [
    shape, 
    size, 
    _calc_arc_xy_pos_deltaang_i(radius, angle1, delta_angle, n, i), 
    _calc_arc_xy_rot_deltaang_i(angle1, delta_angle, n, i)
];
function _arc_xy_abs_position_deltaang(shape, size, radius, angle1, delta_angle, n) = [
    for (i=[0:1:n]) _arc_xy_pos_rot_deltaang_oneline(shape, size, radius, angle1, delta_angle, n, i)
];
function arc_xy(shape, size, radius, angle1, delta_angle, n) = 
    abs_to_rel_positions(_arc_xy_abs_position_deltaang(shape, size, radius, angle1, delta_angle, n));

/*---------------------------------------------------------------------------------------
// Circular arc functions to calculate relative positions along an arc in xz.
// n is the number of segments in arc, so number of points in arc is n+1.
/--------------------------------------------------------------------------------------*/
function _calc_arc_xz_rot_deltaang_i(angle1, delta_angle, n, i) = 
    _calc_arc_rot_i(angle1, delta_angle, n, i, [0, -1, 0]);
function _calc_arc_xz_pos_deltaang_i(radius, angle1, delta_angle, n, i) = [
    radius*cos(angle1 + i*delta_angle/n), 
    0,
    radius*sin(angle1 + i*delta_angle/n)
];
function _arc_xz_pos_rot_deltaang_oneline(shape, size, radius, angle1, delta_angle, n, i) = [
    shape, 
    size, 
    _calc_arc_xz_pos_deltaang_i(radius, angle1, delta_angle, n, i), 
    _calc_arc_xz_rot_deltaang_i(angle1, delta_angle, n, i)
];
function _arc_xz_abs_position_deltaang(shape, size, radius, angle1, delta_angle, n) = [
    for (i=[0:1:n]) _arc_xz_pos_rot_deltaang_oneline(shape, size, radius, angle1, delta_angle, n, i)
];
function arc_xz(shape, size, radius, angle1, delta_angle, n) = 
    abs_to_rel_positions(_arc_xz_abs_position_deltaang(shape, size, radius, angle1, delta_angle, n));

/*---------------------------------------------------------------------------------------
// Circular arc functions to calculate relative positions along an arc in yz.
// n is the number of segments in arc, so number of points in arc is n+1.
/--------------------------------------------------------------------------------------*/
function _calc_arc_yz_rot_deltaang_i(angle1, delta_angle, n, i) = 
    _calc_arc_rot_i(angle1, delta_angle, n, i, [1, 0, 0]);
function _calc_arc_yz_pos_deltaang_i(radius, angle1, delta_angle, n, i) = [
    0,
    radius*cos(angle1 + i*delta_angle/n), 
    radius*sin(angle1 + i*delta_angle/n)
];
function _arc_yz_pos_rot_deltaang_oneline(shape, size, radius, angle1, delta_angle, n, i) = [
    shape, 
    size, 
    _calc_arc_yz_pos_deltaang_i(radius, angle1, delta_angle, n, i), 
    _calc_arc_yz_rot_deltaang_i(angle1, delta_angle, n, i)
];
function _arc_yz_abs_position_deltaang(shape, size, radius, angle1, delta_angle, n) = [
    for (i=[0:1:n]) _arc_yz_pos_rot_deltaang_oneline(shape, size, radius, angle1, delta_angle, n, i)
];
function arc_yz(shape, size, radius, angle1, delta_angle, n) = 
    abs_to_rel_positions(_arc_yz_abs_position_deltaang(shape, size, radius, angle1, delta_angle, n));

/*---------------------------------------------------------------------------------------
// Cubic Bezier curve to connect two 3D points.
//  p0 - Initial position
//  p1 - Final position
//  d0 - Tangent of curve at initial position
//  d1 - Tangent of curve at final position
//  n - Number of segments in curve, so number of points in curve is n+1.
/--------------------------------------------------------------------------------------*/
function c0(p0) = p0;
function c1(p0, d0) = p0 + d0 / 3;
function c2(p1, d1) = p1 - d1 / 3;
function c3(p1) = p1;
function cubicBezier3D_point(t, p0, p1, d0, d1) = 
    c0(p0) * ((1 - t)^3) +
    c1(p0, d0) * 3 * t * ((1 - t)^2) + 
    c2(p1, d1) * 3 * t^2 * (1 - t) + 
    c3(p1) * t^3;
function cubicBezier3D_point_tangent(t, p0, p1, d0, d1) = 
    -3 * c0(p0) * (1 - t)^2 +
    3 * c1(p0, d0) * (t * (2*t - 2) + (1 - t)^2) +
    3 * c2(p1, d1) * (-1 * t^2 + 2 * t * (1 - t)) +
    3 * c3(p1) * t^2;
function cubicBezier3D_one_line(shape, size, t, p0, p1, d0, d1, shape_normal_vec) = [
    shape, 
    size, 
    cubicBezier3D_point(t, p0, p1, d0, d1),
    [
        angle_btwn_vecs(shape_normal_vec, cubicBezier3D_point_tangent(t, p0, p1, d0, d1)),
        unit_vec(cross(shape_normal_vec, cubicBezier3D_point_tangent(t, p0, p1, d0, d1)))
    ]
];
function _cubicBezier3D_list(shape, size, p0, p1, d0, d1, shape_normal_vec, n) = [
    for (i=[0:1:n]) 
        let (t=i/n) 
        cubicBezier3D_one_line(shape, size, t, p0, p1, d0, d1, shape_normal_vec),
];
function cubicBezier3D_list(shape, size, p0, p1, d0, d1, shape_normal_vec, n) = 
    abs_to_rel_positions(
        _cubicBezier3D_list(shape, size, p0, p1, d0, d1, shape_normal_vec, n)
    );
function unit_vec(v) = v / norm(v); 
function angle_btwn_vecs( v1, v2) = acos(v1 * v2 / (norm(v1) * norm(v2)));



/*---------------------------------------------------------------------------------------
//
// NOTE: THE ARC FUNCTIONS BELOW ARE OLD AND WILL BE DEPRECATED.
//
// Circular arc functions to calculate absolute and relative positions along an arc in xy.
// n is the number of segments in arc, so number of points in arc is n+1.
//
// Example
// -------
// test_arc = arc_xy_rel_position("cube", [1, 0.01, 2], 4, 0, 90, 12);
// test_params_pos_relative = [
//     ["cube", [1, 0.01, 2], [0, 0, 0], [0, [0, 0, 1]]],
//     ["cube", [1, 0.01, 2], [0, 2, 0], [0, [0, 0, 1]]],
//     each test_arc,
//     ["cube", [0.01, 1, 2], [-2, 0, 0], [0, [0, 0, 1]]]
// ];
/--------------------------------------------------------------------------------------*/
function _calc_arc_xy_pos_i(radius, angle1, angle2, n, i) = [
    radius*cos(angle1 + i*(angle2-angle1)/n), 
    radius*sin(angle1 + i*(angle2-angle1)/n),
    0
];
function _calc_arc_xy_rot_i(angle1, angle2, n, i) = [
    angle1 + i*(angle2-angle1)/n, 
    [0, 0, 1]
];
function _arc_xy_pos_rot_oneline(shape, size, radius, angle1, angle2, n, i) = [
    shape, size, _calc_arc_xy_pos_i(radius, angle1, angle2, n, i), _calc_arc_xy_rot_i(angle1, angle2, n, i)
];
function _arc_xy_abs_position(shape, size, radius, angle1, angle2, n) = [
    for (i=[0:1:n]) _arc_xy_pos_rot_oneline(shape, size, radius, angle1, angle2, n, i)
];
function arc_xy_rel_position(shape, size, radius, angle1, angle2, n) = 
    abs_to_rel_positions(_arc_xy_abs_position(shape, size, radius, angle1, angle2, n));

/*---------------------------------------------------------------------------------------
// Circular arc functions to calculate absolute and relative positions along an arc in xz.
// n is the number of segments in arc, so number of points in arc is n+1.
/--------------------------------------------------------------------------------------*/
function _calc_arc_xz_pos_i(radius, angle1, angle2, n, i) = [
    radius*cos(angle1 + i*(angle2-angle1)/n), 
    0,
    radius*sin(angle1 + i*(angle2-angle1)/n)
];
function _calc_arc_xz_rot_i(angle1, angle2, n, i) = [
    angle1 + i*(angle2-angle1)/n, 
    [0, -1, 0]
];
function _arc_xz_pos_rot_oneline(shape, size, radius, angle1, angle2, n, i) = [
    shape, size, _calc_arc_xz_pos_i(radius, angle1, angle2, n, i), _calc_arc_xz_rot_i(angle1, angle2, n, i)
];
function _arc_xz_abs_position(shape, size, radius, angle1, angle2, n) = [
    for (i=[0:1:n]) _arc_xz_pos_rot_oneline(shape, size, radius, angle1, angle2, n, i)
];
function arc_xz_rel_position(shape, size, radius, angle1, angle2, n) = 
    abs_to_rel_positions(_arc_xz_abs_position(shape, size, radius, angle1, angle2, n));

/*---------------------------------------------------------------------------------------
// Circular arc functions to calculate absolute and relative positions along an arc in yz.
// n is the number of segments in arc, so number of points in arc is n+1.
/--------------------------------------------------------------------------------------*/
function _calc_arc_yz_pos_i(radius, angle1, angle2, n, i) = [
    0,
    radius*cos(angle1 + i*(angle2-angle1)/n), 
    radius*sin(angle1 + i*(angle2-angle1)/n)
];
function _calc_arc_yz_rot_i(angle1, angle2, n, i) = [
    angle1 + i*(angle2-angle1)/n, 
    [1, 0, 0]
];
function _arc_yz_pos_rot_oneline(shape, size, radius, angle1, angle2, n, i) = [
    shape, size, _calc_arc_yz_pos_i(radius, angle1, angle2, n, i), _calc_arc_yz_rot_i(angle1, angle2, n, i)
];
function _arc_yz_abs_position(shape, size, radius, angle1, angle2, n) = [
    for (i=[0:1:n]) _arc_yz_pos_rot_oneline(shape, size, radius, angle1, angle2, n, i)
];
function arc_yz_rel_position(shape, size, radius, angle1, angle2, n) = 
    abs_to_rel_positions(_arc_yz_abs_position(shape, size, radius, angle1, angle2, n));


/*---------------------------------------------------------------------------------------
// Example
/--------------------------------------------------------------------------------------*/
eps = 0.01;

no_rotation = no_rot();
n_segs90 = 10;
params_verbose = [
    ["sphr", [eps, 4, 4], [0, 0, 0], no_rotation],
    ["sphr", [eps, 4, 4], [7, 0, 0], no_rotation],
    ["sphr", [eps, 3, 3], [0, 0, 0], no_rotation],
    ["cube", [eps, 1, 1], [3, 0, 0], no_rotation],
    ["cube", [eps, 1*sqrt(2), 1], [3, 0, 0], rot_z(45)],
    ["cube", [eps, 1, 1], [0, 2, 0], rot_z(90)],
    ["cube", [3, 1, 3], [0, 3, 0], no_rotation],
    ["cube", [1, eps, 1], [0, 2, 0], no_rotation],
    ["sphr", [eps, 1*sqrt(2), 1], [0, 2, 0], rot_z(45)],
    ["sphr", [eps, 2, 2], [5, 0, 0], no_rotation],
    ["sphr", [2, 2, 2], [2, 0, 0], no_rotation],
    ["sphr", [2, 2, 2], [0, -4, 4], no_rotation],
    ["cube", [1, eps, 2], [0, -3, 0], no_rotation],
    each arc_xy("cube", [1, eps, 2], radius=3, angle1=0, delta_angle=-90, n=n_segs90),
    ["cube", [1, 1, 2], [-2, 0, 0], no_rotation],
    each arc_xz("cube", [2, 1, eps], radius=3, angle1=-90, delta_angle=-180, n=2*n_segs90),
    each arc_xy("cube", [1, eps, 2], radius=1, angle1=-90, delta_angle=90, n=n_segs90),
    ["cube", [1, eps, 1], [0, 5, 0], no_rotation],
    each arc_xy("cube", [1, eps, 1], radius=1, angle1=0, delta_angle=90, n=n_segs90),
    ["cube", [eps, 1, 1], [-15, 0, 0], no_rotation],
];
function cs(size, position, ang=[0, [0,0,1]]) = cube_shape(size, position, ang);
function ss(size, position, ang=[0, [0,0,1]]) = sphere_shape(size, position, ang);
stay_same_position = [0, 0, 0];
params_with_helper_functions = [
    ss([eps, 4, 4], [0, 0, 0]),
    ss([eps, 4, 4], [7, 0, 0]),
    ss([eps, 3, 3], stay_same_position),
    cs([eps, 1, 1], [3, 0, 0]),
    cs([eps, 1*sqrt(2), 1], [3, 0, 0], rot_z(45)),
    cs([eps, 1, 1], [0, 2, 0], rot_z(90)),
    cs([3, 1, 3], [0, 3, 0]),
    cs([1, eps, 1], [0, 2, 0]),
    ss([eps, 1*sqrt(2), 1], [0, 2, 0], rot_z(45)),
    ss([eps, 2, 2], [5, 0, 0]),
    ss([2, 2, 2], [2, 0, 0]),
    ss([2, 2, 2], [0, -4, 4]),
    each set_first_position(
        arc_xy("cube", [1, eps, 2], radius=3, angle1=0, delta_angle=-90, n=n_segs90),
        pos=[0, -3, 0]),
    each set_first_position(
        arc_xz("cube", [2, 1, eps], radius=3, angle1=-90, delta_angle=-180, n=2*n_segs90),
        pos=[-2, 0, 0]),
    each arc_xy("cube", [1, eps, 2], radius=1, angle1=-90, delta_angle=90, n=n_segs90),
    each set_first_position(
        arc_xy("cube", [1, eps, 1], radius=1, angle1=0, delta_angle=90, n=n_segs90),
        pos=[0, 5, 0]),
    cs([eps, 1, 1], [-15, 0, 0]),
];

polychannel(params_verbose, clr="Salmon", show_only_shapes=true);
translate([0, 25, 0]) polychannel(params_verbose);
translate([0, -25, 0]) polychannel(params_with_helper_functions, clr="lightgreen");

echo();
echo(get_final_position(params_verbose));
echo();

let(p=params_absolute2, line_index=1) 
{
    s3 = [for(i=[0:1:2]) _add_list_of_vecs(_extract_rel_pos_vectors_up_to_n_mixed2(p, line_index, _get_last_abs_index2(p,line_index)[line_index], i)) ];

    echo(s3);
}

polychannel_g2(params_relative);

echo("params relative length:");
echo(polychannel_len_calc(params_relative));

//polychannel_mixed(params_absolute);