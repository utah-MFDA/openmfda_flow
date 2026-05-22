// ^^^ routing and px/layer defines are added at runtime ^^^ //

module serpentine_25px_0(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px, 23*px, 0])
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [30*px, 30*px+14*px], [1, 0]]
                    ]
        );

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-3*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -3*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-3*30*px - xpos*px, -3*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_25px_0(0, 0, 0, "N");
//serpentine_25px_0(90, 0, 0, "FN");
//serpentine_25px_0(180, 0, 0, "FS");
//serpentine_25px_0(270, 0, 0, "S");

module serpentine_50px_0(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px, 23*px, 0])
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [60*px, 30*px], [1, 0]],
                    ["+yx", [-60*px, 30*px+14*px], [1, 0]]
                    ]
        );

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-4*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -4*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-4*30*px - xpos*px, -4*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_50px_0(0, 0, 0, "N");
//serpentine_50px_0(120, 0, 0, "FN");
//serpentine_50px_0(240, 0, 0, "FS");
//serpentine_50px_0(360, 0, 0, "S");

module serpentine_75px_0(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px, 23*px, 0])
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [90*px, 30*px], [1, 0]],
                    ["+yx", [-90*px, 30*px], [1, 0]],
                    ["+yx", [90*px, 30*px+14*px], [1, 0]]
                    ]
        );

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-5*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -5*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-5*30*px - xpos*px, -5*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_75px_0(0, 0, 0, "N");
//serpentine_75px_0(150, 0, 0, "FN");
//serpentine_75px_0(300, 0, 0, "FS");
//serpentine_75px_0(450, 0, 0, "S");

module serpentine_100px_0(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px, 23*px, 0])
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [120*px, 30*px], [1, 0]],
                    ["+yx", [-120*px, 30*px], [1, 0]],
                    ["+yx", [120*px, 30*px], [1, 0]],
                    ["+yx", [-120*px, 30*px+14*px], [1, 0]]
                    ]
        );

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-6*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -6*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-6*30*px - xpos*px, -6*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_100px_0(0, 0, 0, "N");
//serpentine_100px_0(180, 0, "FN");
//serpentine_100px_0(360, 0, "FS");
//serpentine_100px_0(540, 0, "S");

module serpentine_150px_0(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px, 23*px, 0])
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [180*px, 30*px], [1, 0]],
                    ["+yx", [-180*px, 30*px], [1, 0]],
                    ["+yx", [180*px, 30*px], [1, 0]],
                    ["+yx", [-180*px, 30*px], [1, 0]],
                    ["+yx", [180*px, 30*px], [1, 0]],
                    ["+yx", [-180*px, 30*px+14*px], [1, 0]]
                    ]
        );

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-8*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -8*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-8*30*px - xpos*px, -8*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_150px_0(0, 0, 0, "N");
//serpentine_150px_0(240, 0, 0, "FN");
//serpentine_150px_0(480, 0, 0, "FS");
//serpentine_150px_0(720, 0, 0, "S");

module serpentine_200px_0(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px, 23*px, 0])
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [240*px, 30*px], [1, 0]],
                    ["+yx", [-240*px, 30*px], [1, 0]],
                    ["+yx", [240*px, 30*px], [1, 0]],
                    ["+yx", [-240*px, 30*px], [1, 0]],
                    ["+yx", [240*px, 30*px], [1, 0]],
                    ["+yx", [-240*px, 30*px], [1, 0]],
                    ["+yx", [240*px, 30*px], [1, 0]],
                    ["+yx", [-240*px, 30*px+14*px], [1, 0]]
                    ]
        );

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-10*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -10*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-10*30*px - xpos*px, -10*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_200px_0(0, 0, 0, "N");
//serpentine_200px_0(300, 0, 0, "FN");
//serpentine_200px_0(600, 0, 0, "FS");
//serpentine_200px_0(900, 0, 0, "S");

module serpentine_200px_3(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px+30*px, 23*px, 0]){
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [-30*px, 0, lpv*layer],
                pf = [
                        ["+x", 30*px, 0],
                        ["+yx", [240*px, 30*px], [1, 0]],
                        ["+yx", [-240*px, 30*px], [1, 0]],
                        ["+yx", [240*px, 30*px], [1, 0]],
                        ["+yx", [-240*px, 30*px], [1, 0]],
                        ["+yx", [240*px, 30*px], [1, 0]],
                        ["+yx", [-240*px, 30*px], [1, 0]],
                        ["+yx", [240*px, 30*px], [1, 0]],
                        ["+yz", [-240*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [7*30*px, 0, 2*lpv*layer],
                pf = [
                        ["+yx", [240*px, -30*px], [1, 0]],
                        ["+yx", [-240*px, -30*px], [1, 0]],
                        ["+yx", [240*px, -30*px], [1, 0]],
                        ["+yx", [-240*px, -30*px], [1, 0]],
                        ["+yx", [240*px, -30*px], [1, 0]],
                        ["+yx", [-240*px, -30*px], [1, 0]],
                        ["+yx", [240*px, -30*px], [1, 0]],
                        ["+yz", [-240*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [0, 0, 3*lpv*layer],
                pf = [
                        ["+yx", [240*px, 30*px], [1, 0]],
                        ["+yx", [-240*px, 30*px], [1, 0]],
                        ["+yx", [240*px, 30*px], [1, 0]],
                        ["+yx", [-240*px, 30*px], [1, 0]],
                        ["+yx", [240*px, 30*px], [1, 0]],
                        ["+yx", [-240*px, 30*px], [1, 0]],
                        ["+yx", [240*px, 30*px], [1, 0]],
                        ["+yz", [-240*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [7*30*px, 0, 4*lpv*layer],
                pf = [
                        ["+yx", [240*px, -30*px], [1, 0]],
                        ["+yx", [-240*px, -30*px], [1, 0]],
                        ["+yx", [240*px, -30*px], [1, 0]],
                        ["+yx", [-240*px, -30*px], [1, 0]],
                        ["+yx", [240*px, -30*px], [1, 0]],
                        ["+yx", [-240*px, -30*px], [1, 0]],
                        ["+yx", [240*px, -30*px], [1, 0]],
                        ["+yx", [-240*px, -30*px], [1, 0]]
                        ]
            );
        }

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-10*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -10*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-10*30*px - xpos*px, -10*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_200px_3(0, 0, 0, "N");
//serpentine_200px_3(300, 0, 0, "FN");
//serpentine_200px_3(600, 0, 0, "FS");
//serpentine_200px_3(900, 0, 0, "S");

module serpentine_300px_0(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px, 23*px, 0])
        routing(
            dimm = [
                    [[0, 0], [0, 14*px], [0, 10*layer]],
                    [[0, 14*px], [0, 0], [0, 10*layer]]
                    ],
            p0 = [0, 0, 0],
            pf = [
                    ["+yx", [360*px, 30*px], [1, 0]],
                    ["+yx", [-360*px, 30*px], [1, 0]],
                    ["+yx", [360*px, 30*px], [1, 0]],
                    ["+yx", [-360*px, 30*px], [1, 0]],
                    ["+yx", [360*px, 30*px], [1, 0]],
                    ["+yx", [-360*px, 30*px], [1, 0]],
                    ["+yx", [360*px, 30*px], [1, 0]],
                    ["+yx", [-360*px, 30*px], [1, 0]],
                    ["+yx", [360*px, 30*px], [1, 0]],
                    ["+yx", [-360*px, 30*px], [1, 0]],
                    ["+yx", [360*px, 30*px], [1, 0]],
                    ["+yx", [-360*px, 30*px+14*px], [1, 0]]
                    ]
        );

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-14*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -14*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-14*30*px - xpos*px, -14*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_300px_0(0, 0, 0, "N");
//serpentine_300px_0(420, 0, 0, "FN");
//serpentine_300px_0(840, 0, 0, "FS");
//serpentine_300px_0(1260, 0, 0, "S");

module serpentine_300px_1(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px+30*px, 23*px, 0]){
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [0, 0, lpv*layer],
                pf = [
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yz", [-360*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [11*30*px, 0, 2*lpv*layer],
                pf = [
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]]
                        ]
            );
        }

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-14*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -14*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-14*30*px - xpos*px, -14*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_300px_1(0, 0, 0, "N");
//serpentine_300px_1(420, 0, 0, "FN");
//serpentine_300px_1(840, 0, 0, "FS");
//serpentine_300px_1(1260, 0, 0, "S");

module serpentine_300px_2(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px+30*px, 23*px, 0]){
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [-30*px, 0, lpv*layer],
                pf = [
                        ["+x", 30*px, 0],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yz", [-360*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [11*30*px, 0, 2*lpv*layer],
                pf = [
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yz", [-360*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [0, 0, 3*lpv*layer],
                pf = [
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px+14*px], [1, 0]]
                        ]
            );
        }

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-15*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -14*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-15*30*px - xpos*px, -14*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_300px_2(0, 0, 0, "N");
//serpentine_300px_2(420, 0, 0, "FN");
//serpentine_300px_2(2*420, 0, 0, "FS");
//serpentine_300px_2(3*420, 0, 0, "S");

module serpentine_300px_3(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px+30*px, 23*px, 0]){
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [0, 0, lpv*layer],
                pf = [
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yz", [-360*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [11*30*px, 0, 2*lpv*layer],
                pf = [
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yz", [-360*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [0, 0, 3*lpv*layer],
                pf = [
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yz", [-360*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [11*30*px, 0, 4*lpv*layer],
                pf = [
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]]
                        ]
            );
        }

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-14*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -14*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-14*30*px - xpos*px, -14*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_300px_3(0, 0, 0, "N");
//serpentine_300px_3(420, 0, 0, "FN");
//serpentine_300px_3(2*420, 0, 0, "FS");
//serpentine_300px_3(3*420, 0, 0, "S");

module serpentine_300px_4(xpos, ypos, zpos, orientation){

    // Sub-modules
    module obj(){
        translate([23*px+30*px, 23*px, 0]){
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [-30*px, 0, lpv*layer],
                pf = [
                        ["+x", 30*px, 0],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yz", [-360*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [11*30*px, 0, 2*lpv*layer],
                pf = [
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yz", [-360*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [0, 0, 3*lpv*layer],
                pf = [
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yz", [-360*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [11*30*px, 0, 4*lpv*layer],
                pf = [
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yx", [-360*px, -30*px], [1, 0]],
                        ["+yx", [360*px, -30*px], [1, 0]],
                        ["+yz", [-360*px, lpv*layer], [1, 2]]
                        ]
            );
            routing(
                dimm = [
                        [[0, 0], [0, 14*px], [0, 10*layer]],
                        [[0, 14*px], [0, 0], [0, 10*layer]],
                        [[0, 14*px], [0, 14*px], [0, 0]]
                        ],
                p0 = [0, 0, 5*lpv*layer],
                pf = [
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 30*px], [1, 0]],
                        ["+yx", [360*px, 30*px], [1, 0]],
                        ["+yx", [-360*px, 25*px+14*px], [1, 0]]
                        ]
            );
        }

    }

    if (orientation == "N"){
        translate([xpos*px, ypos*px, zpos*layer])
        obj();
    }
        if (orientation == "FN"){
        mirror([1, 0, 0])
        translate([-15*30*px - xpos*px, ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([xpos*px, -14*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-15*30*px - xpos*px, -14*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//serpentine_300px_4(0, 0, 0, "N");
//serpentine_300px_4(420, 0, 0, "FN");
//serpentine_300px_4(2*420, 0, 0, "FS");
//serpentine_300px_4(3*420, 0, 0, "S");


module diffmix_25px_0(xpos, ypos, zpos, orientation){

    // Channel Dimensions
    hchan = 10*layer;
    Wchan = 14*px;

    dim  = [
            [[0,0],[-Wchan/2,Wchan/2],[0,hchan]], // 0
            [[-Wchan/2,Wchan/2],[0,0],[0,hchan]], // 1

           ];

    module obj(){
        pi_0 = [-7*px, 30*px, 0];
        pf_0 = [Wchan+16*px, 0, 0];
        connect_0 = [
                     ["+x", pf_0, 0]
                    ];
        routing(pi_0, connect_0, dim);

        pi_1 = [-7*px, 0*px, 0];
        pf_1 = [Wchan, 0, 0];
        connect_1 = [
                     ["+x", pf_1, 0]
                    ];
        routing(pi_1, connect_1, dim);

        pi_2 = [23*px, 30*px, 0];
        pf_2 = [Wchan, 0, 0];
        connect_2 = [
                     ["+x", pf_2, 0]
                    ];
        routing(pi_2, connect_2, dim);

        pi_3 = [0, 0, 0];
        pf_3 = [42.4*px, 0, 0];
        connect_3 = [
                     ["+x", pf_3, 0]
                    ];
        rotate(45)
        routing(pi_3, connect_3, dim);

    }

    if (orientation == "N"){
        translate([30*px + xpos*px, 30*px + ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FN"){
        mirror([1,0,0])
        translate([-2*30*px - xpos*px, 30*px + ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([30*px + xpos*px, -2*30*px - ypos*px, zpos*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([1,0,0])
        mirror([0, 1, 0])
        translate([-2*30*px - xpos*px, -2*30*px - ypos*px, zpos*layer])
        obj();
    }

}

// Test
//diffmix_25px_0(0, 0, 0, "N");
//diffmix_25px_0(90, 0, 0, "FN");
//diffmix_25px_0(2*90, 0, 0, "FS");
//diffmix_25px_0(3*90, 0, 0, "S");

module pinhole_325px_0(xpos, ypos, zpos, orientation){

    // Parameters
    d_pin   = 140*px;   // ~= 106*layer = 1.06mm;
    l_pin   = 260*px;   // ~= 2.00mm
    h_cone  = 67*px;    // ~= 0.46mm

    module obj(){
        rotate([-90, 0, 0]){
            translate([0, 0, l_pin]){
                cylinder(h = h_cone, d1 = d_pin, d2 = 0);
            }
        cylinder(d = d_pin, h = l_pin);
        }
    }

    if (orientation == "bottom"){
        translate([xpos*px, ypos*px, zpos*layer + 5 * layer])
        obj();
    }

    if (orientation == "left"){
        rotate([0, 0, -90])
        translate([-ypos*px, xpos*px, zpos*layer + 5 * layer])
        obj();
    }

    if (orientation == "top"){
        rotate([0, 0, -180])
        translate([-xpos*px, -ypos*px, zpos*layer + 5 * layer])
        obj();
    }

    if (orientation == "right"){
        rotate([0, 0, 90])
        translate([ypos*px, -xpos*px, zpos*layer+ 5 * layer])
        obj();
    }

}

// Test
//pinhole_325px_0 (0, -320, 100, "bottom");
//pinhole_325px_0 (-320, 0, 100, "left");
//pinhole_325px_0 (0, 320, 100, "top");
//pinhole_325px_0 (320, 0, 100, "right");

module interconnect_32channel(xpos, ypos, zpos){
    gasket_side_length = 40*px;
    gasket_aperture_length = 20*px;
    gasket_height = 1*layer;

    gasket_grid = [2, 2];
    block_gasket_offset = 155*px;
    block_height_default = 200*layer;
    block_long_side = 600*px;
    block_short_side = 399*px;
    gasket_offset = 50*px;

    pedestal_x = 780*px;
    pedestal_y = 380*px;
    pedestal_height = 100*px;

    channel_width_thick = 20 * px;
    channel_width_default = 12*px;

    module zchan(l, xy = channel_width_default) {
        color("lightblue")
        translate([-xy / 2, -xy / 2, 0]) {
            if (l < 0)
                mirror([0, 0, 1])
            cube([xy, xy, -l]);
            else
            cube([xy, xy, l]);
        }
    }

    module gasket(
        gasket_side_length=gasket_side_length,
        aperture_side_length=gasket_aperture_length,
        height=gasket_height
        ){

            gasket_width = (gasket_side_length - aperture_side_length)/2;
            difference(){
                cube([gasket_side_length, gasket_side_length, height]);
                translate([gasket_width, gasket_width, 0])
                    cube([aperture_side_length, aperture_side_length, height]);
        }
    }

    module interconnect(
        gasket_grid=gasket_grid,
        gasket_side_length=gasket_side_length,
        aperture_side_length=gasket_aperture_length,
        gasket_height=gasket_height,
        gasket_offset = gasket_offset,
        block_gasket_offset=block_gasket_offset,
        block_height=block_height_default,
        block_long_side=block_long_side,
        block_short_side=block_short_side,
        ccim=false, // Flag to use the CCIM type of microgasket (SIM is the default)
        for_interface_chip=false // Interface chips are printed upside down for the burning layers to not clog entrance channels, also the gasket grid is displayed transparent
        ){
        gasket_group_x_lenght = gasket_grid[1] * gasket_side_length + (gasket_grid[1]-1) * gasket_offset;
        gasket_group_y_lenght = gasket_grid[0] * gasket_side_length + (gasket_grid[0]-1) * gasket_offset;
        x_centering_offset = gasket_group_x_lenght/2;
        y_centering_offset = gasket_group_y_lenght/2;
        if (ccim){
            cube([1, 1, 1]); // This section should implement an interconnect structure that uses SSIMs instead of SIMs (see 2018 paper for reference)
        }
        else {
            flip_angle = for_interface_chip ? 180:0;
            diff_interface_blocks = for_interface_chip ? 0:50*layer;
            rotate([flip_angle, 0, 0]){
                // Gasket grid
                translate([-x_centering_offset, -y_centering_offset, 0]){
                    for (row=[0:gasket_grid[1]-1]){
                        for (col=[0:gasket_grid[0]-1]){
                            translate([(gasket_side_length + gasket_offset)*row, (gasket_side_length + gasket_offset)*col, 0])
                            if (for_interface_chip){
                                %gasket(gasket_side_length=gasket_side_length, aperture_side_length=aperture_side_length, height=gasket_height);
                            }
                            else {
                                gasket(gasket_side_length=gasket_side_length, aperture_side_length=aperture_side_length, height=gasket_height);
                            }
                        }
                    }
                }
                // Right block
                translate([x_centering_offset + block_gasket_offset, -block_long_side/2, -pedestal_height])
                    cube([block_short_side, block_long_side, block_height - diff_interface_blocks]);
                // Left block
                translate([-x_centering_offset - block_gasket_offset - block_short_side, -block_long_side/2, -pedestal_height])
                    cube([block_short_side, block_long_side, block_height - diff_interface_blocks]);
            }
        }
    }

    module corner_connections(){
        for (row=[0.5, 1.5]) {
            for (col=[-0.5, -1.5, -2.5, -3.5]) {
                x_offset_outchan = col*gasket_side_length + col*gasket_offset;
                y_offset_outchan = row*gasket_side_length + row*gasket_offset;
                translate([x_offset_outchan, y_offset_outchan, 0])
                    zchan(pedestal_height+gasket_height, xy=channel_width_thick);
            }
        }
    }

    module obj(){
        difference(){
            translate([-pedestal_x/2, -pedestal_y/2, 0])
                cube([pedestal_x, pedestal_y, pedestal_height]);
            corner_connections();
            translate([4*(gasket_side_length+gasket_offset), 0, 0]){
                corner_connections();
            }
            translate([0, -2*(gasket_side_length+gasket_offset), 0]){
                corner_connections();
            }
            translate([4*(gasket_side_length+gasket_offset), -2*(gasket_side_length+gasket_offset), 0]){
                corner_connections();
            }
        }

        translate([0, 0, pedestal_height])
            interconnect(gasket_grid=[4, 8], for_interface_chip=false);
        }

    translate([xpos*px, ypos*px, zpos*layer]){
        obj();
    }

}

//interconnect_32channel(0, 0, 0);

module marker(xpos, ypos, zpos){
    marker_height = 80*layer;
    marker_diameter = 200*px;

    module obj(){
        cylinder(h = marker_height, d = marker_diameter);
    }

    translate([xpos, ypos, zpos]){
        obj();
    }
}

module empty_obj(str_obj){

}

////////////////////////// NEEDS FIX /////////////////////////////////////////

module valve_20px_1(xpos, ypos, zpos, orientation){

    // Parameteres
    h_fluid = 2*layer;
    t_memb = layer;
    h_air = 4*layer;
    h_total = h_fluid + t_memb + h_air;
    d_valve = 20*px;

    // Valve connection channels
    xychan0 = 6*px;
    xychan = 8*px;
    hchan = 5*layer;
    wchan = 8*px;

    dimm        =   [
                        [[0,0],[-wchan/2,wchan/2],[0, hchan]], // 0
                        [[-wchan/2,wchan/2],[0,0],[0, hchan]], // 1
                        [[-xychan/2,xychan/2],[-xychan/2,xychan/2],[0,0]], // 2
                        [[-xychan0/2,xychan0/2],[-xychan0/2,xychan0/2],[0,0]], // 3
                    ];

    overlap_v_xy  = 2*px;

    module obj(){
    // Fluid compartment
    color("CadetBlue")
    cylinder(d = d_valve, h = h_fluid);

    // Air compartment
    color("SteelBlue")
    translate([0,0,h_fluid + t_memb])
    cylinder(d = d_valve, h = h_air);

    // Fluid in channel connection
    pt_fluid_in         = [0, 0, 0];
    pt_fluid_in_next    = [
                            ["+z", -7*layer, 3],
                          ];

    routing(pt_fluid_in,pt_fluid_in_next, dimm);

    // Fluid out channel connection
    pt_fluid_out        = [d_valve/2 - overlap_v_xy, 0, 1*layer - hchan];
    pt_fluid_out_next   = [
                            ["+x", 50*px],
                          ];

    routing(pt_fluid_out,pt_fluid_out_next, dimm);

    // Air control channel connection
    pt_air_control      = [-d_valve/2 - xychan/2 + 6*px, 0, h_total];
    pt_air_control_next = [
                            ["+zx", [10*layer, -50*px]],
                          ];

    routing(pt_air_control,pt_air_control_next, dimm);

    // Air flushing channel connection
    pt_air_flush        = [d_valve/2 + xychan/2 - 6*px, 0, h_total];
    pt_air_flush_next   = [
                            ["+zy", [10*layer, 50*px], [2,1]],
                          ];

    routing(pt_air_flush,pt_air_flush_next, dimm);
    }

    if (orientation == "N"){
        translate([68*px + xpos*px, 20*px + ypos*px, 7*layer])
        obj();
    }
    if (orientation == "FN"){
        mirror([1,0,0])
        translate([-68*px - xpos*px, 20*px + ypos*px, 7*layer])
        obj();
    }
    if (orientation == "FS"){
        mirror([0, 1, 0])
        translate([68*px + xpos*px, -60*px - ypos*px, 7*layer])
        obj();
    }
    if (orientation == "S"){
        mirror([0, 1, 0])
        mirror([1, 0, 0])
        translate([-68*px - xpos*px, -60*px - ypos*px, 7*layer])
        obj();
    }

}

// Test
//valve_20px_0(0, 0, "N");
//valve_20px_0(75, 0, "FN");
//valve_20px_0(150, 0, "FS");
//valve_20px_0(225, 0, "S");

// ^^^ routing and px/layer defines are added at runtime ^^^ //

// Parameters
// max size of the object: 19.45mm x 12.16mm x 11cm (x x y)

$fa = 1;
$fs = 0.04;

// Bulk size
bulk_x = 2500 * px; // 19mm
bulk_y = 1579 * px; // 12mm
bulk_z = 500 * layer; // 5mm

gasket_side_length = 50*px;
gasket_aperture_length = 20*px;
gasket_height = 1*layer;

gasket_grid = [2, 2];
block_gasket_offset = 150*px;
block_height = 200*layer;
block_long_side = 600*px;
block_short_side = 400*px;
gasket_offset = 40*px;

channel_width_thick = 20 * px;
channel_height_thick = 15 * layer;
channel_width_default = 12*px;
channel_height_default = 10*layer;

marker_height = 80*layer;
marker_diameter = 200*px;

module xchan(l, w = channel_width_default, h = channel_height_default) {
    color("lightblue")
    if (l < 0)
        mirror([1, 0, 0])
    translate([0, -floor(w / px / 2) * px, 0]) cube([-l, w, h]);
    else
    translate([0, -floor(w / px / 2) * px, 0]) cube([l, w, h]);
}

module ychan(l, w = channel_width_default, h = channel_height_default) {
    color("lightblue")
    if (l < 0)
        mirror([0, -1, 0])
    translate([-floor(w / px / 2) * px, 0, 0]) cube([w, -l, h]);
    else
    translate([-floor(w / px / 2) * px, 0, 0]) cube([w, l, h]);
}

module zchan(l, xy = channel_width_default) {
    color("lightblue")
    translate([-xy / 2, -xy / 2, 0]) {
        if (l < 0)
            mirror([0, 0, 1])
        cube([xy, xy, -l]);
        else
        cube([xy, xy, l]);
    }
}

module pinhole(d=106*layer, l=200*px, orth=0, ychan_z_angle=0) {
    // This module operates on a standard of 10um layers and 7.6 um pixels
    rotate([-90, 0, orth]){
        union(){
            cylinder(d = d, h = l, $fn = 100);
            translate([0, 0, l])
                cylinder(h=150*px, r1=d/4, r2=2*layer, $fn = 100);
        }
    }
}

module gasket(
    gasket_side_length=gasket_side_length,
    aperture_side_length=gasket_aperture_length,
    height=gasket_height
    ){

        gasket_width = (gasket_side_length - aperture_side_length)/2;
        difference(){
            cube([gasket_side_length, gasket_side_length, height]);
            translate([gasket_width, gasket_width, 0])
                cube([aperture_side_length, aperture_side_length, height]);
    }
}

module interconnect(
    gasket_grid=gasket_grid,
    gasket_side_length=gasket_side_length,
    aperture_side_length=gasket_aperture_length,
    gasket_height=gasket_height,
    gasket_offset = gasket_offset,
    block_gasket_offset=block_gasket_offset,
    block_height=block_height,
    block_long_side=block_long_side,
    block_short_side=block_short_side,
    ccim=false, // Flag to use the CCIM type of microgasket (SIM is the default)
    for_interface_chip=false // Interface chips are printed upside down for the burning layers to not clog entrance channels, also the gasket grid is displayed transparent
    ){
    gasket_group_x_lenght = gasket_grid[1] * gasket_side_length + (gasket_grid[1]-1) * gasket_offset;
    gasket_group_y_lenght = gasket_grid[0] * gasket_side_length + (gasket_grid[0]-1) * gasket_offset;
    x_centering_offset = gasket_group_x_lenght/2;
    y_centering_offset = gasket_group_y_lenght/2;
    if (ccim){
        cube([1, 1, 1]); // This section should implement an interconnect structure that uses SSIMs instead of SIMs (see 2018 paper for reference)
    }
    else {
        flip_angle = for_interface_chip ? 180:0;
        diff_interface_blocks = for_interface_chip ? 0:50*layer;
        rotate([flip_angle, 0, 0]){
            // Gasket grid
            translate([-x_centering_offset, -y_centering_offset, 0]){
                for (row=[0:gasket_grid[1]-1]){
                    for (col=[0:gasket_grid[0]-1]){
                        translate([(gasket_side_length + gasket_offset)*row, (gasket_side_length + gasket_offset)*col, 0])
                        if (for_interface_chip){
                            %gasket(gasket_side_length=gasket_side_length, aperture_side_length=aperture_side_length, height=gasket_height);
                        }
                        else {
                            gasket(gasket_side_length=gasket_side_length, aperture_side_length=aperture_side_length, height=gasket_height);
                        }
                    }
                }
            }
            // Right block
            translate([x_centering_offset + block_gasket_offset, -block_long_side/2, -block_height/3])
                cube([block_short_side, block_long_side, block_height - diff_interface_blocks]);
            // Left block
            translate([-x_centering_offset - block_gasket_offset - block_short_side, -block_long_side/2, -block_height/3])
                cube([block_short_side, block_long_side, block_height - diff_interface_blocks]);
        }
    }
}

module corner_connections(){
    // ========================== ROW 1 ==========================
    {
        // (1, 1) Path
        {
            1_1_x_offset_pinhole = 1*bulk_x/7;
            1_1_y_offset_pinhole = bulk_y;
            1_1_z_offset_pinhole = 1*bulk_z/3;
            translate([1_1_x_offset_pinhole, 1_1_y_offset_pinhole, 1_1_z_offset_pinhole])
                pinhole(orth=180);
            translate([1_1_x_offset_pinhole, 1_1_y_offset_pinhole, 1_1_z_offset_pinhole - channel_height_thick/2])
                ychan(-470*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_1_x_offset_pinhole - channel_width_thick/2, 1_1_y_offset_pinhole - 470*px, 1_1_z_offset_pinhole - channel_height_thick/2])
                xchan(628*px-71*px+35*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_1_x_offset_pinhole - channel_width_thick/2 + 619*px - 71*px + 35*px, 1_1_y_offset_pinhole - 470*px + channel_width_thick/2, 1_1_z_offset_pinhole - channel_height_thick/2])
                ychan(-215*px+15*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1_1_x_offset_pinhole - channel_width_thick/2 + 619*px - 71*px + 35*px, 1_1_y_offset_pinhole - 340*px + channel_width_thick/2 - 335*px + 15*px, 1_1_z_offset_pinhole - channel_height_thick/2])
                    zchan(250*layer, xy=channel_width_thick);
                translate([1_1_x_offset_pinhole - channel_width_thick/2 + 624*px -71*px + 35*px, 1_1_y_offset_pinhole - 345*px + channel_width_thick/2 - 335*px + 15*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (1, 2) Path
        {
            1_2_x_offset_pinhole = 1*bulk_x/7;
            1_2_y_offset_pinhole = bulk_y;
            1_2_z_offset_pinhole = 2*bulk_z/3;
            translate([1_2_x_offset_pinhole, 1_2_y_offset_pinhole, 1_2_z_offset_pinhole])
                pinhole(orth=180);
            translate([1_2_x_offset_pinhole, 1_2_y_offset_pinhole, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-470*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_2_x_offset_pinhole - channel_width_thick/2, 1_2_y_offset_pinhole - 470*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                xchan(700*px-51*px+22*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_2_x_offset_pinhole - channel_width_thick/2 + 700*px - 51*px + 22*px, 1_2_y_offset_pinhole - 470*px + channel_width_thick/2, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-215*px+15*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1_2_x_offset_pinhole - channel_width_thick/2 + 700*px -51*px + 22*px, 1_2_y_offset_pinhole - 340*px + channel_width_thick/2 - 335*px + 15*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                    zchan(83*layer, xy=channel_width_thick);
                translate([1_2_x_offset_pinhole - channel_width_thick/2 + 705*px - 51*px + 22*px, 1_2_y_offset_pinhole - 345*px + channel_width_thick/2 - 335*px + 15*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (1, 3) Path
        {
            1_3_x_offset_pinhole = 2*bulk_x/7;
            1_3_y_offset_pinhole = bulk_y;
            1_3_z_offset_pinhole = 2*bulk_z/3;
            translate([1_3_x_offset_pinhole, 1_3_y_offset_pinhole, 1_3_z_offset_pinhole])
                pinhole(orth=180);
            translate([1_3_x_offset_pinhole, 1_3_y_offset_pinhole, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-410*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_3_x_offset_pinhole - channel_width_thick/2, 1_3_y_offset_pinhole - 410*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                xchan(430*px-31*px+11*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_3_x_offset_pinhole - channel_width_thick/2 + 422*px - 31*px + 11*px, 1_3_y_offset_pinhole - 410*px + channel_width_thick/2, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-275*px+15*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1_3_x_offset_pinhole - channel_width_thick/2 + 422*px - 31*px + 11*px, 1_3_y_offset_pinhole - 340*px + channel_width_thick/2 - 335*px + 15*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                    zchan(83*layer, xy=channel_width_thick);
                translate([1_3_x_offset_pinhole - channel_width_thick/2 + 427*px - 31*px + 11*px, 1_3_y_offset_pinhole - 345*px + channel_width_thick/2 - 335*px + 15*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (1, 4) Path
        {
            1_4_x_offset_pinhole = 3*bulk_x/7;
            1_4_y_offset_pinhole = bulk_y;
            1_4_z_offset_pinhole = 2*bulk_z/3;
            translate([1_4_x_offset_pinhole, 1_4_y_offset_pinhole, 1_4_z_offset_pinhole])
                pinhole(orth=180);
            translate([1_4_x_offset_pinhole, 1_4_y_offset_pinhole, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-350*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_4_x_offset_pinhole - channel_width_thick/2, 1_4_y_offset_pinhole - 350*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                xchan(150*px-11*px+1*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_4_x_offset_pinhole - channel_width_thick/2 + 145*px - 11*px + 1*px, 1_4_y_offset_pinhole - 350*px + channel_width_thick/2, 1_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-335*px+15*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1_4_x_offset_pinhole - channel_width_thick/2 + 145*px - 11*px + 1*px, 1_4_y_offset_pinhole - 340*px + channel_width_thick/2 - 335*px + 15*px, 1_4_z_offset_pinhole - channel_height_thick/2])
                    zchan(83*layer, xy=channel_width_thick);
                translate([1_4_x_offset_pinhole - channel_width_thick/2 + 150*px - 11*px + 1*px, 1_4_y_offset_pinhole - 345*px + channel_width_thick/2 - 335*px + 15*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }
    }

    // ========================== ROW 2 ==========================
    {
        // (2, 1) Path -> side pinhole top
        {
            2_1_x_offset_pinhole = 0;
            2_1_y_offset_pinhole = 5*bulk_y/8;
            2_1_z_offset_pinhole = 2*bulk_z/3;
            translate([2_1_x_offset_pinhole, 2_1_y_offset_pinhole, 2_1_z_offset_pinhole])
                pinhole(orth=-90);
            translate([2_1_x_offset_pinhole, 2_1_y_offset_pinhole, 2_1_z_offset_pinhole - channel_height_thick/2])
                xchan(500*px, w=channel_width_thick, h=channel_height_thick);
            translate([500*px, 2_1_y_offset_pinhole + channel_height_thick/2, 2_1_z_offset_pinhole - channel_height_thick/2])
                ychan(-160*px+10*px, w=channel_width_thick, h=channel_height_thick);
            translate([500*px - channel_height_thick/2, 2_1_y_offset_pinhole + channel_height_thick/2 - 163*px + 10*px -5*px, 2_1_z_offset_pinhole - channel_height_thick/2])
                xchan(485*px-71*px+35*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([976*px - channel_height_thick/2 - 71*px + 35*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 163*px + 10*px - 5*px, 2_1_z_offset_pinhole - channel_height_thick/2])
                    zchan(83*layer, xy=channel_width_thick);
                translate([981*px - channel_height_thick/2 - 71*px + 35*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 168*px + 10*px - 5*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (2, 2) Path -> side pinhole bottom
        {
            2_2_x_offset_pinhole = 0;
            2_2_y_offset_pinhole = 5*bulk_y/8;
            2_2_z_offset_pinhole = 1*bulk_z/3;
            translate([2_2_x_offset_pinhole, 2_2_y_offset_pinhole, 2_2_z_offset_pinhole])
                pinhole(orth=-90);
            translate([2_1_x_offset_pinhole, 2_1_y_offset_pinhole, 2_2_z_offset_pinhole - channel_height_thick/2])
                xchan(500*px, w=channel_width_thick, h=channel_height_thick);
            translate([500*px, 2_1_y_offset_pinhole + channel_height_thick/2, 2_2_z_offset_pinhole - channel_height_thick/2])
                ychan(-160*px+10*px, w=channel_width_thick, h=channel_height_thick);
            translate([500*px - channel_height_thick/2, 2_1_y_offset_pinhole + channel_height_thick/2 - 163*px + 10*px - 5*px, 2_2_z_offset_pinhole - channel_height_thick/2])
                xchan(550*px-51*px + 22*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1056*px - channel_height_thick/2 - 51*px + 22*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 163*px + 10*px - 5*px, 2_2_z_offset_pinhole - channel_height_thick/2])
                    zchan(250*layer, xy=channel_width_thick);
                translate([1061*px - channel_height_thick/2 - 51*px + 22*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 168*px + 10*px - 5*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (2, 3) Path
        {
            2_3_x_offset_pinhole = 2*bulk_x/7;
            2_3_y_offset_pinhole = bulk_y;
            2_3_z_offset_pinhole = 1*bulk_z/3;
            translate([2_3_x_offset_pinhole, 2_3_y_offset_pinhole, 2_3_z_offset_pinhole])
                pinhole(orth=180);
            translate([2_3_x_offset_pinhole, 2_3_y_offset_pinhole, 2_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-410*px, w=channel_width_thick, h=channel_height_thick);
            translate([2_3_x_offset_pinhole - channel_width_thick/2, 2_3_y_offset_pinhole - 410*px, 2_4_z_offset_pinhole - channel_height_thick/2])
                xchan(430*px-31*px+11*px, w=channel_width_thick, h=channel_height_thick);
            translate([2_3_x_offset_pinhole - channel_width_thick/2 + 422*px - 31*px +11*px, 2_3_y_offset_pinhole - 410*px + channel_width_thick/2, 2_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-355*px + 10*px - 5*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([2_3_x_offset_pinhole - channel_width_thick/2 + 422*px -31*px +11*px, 2_3_y_offset_pinhole - 420*px + channel_width_thick/2 - 335*px + 10*px - 5*px, 2_4_z_offset_pinhole - channel_height_thick/2])
                    zchan(250*layer, xy=channel_width_thick);
                translate([2_3_x_offset_pinhole - channel_width_thick/2 + 427*px -31*px+11*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 168*px + 10*px - 5*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }

        // (2, 4) Path
        {
            2_4_x_offset_pinhole = 3*bulk_x/7;
            2_4_y_offset_pinhole = bulk_y;
            2_4_z_offset_pinhole = 1*bulk_z/3;
            translate([2_4_x_offset_pinhole, 2_4_y_offset_pinhole, 2_4_z_offset_pinhole])
                pinhole(orth=180);
            translate([1_4_x_offset_pinhole, 1_4_y_offset_pinhole, 2_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-350*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_4_x_offset_pinhole - channel_width_thick/2, 1_4_y_offset_pinhole - 350*px, 2_4_z_offset_pinhole - channel_height_thick/2])
                xchan(150*px-11*px, w=channel_width_thick, h=channel_height_thick);
            translate([1_4_x_offset_pinhole - channel_width_thick/2 + 145*px - 11*px + 1*px, 1_4_y_offset_pinhole - 350*px + channel_width_thick/2, 2_4_z_offset_pinhole - channel_height_thick/2])
                ychan(-415*px + 10*px-5*px, w=channel_width_thick, h=channel_height_thick);
            hull(){
                translate([1_4_x_offset_pinhole - channel_width_thick/2 + 145*px - 11*px + 1*px, 1_4_y_offset_pinhole - 420*px + channel_width_thick/2 - 335*px + 10*px -5*px, 2_4_z_offset_pinhole - channel_height_thick/2])
                    zchan(250*layer, xy=channel_width_thick);
                translate([1_4_x_offset_pinhole - channel_width_thick/2 + 150*px - 11*px + 1*px, 2_1_y_offset_pinhole + channel_height_thick/2 - 168*px + 10*px - 5*px, bulk_z - 175*layer])
                    zchan(175*layer, xy=10*px);
            }
        }
    }

}

module flushing_interface(transparent=true) {
    if (transparent){
        // Bulk
        %cube([bulk_x, bulk_y, bulk_z]);

        // Interconnects
        translate([bulk_x/2, bulk_y/2, bulk_z])
            interconnect(gasket_grid=[4,8], for_interface_chip=true);

        // ======> Connection nomenclature: (row, column) <====== // (1,1) == top left, (4,8) == bottom right

        // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ TOP HALF +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        {
            // @@@@@@@@@@@@@@@ TOP LEFT QUARTER @@@@@@@@@@@@@@@
            corner_connections();

            // @@@@@@@@@@@@@@@ TOP RIGHT QUARTER @@@@@@@@@@@@@@@
            translate([bulk_x, 0, 0]){
                mirror([bulk_x/2, 0, 0]){
                    corner_connections();
                }
            }
        }

        // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ BOTTOM HALF ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        {
            translate([0, bulk_y, 0]){
                mirror([0, bulk_y/2, 0]){
                    // @@@@@@@@@@@@@@@ BOTTOM LEFT QUARTER @@@@@@@@@@@@@@@
                    corner_connections();

                    // @@@@@@@@@@@@@@@ BOTTOM RIGHT QUARTER @@@@@@@@@@@@@@@
                    translate([bulk_x, 0, 0]){
                        mirror([bulk_x/2, 0, 0]){
                            corner_connections();
                        }
                    }
                }
            }
        }
    }
    else {
        difference(){
            cube([bulk_x, bulk_y, bulk_z]);

            translate([marker_diameter, bulk_y-marker_diameter, bulk_z-marker_height])
            cylinder(h = marker_height, d = marker_diameter);

            // Interconnects
            translate([bulk_x/2, bulk_y/2, bulk_z])
                interconnect(gasket_grid=[4,8], for_interface_chip=true);

            // ======> Connection nomenclature: (row, column) <====== // (1,1) == top left, (4,8) == bottom right

            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ TOP HALF +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            {
                // @@@@@@@@@@@@@@@ TOP LEFT QUARTER @@@@@@@@@@@@@@@
                corner_connections();

                // @@@@@@@@@@@@@@@ TOP RIGHT QUARTER @@@@@@@@@@@@@@@
                translate([bulk_x, 0, 0]){
                    mirror([bulk_x/2, 0, 0]){
                        corner_connections();
                    }
                }
            }

            // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++ BOTTOM HALF ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            {
                translate([0, bulk_y, 0]){
                    mirror([0, bulk_y/2, 0]){
                        // @@@@@@@@@@@@@@@ BOTTOM LEFT QUARTER @@@@@@@@@@@@@@@
                        corner_connections();

                        // @@@@@@@@@@@@@@@ BOTTOM RIGHT QUARTER @@@@@@@@@@@@@@@
                        translate([bulk_x, 0, 0]){
                            mirror([bulk_x/2, 0, 0]){
                                corner_connections();
                            }
                        }
                    }
                }
            }
        }
    }
}
