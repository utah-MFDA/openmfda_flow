translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_85*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, -5, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, -4, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, -3, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, -7, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, -6, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, -10, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, -8, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, -4, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 85 from thing.dead_bead to $_85*/
			translate(v = [0.5, -4.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 19 from thing.dead_bead to $_19*/
			translate(v = [0.5, -3.5, -4.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 39 from thing.dead_bead to $_39*/
			translate(v = [0.5, -2.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 85 from $_85 to thing.dead_cell*/
			translate(v = [1.5, -5.5, -5.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 41 from thing.dead_cell to $_41*/
			translate(v = [0.5, -6.5, -6.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_38__0 to $_38__1*/
			translate(v = [1.5, -5.5, 5.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_40__0 to $_40__1*/
			translate(v = [1.5, -8.5, -9.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_36__0 to $_36__1*/
			translate(v = [1.5, -7.5, 3.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_37__0 to $_37__1*/
			translate(v = [1.5, -3.5, 2.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 1*/
	union() {
		%/*Nodes shell 1*/
		union() {
			/*Node thing.dead_bead*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, -4, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.dead_cell*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, -6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, -6, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, -9, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, -8, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, -4, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge -1 from $_37 to $_37__1*/
			translate(v = [1.5, -3.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 82 from $_82 to thing.dead_cell*/
			translate(v = [1.5, -5.5, -5.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 84 from $_84 to thing.dead_bead*/
			translate(v = [1.5, -3.5, -3.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 86 from $_86 to thing.dead_cell*/
			translate(v = [1.5, -5.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_40 to $_40__1*/
			translate(v = [1.5, -8.5, -9.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_38__1 to $_38__2*/
			translate(v = [2.5, -4.5, 4.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_36__1 to $_36__2*/
			translate(v = [2.5, -6.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_27*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -9, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_70*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -9, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_28*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -7, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_71*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -7, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_29*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -8, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_22*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -5, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_26*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -4, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_20*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -9, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_21*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -8, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_82*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -7, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_23*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -7, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_84*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -5, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -9, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_86*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -7, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -8, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, -5, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, -7, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 27 from thing.chamber[1].thingy.p0 to $_27*/
			translate(v = [2.5, -8.5, -2.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 70 from thing.chamber[1].thingy.p0 to $_70*/
			translate(v = [2.5, -8.5, -3.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 28 from thing.chamber[1].thingy.p1 to $_28*/
			translate(v = [2.5, -6.5, -2.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 71 from thing.chamber[1].thingy.p1 to $_71*/
			translate(v = [2.5, -6.5, -3.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 71 from $_71 to thing.chamber[1].thingy.p2*/
			translate(v = [3.5, -7.5, -3.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 29 from thing.chamber[1].thingy.p2 to $_29*/
			translate(v = [2.5, -7.5, -4.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 22 from thing.chamber[1].thingy.v12 to $_22*/
			translate(v = [2.5, -4.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 26 from thing.chamber[1].thingy.v13 to $_26*/
			translate(v = [2.5, -3.5, 1.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 37 from thing.chamber[1].thingy.v13 to $_37*/
			translate(v = [2.5, -2.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 20 from thing.chamber[1].thingy.v3 to $_20*/
			translate(v = [2.5, -8.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 21 from thing.chamber[1].thingy.v7 to $_21*/
			translate(v = [2.5, -7.5, -6.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 82 from thing.chamber[1].thingy.v7 to $_82*/
			translate(v = [2.5, -6.5, -5.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 23 from thing.chamber[1].thingy.v9 to $_23*/
			translate(v = [2.5, -6.5, -1.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 84 from thing.chamber[1].thingy.v9 to $_84*/
			translate(v = [2.5, -4.5, -2.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 5 from thing.dead_buffer to $_5*/
			translate(v = [2.5, -8.5, -8.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 86 from thing.dead_buffer to $_86*/
			translate(v = [2.5, -6.5, -6.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 40 from thing.dead_buffer to $_40*/
			translate(v = [2.5, -7.5, -8.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_38__2 to $_38__3*/
			translate(v = [3.5, -3.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_36__2 to $_36__3*/
			translate(v = [3.5, -5.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union() {
			/*Node thing.chamber[1].thingy.p0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -10, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.p1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -8, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.p2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -8, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v12*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -4, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v13*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -10, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v7*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -8, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v9*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -6, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.dead_buffer*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -8, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, -4, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, -6, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 42 from $_42 to thing.chamber[1].thingy.p0*/
			translate(v = [3.5, -9.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 45 from $_45 to thing.chamber[1].thingy.p1*/
			translate(v = [3.5, -7.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 47 from $_47 to thing.chamber[1].thingy.p2*/
			translate(v = [3.5, -7.5, -3.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 55 from $_55 to thing.chamber[1].thingy.v12*/
			translate(v = [3.5, -3.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 38 from $_38 to thing.chamber[1].thingy.v12*/
			translate(v = [3.5, -3.5, 2.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_38 to $_38__3*/
			translate(v = [3.5, -3.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 56 from $_56 to thing.chamber[1].thingy.v13*/
			translate(v = [3.5, -3.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_36 to $_36__3*/
			translate(v = [3.5, -5.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from thing.chamber[1].thingy.p0 to $_69*/
			translate(v = [4.5, -8.5, -2.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 69 from $_69 to thing.chamber[1].thingy.p1*/
			translate(v = [3.5, -7.5, -2.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 69 from $_69 to thing.chamber[1].thingy.p2*/
			translate(v = [3.5, -7.5, -3.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from $_69 to thing.chamber[1].thingy.v3*/
			translate(v = [3.5, -9.5, -3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from $_74 to thing.chamber[1].thingy.v9*/
			translate(v = [3.5, -5.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 75 from $_75 to thing.chamber[1].thingy.v12*/
			translate(v = [3.5, -3.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 75 from $_75 to thing.chamber[1].thingy.v13*/
			translate(v = [3.5, -3.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from $_76 to thing.chamber[1].thingy.v3*/
			translate(v = [3.5, -9.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from $_77 to thing.chamber[1].thingy.v3*/
			translate(v = [3.5, -9.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from $_77 to thing.chamber[1].thingy.v7*/
			translate(v = [3.5, -7.5, -5.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 80 from $_80 to thing.dead_buffer*/
			translate(v = [3.5, -7.5, -7.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 81 from $_81 to thing.chamber[1].thingy.v7*/
			translate(v = [3.5, -7.5, -5.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 83 from $_83 to thing.chamber[1].thingy.v9*/
			translate(v = [3.5, -5.5, -1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*Node $_13*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -10, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -11, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_44*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -9, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -7, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_45*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -7, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_46*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -8, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -8, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -8, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -4, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_55*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -3, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_56*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_69*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -9, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -7, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_74*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -7, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_75*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -5, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_76*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -11, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_77*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -9, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_78*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -7, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_79*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -7, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_80*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -7, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_81*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -8, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_83*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -6, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 13 from thing.chamber[0].thingy.p0 to $_13*/
			translate(v = [4.5, -9.5, -4.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 42 from thing.chamber[0].thingy.p0 to $_42*/
			translate(v = [4.5, -10.5, -3.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 44 from thing.chamber[0].thingy.p0 to $_44*/
			translate(v = [4.5, -8.5, -3.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 14 from thing.chamber[0].thingy.p1 to $_14*/
			translate(v = [4.5, -6.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 45 from thing.chamber[0].thingy.p1 to $_45*/
			translate(v = [4.5, -6.5, -3.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 46 from thing.chamber[0].thingy.p1 to $_46*/
			translate(v = [4.5, -7.5, -3.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 46 from $_46 to thing.chamber[0].thingy.p2*/
			translate(v = [5.5, -8.5, -3.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 15 from thing.chamber[0].thingy.p2 to $_15*/
			translate(v = [4.5, -7.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 47 from thing.chamber[0].thingy.p2 to $_47*/
			translate(v = [4.5, -7.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 8 from thing.chamber[0].thingy.v12 to $_8*/
			translate(v = [4.5, -3.5, 3.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 55 from thing.chamber[0].thingy.v12 to $_55*/
			translate(v = [4.5, -2.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 38 from thing.chamber[0].thingy.v12 to $_38*/
			translate(v = [4.5, -2.5, 2.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 12 from thing.chamber[0].thingy.v13 to $_12*/
			translate(v = [4.5, -2.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 56 from thing.chamber[0].thingy.v13 to $_56*/
			translate(v = [4.5, -2.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 36 from thing.chamber[0].thingy.v13 to $_36*/
			translate(v = [4.5, -4.5, 0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 69 from $_69 to thing.chamber[1].thingy.v10*/
			translate(v = [5.5, -7.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 24 from thing.chamber[1].thingy.v10 to $_24*/
			translate(v = [4.5, -6.5, -2.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from thing.chamber[1].thingy.v10 to $_74*/
			translate(v = [4.5, -6.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from $_74 to thing.chamber[1].thingy.v11*/
			translate(v = [5.5, -5.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from $_74 to thing.chamber[1].thingy.v8*/
			translate(v = [5.5, -5.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 25 from thing.chamber[1].thingy.v11 to $_25*/
			translate(v = [4.5, -6.5, 0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 75 from thing.chamber[1].thingy.v11 to $_75*/
			translate(v = [4.5, -4.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from thing.chamber[1].thingy.v2 to $_76*/
			translate(v = [4.5, -10.5, -4.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from thing.chamber[1].thingy.v2 to $_77*/
			translate(v = [4.5, -8.5, -4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from $_77 to thing.chamber[1].thingy.v6*/
			translate(v = [5.5, -7.5, -5.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 78 from thing.chamber[1].thingy.v4 to $_78*/
			translate(v = [4.5, -6.5, -7.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 78 from $_78 to thing.chamber[1].thingy.v5*/
			translate(v = [5.5, -7.5, -7.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 79 from thing.chamber[1].thingy.v5 to $_79*/
			translate(v = [4.5, -6.5, -6.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 80 from thing.chamber[1].thingy.v5 to $_80*/
			translate(v = [4.5, -6.5, -8.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 79 from $_79 to thing.chamber[1].thingy.v6*/
			translate(v = [5.5, -7.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 81 from thing.chamber[1].thingy.v6 to $_81*/
			translate(v = [4.5, -7.5, -6.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 83 from thing.chamber[1].thingy.v8 to $_83*/
			translate(v = [4.5, -5.5, -1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*Node thing.chamber[0].thingy.p0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -10, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.p1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -8, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.p2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -9, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.v12*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -4, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.v13*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v10*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -8, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v11*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -10, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -8, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v5*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -8, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v6*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -8, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v8*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -6, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 43 from thing.chamber[0].thingy.p0 to $_43*/
			translate(v = [6.5, -8.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 43 from $_43 to thing.chamber[0].thingy.p1*/
			translate(v = [5.5, -7.5, -3.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 43 from $_43 to thing.chamber[0].thingy.p2*/
			translate(v = [5.5, -8.5, -3.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 51 from $_51 to thing.chamber[1].thingy.v10*/
			translate(v = [5.5, -7.5, -1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 53 from $_53 to thing.chamber[1].thingy.v11*/
			translate(v = [5.5, -5.5, 0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 54 from $_54 to thing.chamber[0].thingy.v12*/
			translate(v = [5.5, -3.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 54 from $_54 to thing.chamber[0].thingy.v13*/
			translate(v = [5.5, -3.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 62 from $_62 to thing.chamber[1].thingy.v4*/
			translate(v = [5.5, -7.5, -6.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from $_64 to thing.chamber[1].thingy.v4*/
			translate(v = [5.5, -7.5, -6.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 65 from $_65 to thing.chamber[1].thingy.v6*/
			translate(v = [5.5, -7.5, -5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 67 from $_67 to thing.chamber[1].thingy.v8*/
			translate(v = [5.5, -5.5, -1.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 68 from $_68 to thing.chamber[1].thingy.v8*/
			translate(v = [5.5, -5.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from $_72 to thing.chamber[1].thingy.v2*/
			translate(v = [5.5, -9.5, -5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 73 from $_73 to thing.chamber[1].thingy.v2*/
			translate(v = [5.5, -9.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from $_73 to thing.chamber[1].thingy.v4*/
			translate(v = [5.5, -7.5, -6.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 73 from $_73 to thing.chamber[1].thingy.v5*/
			translate(v = [5.5, -7.5, -7.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*Node $_43*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -9, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -6, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -9, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_51*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, -8, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_53*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_54*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -5, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_57*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -8, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_59*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, -9, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_62*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -7, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_64*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, -7, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_65*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -7, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_67*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -7, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_68*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_72*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -9, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_73*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -9, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*Edge 43 from $_43 to thing.chamber[0].thingy.v10*/
			translate(v = [7.5, -7.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 43 from $_43 to thing.chamber[0].thingy.v3*/
			translate(v = [7.5, -7.5, -3.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 6 from thing.chamber[0].thingy.v1 to $_6*/
			translate(v = [6.5, -5.5, -5.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 48 from thing.chamber[0].thingy.v1 to $_48*/
			translate(v = [6.5, -5.5, -6.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 48 from $_48 to thing.chamber[0].thingy.v2*/
			translate(v = [7.5, -6.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 10 from thing.chamber[0].thingy.v10 to $_10*/
			translate(v = [6.5, -8.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 51 from thing.chamber[0].thingy.v10 to $_51*/
			translate(v = [6.5, -7.5, -1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 11 from thing.chamber[0].thingy.v11 to $_11*/
			translate(v = [6.5, -6.5, 0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 53 from thing.chamber[0].thingy.v11 to $_53*/
			translate(v = [6.5, -4.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 54 from thing.chamber[0].thingy.v11 to $_54*/
			translate(v = [6.5, -4.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 57 from thing.chamber[0].thingy.v2 to $_57*/
			translate(v = [6.5, -7.5, -4.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 57 from $_57 to thing.chamber[0].thingy.v3*/
			translate(v = [7.5, -7.5, -3.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 59 from thing.chamber[0].thingy.v3 to $_59*/
			translate(v = [6.5, -8.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from $_59 to thing.chamber[1].thingy.v1*/
			translate(v = [7.5, -7.5, -5.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 62 from thing.chamber[0].thingy.v5 to $_62*/
			translate(v = [6.5, -6.5, -7.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 64 from thing.chamber[0].thingy.v7 to $_64*/
			translate(v = [6.5, -6.5, -6.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 65 from thing.chamber[0].thingy.v7 to $_65*/
			translate(v = [6.5, -6.5, -5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 67 from thing.chamber[0].thingy.v9 to $_67*/
			translate(v = [6.5, -6.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 68 from thing.chamber[0].thingy.v9 to $_68*/
			translate(v = [6.5, -4.5, -0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 72 from thing.chamber[1].thingy.v1 to $_72*/
			translate(v = [6.5, -8.5, -5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 73 from thing.chamber[1].thingy.v1 to $_73*/
			translate(v = [6.5, -8.5, -6.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 7*/
	union() {
		%/*Nodes shell 7*/
		union() {
			/*Node thing.chamber[0].thingy.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -6, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.v10*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -8, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.v11*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -7, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.v3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -8, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.v5*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -6, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.v7*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.v9*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[1].thingy.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -8, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*Edge 49 from thing.chamber[0].thingy.v1 to $_49*/
			translate(v = [8.5, -6.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from thing.chamber[0].thingy.v1 to $_50*/
			translate(v = [8.5, -5.5, -6.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 49 from $_49 to thing.chamber[1].thingy.v1*/
			translate(v = [7.5, -7.5, -5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 50 from $_50 to thing.chamber[0].thingy.v2*/
			translate(v = [7.5, -6.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from $_50 to thing.chamber[0].thingy.v5*/
			translate(v = [7.5, -5.5, -7.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 52 from thing.chamber[0].thingy.v10 to $_52*/
			translate(v = [8.5, -6.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 52 from $_52 to thing.chamber[0].thingy.v11*/
			translate(v = [7.5, -5.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 52 from $_52 to thing.chamber[0].thingy.v9*/
			translate(v = [7.5, -5.5, -0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 58 from thing.chamber[0].thingy.v2 to $_58*/
			translate(v = [8.5, -6.5, -4.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 58 from $_58 to thing.chamber[0].thingy.v3*/
			translate(v = [7.5, -7.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 58 from $_58 to thing.chamber[0].thingy.v7*/
			translate(v = [7.5, -5.5, -5.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 60 from $_60 to thing.chamber[0].thingy.v5*/
			translate(v = [7.5, -5.5, -7.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 61 from thing.chamber[0].thingy.v5 to $_61*/
			translate(v = [8.5, -4.5, -6.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from $_63 to thing.chamber[0].thingy.v7*/
			translate(v = [7.5, -5.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 66 from $_66 to thing.chamber[0].thingy.v9*/
			translate(v = [7.5, -5.5, -0.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 8*/
	union() {
		%/*Nodes shell 8*/
		union() {
			/*Node $_49*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, -7, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, -6, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, -7, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_58*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, -7, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -4, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_60*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -5, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_61*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -5, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_63*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -7, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_66*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -5, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -5, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_2*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -6, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -6, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -5, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -5, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*Edge 49 from $_49 to thing.elute*/
			translate(v = [9.5, -5.5, -4.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 49 from $_49 to thing.lysis*/
			translate(v = [9.5, -6.5, -4.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 49 from $_49 to thing.wash*/
			translate(v = [9.5, -5.5, -6.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from $_50 to thing.chamber[0].thingy.v4*/
			translate(v = [9.5, -4.5, -7.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 52 from $_52 to thing.chamber[0].thingy.v8*/
			translate(v = [9.5, -5.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 58 from $_58 to thing.chamber[0].thingy.v6*/
			translate(v = [9.5, -5.5, -5.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 7 from thing.chamber[0].thingy.v4 to $_7*/
			translate(v = [8.5, -3.5, -8.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 60 from thing.chamber[0].thingy.v4 to $_60*/
			translate(v = [8.5, -4.5, -8.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 61 from $_61 to thing.chamber[0].thingy.v6*/
			translate(v = [9.5, -5.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from thing.chamber[0].thingy.v6 to $_63*/
			translate(v = [8.5, -6.5, -6.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 9 from thing.chamber[0].thingy.v8 to $_9*/
			translate(v = [8.5, -4.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 66 from thing.chamber[0].thingy.v8 to $_66*/
			translate(v = [8.5, -5.5, 0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 4 from thing.elute to $_4*/
			translate(v = [8.5, -4.5, -4.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 18 from thing.elute to $_18*/
			translate(v = [8.5, -4.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 2 from thing.lysis to $_2*/
			translate(v = [8.5, -5.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 16 from thing.lysis to $_16*/
			translate(v = [8.5, -5.5, -4.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 3 from thing.wash to $_3*/
			translate(v = [8.5, -4.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 17 from thing.wash to $_17*/
			translate(v = [8.5, -4.5, -7.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 9*/
	union() {
		%/*Nodes shell 9*/
		union() {
			/*Node thing.chamber[0].thingy.v4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -5, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.v6*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.chamber[0].thingy.v8*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.elute*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -6, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.lysis*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -7, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.wash*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -6, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*Edge 31 from thing.chamber[0].thingy.v4 to $_31*/
			translate(v = [10.5, -4.5, -6.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 32 from thing.chamber[0].thingy.v6 to $_32*/
			translate(v = [10.5, -5.5, -5.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 30 from thing.chamber[0].thingy.v8 to $_30*/
			translate(v = [10.5, -5.5, 0.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 35 from thing.elute to $_35*/
			translate(v = [10.5, -6.5, -4.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 33 from thing.lysis to $_33*/
			translate(v = [10.5, -7.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 34 from thing.wash to $_34*/
			translate(v = [10.5, -4.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 10*/
	union() {
		%/*Nodes shell 10*/
		union() {
			/*Node $_31*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, -5, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, -6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_30*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, -6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, -7, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, -8, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, -5, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union();
	}
}
