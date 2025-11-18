translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_28*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3, 3, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 28 from thing.pump_flush1_hole to $_28*/
			translate(v = [-2.5, 3.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 1*/
	union() {
		%/*Nodes shell 1*/
		union() {
			/*Node thing.pump_flush1_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-4, 4, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge 64 from thing.pump_flush1_hole to $_64*/
			translate(v = [-4.5, 5.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_14*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5, 5, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5, 5, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_64*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5, 5, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_29*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-4, 5, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 14 from thing.pump1_hole to $_14*/
			translate(v = [-4.5, 5.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 27 from thing.pump_flush0_hole to $_27*/
			translate(v = [-4.5, 5.5, 12.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 64 from $_64 to thing.thing.chamber[1].thingy.p1*/
			translate(v = [-5.5, 6.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 29 from thing.pump_flush2_hole to $_29*/
			translate(v = [-3.5, 5.5, 14.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union() {
			/*Node thing.pump1_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-6, 6, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump_flush0_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-6, 6, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump_flush2_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-5, 6, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.p1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6, 6, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 61 from thing.pump1_hole to $_61*/
			translate(v = [-6.5, 7.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from thing.pump_flush0_hole to $_63*/
			translate(v = [-6.5, 7.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 65 from thing.pump_flush2_hole to $_65*/
			translate(v = [-5.5, 7.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from $_69 to thing.thing.chamber[1].thingy.p1*/
			translate(v = [-5.5, 6.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 96 from $_96 to thing.thing.chamber[1].thingy.p1*/
			translate(v = [-5.5, 6.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 97 from thing.thing.chamber[1].thingy.p1 to $_97*/
			translate(v = [-6.5, 6.5, 14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
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
				translate(v = [-7, 6, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_61*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7, 7, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7, 7, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_63*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7, 7, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_65*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-6, 7, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_69*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7, 7, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_96*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7, 7, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_97*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7, 6, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 13 from thing.pump0_hole to $_13*/
			translate(v = [-6.5, 6.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 61 from $_61 to thing.thing.chamber[0].thingy.p1*/
			translate(v = [-7.5, 8.5, 15.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 15 from thing.pump2_hole to $_15*/
			translate(v = [-6.5, 7.5, 16.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 63 from $_63 to thing.thing.chamber[1].thingy.p0*/
			translate(v = [-7.5, 8.5, 13.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 65 from $_65 to thing.thing.chamber[1].thingy.p2*/
			translate(v = [-7.5, 8.5, 14.5]) {
				rotate(a = [0, 65.9051574478893, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 69 from thing.thing.chamber[0].thingy.p1 to $_69*/
			translate(v = [-6.5, 7.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 96 from thing.thing.chamber[1].thingy.p0 to $_96*/
			translate(v = [-6.5, 7.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 97 from $_97 to thing.thing.chamber[1].thingy.p2*/
			translate(v = [-7.5, 8.5, 14.5]) {
				rotate(a = [0, 90.0, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*Node thing.pump0_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-8, 7, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump2_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-8, 8, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.p1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 8, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.p0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 8, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.p2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 8, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.r1c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 8, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 60 from thing.pump0_hole to $_60*/
			translate(v = [-8.5, 8.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 62 from thing.pump2_hole to $_62*/
			translate(v = [-8.5, 9.5, 16.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 66 from $_66 to thing.thing.chamber[1].thingy.p0*/
			translate(v = [-7.5, 8.5, 13.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 68 from $_68 to thing.thing.chamber[0].thingy.p1*/
			translate(v = [-7.5, 8.5, 15.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 70 from thing.thing.chamber[0].thingy.p1 to $_70*/
			translate(v = [-8.5, 9.5, 15.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 71 from $_71 to thing.thing.chamber[1].thingy.p2*/
			translate(v = [-7.5, 8.5, 14.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 95 from thing.thing.chamber[1].thingy.p0 to $_95*/
			translate(v = [-8.5, 9.5, 13.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 95 from $_95 to thing.thing.chamber[1].thingy.r1c*/
			translate(v = [-7.5, 8.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 98 from thing.thing.chamber[1].thingy.p2 to $_98*/
			translate(v = [-7.5, 9.5, 13.5]) {
				rotate(a = [0, 45.00000000000001, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 98 from $_98 to thing.thing.chamber[1].thingy.r1c*/
			translate(v = [-7.5, 8.5, 12.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*Node $_11*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-6, 9, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-8, 9, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_60*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9, 8, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_62*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9, 9, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_66*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9, 8, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_68*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 8, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_70*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 9, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_71*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9, 9, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_95*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 9, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_98*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8, 9, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_102*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 9, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_106*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7, 9, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-8, 9, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*Edge 11 from thing.bead_trap_ctrl_hole to $_11*/
			translate(v = [-5.5, 9.5, 15.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 10 from thing.loop_exit_ctrl_hole to $_10*/
			translate(v = [-7.5, 9.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 60 from $_60 to thing.thing.chamber[0].thingy.p0*/
			translate(v = [-9.5, 9.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 62 from $_62 to thing.thing.chamber[0].thingy.p2*/
			translate(v = [-9.5, 10.5, 15.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 66 from thing.thing.chamber[0].thingy.p0 to $_66*/
			translate(v = [-8.5, 8.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 68 from thing.thing.chamber[0].thingy.p0 to $_68*/
			translate(v = [-8.5, 8.5, 14.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 70 from $_70 to thing.thing.chamber[0].thingy.p2*/
			translate(v = [-9.5, 10.5, 15.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 71 from thing.thing.chamber[0].thingy.p2 to $_71*/
			translate(v = [-8.5, 9.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 95 from $_95 to thing.thing.chamber[1].thingy.v3*/
			translate(v = [-9.5, 10.5, 13.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 98 from $_98 to thing.thing.chamber[1].thingy.v10*/
			translate(v = [-7.5, 10.5, 14.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 102 from thing.thing.chamber[1].thingy.r3c to $_102*/
			translate(v = [-8.5, 9.5, 12.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 102 from $_102 to thing.thing.chamber[1].thingy.v2*/
			translate(v = [-9.5, 10.5, 12.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 106 from thing.thing.chamber[1].thingy.v10 to $_106*/
			translate(v = [-6.5, 9.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 6 from thing.vertical_ctrl_hole to $_6*/
			translate(v = [-7.5, 9.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 7*/
	union() {
		%/*Nodes shell 7*/
		union() {
			/*Node thing.bead_trap_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-7, 10, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.loop_exit_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-9, 10, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.p0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 9, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.p2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 10, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r1c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 10, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.r2c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 10, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.r3c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 9, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.r4c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 10, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v10*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 10, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 10, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 10, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.vertical_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-9, 10, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*Edge 45 from thing.bead_trap_ctrl_hole to $_45*/
			translate(v = [-6.5, 11.5, 17.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 57 from thing.loop_exit_ctrl_hole to $_57*/
			translate(v = [-9.5, 11.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from thing.thing.chamber[0].thingy.p0 to $_67*/
			translate(v = [-10.5, 9.5, 15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 67 from $_67 to thing.thing.chamber[0].thingy.r1c*/
			translate(v = [-9.5, 10.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from thing.thing.chamber[0].thingy.p2 to $_72*/
			translate(v = [-8.5, 11.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from $_72 to thing.thing.chamber[0].thingy.r1c*/
			translate(v = [-9.5, 10.5, 14.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 79 from $_79 to thing.vertical_ctrl_hole*/
			translate(v = [-8.5, 10.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 80 from $_80 to thing.thing.chamber[1].thingy.v2*/
			translate(v = [-9.5, 10.5, 12.5]) {
				rotate(a = [0, 35.26438968275464, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 80 from $_80 to thing.thing.chamber[1].thingy.v3*/
			translate(v = [-9.5, 10.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 82 from $_82 to thing.thing.chamber[1].thingy.v10*/
			translate(v = [-7.5, 10.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 99 from thing.thing.chamber[1].thingy.r2c to $_99*/
			translate(v = [-8.5, 11.5, 12.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 100 from thing.thing.chamber[1].thingy.r2c to $_100*/
			translate(v = [-7.5, 11.5, 13.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 99 from $_99 to thing.thing.chamber[1].thingy.v2*/
			translate(v = [-9.5, 10.5, 12.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 99 from $_99 to thing.thing.chamber[1].thingy.v3*/
			translate(v = [-9.5, 10.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 101 from thing.thing.chamber[1].thingy.r3c to $_101*/
			translate(v = [-10.5, 9.5, 14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 103 from thing.thing.chamber[1].thingy.r4c to $_103*/
			translate(v = [-8.5, 11.5, 15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 104 from thing.thing.chamber[1].thingy.r4c to $_104*/
			translate(v = [-8.5, 11.5, 17.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 103 from $_103 to thing.thing.chamber[1].thingy.v10*/
			translate(v = [-7.5, 10.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 105 from $_105 to thing.thing.chamber[1].thingy.v2*/
			translate(v = [-9.5, 10.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 105 from $_105 to thing.thing.chamber[1].thingy.v3*/
			translate(v = [-9.5, 10.5, 13.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 8*/
	union() {
		%/*Nodes shell 8*/
		union() {
			/*Node $_9*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7, 11, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_45*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7, 11, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-6, 11, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11, 11, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11, 11, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11, 10, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_57*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-10, 11, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_2*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9, 11, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_67*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11, 9, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_72*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 11, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_74*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11, 10, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_76*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11, 10, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_78*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8, 11, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_79*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-10, 11, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_80*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-11, 11, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_82*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9, 11, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_83*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9, 11, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_90*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-11, 9, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_91*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11, 9, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_92*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11, 11, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_94*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8, 11, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_99*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 11, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_100*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8, 11, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_101*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11, 9, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_103*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 11, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_104*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 11, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_105*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-11, 11, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_107*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-10, 11, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_111*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-10, 11, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_112*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-8, 11, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_115*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-10, 11, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11, 11, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7, 11, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*Edge 9 from thing.bead_ctrl_hole to $_9*/
			translate(v = [-6.5, 11.5, 14.5]) {
				rotate(a = [0, 90.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 45 from $_45 to thing.thing.chamber[0].thingy.v11*/
			translate(v = [-6.5, 12.5, 18.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 12 from thing.collect_ctrl_hole to $_12*/
			translate(v = [-5.5, 11.5, 15.5]) {
				rotate(a = [0, 90.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 5 from thing.dead_end_ctrl_hole to $_5*/
			translate(v = [-10.5, 11.5, 16.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 4 from thing.elute_ctrl_hole to $_4*/
			translate(v = [-10.5, 11.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 7 from thing.horiz_ctrl_hole to $_7*/
			translate(v = [-10.5, 10.5, 12.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 57 from $_57 to thing.thing.chamber[0].thingy.v10*/
			translate(v = [-9.5, 12.5, 14.5]) {
				rotate(a = [0, 45.00000000000001, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 2 from thing.lysis_ctrl_hole to $_2*/
			translate(v = [-8.5, 11.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from $_67 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [-11.5, 10.5, 15.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 72 from $_72 to thing.thing.chamber[0].thingy.v10*/
			translate(v = [-9.5, 12.5, 14.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 74 from thing.thing.chamber[0].thingy.r2c to $_74*/
			translate(v = [-10.5, 10.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from $_74 to thing.thing.chamber[0].thingy.v7*/
			translate(v = [-11.5, 12.5, 13.5]) {
				rotate(a = [0, 65.9051574478893, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 76 from thing.thing.chamber[0].thingy.r3c to $_76*/
			translate(v = [-10.5, 10.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from $_76 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [-11.5, 10.5, 14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 78 from thing.thing.chamber[0].thingy.r4c to $_78*/
			translate(v = [-7.5, 11.5, 16.5]) {
				rotate(a = [0, 144.73561031724537, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 78 from $_78 to thing.thing.chamber[0].thingy.v11*/
			translate(v = [-6.5, 12.5, 18.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 78 from $_78 to thing.thing.chamber[0].thingy.v9*/
			translate(v = [-7.5, 12.5, 16.5]) {
				rotate(a = [0, 90.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 79 from thing.thing.chamber[0].thingy.v1 to $_79*/
			translate(v = [-9.5, 11.5, 14.5]) {
				rotate(a = [0, 90.0, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 80 from thing.thing.chamber[0].thingy.v1 to $_80*/
			translate(v = [-10.5, 11.5, 14.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 79 from $_79 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [-11.5, 10.5, 14.5]) {
				rotate(a = [0, 90.0, 26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 79 from $_79 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [-11.5, 10.5, 15.5]) {
				rotate(a = [0, 114.09484255211072, 26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 80 from $_80 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [-11.5, 10.5, 14.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 80 from $_80 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [-11.5, 10.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 80 from $_80 to thing.thing.chamber[1].thingy.v1*/
			translate(v = [-11.5, 11.5, 14.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 82 from thing.thing.chamber[0].thingy.v10 to $_82*/
			translate(v = [-8.5, 11.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 83 from thing.thing.chamber[0].thingy.v11 to $_83*/
			translate(v = [-8.5, 11.5, 18.5]) {
				rotate(a = [0, 90.0, 26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 83 from $_83 to thing.thing.chamber[1].thingy.v11*/
			translate(v = [-9.5, 12.5, 18.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 90 from thing.thing.chamber[0].thingy.v5 to $_90*/
			translate(v = [-10.5, 9.5, 12.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 91 from thing.thing.chamber[0].thingy.v5 to $_91*/
			translate(v = [-10.5, 9.5, 13.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 91 from $_91 to thing.thing.chamber[1].thingy.v4*/
			translate(v = [-9.5, 12.5, 15.5]) {
				rotate(a = [0, 122.31153323742386, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 92 from thing.thing.chamber[0].thingy.v7 to $_92*/
			translate(v = [-10.5, 11.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 92 from $_92 to thing.thing.chamber[1].thingy.v6*/
			translate(v = [-9.5, 12.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 94 from thing.thing.chamber[0].thingy.v9 to $_94*/
			translate(v = [-7.5, 11.5, 15.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 94 from $_94 to thing.thing.chamber[1].thingy.v8*/
			translate(v = [-8.5, 12.5, 16.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 99 from $_99 to thing.thing.chamber[1].thingy.v6*/
			translate(v = [-9.5, 12.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 100 from $_100 to thing.thing.chamber[1].thingy.v7*/
			translate(v = [-8.5, 12.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 101 from $_101 to thing.thing.chamber[1].thingy.v1*/
			translate(v = [-11.5, 11.5, 14.5]) {
				rotate(a = [0, 90.0, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 101 from $_101 to thing.thing.chamber[1].thingy.v4*/
			translate(v = [-9.5, 12.5, 15.5]) {
				rotate(a = [0, 107.54840061379231, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 103 from $_103 to thing.thing.chamber[1].thingy.v8*/
			translate(v = [-8.5, 12.5, 16.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 104 from $_104 to thing.thing.chamber[1].thingy.v11*/
			translate(v = [-9.5, 12.5, 18.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 104 from $_104 to thing.thing.chamber[1].thingy.v9*/
			translate(v = [-9.5, 12.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 105 from thing.thing.chamber[1].thingy.v1 to $_105*/
			translate(v = [-10.5, 11.5, 13.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 107 from thing.thing.chamber[1].thingy.v11 to $_107*/
			translate(v = [-9.5, 11.5, 17.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 111 from thing.thing.chamber[1].thingy.v4 to $_111*/
			translate(v = [-9.5, 11.5, 13.5]) {
				rotate(a = [0, 26.56505117707799, 90.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 111 from $_111 to thing.thing.chamber[1].thingy.v6*/
			translate(v = [-9.5, 12.5, 13.5]) {
				rotate(a = [0, 90.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 111 from $_111 to thing.thing.chamber[1].thingy.v7*/
			translate(v = [-8.5, 12.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 112 from thing.thing.chamber[1].thingy.v5 to $_112*/
			translate(v = [-7.5, 11.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 115 from thing.thing.chamber[1].thingy.v8 to $_115*/
			translate(v = [-9.5, 11.5, 16.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 115 from $_115 to thing.thing.chamber[1].thingy.v9*/
			translate(v = [-9.5, 12.5, 16.5]) {
				rotate(a = [0, 90.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 3 from thing.wash_ctrl_hole to $_3*/
			translate(v = [-10.5, 11.5, 15.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 8 from thing.waste_ctrl_hole to $_8*/
			translate(v = [-6.5, 11.5, 15.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 9*/
	union() {
		%/*Nodes shell 9*/
		union() {
			/*Node thing.bead_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-7, 12, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.collect_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-6, 12, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.dead_end_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-11, 12, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.elute_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-12, 12, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.horiz_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-12, 10, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.lysis_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-10, 12, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r2c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 9, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r3c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 11, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r4c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9, 12, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 12, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v10*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 12, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v11*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-7, 12, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 10, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 10, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v5*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 9, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v7*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 12, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v9*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 12, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 11, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v11*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 12, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 12, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v5*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9, 12, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v6*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 12, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v7*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9, 12, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v8*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9, 12, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v9*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 12, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.wash_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-12, 12, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.waste_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-7, 12, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*Edge 42 from thing.bead_ctrl_hole to $_42*/
			translate(v = [-4.5, 13.5, 13.5]) {
				rotate(a = [0, 65.9051574478893, -153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 42 from $_42 to thing.thing.chamber[0].thingy.v9*/
			translate(v = [-7.5, 12.5, 16.5]) {
				rotate(a = [0, 133.491519345092, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 50 from thing.collect_ctrl_hole to $_50*/
			translate(v = [-5.5, 13.5, 14.5]) {
				rotate(a = [0, 45.00000000000001, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 53 from thing.dead_end_ctrl_hole to $_53*/
			translate(v = [-11.5, 13.5, 17.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 54 from thing.elute_ctrl_hole to $_54*/
			translate(v = [-12.5, 13.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 56 from thing.horiz_ctrl_hole to $_56*/
			translate(v = [-12.5, 9.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 56 from $_56 to thing.thing.chamber[0].thingy.v5*/
			translate(v = [-11.5, 9.5, 12.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 56 from $_56 to thing.thing.chamber[0].thingy.v7*/
			translate(v = [-11.5, 12.5, 13.5]) {
				rotate(a = [0, 122.31153323742386, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 58 from thing.lysis_ctrl_hole to $_58*/
			translate(v = [-8.5, 13.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from thing.thing.chamber[0].thingy.r2c to $_73*/
			translate(v = [-12.5, 9.5, 15.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 73 from $_73 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [-11.5, 10.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from $_73 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [-11.5, 10.5, 15.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 75 from thing.thing.chamber[0].thingy.r3c to $_75*/
			translate(v = [-12.5, 12.5, 10.5]) {
				rotate(a = [0, 35.26438968275464, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 75 from $_75 to thing.thing.chamber[0].thingy.v1*/
			translate(v = [-11.5, 12.5, 14.5]) {
				rotate(a = [0, 165.96375653207352, 180.0]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
			/*Edge 77 from thing.thing.chamber[0].thingy.r4c to $_77*/
			translate(v = [-9.5, 13.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from $_77 to thing.thing.chamber[0].thingy.v10*/
			translate(v = [-9.5, 12.5, 14.5]) {
				rotate(a = [0, 135.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 81 from thing.thing.chamber[0].thingy.v1 to $_81*/
			translate(v = [-12.5, 12.5, 15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 81 from $_81 to thing.thing.chamber[1].thingy.v1*/
			translate(v = [-11.5, 11.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 84 from thing.thing.chamber[0].thingy.v11 to $_84*/
			translate(v = [-7.5, 13.5, 19.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 85 from $_85 to thing.waste_ctrl_hole*/
			translate(v = [-6.5, 12.5, 16.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 89 from $_89 to thing.thing.chamber[0].thingy.v7*/
			translate(v = [-11.5, 12.5, 13.5]) {
				rotate(a = [0, 72.4515993862077, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 89 from $_89 to thing.thing.chamber[1].thingy.v4*/
			translate(v = [-9.5, 12.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 89 from $_89 to thing.thing.chamber[1].thingy.v5*/
			translate(v = [-8.5, 12.5, 15.5]) {
				rotate(a = [0, 135.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 89 from $_89 to thing.thing.chamber[1].thingy.v6*/
			translate(v = [-9.5, 12.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 89 from $_89 to thing.thing.chamber[1].thingy.v7*/
			translate(v = [-8.5, 12.5, 12.5]) {
				rotate(a = [0, 26.56505117707799, 90.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 93 from $_93 to thing.thing.chamber[0].thingy.v9*/
			translate(v = [-7.5, 12.5, 16.5]) {
				rotate(a = [0, 65.9051574478893, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 93 from $_93 to thing.thing.chamber[1].thingy.v8*/
			translate(v = [-8.5, 12.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 93 from $_93 to thing.thing.chamber[1].thingy.v9*/
			translate(v = [-9.5, 12.5, 16.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 108 from thing.thing.chamber[1].thingy.v11 to $_108*/
			translate(v = [-9.5, 13.5, 19.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 113 from thing.thing.chamber[1].thingy.v5 to $_113*/
			translate(v = [-6.5, 13.5, 16.5]) {
				rotate(a = [0, 114.09484255211072, -153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 114 from thing.thing.chamber[1].thingy.v7 to $_114*/
			translate(v = [-10.5, 13.5, 10.5]) {
				rotate(a = [0, 48.189685104221404, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*Edge 116 from thing.thing.chamber[1].thingy.v9 to $_116*/
			translate(v = [-10.5, 13.5, 17.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 122 from $_122 to thing.wash_ctrl_hole*/
			translate(v = [-11.5, 12.5, 16.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 10*/
	union() {
		%/*Nodes shell 10*/
		union() {
			/*Node $_42*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5, 13, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-6, 13, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_53*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-12, 13, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_54*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-13, 13, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_56*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-13, 9, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_58*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9, 13, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_73*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13, 9, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_75*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13, 12, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_77*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-10, 13, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_81*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13, 12, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_84*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8, 13, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_85*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-8, 13, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_86*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9, 13, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_88*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7, 13, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_89*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9, 13, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_93*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-10, 13, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_108*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-10, 13, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_109*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9, 13, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_110*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-13, 13, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_113*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7, 13, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_114*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11, 13, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_116*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11, 13, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_117*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-13, 13, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_118*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9, 13, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_119*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-13, 13, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_120*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-13, 13, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_121*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9, 13, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_122*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-13, 13, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_123*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-13, 13, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union() {
			/*Edge 42 from $_42 to thing.thing.chamber[0].thingy.v8*/
			translate(v = [-9.5, 14.5, 17.5]) {
				rotate(a = [0, 128.11292650098662, -11.309932474020213]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*Edge 50 from $_50 to thing.thing.chamber[0].thingy.v13*/
			translate(v = [-7.5, 14.5, 19.5]) {
				rotate(a = [0, 155.9051574478893, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 5.477225575051661]);
				}
			}
			/*Edge 53 from $_53 to thing.thing.dead_buffer*/
			translate(v = [-11.5, 14.5, 17.5]) {
				rotate(a = [0, 90.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 54 from $_54 to thing.thing.elute*/
			translate(v = [-13.5, 13.5, 16.5]) {
				rotate(a = [0, 168.6900675259798, 0.0]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*Edge 56 from $_56 to thing.thing.chamber[0].thingy.v4*/
			translate(v = [-13.5, 13.5, 15.5]) {
				rotate(a = [0, 134.13174921203108, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*Edge 56 from $_56 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [-12.5, 14.5, 16.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 7.0710678118654755]);
				}
			}
			/*Edge 58 from $_58 to thing.thing.lysis*/
			translate(v = [-13.5, 14.5, 16.5]) {
				rotate(a = [0, 134.43824067114977, -11.309932474020213]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*Edge 73 from $_73 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [-12.5, 14.5, 16.5]) {
				rotate(a = [0, 101.30993247402021, -90.0]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*Edge 75 from $_75 to thing.thing.chamber[0].thingy.v4*/
			translate(v = [-13.5, 13.5, 15.5]) {
				rotate(a = [0, 164.20683095173604, -45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 77 from $_77 to thing.thing.chamber[0].thingy.v8*/
			translate(v = [-9.5, 14.5, 17.5]) {
				rotate(a = [0, 165.96375653207352, -90.0]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
			/*Edge 81 from $_81 to thing.thing.elute*/
			translate(v = [-13.5, 13.5, 16.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 81 from $_81 to thing.thing.lysis*/
			translate(v = [-13.5, 14.5, 16.5]) {
				rotate(a = [0, 114.09484255211072, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 81 from $_81 to thing.thing.wash*/
			translate(v = [-13.5, 14.5, 17.5]) {
				rotate(a = [0, 131.81031489577862, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*Edge 84 from $_84 to thing.thing.chamber[0].thingy.v12*/
			translate(v = [-8.5, 14.5, 20.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 84 from $_84 to thing.thing.chamber[0].thingy.v13*/
			translate(v = [-7.5, 14.5, 19.5]) {
				rotate(a = [0, 90.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 85 from thing.thing.chamber[0].thingy.v12 to $_85*/
			translate(v = [-7.5, 13.5, 15.5]) {
				rotate(a = [0, 15.793169048263968, 135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 86 from thing.thing.chamber[0].thingy.v12 to $_86*/
			translate(v = [-8.5, 13.5, 19.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 86 from $_86 to thing.thing.chamber[1].thingy.v12*/
			translate(v = [-9.5, 14.5, 20.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 88 from thing.thing.chamber[0].thingy.v13 to $_88*/
			translate(v = [-6.5, 13.5, 19.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 88 from $_88 to thing.thing.chamber[1].thingy.v13*/
			translate(v = [-7.5, 14.5, 20.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 89 from thing.thing.chamber[0].thingy.v4 to $_89*/
			translate(v = [-8.5, 13.5, 14.5]) {
				rotate(a = [0, 78.69006752597979, 180.0]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*Edge 89 from $_89 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [-12.5, 14.5, 16.5]) {
				rotate(a = [0, 115.8766900608275, -14.036243467926477]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*Edge 93 from thing.thing.chamber[0].thingy.v8 to $_93*/
			translate(v = [-9.5, 13.5, 17.5]) {
				rotate(a = [0, 90.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 108 from $_108 to thing.thing.chamber[1].thingy.v12*/
			translate(v = [-9.5, 14.5, 20.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 108 from $_108 to thing.thing.chamber[1].thingy.v13*/
			translate(v = [-7.5, 14.5, 20.5]) {
				rotate(a = [0, 114.09484255211072, -153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 109 from thing.thing.chamber[1].thingy.v12 to $_109*/
			translate(v = [-8.5, 13.5, 16.5]) {
				rotate(a = [0, 19.471220634490674, 135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 110 from thing.thing.chamber[1].thingy.v13 to $_110*/
			translate(v = [-12.5, 13.5, 19.5]) {
				rotate(a = [0, 78.90419671686361, 11.309932474020213]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 113 from $_113 to thing.thing.dead_buffer*/
			translate(v = [-11.5, 14.5, 17.5]) {
				rotate(a = [0, 101.0958032831364, -11.309932474020213]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 114 from $_114 to thing.thing.dead_cell*/
			translate(v = [-11.5, 14.5, 15.5]) {
				rotate(a = [0, 164.20683095173604, -45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 116 from $_116 to thing.thing.dead_bead*/
			translate(v = [-9.5, 14.5, 18.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from thing.thing.dead_bead to $_117*/
			translate(v = [-12.5, 13.5, 13.5]) {
				rotate(a = [0, 32.31153323742385, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*Edge 118 from thing.thing.dead_bead to $_118*/
			translate(v = [-8.5, 13.5, 17.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from $_117 to thing.thing.dead_cell*/
			translate(v = [-11.5, 14.5, 15.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 119 from thing.thing.dead_buffer to $_119*/
			translate(v = [-12.5, 13.5, 14.5]) {
				rotate(a = [0, 25.239401820678914, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 119 from $_119 to thing.thing.dead_cell*/
			translate(v = [-11.5, 14.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 120 from thing.thing.elute to $_120*/
			translate(v = [-12.5, 13.5, 15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 121 from thing.thing.lysis to $_121*/
			translate(v = [-8.5, 13.5, 15.5]) {
				rotate(a = [0, 78.90419671686361, 168.6900675259798]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 122 from thing.thing.wash to $_122*/
			translate(v = [-12.5, 13.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 123 from thing.thing.wash to $_123*/
			translate(v = [-12.5, 13.5, 12.5]) {
				rotate(a = [0, 15.793169048263968, 135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
		}
	}
	/*Shell 11*/
	union() {
		%/*Nodes shell 11*/
		union() {
			/*Node thing.thing.chamber[0].thingy.v12*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9, 14, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v13*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 14, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14, 13, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v6*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-13, 14, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v8*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 14, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v12*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 14, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v13*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 14, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.dead_bead*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10, 14, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.dead_buffer*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 14, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.dead_cell*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 14, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.elute*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14, 13, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.lysis*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14, 14, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.wash*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14, 14, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 11*/
		union() {
			/*Edge 43 from $_43 to thing.thing.chamber[0].thingy.v8*/
			translate(v = [-9.5, 14.5, 17.5]) {
				rotate(a = [0, 90.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 44 from $_44 to thing.thing.dead_bead*/
			translate(v = [-9.5, 14.5, 18.5]) {
				rotate(a = [0, 90.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 46 from $_46 to thing.thing.chamber[0].thingy.v4*/
			translate(v = [-13.5, 13.5, 15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 47 from $_47 to thing.thing.dead_buffer*/
			translate(v = [-11.5, 14.5, 17.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 48 from $_48 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [-12.5, 14.5, 16.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 49 from $_49 to thing.thing.dead_cell*/
			translate(v = [-11.5, 14.5, 15.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 51 from $_51 to thing.thing.chamber[0].thingy.v13*/
			translate(v = [-7.5, 14.5, 19.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 52 from $_52 to thing.thing.chamber[1].thingy.v13*/
			translate(v = [-7.5, 14.5, 20.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 55 from $_55 to thing.thing.elute*/
			translate(v = [-13.5, 13.5, 16.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 59 from $_59 to thing.thing.lysis*/
			translate(v = [-13.5, 14.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 87 from thing.thing.chamber[0].thingy.v12 to $_87*/
			translate(v = [-9.5, 15.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 87 from $_87 to thing.thing.chamber[1].thingy.v12*/
			translate(v = [-9.5, 14.5, 20.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 124 from thing.thing.wash to $_124*/
			translate(v = [-14.5, 15.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 12*/
	union() {
		%/*Nodes shell 12*/
		union() {
			/*Node $_43*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-10, 15, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_44*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-10, 15, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_46*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15, 13, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-12, 15, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-14, 15, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_49*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-12, 15, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_51*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8, 15, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 15, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_55*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15, 14, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_59*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15, 15, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_87*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-10, 15, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_124*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15, 15, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 12*/
		union() {
			/*Edge 43 from thing.bead_in_hole to $_43*/
			translate(v = [-9.5, 15.5, 17.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 44 from thing.bead_out_hole to $_44*/
			translate(v = [-9.5, 15.5, 18.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 46 from thing.buffer_in_hole to $_46*/
			translate(v = [-14.5, 13.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 47 from thing.buffer_out_hole to $_47*/
			translate(v = [-11.5, 15.5, 18.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 48 from thing.cell_in_hole to $_48*/
			translate(v = [-13.5, 15.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 49 from thing.cell_out_hole to $_49*/
			translate(v = [-11.5, 15.5, 16.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 51 from thing.collect_hole to $_51*/
			translate(v = [-7.5, 15.5, 20.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 52 from thing.collect_hole to $_52*/
			translate(v = [-8.5, 15.5, 20.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 55 from thing.elute_in_hole to $_55*/
			translate(v = [-14.5, 14.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from thing.lysis_in_hole to $_59*/
			translate(v = [-14.5, 15.5, 17.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 87 from $_87 to thing.waste_hole*/
			translate(v = [-8.5, 16.5, 22.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 124 from $_124 to thing.wash_in_hole*/
			translate(v = [-15.5, 16.5, 17.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 13*/
	union() {
		%/*Nodes shell 13*/
		union() {
			/*Node thing.bead_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9, 16, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.bead_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9, 16, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.buffer_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-16, 14, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.buffer_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 16, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.cell_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-15, 16, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.cell_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12, 16, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.collect_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9, 16, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.elute_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-16, 15, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.lysis_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-16, 16, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.wash_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-16, 16, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.waste_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9, 16, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 13*/
		union() {
			/*Edge 30 from thing.bead_in_hole to $_30*/
			translate(v = [-7.5, 17.5, 17.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 39 from thing.bead_out_hole to $_39*/
			translate(v = [-7.5, 17.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 31 from thing.buffer_in_hole to $_31*/
			translate(v = [-16.5, 13.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 40 from thing.buffer_out_hole to $_40*/
			translate(v = [-12.5, 17.5, 18.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 32 from thing.cell_in_hole to $_32*/
			translate(v = [-13.5, 17.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 41 from thing.cell_out_hole to $_41*/
			translate(v = [-11.5, 17.5, 16.5]) {
				rotate(a = [0, 45.00000000000001, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 36 from thing.collect_hole to $_36*/
			translate(v = [-7.5, 17.5, 22.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 37 from thing.collect_hole to $_37*/
			translate(v = [-7.5, 17.5, 20.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 35 from thing.elute_in_hole to $_35*/
			translate(v = [-16.5, 14.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 33 from thing.lysis_in_hole to $_33*/
			translate(v = [-16.5, 15.5, 17.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 34 from thing.wash_in_hole to $_34*/
			translate(v = [-14.5, 17.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 38 from thing.waste_hole to $_38*/
			translate(v = [-7.5, 17.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 14*/
	union() {
		%/*Nodes shell 14*/
		union() {
			/*Node $_30*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8, 17, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8, 17, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_31*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-17, 13, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13, 17, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-14, 17, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-12, 17, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8, 17, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8, 17, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-17, 14, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-17, 15, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15, 17, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8, 17, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 14*/
		union();
	}
}
