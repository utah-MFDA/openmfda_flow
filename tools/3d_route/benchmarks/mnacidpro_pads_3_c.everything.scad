translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_26*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, -2, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_28*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, -1, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_29*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, -4, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_22*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, -2, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, -4, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 10, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, -2, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 2, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, -4, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 0, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 3, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 26 from thing.collect_flush_hole to $_26*/
			translate(v = [0.5, -1.5, -18.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 28 from thing.pump_flush1_hole to $_28*/
			translate(v = [0.5, -0.5, -7.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 29 from thing.pump_flush2_hole to $_29*/
			translate(v = [0.5, -3.5, -10.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 22 from thing.waste_flush_hole to $_22*/
			translate(v = [0.5, -1.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_37__0 to $_37__1*/
			translate(v = [1.5, -2.5, -20.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_41__0 to $_41__1*/
			translate(v = [1.5, 10.5, -19.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_38__0 to $_38__1*/
			translate(v = [1.5, -0.5, -21.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_42__0 to $_42__1*/
			translate(v = [1.5, 2.5, -20.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_36__0 to $_36__1*/
			translate(v = [1.5, -2.5, -21.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_39__0 to $_39__1*/
			translate(v = [1.5, -0.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_40__0 to $_40__1*/
			translate(v = [1.5, 4.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 1*/
	union() {
		%/*Nodes shell 1*/
		union() {
			/*Node thing.collect_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, -1, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump_flush1_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 0, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump_flush2_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, -3, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.waste_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, -1, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, -3, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 10, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, -1, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 2, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, -3, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, -1, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 4, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge -1 from $_40 to $_40__1*/
			translate(v = [1.5, 4.5, -12.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_41 to $_41__1*/
			translate(v = [1.5, 10.5, -19.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_42 to $_42__1*/
			translate(v = [1.5, 2.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 54 from thing.collect_flush_hole to $_54*/
			translate(v = [2.5, 0.5, -18.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_36 to $_36__1*/
			translate(v = [1.5, -2.5, -21.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_37 to $_37__1*/
			translate(v = [1.5, -2.5, -20.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_38 to $_38__1*/
			translate(v = [1.5, -0.5, -21.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 74 from thing.pump_flush1_hole to $_74*/
			translate(v = [2.5, 0.5, -9.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 75 from thing.pump_flush2_hole to $_75*/
			translate(v = [2.5, -2.5, -11.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 142 from $_142 to thing.waste_flush_hole*/
			translate(v = [1.5, -0.5, -16.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_39 to $_39__1*/
			translate(v = [1.5, -0.5, -15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_40*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 4, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 3, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 10, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 3, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -6, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_54*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 0, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_57*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 0, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -2, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -2, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -1, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 9, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 4, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 2, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 5, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 2, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_74*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 0, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_75*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -3, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_108*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 1, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_132*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -1, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_142*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -1, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -5, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -1, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 40 from thing.bead_out_hole to $_40*/
			translate(v = [2.5, 4.5, -13.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 25 from thing.bead_trap_flush_hole to $_25*/
			translate(v = [2.5, 3.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 41 from thing.buffer_out_hole to $_41*/
			translate(v = [2.5, 10.5, -19.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 42 from thing.cell_out_hole to $_42*/
			translate(v = [2.5, 3.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 12 from thing.collect_ctrl_hole to $_12*/
			translate(v = [2.5, -5.5, -20.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 54 from $_54 to thing.thing.chamber[2].thingy.v13*/
			translate(v = [3.5, 0.5, -18.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 57 from thing.collect_hole to $_57*/
			translate(v = [2.5, 0.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 36 from thing.collect_hole to $_36*/
			translate(v = [2.5, -1.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 37 from thing.collect_hole to $_37*/
			translate(v = [2.5, -1.5, -20.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 38 from thing.collect_hole to $_38*/
			translate(v = [2.5, -0.5, -21.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 57 from $_57 to thing.thing.chamber[2].thingy.v13*/
			translate(v = [3.5, 0.5, -18.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 5 from thing.dead_end_ctrl_hole to $_5*/
			translate(v = [2.5, 9.5, -19.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 19 from thing.dead_end_flush_hole to $_19*/
			translate(v = [2.5, 4.5, -16.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 24 from thing.loop_exit_flush_hole to $_24*/
			translate(v = [2.5, 2.5, -14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 14 from thing.pump1_hole to $_14*/
			translate(v = [2.5, 5.5, -10.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 27 from thing.pump_flush0_hole to $_27*/
			translate(v = [2.5, 2.5, -10.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from $_74 to thing.thing.chamber[2].thingy.p1*/
			translate(v = [3.5, 0.5, -10.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 75 from $_75 to thing.thing.chamber[2].thingy.p2*/
			translate(v = [3.5, -1.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 108 from thing.thing.chamber[1].thingy.p1 to $_108*/
			translate(v = [2.5, 1.5, -9.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 108 from $_108 to thing.thing.chamber[2].thingy.p1*/
			translate(v = [3.5, 0.5, -10.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 132 from thing.thing.chamber[2].thingy.p1 to $_132*/
			translate(v = [2.5, -0.5, -11.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 132 from $_132 to thing.thing.chamber[2].thingy.p2*/
			translate(v = [3.5, -1.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 142 from thing.thing.chamber[2].thingy.v12 to $_142*/
			translate(v = [2.5, -0.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 8 from thing.waste_ctrl_hole to $_8*/
			translate(v = [2.5, -4.5, -18.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 39 from thing.waste_hole to $_39*/
			translate(v = [2.5, -0.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union() {
			/*Node thing.bead_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 4, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.bead_trap_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 2, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.buffer_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 10, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.cell_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 4, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.collect_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, -5, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.collect_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -1, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.dead_end_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 9, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.dead_end_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 4, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.loop_exit_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 2, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump1_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 5, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump_flush0_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 3, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.p1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 2, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.p1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 0, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.p2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -2, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v12*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -2, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v13*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 0, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.waste_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, -5, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.waste_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -2, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 46 from thing.bead_out_hole to $_46*/
			translate(v = [4.5, 4.5, -14.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 48 from thing.bead_trap_flush_hole to $_48*/
			translate(v = [4.5, 1.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from thing.buffer_out_hole to $_50*/
			translate(v = [4.5, 9.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 52 from thing.cell_out_hole to $_52*/
			translate(v = [4.5, 5.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 53 from thing.collect_ctrl_hole to $_53*/
			translate(v = [4.5, -3.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 55 from thing.collect_hole to $_55*/
			translate(v = [4.5, -1.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 56 from thing.collect_hole to $_56*/
			translate(v = [4.5, 0.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 58 from thing.dead_end_ctrl_hole to $_58*/
			translate(v = [4.5, 9.5, -19.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 59 from thing.dead_end_flush_hole to $_59*/
			translate(v = [4.5, 4.5, -16.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 66 from thing.loop_exit_flush_hole to $_66*/
			translate(v = [4.5, 1.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 71 from thing.pump1_hole to $_71*/
			translate(v = [4.5, 5.5, -9.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 73 from thing.pump_flush0_hole to $_73*/
			translate(v = [4.5, 3.5, -12.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 79 from $_79 to thing.thing.chamber[1].thingy.p1*/
			translate(v = [3.5, 2.5, -8.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 95 from $_95 to thing.waste_ctrl_hole*/
			translate(v = [3.5, -4.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 97 from $_97 to thing.thing.chamber[2].thingy.v12*/
			translate(v = [3.5, -1.5, -18.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 97 from $_97 to thing.waste_hole*/
			translate(v = [3.5, -1.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 107 from $_107 to thing.thing.chamber[1].thingy.p1*/
			translate(v = [3.5, 2.5, -8.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 109 from thing.thing.chamber[1].thingy.p1 to $_109*/
			translate(v = [4.5, 1.5, -9.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 110 from $_110 to thing.thing.chamber[2].thingy.p2*/
			translate(v = [3.5, -1.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 122 from $_122 to thing.thing.chamber[2].thingy.v12*/
			translate(v = [3.5, -1.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 123 from $_123 to thing.thing.chamber[2].thingy.v13*/
			translate(v = [3.5, 0.5, -18.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 131 from $_131 to thing.thing.chamber[2].thingy.p1*/
			translate(v = [3.5, 0.5, -10.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 133 from thing.thing.chamber[2].thingy.p2 to $_133*/
			translate(v = [4.5, -0.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 141 from $_141 to thing.thing.chamber[2].thingy.v12*/
			translate(v = [3.5, -1.5, -18.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 141 from $_141 to thing.thing.chamber[2].thingy.v13*/
			translate(v = [3.5, 0.5, -18.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*Node $_23*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 2, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_46*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 4, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -5, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 1, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 9, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 5, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_53*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -4, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_55*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -2, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_56*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 0, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_58*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 9, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_59*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 4, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_21*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 5, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_66*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 1, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_13*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 6, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_71*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 5, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 0, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_73*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 3, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_79*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 3, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_95*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -4, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_96*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -2, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_97*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -3, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_98*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -2, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_105*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 3, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_107*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 3, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_109*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 1, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_110*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -1, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_122*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -1, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_123*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 0, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_131*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 1, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_133*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -1, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_141*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -1, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_147*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 5, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_148*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 7, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 23 from thing.bead_flush_hole to $_23*/
			translate(v = [4.5, 2.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 46 from $_46 to thing.thing.dead_bead*/
			translate(v = [5.5, 4.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 11 from thing.bead_trap_ctrl_hole to $_11*/
			translate(v = [4.5, -4.5, -15.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 48 from $_48 to thing.thing.chamber[2].thingy.v11*/
			translate(v = [5.5, 0.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from $_50 to thing.thing.dead_buffer*/
			translate(v = [5.5, 8.5, -18.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 52 from $_52 to thing.thing.dead_cell*/
			translate(v = [5.5, 6.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 53 from $_53 to thing.thing.chamber[0].thingy.v13*/
			translate(v = [5.5, -2.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 55 from $_55 to thing.thing.chamber[0].thingy.v13*/
			translate(v = [5.5, -2.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 56 from $_56 to thing.thing.chamber[1].thingy.v13*/
			translate(v = [5.5, -0.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 58 from $_58 to thing.thing.dead_buffer*/
			translate(v = [5.5, 8.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from $_59 to thing.thing.dead_bead*/
			translate(v = [5.5, 4.5, -15.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 21 from thing.horiz_flush_hole to $_21*/
			translate(v = [4.5, 5.5, -18.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 66 from $_66 to thing.thing.chamber[2].thingy.v10*/
			translate(v = [5.5, 0.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 13 from thing.pump0_hole to $_13*/
			translate(v = [4.5, 6.5, -8.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 71 from $_71 to thing.thing.chamber[0].thingy.p1*/
			translate(v = [5.5, 4.5, -8.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 15 from thing.pump2_hole to $_15*/
			translate(v = [4.5, 0.5, -7.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from $_73 to thing.thing.chamber[2].thingy.p0*/
			translate(v = [5.5, 2.5, -12.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 79 from thing.thing.chamber[0].thingy.p1 to $_79*/
			translate(v = [4.5, 3.5, -7.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 95 from thing.thing.chamber[0].thingy.v12 to $_95*/
			translate(v = [4.5, -3.5, -17.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 96 from thing.thing.chamber[0].thingy.v12 to $_96*/
			translate(v = [4.5, -1.5, -17.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 97 from thing.thing.chamber[0].thingy.v12 to $_97*/
			translate(v = [4.5, -2.5, -18.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 96 from $_96 to thing.thing.chamber[1].thingy.v12*/
			translate(v = [5.5, -1.5, -18.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 97 from $_97 to thing.thing.chamber[1].thingy.v12*/
			translate(v = [5.5, -1.5, -18.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 98 from thing.thing.chamber[0].thingy.v13 to $_98*/
			translate(v = [4.5, -1.5, -18.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 98 from $_98 to thing.thing.chamber[1].thingy.v13*/
			translate(v = [5.5, -0.5, -18.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 105 from thing.thing.chamber[1].thingy.p0 to $_105*/
			translate(v = [4.5, 3.5, -11.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 107 from thing.thing.chamber[1].thingy.p0 to $_107*/
			translate(v = [4.5, 3.5, -9.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 105 from $_105 to thing.thing.chamber[2].thingy.p0*/
			translate(v = [5.5, 2.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 109 from $_109 to thing.thing.chamber[1].thingy.p2*/
			translate(v = [5.5, 0.5, -10.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 110 from thing.thing.chamber[1].thingy.p2 to $_110*/
			translate(v = [4.5, -0.5, -11.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 122 from thing.thing.chamber[1].thingy.v12 to $_122*/
			translate(v = [4.5, -0.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 123 from thing.thing.chamber[1].thingy.v13 to $_123*/
			translate(v = [4.5, 0.5, -18.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 131 from thing.thing.chamber[2].thingy.p0 to $_131*/
			translate(v = [4.5, 1.5, -11.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 133 from $_133 to thing.thing.chamber[2].thingy.r1c*/
			translate(v = [5.5, 0.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 133 from $_133 to thing.thing.chamber[2].thingy.v10*/
			translate(v = [5.5, 0.5, -13.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 141 from thing.thing.chamber[2].thingy.v11 to $_141*/
			translate(v = [4.5, -0.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 147 from thing.thing.dead_bead to $_147*/
			translate(v = [4.5, 5.5, -15.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 147 from $_147 to thing.thing.dead_cell*/
			translate(v = [5.5, 6.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 148 from thing.thing.dead_buffer to $_148*/
			translate(v = [4.5, 7.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 148 from $_148 to thing.thing.dead_cell*/
			translate(v = [5.5, 6.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*Node thing.bead_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 3, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.bead_trap_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, -5, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.horiz_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 5, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump0_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 6, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump2_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 1, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.p1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 4, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v12*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -3, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v13*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -3, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.p0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 4, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.p2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 0, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.r1c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 2, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v12*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -2, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v13*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -1, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.p0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 2, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.r1c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 0, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.r2c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 4, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.r4c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 2, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v10*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 0, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v11*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 0, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.dead_bead*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 4, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.dead_buffer*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 8, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.dead_cell*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 6, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 44 from thing.bead_flush_hole to $_44*/
			translate(v = [6.5, 2.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 47 from thing.bead_trap_ctrl_hole to $_47*/
			translate(v = [6.5, -3.5, -15.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 64 from thing.horiz_flush_hole to $_64*/
			translate(v = [6.5, 5.5, -16.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 70 from thing.pump0_hole to $_70*/
			translate(v = [6.5, 6.5, -9.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 72 from thing.pump2_hole to $_72*/
			translate(v = [6.5, 2.5, -9.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from $_76 to thing.thing.chamber[1].thingy.p0*/
			translate(v = [5.5, 4.5, -10.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 78 from $_78 to thing.thing.chamber[0].thingy.p1*/
			translate(v = [5.5, 4.5, -8.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 80 from thing.thing.chamber[0].thingy.p1 to $_80*/
			translate(v = [6.5, 3.5, -9.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 81 from $_81 to thing.thing.chamber[1].thingy.p2*/
			translate(v = [5.5, 0.5, -10.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 94 from $_94 to thing.thing.chamber[0].thingy.v12*/
			translate(v = [5.5, -2.5, -17.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 94 from $_94 to thing.thing.chamber[0].thingy.v13*/
			translate(v = [5.5, -2.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 106 from thing.thing.chamber[1].thingy.p0 to $_106*/
			translate(v = [6.5, 3.5, -11.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 106 from $_106 to thing.thing.chamber[1].thingy.r1c*/
			translate(v = [5.5, 2.5, -11.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 111 from thing.thing.chamber[1].thingy.p2 to $_111*/
			translate(v = [6.5, 1.5, -11.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 111 from $_111 to thing.thing.chamber[1].thingy.r1c*/
			translate(v = [5.5, 2.5, -11.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 119 from $_119 to thing.thing.chamber[2].thingy.v10*/
			translate(v = [5.5, 0.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 120 from $_120 to thing.thing.chamber[2].thingy.v11*/
			translate(v = [5.5, 0.5, -17.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 121 from $_121 to thing.thing.chamber[1].thingy.v12*/
			translate(v = [5.5, -1.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 121 from $_121 to thing.thing.chamber[1].thingy.v13*/
			translate(v = [5.5, -0.5, -18.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 130 from thing.thing.chamber[2].thingy.p0 to $_130*/
			translate(v = [6.5, 1.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 130 from $_130 to thing.thing.chamber[2].thingy.r1c*/
			translate(v = [5.5, 0.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 134 from thing.thing.chamber[2].thingy.r2c to $_134*/
			translate(v = [6.5, 3.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 135 from thing.thing.chamber[2].thingy.r2c to $_135*/
			translate(v = [6.5, 5.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 138 from thing.thing.chamber[2].thingy.r4c to $_138*/
			translate(v = [6.5, 1.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 139 from thing.thing.chamber[2].thingy.r4c to $_139*/
			translate(v = [6.5, 1.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 138 from $_138 to thing.thing.chamber[2].thingy.v10*/
			translate(v = [5.5, 0.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 139 from $_139 to thing.thing.chamber[2].thingy.v11*/
			translate(v = [5.5, 0.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 144 from $_144 to thing.thing.dead_buffer*/
			translate(v = [5.5, 8.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 145 from $_145 to thing.thing.dead_cell*/
			translate(v = [5.5, 6.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 146 from $_146 to thing.thing.dead_bead*/
			translate(v = [5.5, 4.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*Node $_44*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 2, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -4, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_64*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 5, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 3, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_70*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 6, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_72*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 2, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_76*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 5, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_78*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 5, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_80*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 3, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_81*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 1, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_93*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -2, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_94*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -4, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_106*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 3, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_111*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 1, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_115*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 4, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_119*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 1, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_120*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 0, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_121*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -1, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_130*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 1, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_134*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 3, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_135*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 5, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_137*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 4, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_138*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 1, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_139*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 1, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_143*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [6, 6, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_144*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 7, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_145*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 6, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_146*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 3, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 5, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_20*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 4, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*Edge 44 from $_44 to thing.thing.chamber[2].thingy.v8*/
			translate(v = [7.5, 2.5, -15.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 44 from $_44 to thing.thing.chamber[2].thingy.v9*/
			translate(v = [7.5, 2.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 47 from $_47 to thing.thing.chamber[0].thingy.v11*/
			translate(v = [7.5, -2.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from $_64 to thing.thing.chamber[2].thingy.v4*/
			translate(v = [7.5, 5.5, -15.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 64 from $_64 to thing.thing.chamber[2].thingy.v6*/
			translate(v = [7.5, 4.5, -16.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 64 from $_64 to thing.thing.chamber[2].thingy.v7*/
			translate(v = [7.5, 6.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 10 from thing.loop_exit_ctrl_hole to $_10*/
			translate(v = [6.5, 3.5, -10.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 70 from $_70 to thing.thing.chamber[0].thingy.p0*/
			translate(v = [7.5, 5.5, -10.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from $_72 to thing.thing.chamber[0].thingy.p2*/
			translate(v = [7.5, 2.5, -10.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 76 from thing.thing.chamber[0].thingy.p0 to $_76*/
			translate(v = [6.5, 5.5, -10.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 78 from thing.thing.chamber[0].thingy.p0 to $_78*/
			translate(v = [6.5, 5.5, -9.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 80 from $_80 to thing.thing.chamber[0].thingy.p2*/
			translate(v = [7.5, 2.5, -10.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 81 from thing.thing.chamber[0].thingy.p2 to $_81*/
			translate(v = [6.5, 1.5, -10.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 93 from thing.thing.chamber[0].thingy.v11 to $_93*/
			translate(v = [6.5, -1.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 94 from thing.thing.chamber[0].thingy.v11 to $_94*/
			translate(v = [6.5, -3.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 93 from $_93 to thing.thing.chamber[1].thingy.v11*/
			translate(v = [7.5, -0.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 106 from $_106 to thing.thing.chamber[1].thingy.v3*/
			translate(v = [7.5, 4.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 111 from $_111 to thing.thing.chamber[1].thingy.v10*/
			translate(v = [7.5, 2.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 115 from thing.thing.chamber[1].thingy.r3c to $_115*/
			translate(v = [6.5, 4.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 115 from $_115 to thing.thing.chamber[1].thingy.v2*/
			translate(v = [7.5, 4.5, -13.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 119 from thing.thing.chamber[1].thingy.v10 to $_119*/
			translate(v = [6.5, 1.5, -12.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 120 from thing.thing.chamber[1].thingy.v11 to $_120*/
			translate(v = [6.5, 0.5, -16.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 121 from thing.thing.chamber[1].thingy.v11 to $_121*/
			translate(v = [6.5, -0.5, -17.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 130 from $_130 to thing.thing.chamber[2].thingy.v3*/
			translate(v = [7.5, 2.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 134 from $_134 to thing.thing.chamber[2].thingy.v2*/
			translate(v = [7.5, 3.5, -14.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 134 from $_134 to thing.thing.chamber[2].thingy.v3*/
			translate(v = [7.5, 2.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 134 from $_134 to thing.thing.chamber[2].thingy.v6*/
			translate(v = [7.5, 4.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 135 from $_135 to thing.thing.chamber[2].thingy.v7*/
			translate(v = [7.5, 6.5, -15.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 137 from thing.thing.chamber[2].thingy.r3c to $_137*/
			translate(v = [6.5, 4.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 137 from $_137 to thing.thing.chamber[2].thingy.v2*/
			translate(v = [7.5, 3.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 138 from $_138 to thing.thing.chamber[2].thingy.v8*/
			translate(v = [7.5, 2.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 139 from $_139 to thing.thing.chamber[2].thingy.v9*/
			translate(v = [7.5, 2.5, -16.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 143 from thing.thing.chamber[2].thingy.v5 to $_143*/
			translate(v = [6.5, 6.5, -16.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 144 from thing.thing.chamber[2].thingy.v5 to $_144*/
			translate(v = [6.5, 7.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 145 from thing.thing.chamber[2].thingy.v7 to $_145*/
			translate(v = [6.5, 6.5, -15.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 146 from thing.thing.chamber[2].thingy.v9 to $_146*/
			translate(v = [6.5, 3.5, -16.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 6 from thing.vertical_ctrl_hole to $_6*/
			translate(v = [6.5, 5.5, -11.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 20 from thing.vertical_flush_hole to $_20*/
			translate(v = [6.5, 4.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 7*/
	union() {
		%/*Nodes shell 7*/
		union() {
			/*Node thing.loop_exit_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, 2, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.p0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 5, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.p2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 2, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r1c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 3, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v11*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -3, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.r2c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 6, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.r3c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 3, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.r4c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 1, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v10*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 2, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v11*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -1, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 4, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 4, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.r3c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 5, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 3, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 2, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 5, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v5*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 6, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v6*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 4, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v7*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 6, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v8*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 2, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v9*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 2, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.vertical_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, 5, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.vertical_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, 4, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*Edge 65 from thing.loop_exit_ctrl_hole to $_65*/
			translate(v = [8.5, 1.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from thing.thing.chamber[0].thingy.p0 to $_77*/
			translate(v = [8.5, 4.5, -11.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from $_77 to thing.thing.chamber[0].thingy.r1c*/
			translate(v = [7.5, 3.5, -11.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 82 from thing.thing.chamber[0].thingy.p2 to $_82*/
			translate(v = [8.5, 2.5, -11.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 82 from $_82 to thing.thing.chamber[0].thingy.r1c*/
			translate(v = [7.5, 3.5, -11.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 88 from $_88 to thing.thing.chamber[0].thingy.v11*/
			translate(v = [7.5, -2.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 89 from $_89 to thing.vertical_ctrl_hole*/
			translate(v = [7.5, 5.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 90 from $_90 to thing.thing.chamber[1].thingy.v2*/
			translate(v = [7.5, 4.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 90 from $_90 to thing.thing.chamber[1].thingy.v3*/
			translate(v = [7.5, 4.5, -12.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 92 from $_92 to thing.thing.chamber[1].thingy.v10*/
			translate(v = [7.5, 2.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 112 from thing.thing.chamber[1].thingy.r2c to $_112*/
			translate(v = [8.5, 5.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 113 from thing.thing.chamber[1].thingy.r2c to $_113*/
			translate(v = [8.5, 7.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 112 from $_112 to thing.thing.chamber[1].thingy.v2*/
			translate(v = [7.5, 4.5, -13.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 112 from $_112 to thing.thing.chamber[1].thingy.v3*/
			translate(v = [7.5, 4.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 114 from thing.thing.chamber[1].thingy.r3c to $_114*/
			translate(v = [8.5, 4.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 116 from thing.thing.chamber[1].thingy.r4c to $_116*/
			translate(v = [8.5, 2.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from thing.thing.chamber[1].thingy.r4c to $_117*/
			translate(v = [8.5, 0.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 116 from $_116 to thing.thing.chamber[1].thingy.v10*/
			translate(v = [7.5, 2.5, -12.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 117 from $_117 to thing.thing.chamber[1].thingy.v11*/
			translate(v = [7.5, -0.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 118 from $_118 to thing.thing.chamber[1].thingy.v2*/
			translate(v = [7.5, 4.5, -13.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 118 from $_118 to thing.thing.chamber[1].thingy.v3*/
			translate(v = [7.5, 4.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 118 from $_118 to thing.thing.chamber[2].thingy.v2*/
			translate(v = [7.5, 3.5, -14.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 118 from $_118 to thing.thing.chamber[2].thingy.v3*/
			translate(v = [7.5, 2.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 124 from $_124 to thing.thing.chamber[2].thingy.v4*/
			translate(v = [7.5, 5.5, -15.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 124 from $_124 to thing.thing.chamber[2].thingy.v5*/
			translate(v = [7.5, 6.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 124 from $_124 to thing.thing.chamber[2].thingy.v6*/
			translate(v = [7.5, 4.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 124 from $_124 to thing.thing.chamber[2].thingy.v7*/
			translate(v = [7.5, 6.5, -15.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 126 from $_126 to thing.thing.chamber[2].thingy.v4*/
			translate(v = [7.5, 5.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 127 from $_127 to thing.thing.chamber[2].thingy.v6*/
			translate(v = [7.5, 4.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 128 from $_128 to thing.thing.chamber[2].thingy.v8*/
			translate(v = [7.5, 2.5, -15.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 128 from $_128 to thing.thing.chamber[2].thingy.v9*/
			translate(v = [7.5, 2.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 129 from $_129 to thing.thing.chamber[2].thingy.v8*/
			translate(v = [7.5, 2.5, -15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 136 from thing.thing.chamber[2].thingy.r3c to $_136*/
			translate(v = [8.5, 4.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 136 from $_136 to thing.thing.chamber[2].thingy.v4*/
			translate(v = [7.5, 5.5, -15.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 140 from $_140 to thing.thing.chamber[2].thingy.v2*/
			translate(v = [7.5, 3.5, -14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 140 from $_140 to thing.thing.chamber[2].thingy.v3*/
			translate(v = [7.5, 2.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 140 from $_140 to thing.vertical_flush_hole*/
			translate(v = [7.5, 4.5, -15.5]) {
				rotate(a = [0, 90.0, -45.0]) {
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
				translate(v = [8, -3, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 8, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 8, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 9, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_65*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 1, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_2*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 2, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 3, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_77*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 4, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_82*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 2, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_84*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 8, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_86*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 7, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_88*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, -2, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_89*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 6, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_90*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 5, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_92*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 1, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_100*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, 7, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_101*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 6, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_102*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 7, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_104*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 0, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_112*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 5, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_113*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 7, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_114*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 4, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_116*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 2, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_117*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 0, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_118*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 3, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_124*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 5, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_125*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, 5, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_126*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 6, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_127*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 5, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_128*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 2, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_129*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 2, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_136*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 4, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_140*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 3, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 8, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 9, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*Edge 9 from thing.bead_ctrl_hole to $_9*/
			translate(v = [8.5, -2.5, -13.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 4 from thing.elute_ctrl_hole to $_4*/
			translate(v = [8.5, 8.5, -18.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 18 from thing.elute_flush_hole to $_18*/
			translate(v = [8.5, 8.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 7 from thing.horiz_ctrl_hole to $_7*/
			translate(v = [8.5, 9.5, -15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 65 from $_65 to thing.thing.chamber[0].thingy.v10*/
			translate(v = [9.5, 1.5, -12.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 2 from thing.lysis_ctrl_hole to $_2*/
			translate(v = [8.5, 2.5, -12.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 16 from thing.lysis_flush_hole to $_16*/
			translate(v = [8.5, 3.5, -12.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 77 from $_77 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [9.5, 5.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 82 from $_82 to thing.thing.chamber[0].thingy.v10*/
			translate(v = [9.5, 1.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 84 from thing.thing.chamber[0].thingy.r2c to $_84*/
			translate(v = [8.5, 8.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 84 from $_84 to thing.thing.chamber[0].thingy.v7*/
			translate(v = [9.5, 7.5, -15.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 86 from thing.thing.chamber[0].thingy.r3c to $_86*/
			translate(v = [8.5, 7.5, -13.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 86 from $_86 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [9.5, 6.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 88 from thing.thing.chamber[0].thingy.r4c to $_88*/
			translate(v = [8.5, -1.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 88 from $_88 to thing.thing.chamber[0].thingy.v9*/
			translate(v = [9.5, -0.5, -15.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 89 from thing.thing.chamber[0].thingy.v1 to $_89*/
			translate(v = [8.5, 6.5, -13.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 90 from thing.thing.chamber[0].thingy.v1 to $_90*/
			translate(v = [8.5, 5.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 89 from $_89 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [9.5, 6.5, -12.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 89 from $_89 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [9.5, 5.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 90 from $_90 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [9.5, 6.5, -12.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 90 from $_90 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [9.5, 5.5, -12.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 90 from $_90 to thing.thing.chamber[1].thingy.v1*/
			translate(v = [9.5, 4.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 92 from thing.thing.chamber[0].thingy.v10 to $_92*/
			translate(v = [8.5, 1.5, -13.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 100 from thing.thing.chamber[0].thingy.v5 to $_100*/
			translate(v = [8.5, 7.5, -16.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 101 from thing.thing.chamber[0].thingy.v5 to $_101*/
			translate(v = [8.5, 6.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 101 from $_101 to thing.thing.chamber[1].thingy.v4*/
			translate(v = [9.5, 5.5, -15.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 102 from thing.thing.chamber[0].thingy.v7 to $_102*/
			translate(v = [8.5, 7.5, -14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 102 from $_102 to thing.thing.chamber[1].thingy.v6*/
			translate(v = [9.5, 6.5, -14.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 104 from thing.thing.chamber[0].thingy.v9 to $_104*/
			translate(v = [8.5, 0.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 104 from $_104 to thing.thing.chamber[1].thingy.v8*/
			translate(v = [9.5, 1.5, -14.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 112 from $_112 to thing.thing.chamber[1].thingy.v6*/
			translate(v = [9.5, 6.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 113 from $_113 to thing.thing.chamber[1].thingy.v7*/
			translate(v = [9.5, 6.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 114 from $_114 to thing.thing.chamber[1].thingy.v1*/
			translate(v = [9.5, 4.5, -13.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 114 from $_114 to thing.thing.chamber[1].thingy.v4*/
			translate(v = [9.5, 5.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 116 from $_116 to thing.thing.chamber[1].thingy.v8*/
			translate(v = [9.5, 1.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from $_117 to thing.thing.chamber[1].thingy.v9*/
			translate(v = [9.5, 1.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 118 from thing.thing.chamber[1].thingy.v1 to $_118*/
			translate(v = [8.5, 3.5, -13.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 118 from $_118 to thing.thing.chamber[2].thingy.v1*/
			translate(v = [9.5, 4.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 124 from thing.thing.chamber[1].thingy.v4 to $_124*/
			translate(v = [8.5, 5.5, -15.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 124 from $_124 to thing.thing.chamber[1].thingy.v6*/
			translate(v = [9.5, 6.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 124 from $_124 to thing.thing.chamber[1].thingy.v7*/
			translate(v = [9.5, 6.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 125 from thing.thing.chamber[1].thingy.v5 to $_125*/
			translate(v = [8.5, 5.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 126 from thing.thing.chamber[1].thingy.v5 to $_126*/
			translate(v = [8.5, 6.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 127 from thing.thing.chamber[1].thingy.v7 to $_127*/
			translate(v = [8.5, 5.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 128 from thing.thing.chamber[1].thingy.v8 to $_128*/
			translate(v = [8.5, 2.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 128 from $_128 to thing.thing.chamber[1].thingy.v9*/
			translate(v = [9.5, 1.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 129 from thing.thing.chamber[1].thingy.v9 to $_129*/
			translate(v = [8.5, 2.5, -16.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 136 from $_136 to thing.thing.chamber[2].thingy.v1*/
			translate(v = [9.5, 4.5, -14.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 140 from thing.thing.chamber[2].thingy.v1 to $_140*/
			translate(v = [8.5, 3.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 3 from thing.wash_ctrl_hole to $_3*/
			translate(v = [8.5, 8.5, -11.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 17 from thing.wash_flush_hole to $_17*/
			translate(v = [8.5, 9.5, -16.5]) {
				rotate(a = [0, 90.0, -45.0]) {
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
				translate(v = [9, -2, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.elute_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 8, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.elute_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 7, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.horiz_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 9, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.lysis_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 2, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.lysis_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 3, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r2c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 7, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r3c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 8, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r4c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -1, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 6, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v10*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 1, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 6, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 5, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v5*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 7, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v7*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 7, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v9*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -1, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 4, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 5, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v5*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 6, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v6*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 6, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v7*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 6, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v8*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 1, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[1].thingy.v9*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 1, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[2].thingy.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 4, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.wash_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 8, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.wash_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 8, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*Edge 43 from thing.bead_ctrl_hole to $_43*/
			translate(v = [10.5, -0.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 43 from $_43 to thing.thing.chamber[0].thingy.v9*/
			translate(v = [9.5, -0.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 60 from thing.elute_ctrl_hole to $_60*/
			translate(v = [10.5, 7.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 61 from thing.elute_flush_hole to $_61*/
			translate(v = [10.5, 6.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from thing.horiz_ctrl_hole to $_63*/
			translate(v = [10.5, 8.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from $_63 to thing.thing.chamber[0].thingy.v5*/
			translate(v = [9.5, 7.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from $_63 to thing.thing.chamber[0].thingy.v7*/
			translate(v = [9.5, 7.5, -15.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 67 from thing.lysis_ctrl_hole to $_67*/
			translate(v = [10.5, 3.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 68 from thing.lysis_flush_hole to $_68*/
			translate(v = [10.5, 4.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 83 from thing.thing.chamber[0].thingy.r2c to $_83*/
			translate(v = [10.5, 6.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 83 from $_83 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [9.5, 6.5, -12.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 83 from $_83 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [9.5, 5.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 85 from thing.thing.chamber[0].thingy.r3c to $_85*/
			translate(v = [10.5, 7.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 85 from $_85 to thing.thing.chamber[0].thingy.v1*/
			translate(v = [9.5, 6.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 87 from thing.thing.chamber[0].thingy.r4c to $_87*/
			translate(v = [10.5, 0.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 87 from $_87 to thing.thing.chamber[0].thingy.v10*/
			translate(v = [9.5, 1.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 91 from thing.thing.chamber[0].thingy.v1 to $_91*/
			translate(v = [10.5, 5.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 91 from $_91 to thing.thing.chamber[1].thingy.v1*/
			translate(v = [9.5, 4.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 91 from $_91 to thing.thing.chamber[2].thingy.v1*/
			translate(v = [9.5, 4.5, -14.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 99 from $_99 to thing.thing.chamber[0].thingy.v7*/
			translate(v = [9.5, 7.5, -15.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 99 from $_99 to thing.thing.chamber[1].thingy.v4*/
			translate(v = [9.5, 5.5, -15.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 99 from $_99 to thing.thing.chamber[1].thingy.v5*/
			translate(v = [9.5, 6.5, -15.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 99 from $_99 to thing.thing.chamber[1].thingy.v6*/
			translate(v = [9.5, 6.5, -14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 99 from $_99 to thing.thing.chamber[1].thingy.v7*/
			translate(v = [9.5, 6.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 103 from $_103 to thing.thing.chamber[0].thingy.v9*/
			translate(v = [9.5, -0.5, -15.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 103 from $_103 to thing.thing.chamber[1].thingy.v8*/
			translate(v = [9.5, 1.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 103 from $_103 to thing.thing.chamber[1].thingy.v9*/
			translate(v = [9.5, 1.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 149 from $_149 to thing.wash_ctrl_hole*/
			translate(v = [9.5, 8.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 150 from $_150 to thing.wash_flush_hole*/
			translate(v = [9.5, 8.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 10*/
	union() {
		%/*Nodes shell 10*/
		union() {
			/*Node $_43*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -1, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_60*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 7, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_61*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 6, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_63*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 8, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_67*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 3, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_68*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 4, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_83*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 6, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_85*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 7, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_87*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 0, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_91*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 5, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_99*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 6, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_103*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 0, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_149*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 7, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_150*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 7, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union() {
			/*Edge 43 from $_43 to thing.thing.chamber[0].thingy.v8*/
			translate(v = [11.5, 0.5, -14.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 60 from $_60 to thing.thing.elute*/
			translate(v = [11.5, 6.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 61 from $_61 to thing.thing.elute*/
			translate(v = [11.5, 6.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 63 from $_63 to thing.thing.chamber[0].thingy.v4*/
			translate(v = [11.5, 7.5, -15.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 63 from $_63 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [11.5, 7.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from $_67 to thing.thing.lysis*/
			translate(v = [11.5, 4.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 68 from $_68 to thing.thing.lysis*/
			translate(v = [11.5, 4.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 83 from $_83 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [11.5, 7.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 85 from $_85 to thing.thing.chamber[0].thingy.v4*/
			translate(v = [11.5, 7.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 87 from $_87 to thing.thing.chamber[0].thingy.v8*/
			translate(v = [11.5, 0.5, -14.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 91 from $_91 to thing.thing.elute*/
			translate(v = [11.5, 6.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 91 from $_91 to thing.thing.lysis*/
			translate(v = [11.5, 4.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 91 from $_91 to thing.thing.wash*/
			translate(v = [11.5, 6.5, -14.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 99 from thing.thing.chamber[0].thingy.v4 to $_99*/
			translate(v = [10.5, 6.5, -15.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 99 from $_99 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [11.5, 7.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 103 from thing.thing.chamber[0].thingy.v8 to $_103*/
			translate(v = [10.5, 0.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 149 from thing.thing.wash to $_149*/
			translate(v = [10.5, 7.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 150 from thing.thing.wash to $_150*/
			translate(v = [10.5, 7.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 11*/
	union() {
		%/*Nodes shell 11*/
		union() {
			/*Node thing.thing.chamber[0].thingy.v4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 7, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v6*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 7, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v8*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 0, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.elute*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 6, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.lysis*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 4, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.wash*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 6, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 11*/
		union() {
			/*Edge 45 from $_45 to thing.thing.chamber[0].thingy.v8*/
			translate(v = [11.5, 0.5, -14.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 49 from $_49 to thing.thing.chamber[0].thingy.v4*/
			translate(v = [11.5, 7.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 51 from $_51 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [11.5, 7.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 62 from $_62 to thing.thing.elute*/
			translate(v = [11.5, 6.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from $_69 to thing.thing.lysis*/
			translate(v = [11.5, 4.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 151 from thing.thing.wash to $_151*/
			translate(v = [12.5, 7.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 12*/
	union() {
		%/*Nodes shell 12*/
		union() {
			/*Node $_45*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 0, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_49*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 6, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_51*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 6, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_62*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 7, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_69*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 3, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_151*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 7, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 12*/
		union() {
			/*Edge 45 from thing.bead_in_hole to $_45*/
			translate(v = [12.5, 0.5, -14.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 49 from thing.buffer_in_hole to $_49*/
			translate(v = [12.5, 6.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 51 from thing.cell_in_hole to $_51*/
			translate(v = [12.5, 6.5, -13.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 62 from thing.elute_in_hole to $_62*/
			translate(v = [12.5, 7.5, -14.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 69 from thing.lysis_in_hole to $_69*/
			translate(v = [12.5, 3.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 151 from $_151 to thing.wash_in_hole*/
			translate(v = [13.5, 8.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
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
				translate(v = [13, 0, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.buffer_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 5, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.cell_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 6, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.elute_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 8, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.lysis_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 2, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.wash_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 8, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 13*/
		union() {
			/*Edge 30 from thing.bead_in_hole to $_30*/
			translate(v = [14.5, 0.5, -14.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 31 from thing.buffer_in_hole to $_31*/
			translate(v = [14.5, 4.5, -13.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 32 from thing.cell_in_hole to $_32*/
			translate(v = [14.5, 6.5, -13.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 35 from thing.elute_in_hole to $_35*/
			translate(v = [14.5, 8.5, -14.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 33 from thing.lysis_in_hole to $_33*/
			translate(v = [14.5, 1.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 34 from thing.wash_in_hole to $_34*/
			translate(v = [14.5, 8.5, -11.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
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
				translate(v = [14, 0, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_31*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 4, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 6, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 8, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 1, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 8, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 14*/
		union();
	}
}
