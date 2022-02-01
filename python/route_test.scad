include<routing_181112.scad>;
//This openScad sketch will teach you how to use the routing_181220.scad routing function. The main purpose of this routing function is to rout a channel from one point to another in your openscad sketch and allow you to define exactly how that channel will be oriented between those two point. To start, lets define two points in space:

point_1 = [0, 0, 0]; //this point is centered at the origin
point_2 = [100, 0, 0]; //point_2 is 2 units away from point_1 in the x direction, 4 units away in the y direction, and 6 units away in the z direction.

//After defining the points we want to connect, lets define a matrix that will tell the routing function the width and height of the connections between the points. We can start by defining the height and width as variables:

//smaller width and height
w_chan = 1;
h_chan = 1;

//larger width and height
W_chan = 2;
H_chan = 2;

//In order to create the matrix, we must make a separate line of code for each size and direction of channel we want. Because we want two sizes of channels in the x, y, and z directions, we will need to write six lines of code. This is shown below. Notice that for the line defining the dimensions in the x-direction a vector of [0, 0] is in the x position. This is basically a placeholder because the size of the channel in the x direction will depend on the distance between the two points in the x direction. This is the same for all dimensions and is how the routing function knows to route the channel in that direction. In addition, for a routed channel of width w_chan, notice how this width is defined as [-w_chan/2, w_chan/2]. This signifies that the width of the channel will be centered upon the defined point.

//In some cases, you may not want a channel that is centered on the point. For example, in the z-direction of larger channels defined below (index numbers 3 & 4), the heigth is defined as [0, H_chan]. This means that instead of being centered on the defined point, the height of the channel will start from the z position of the point and extend upward by the amount H_chan.

dimensions_matrix =
[

    //defining x, y, and z smaller channels
    [[0, 0], [-w_chan/2, w_chan/2], [-h_chan/2, h_chan/2]], // index number 0, x-direction
    [[-w_chan/2, w_chan/2], [0, 0], [-h_chan/2, h_chan/2]], // index number 1, y-direction
    [[-w_chan/2, w_chan/2], [-w_chan/2, w_chan/2], [0, 0]], // index number 2, z-direction

    //defining x, y, and z larger channels
    [[0, 0], [-W_chan/2, W_chan/2], [0, H_chan]],           // index number 3, x-direction
    [[-W_chan/2, W_chan/2], [0, 0], [0, H_chan]],           // index number 4, y-direction
    [[-W_chan/2, W_chan/2], [-W_chan/2, W_chan/2], [0, 0]], // index number 5, z-direction

];

//After defining the sizes of our channels, next we will create a matrix that will define the connections between our two points. Each vector in this matrix contains a string, routing information and finally the index numbers of the desired channel sizes from the dimensions matrix we just made. In the first vector in the connection matrix, the first input is the string "+yzx". In this case, the + sign indicates that we will define how far to route in each direction, instead of routing directly to point_2. The order y, z, x means that we want to route first in the y direction, then the z direction and lastly in the x direction. The next input to the vector is [15, 8, -20]. These are the distances we want to route in the y, z, and x directions respectively. Finally, the vector [1, 2, 0] calls upon index numbers of the desired channel sizes from our dimensions_matrix. It is VERY important that the index numbers correspond to the correct routing direction as shown here.

//The next line of the connect_matrix starts with just the string "zxy", meaning that we will route directly to point_2 in the z direction first, then x and finally y. We then input our previously defined point_2 and the corresponding indeces from the dimensions_matrix. In this case we chose to use larger channels.

connect_matrix =
[

    ["+yx", [15, 5], [1, 0]], //move in the y direction 15 units, then -20 units in the x direction
    ["+yx", [-15, 5], [1, 0]],
    ["+yx", [15, 5], [1, 0]],
    ["+yx", [-15, 5], [1, 0]],
    ["+yx", [15, 5], [1, 0]],
    ["+yx", [-15, 5], [1, 0]],
    ["+yx", [15, 5], [1, 0]],
    ["+yx", [-15, 5], [1, 0]],
    ["+yx", [15, 5], [1, 0]],
    ["+yx", [-15, 5], [1, 0]],
    ["+yx", [15, 5], [1, 0]],
    ["+yx", [-15, 5], [1, 0]],

];

//Now that all the setup is complete, we only need to call upon the actual routing function and input our initial point (point_1), the connect_matrix, and the dimensions matrix.

routing(point_1, connect_matrix, dimensions_matrix);