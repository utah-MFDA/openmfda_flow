translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_12*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 23, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_26*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 23, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 24, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 25, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_28*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 20, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 22, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_22*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 24, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 21, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 22, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 23, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 21, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 12 from thing.collect_ctrl_hole to $_12*/
			translate(v = [0.5, 23.5, -24.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 26 from thing.collect_flush_hole to $_26*/
			translate(v = [0.5, 23.5, -23.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 36 from thing.collect_hole to $_36*/
			translate(v = [0.5, 24.5, -24.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 14 from thing.pump1_hole to $_14*/
			translate(v = [0.5, 25.5, -24.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 28 from thing.pump_flush1_hole to $_28*/
			translate(v = [0.5, 20.5, -24.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 8 from thing.waste_ctrl_hole to $_8*/
			translate(v = [0.5, 22.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 22 from thing.waste_flush_hole to $_22*/
			translate(v = [0.5, 24.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 37 from thing.waste_hole to $_37*/
			translate(v = [0.5, 21.5, -22.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_38__0 to $_38__1*/
			translate(v = [1.5, 22.5, -21.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_39__0 to $_39__1*/
			translate(v = [1.5, 24.5, -20.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_40__0 to $_40__1*/
			translate(v = [1.5, 22.5, -24.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 1*/
	union() {
		%/*Nodes shell 1*/
		union() {
			/*Node thing.collect_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, 24, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.collect_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 23, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.collect_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 25, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump1_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, 25, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump_flush1_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 21, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.waste_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, 23, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.waste_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 25, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.waste_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 22, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 22, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 24, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 22, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge -1 from $_38 to $_38__1*/
			translate(v = [1.5, 22.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_39 to $_39__1*/
			translate(v = [1.5, 24.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_40 to $_40__1*/
			translate(v = [1.5, 22.5, -24.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 51 from thing.collect_ctrl_hole to $_51*/
			translate(v = [2.5, 25.5, -24.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 52 from thing.collect_flush_hole to $_52*/
			translate(v = [2.5, 23.5, -23.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 53 from thing.collect_hole to $_53*/
			translate(v = [2.5, 25.5, -23.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 67 from thing.pump1_hole to $_67*/
			translate(v = [2.5, 24.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 70 from thing.pump_flush1_hole to $_70*/
			translate(v = [2.5, 22.5, -24.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 86 from $_86 to thing.waste_ctrl_hole*/
			translate(v = [1.5, 23.5, -22.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 87 from $_87 to thing.waste_flush_hole*/
			translate(v = [1.5, 25.5, -22.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 88 from $_88 to thing.waste_hole*/
			translate(v = [1.5, 22.5, -22.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_38*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 23, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 25, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 24, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 25, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 23, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_51*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 25, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 23, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_53*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 25, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 25, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 23, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_13*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 20, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_67*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 24, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 24, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 21, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_70*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 22, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_29*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 25, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_86*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 23, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_87*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 25, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_88*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 23, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 38 from thing.bead_out_hole to $_38*/
			translate(v = [2.5, 23.5, -20.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 11 from thing.bead_trap_ctrl_hole to $_11*/
			translate(v = [2.5, 25.5, -20.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 25 from thing.bead_trap_flush_hole to $_25*/
			translate(v = [2.5, 24.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 39 from thing.buffer_out_hole to $_39*/
			translate(v = [2.5, 25.5, -19.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 40 from thing.cell_out_hole to $_40*/
			translate(v = [2.5, 23.5, -24.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 51 from $_51 to thing.thing.chamber[0].thingy.v13*/
			translate(v = [3.5, 24.5, -24.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 52 from $_52 to thing.thing.chamber[0].thingy.v13*/
			translate(v = [3.5, 24.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 53 from $_53 to thing.thing.chamber[0].thingy.v13*/
			translate(v = [3.5, 24.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 5 from thing.dead_end_ctrl_hole to $_5*/
			translate(v = [2.5, 25.5, -18.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 19 from thing.dead_end_flush_hole to $_19*/
			translate(v = [2.5, 23.5, -19.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 13 from thing.pump0_hole to $_13*/
			translate(v = [2.5, 20.5, -24.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 67 from $_67 to thing.thing.chamber[0].thingy.p1*/
			translate(v = [3.5, 23.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 15 from thing.pump2_hole to $_15*/
			translate(v = [2.5, 24.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 27 from thing.pump_flush0_hole to $_27*/
			translate(v = [2.5, 21.5, -23.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 70 from $_70 to thing.thing.chamber[0].thingy.p1*/
			translate(v = [3.5, 23.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 29 from thing.pump_flush2_hole to $_29*/
			translate(v = [2.5, 25.5, -21.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 86 from thing.thing.chamber[0].thingy.v12 to $_86*/
			translate(v = [2.5, 23.5, -21.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 87 from thing.thing.chamber[0].thingy.v12 to $_87*/
			translate(v = [2.5, 25.5, -22.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 88 from thing.thing.chamber[0].thingy.v12 to $_88*/
			translate(v = [2.5, 23.5, -22.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
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
				translate(v = [3, 24, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.bead_trap_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 25, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.bead_trap_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 25, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.buffer_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 25, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.cell_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 22, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.dead_end_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 24, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.dead_end_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 24, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump0_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 21, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump2_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 25, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump_flush0_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 21, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.pump_flush2_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 24, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.p1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 23, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v12*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 24, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v13*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 24, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 44 from thing.bead_out_hole to $_44*/
			translate(v = [4.5, 25.5, -20.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 45 from thing.bead_trap_ctrl_hole to $_45*/
			translate(v = [4.5, 24.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 46 from thing.bead_trap_flush_hole to $_46*/
			translate(v = [4.5, 25.5, -24.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 48 from thing.buffer_out_hole to $_48*/
			translate(v = [4.5, 24.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from thing.cell_out_hole to $_50*/
			translate(v = [4.5, 23.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 54 from thing.dead_end_ctrl_hole to $_54*/
			translate(v = [4.5, 23.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 55 from thing.dead_end_flush_hole to $_55*/
			translate(v = [4.5, 24.5, -19.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 66 from thing.pump0_hole to $_66*/
			translate(v = [4.5, 22.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 68 from thing.pump2_hole to $_68*/
			translate(v = [4.5, 24.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from thing.pump_flush0_hole to $_69*/
			translate(v = [4.5, 21.5, -22.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 71 from thing.pump_flush2_hole to $_71*/
			translate(v = [4.5, 23.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from $_73 to thing.thing.chamber[0].thingy.p1*/
			translate(v = [3.5, 23.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from thing.thing.chamber[0].thingy.p1 to $_74*/
			translate(v = [4.5, 22.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 85 from $_85 to thing.thing.chamber[0].thingy.v12*/
			translate(v = [3.5, 24.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 85 from $_85 to thing.thing.chamber[0].thingy.v13*/
			translate(v = [3.5, 24.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*Node $_44*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 25, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_45*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 24, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_46*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 25, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 24, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 23, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_54*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 23, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_55*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 24, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 23, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 25, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_66*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 22, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_68*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 24, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_69*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 21, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_71*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 23, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_73*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 22, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_74*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 22, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_85*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 25, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_93*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 23, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_94*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 22, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 20, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_20*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 22, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 44 from $_44 to thing.thing.dead_bead*/
			translate(v = [5.5, 24.5, -20.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 45 from $_45 to thing.thing.chamber[0].thingy.v11*/
			translate(v = [5.5, 25.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 46 from $_46 to thing.thing.chamber[0].thingy.v11*/
			translate(v = [5.5, 25.5, -23.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 48 from $_48 to thing.thing.dead_buffer*/
			translate(v = [5.5, 23.5, -20.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from $_50 to thing.thing.dead_cell*/
			translate(v = [5.5, 22.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 54 from $_54 to thing.thing.dead_buffer*/
			translate(v = [5.5, 23.5, -20.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 55 from $_55 to thing.thing.dead_bead*/
			translate(v = [5.5, 24.5, -20.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 10 from thing.loop_exit_ctrl_hole to $_10*/
			translate(v = [4.5, 23.5, -20.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 24 from thing.loop_exit_flush_hole to $_24*/
			translate(v = [4.5, 25.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 66 from $_66 to thing.thing.chamber[0].thingy.p0*/
			translate(v = [5.5, 22.5, -23.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 68 from $_68 to thing.thing.chamber[0].thingy.p2*/
			translate(v = [5.5, 23.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from $_69 to thing.thing.chamber[0].thingy.p0*/
			translate(v = [5.5, 22.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 71 from $_71 to thing.thing.chamber[0].thingy.p2*/
			translate(v = [5.5, 23.5, -23.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 73 from thing.thing.chamber[0].thingy.p0 to $_73*/
			translate(v = [4.5, 22.5, -24.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 74 from $_74 to thing.thing.chamber[0].thingy.p2*/
			translate(v = [5.5, 23.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 85 from thing.thing.chamber[0].thingy.v11 to $_85*/
			translate(v = [4.5, 25.5, -23.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 93 from thing.thing.dead_bead to $_93*/
			translate(v = [4.5, 23.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 93 from $_93 to thing.thing.dead_cell*/
			translate(v = [5.5, 22.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 94 from thing.thing.dead_buffer to $_94*/
			translate(v = [4.5, 22.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 94 from $_94 to thing.thing.dead_cell*/
			translate(v = [5.5, 22.5, -22.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 6 from thing.vertical_ctrl_hole to $_6*/
			translate(v = [4.5, 20.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 20 from thing.vertical_flush_hole to $_20*/
			translate(v = [4.5, 22.5, -20.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*Node thing.loop_exit_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 24, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.loop_exit_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 24, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.p0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 22, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.p2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 23, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r1c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 23, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v11*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 25, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.dead_bead*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 24, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.dead_buffer*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 23, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.dead_cell*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 22, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.vertical_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 21, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.vertical_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 22, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 61 from thing.loop_exit_ctrl_hole to $_61*/
			translate(v = [6.5, 25.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 62 from thing.loop_exit_flush_hole to $_62*/
			translate(v = [6.5, 25.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from thing.thing.chamber[0].thingy.p0 to $_72*/
			translate(v = [6.5, 23.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from $_72 to thing.thing.chamber[0].thingy.r1c*/
			translate(v = [5.5, 23.5, -22.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 75 from thing.thing.chamber[0].thingy.p2 to $_75*/
			translate(v = [6.5, 23.5, -23.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 75 from $_75 to thing.thing.chamber[0].thingy.r1c*/
			translate(v = [5.5, 23.5, -22.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 81 from $_81 to thing.thing.chamber[0].thingy.v11*/
			translate(v = [5.5, 25.5, -23.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 82 from $_82 to thing.vertical_ctrl_hole*/
			translate(v = [5.5, 21.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 83 from $_83 to thing.vertical_flush_hole*/
			translate(v = [5.5, 22.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 90 from $_90 to thing.thing.dead_buffer*/
			translate(v = [5.5, 23.5, -20.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 91 from $_91 to thing.thing.dead_cell*/
			translate(v = [5.5, 22.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 92 from $_92 to thing.thing.dead_bead*/
			translate(v = [5.5, 24.5, -20.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*Node $_9*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 24, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_23*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 25, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 23, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 25, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 19, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_21*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 19, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_61*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 25, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_62*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 25, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_2*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 24, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 24, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_72*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 23, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_75*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 23, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_77*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 20, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_79*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 21, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_81*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 24, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_82*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 22, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_83*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 23, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_89*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [6, 22, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_90*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 22, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_91*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 21, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_92*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 24, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 25, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 25, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*Edge 9 from thing.bead_ctrl_hole to $_9*/
			translate(v = [6.5, 24.5, -20.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 23 from thing.bead_flush_hole to $_23*/
			translate(v = [6.5, 25.5, -20.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 4 from thing.elute_ctrl_hole to $_4*/
			translate(v = [6.5, 23.5, -24.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 18 from thing.elute_flush_hole to $_18*/
			translate(v = [6.5, 25.5, -19.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 7 from thing.horiz_ctrl_hole to $_7*/
			translate(v = [6.5, 19.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 21 from thing.horiz_flush_hole to $_21*/
			translate(v = [6.5, 19.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 61 from $_61 to thing.thing.chamber[0].thingy.v10*/
			translate(v = [7.5, 24.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 62 from $_62 to thing.thing.chamber[0].thingy.v10*/
			translate(v = [7.5, 24.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 2 from thing.lysis_ctrl_hole to $_2*/
			translate(v = [6.5, 24.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 16 from thing.lysis_flush_hole to $_16*/
			translate(v = [6.5, 24.5, -24.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 72 from $_72 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [7.5, 22.5, -21.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 75 from $_75 to thing.thing.chamber[0].thingy.v10*/
			translate(v = [7.5, 24.5, -23.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 77 from thing.thing.chamber[0].thingy.r2c to $_77*/
			translate(v = [6.5, 20.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from $_77 to thing.thing.chamber[0].thingy.v7*/
			translate(v = [7.5, 20.5, -22.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 79 from thing.thing.chamber[0].thingy.r3c to $_79*/
			translate(v = [6.5, 21.5, -21.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 79 from $_79 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [7.5, 22.5, -20.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 81 from thing.thing.chamber[0].thingy.r4c to $_81*/
			translate(v = [6.5, 24.5, -23.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 81 from $_81 to thing.thing.chamber[0].thingy.v9*/
			translate(v = [7.5, 25.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 82 from thing.thing.chamber[0].thingy.v1 to $_82*/
			translate(v = [6.5, 22.5, -21.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 83 from thing.thing.chamber[0].thingy.v1 to $_83*/
			translate(v = [6.5, 23.5, -20.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 82 from $_82 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [7.5, 22.5, -20.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 82 from $_82 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [7.5, 22.5, -21.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 83 from $_83 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [7.5, 22.5, -20.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 83 from $_83 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [7.5, 22.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 89 from thing.thing.chamber[0].thingy.v5 to $_89*/
			translate(v = [6.5, 22.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 90 from thing.thing.chamber[0].thingy.v5 to $_90*/
			translate(v = [6.5, 22.5, -20.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 91 from thing.thing.chamber[0].thingy.v7 to $_91*/
			translate(v = [6.5, 21.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 92 from thing.thing.chamber[0].thingy.v9 to $_92*/
			translate(v = [6.5, 24.5, -21.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 3 from thing.wash_ctrl_hole to $_3*/
			translate(v = [6.5, 25.5, -18.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 17 from thing.wash_flush_hole to $_17*/
			translate(v = [6.5, 25.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 7*/
	union() {
		%/*Nodes shell 7*/
		union() {
			/*Node thing.bead_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, 25, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.bead_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, 24, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.elute_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, 23, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.elute_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, 25, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.horiz_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, 20, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.horiz_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, 20, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.lysis_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, 25, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.lysis_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, 25, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r2c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 21, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r3c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 22, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.r4c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 24, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 23, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v10*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 24, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 22, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 22, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v5*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 21, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v7*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 20, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v9*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 25, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.wash_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, 25, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.wash_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, 24, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*Edge 41 from thing.bead_ctrl_hole to $_41*/
			translate(v = [8.5, 24.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 41 from $_41 to thing.thing.chamber[0].thingy.v9*/
			translate(v = [7.5, 25.5, -22.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 42 from thing.bead_flush_hole to $_42*/
			translate(v = [8.5, 25.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 42 from $_42 to thing.thing.chamber[0].thingy.v9*/
			translate(v = [7.5, 25.5, -22.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 56 from thing.elute_ctrl_hole to $_56*/
			translate(v = [8.5, 23.5, -22.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 57 from thing.elute_flush_hole to $_57*/
			translate(v = [8.5, 24.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from thing.horiz_ctrl_hole to $_59*/
			translate(v = [8.5, 21.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from $_59 to thing.thing.chamber[0].thingy.v5*/
			translate(v = [7.5, 21.5, -21.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 59 from $_59 to thing.thing.chamber[0].thingy.v7*/
			translate(v = [7.5, 20.5, -22.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 60 from thing.horiz_flush_hole to $_60*/
			translate(v = [8.5, 21.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 60 from $_60 to thing.thing.chamber[0].thingy.v7*/
			translate(v = [7.5, 20.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from thing.lysis_ctrl_hole to $_63*/
			translate(v = [8.5, 24.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from thing.lysis_flush_hole to $_64*/
			translate(v = [8.5, 24.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from thing.thing.chamber[0].thingy.r2c to $_76*/
			translate(v = [8.5, 22.5, -20.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 76 from $_76 to thing.thing.chamber[0].thingy.v2*/
			translate(v = [7.5, 22.5, -20.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 76 from $_76 to thing.thing.chamber[0].thingy.v3*/
			translate(v = [7.5, 22.5, -21.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 78 from thing.thing.chamber[0].thingy.r3c to $_78*/
			translate(v = [8.5, 22.5, -21.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 78 from $_78 to thing.thing.chamber[0].thingy.v1*/
			translate(v = [7.5, 23.5, -21.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 80 from thing.thing.chamber[0].thingy.r4c to $_80*/
			translate(v = [8.5, 25.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 80 from $_80 to thing.thing.chamber[0].thingy.v10*/
			translate(v = [7.5, 24.5, -23.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 84 from thing.thing.chamber[0].thingy.v1 to $_84*/
			translate(v = [8.5, 23.5, -21.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 95 from $_95 to thing.wash_ctrl_hole*/
			translate(v = [7.5, 25.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 96 from $_96 to thing.wash_flush_hole*/
			translate(v = [7.5, 24.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 8*/
	union() {
		%/*Nodes shell 8*/
		union() {
			/*Node $_41*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 24, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 25, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_56*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 23, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_57*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 24, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_59*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 21, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_60*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 21, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_63*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 24, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_64*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 24, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_76*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 22, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_78*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 22, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_80*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 25, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_84*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 23, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_95*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 24, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_96*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 25, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*Edge 41 from $_41 to thing.thing.chamber[0].thingy.v8*/
			translate(v = [9.5, 25.5, -22.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 42 from $_42 to thing.thing.chamber[0].thingy.v8*/
			translate(v = [9.5, 25.5, -22.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 56 from $_56 to thing.thing.elute*/
			translate(v = [9.5, 23.5, -21.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 57 from $_57 to thing.thing.elute*/
			translate(v = [9.5, 23.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from $_59 to thing.thing.chamber[0].thingy.v4*/
			translate(v = [9.5, 21.5, -21.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 59 from $_59 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [9.5, 22.5, -21.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 60 from $_60 to thing.thing.chamber[0].thingy.v4*/
			translate(v = [9.5, 21.5, -21.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 60 from $_60 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [9.5, 22.5, -21.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 63 from $_63 to thing.thing.lysis*/
			translate(v = [9.5, 23.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from $_64 to thing.thing.lysis*/
			translate(v = [9.5, 23.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from $_76 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [9.5, 22.5, -21.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 78 from $_78 to thing.thing.chamber[0].thingy.v4*/
			translate(v = [9.5, 21.5, -21.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 80 from $_80 to thing.thing.chamber[0].thingy.v8*/
			translate(v = [9.5, 25.5, -22.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 84 from $_84 to thing.thing.elute*/
			translate(v = [9.5, 23.5, -21.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 84 from $_84 to thing.thing.lysis*/
			translate(v = [9.5, 23.5, -22.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 84 from $_84 to thing.thing.wash*/
			translate(v = [9.5, 24.5, -20.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 95 from thing.thing.wash to $_95*/
			translate(v = [8.5, 24.5, -19.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 96 from thing.thing.wash to $_96*/
			translate(v = [8.5, 25.5, -21.5]) {
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
			/*Node thing.thing.chamber[0].thingy.v4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 21, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v6*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 22, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.chamber[0].thingy.v8*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 25, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.elute*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 23, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.lysis*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 23, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.thing.wash*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 24, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*Edge 43 from $_43 to thing.thing.chamber[0].thingy.v8*/
			translate(v = [9.5, 25.5, -22.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 47 from $_47 to thing.thing.chamber[0].thingy.v4*/
			translate(v = [9.5, 21.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 49 from $_49 to thing.thing.chamber[0].thingy.v6*/
			translate(v = [9.5, 22.5, -21.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 58 from $_58 to thing.thing.elute*/
			translate(v = [9.5, 23.5, -21.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 65 from $_65 to thing.thing.lysis*/
			translate(v = [9.5, 23.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 97 from thing.thing.wash to $_97*/
			translate(v = [10.5, 23.5, -20.5]) {
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
			/*Node $_43*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 24, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 22, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_49*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 23, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_58*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 23, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_65*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 24, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_97*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 23, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union() {
			/*Edge 43 from thing.bead_in_hole to $_43*/
			translate(v = [10.5, 24.5, -22.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 47 from thing.buffer_in_hole to $_47*/
			translate(v = [10.5, 22.5, -20.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 49 from thing.cell_in_hole to $_49*/
			translate(v = [10.5, 23.5, -21.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 58 from thing.elute_in_hole to $_58*/
			translate(v = [10.5, 23.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 65 from thing.lysis_in_hole to $_65*/
			translate(v = [10.5, 24.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 97 from $_97 to thing.wash_in_hole*/
			translate(v = [11.5, 22.5, -20.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 11*/
	union() {
		%/*Nodes shell 11*/
		union() {
			/*Node thing.bead_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 24, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.buffer_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 22, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.cell_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 24, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.elute_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 24, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.lysis_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 25, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thing.wash_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 22, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 11*/
		union() {
			/*Edge 30 from thing.bead_in_hole to $_30*/
			translate(v = [12.5, 25.5, -22.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 31 from thing.buffer_in_hole to $_31*/
			translate(v = [12.5, 22.5, -22.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 32 from thing.cell_in_hole to $_32*/
			translate(v = [12.5, 25.5, -21.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 35 from thing.elute_in_hole to $_35*/
			translate(v = [12.5, 25.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 33 from thing.lysis_in_hole to $_33*/
			translate(v = [12.5, 24.5, -24.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 34 from thing.wash_in_hole to $_34*/
			translate(v = [12.5, 22.5, -21.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 12*/
	union() {
		%/*Nodes shell 12*/
		union() {
			/*Node $_30*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 25, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_31*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 22, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 25, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 25, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 24, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 22, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 12*/
		union();
	}
}
