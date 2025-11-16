translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_11*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 20, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 19, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 19, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 25, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_13*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 21, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_26*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 22, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_20*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 21, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 20, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 19, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 20, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 19, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 11 from bank.collect_ctrl_hole to $_11*/
			translate(v = [0.5, 20.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 24 from bank.collect_flush_hole to $_24*/
			translate(v = [0.5, 19.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 6 from bank.collect_hole to $_6*/
			translate(v = [0.5, 19.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 8 from bank.lysis_buffer_out_hole to $_8*/
			translate(v = [0.5, 25.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 13 from bank.lysis_out_ctrl_hole to $_13*/
			translate(v = [0.5, 21.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 26 from bank.lysis_out_flush_hole to $_26*/
			translate(v = [0.5, 22.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 20 from bank.waste_ctrl_hole to $_20*/
			translate(v = [0.5, 21.5, -21.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 33 from bank.waste_flush_hole to $_33*/
			translate(v = [0.5, 20.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 10 from bank.waste_out_hole to $_10*/
			translate(v = [0.5, 19.5, -23.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_5__0 to $_5__1*/
			translate(v = [1.5, 21.5, -21.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_3__0 to $_3__1*/
			translate(v = [1.5, 20.5, -24.5]) {
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
			/*Node bank.collect_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, 21, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.collect_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 20, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.collect_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 20, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_buffer_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 25, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_out_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, 22, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_out_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 23, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.waste_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, 22, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.waste_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 21, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.waste_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 20, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 21, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 20, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge -1 from $_3 to $_3__1*/
			translate(v = [1.5, 20.5, -24.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_5 to $_5__1*/
			translate(v = [1.5, 21.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 47 from bank.collect_ctrl_hole to $_47*/
			translate(v = [2.5, 22.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 48 from bank.collect_flush_hole to $_48*/
			translate(v = [2.5, 21.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 49 from bank.collect_hole to $_49*/
			translate(v = [2.5, 21.5, -20.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 51 from bank.lysis_buffer_out_hole to $_51*/
			translate(v = [2.5, 25.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 54 from bank.lysis_out_ctrl_hole to $_54*/
			translate(v = [2.5, 23.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 55 from bank.lysis_out_flush_hole to $_55*/
			translate(v = [2.5, 24.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from $_74 to bank.waste_ctrl_hole*/
			translate(v = [1.5, 22.5, -22.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 75 from $_75 to bank.waste_flush_hole*/
			translate(v = [1.5, 21.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from $_76 to bank.waste_out_hole*/
			translate(v = [1.5, 20.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_3*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 21, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_23*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 24, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 24, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 22, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 22, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 21, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_49*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 21, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_51*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 25, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_54*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 23, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_55*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 24, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_28*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 25, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 25, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_29*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 23, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 24, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_30*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 19, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 19, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 20, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_31*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 20, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 23, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 22, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_74*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 23, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_75*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 22, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_76*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 21, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 3 from bank.beads_out_hole to $_3*/
			translate(v = [2.5, 21.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 23 from bank.cells_out_ctrl_hole to $_23*/
			translate(v = [2.5, 24.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 36 from bank.cells_out_flush_hole to $_36*/
			translate(v = [2.5, 24.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 5 from bank.cells_out_hole to $_5*/
			translate(v = [2.5, 22.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 47 from $_47 to bank.thing.devices[0].thingy.vcollect*/
			translate(v = [3.5, 22.5, -19.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 48 from $_48 to bank.thing.devices[0].thingy.vcollect*/
			translate(v = [3.5, 22.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 49 from $_49 to bank.thing.devices[0].thingy.vcollect*/
			translate(v = [3.5, 22.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 51 from $_51 to bank.thing.devices[0].thingy.vlysis_out*/
			translate(v = [3.5, 24.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 54 from $_54 to bank.thing.devices[0].thingy.vlysis_out*/
			translate(v = [3.5, 24.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 55 from $_55 to bank.thing.devices[0].thingy.vlysis_out*/
			translate(v = [3.5, 24.5, -17.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 28 from bank.pump1_flush_hole to $_28*/
			translate(v = [2.5, 25.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 15 from bank.pump1_hole to $_15*/
			translate(v = [2.5, 25.5, -21.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 29 from bank.pump2_flush_hole to $_29*/
			translate(v = [2.5, 23.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 16 from bank.pump2_hole to $_16*/
			translate(v = [2.5, 24.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 30 from bank.pump3_flush_hole to $_30*/
			translate(v = [2.5, 19.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 17 from bank.pump3_hole to $_17*/
			translate(v = [2.5, 19.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 18 from bank.sep_ctrl_hole to $_18*/
			translate(v = [2.5, 20.5, -23.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 31 from bank.sep_flush_hole to $_31*/
			translate(v = [2.5, 20.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 19 from bank.sieve_ctrl_hole to $_19*/
			translate(v = [2.5, 23.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 32 from bank.sieve_flush_hole to $_32*/
			translate(v = [2.5, 22.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from bank.thing.devices[0].thingy.vwaste to $_74*/
			translate(v = [2.5, 23.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 75 from bank.thing.devices[0].thingy.vwaste to $_75*/
			translate(v = [2.5, 22.5, -22.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 76 from bank.thing.devices[0].thingy.vwaste to $_76*/
			translate(v = [2.5, 21.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union() {
			/*Node bank.beads_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 22, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_out_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 25, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_out_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 25, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 23, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.pump1_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 24, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.pump1_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 25, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.pump2_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 22, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.pump2_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 25, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.pump3_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 20, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.pump3_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 20, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.sep_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 21, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.sep_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 21, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.sieve_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 24, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.sieve_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 23, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vcollect*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 22, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vlysis_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 24, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vwaste*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 22, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 40 from bank.beads_out_hole to $_40*/
			translate(v = [4.5, 23.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 44 from bank.cells_out_ctrl_hole to $_44*/
			translate(v = [4.5, 25.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 45 from bank.cells_out_flush_hole to $_45*/
			translate(v = [4.5, 25.5, -17.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 46 from bank.cells_out_hole to $_46*/
			translate(v = [4.5, 24.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 56 from bank.pump1_flush_hole to $_56*/
			translate(v = [4.5, 25.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 57 from bank.pump1_hole to $_57*/
			translate(v = [4.5, 25.5, -19.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 58 from bank.pump2_flush_hole to $_58*/
			translate(v = [4.5, 23.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from bank.pump2_hole to $_59*/
			translate(v = [4.5, 25.5, -18.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 60 from bank.pump3_flush_hole to $_60*/
			translate(v = [4.5, 21.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 61 from bank.pump3_hole to $_61*/
			translate(v = [4.5, 21.5, -20.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 65 from bank.sep_ctrl_hole to $_65*/
			translate(v = [4.5, 22.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 66 from bank.sep_flush_hole to $_66*/
			translate(v = [4.5, 22.5, -20.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from bank.sieve_ctrl_hole to $_67*/
			translate(v = [4.5, 24.5, -22.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 68 from bank.sieve_flush_hole to $_68*/
			translate(v = [4.5, 23.5, -22.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 71 from bank.thing.devices[0].thingy.vcollect to $_71*/
			translate(v = [4.5, 23.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 71 from $_71 to bank.thing.devices[0].thingy.vwaste*/
			translate(v = [3.5, 22.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from bank.thing.devices[0].thingy.vlysis_out to $_73*/
			translate(v = [4.5, 23.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*Node $_21*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 25, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 25, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 23, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_22*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 24, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 25, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_44*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 25, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_45*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 25, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_46*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 24, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 22, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 20, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_56*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 25, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_57*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 25, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_58*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 23, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_59*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 25, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_60*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 21, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_61*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 21, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 24, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 21, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_65*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 22, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_66*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 22, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_67*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 24, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_68*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 23, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_71*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 23, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_73*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 23, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 21 from bank.beads_ctrl_hole to $_21*/
			translate(v = [4.5, 25.5, -22.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 34 from bank.beads_flush_hole to $_34*/
			translate(v = [4.5, 25.5, -23.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 40 from $_40 to bank.thing.devices[0].thingy.vbead_out*/
			translate(v = [5.5, 24.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 22 from bank.cells_in_ctrl_hole to $_22*/
			translate(v = [4.5, 24.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 35 from bank.cells_in_flush_hole to $_35*/
			translate(v = [4.5, 25.5, -14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 44 from $_44 to bank.thing.devices[0].thingy.vcell_out*/
			translate(v = [5.5, 25.5, -17.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 45 from $_45 to bank.thing.devices[0].thingy.vcell_out*/
			translate(v = [5.5, 25.5, -17.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 46 from $_46 to bank.thing.devices[0].thingy.vcell_out*/
			translate(v = [5.5, 25.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 12 from bank.lysis_in_ctrl_hole to $_12*/
			translate(v = [4.5, 22.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 25 from bank.lysis_in_flush_hole to $_25*/
			translate(v = [4.5, 20.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 56 from $_56 to bank.thing.devices[0].thingy.vpump1*/
			translate(v = [5.5, 24.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 57 from $_57 to bank.thing.devices[0].thingy.vpump1*/
			translate(v = [5.5, 24.5, -19.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 58 from $_58 to bank.thing.devices[0].thingy.vpump2*/
			translate(v = [5.5, 24.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from $_59 to bank.thing.devices[0].thingy.vpump2*/
			translate(v = [5.5, 24.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 60 from $_60 to bank.thing.devices[0].thingy.vpump3*/
			translate(v = [5.5, 22.5, -19.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 61 from $_61 to bank.thing.devices[0].thingy.vpump3*/
			translate(v = [5.5, 22.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 14 from bank.push_ctrl_hole to $_14*/
			translate(v = [4.5, 24.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 27 from bank.push_flush_hole to $_27*/
			translate(v = [4.5, 21.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 65 from $_65 to bank.thing.devices[0].thingy.vsep*/
			translate(v = [5.5, 23.5, -21.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 66 from $_66 to bank.thing.devices[0].thingy.vsep*/
			translate(v = [5.5, 23.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from $_67 to bank.thing.devices[0].thingy.vsieve*/
			translate(v = [5.5, 24.5, -21.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 68 from $_68 to bank.thing.devices[0].thingy.vsieve*/
			translate(v = [5.5, 24.5, -21.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 71 from $_71 to bank.thing.devices[0].thingy.vsieve*/
			translate(v = [5.5, 24.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from $_73 to bank.thing.devices[0].thingy.vpump2*/
			translate(v = [5.5, 24.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from $_73 to bank.thing.devices[0].thingy.vpump3*/
			translate(v = [5.5, 22.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*Node bank.beads_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 25, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.beads_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 25, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_in_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 24, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_in_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 25, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_in_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 23, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_in_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 21, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.push_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 25, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.push_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 22, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vbead_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 24, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vcell_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 25, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vpump1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 24, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vpump2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 24, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vpump3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 22, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vsep*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 23, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vsieve*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 24, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 37 from bank.beads_ctrl_hole to $_37*/
			translate(v = [6.5, 25.5, -22.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 37 from $_37 to bank.thing.devices[0].thingy.vbead_out*/
			translate(v = [5.5, 24.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 38 from bank.beads_flush_hole to $_38*/
			translate(v = [6.5, 25.5, -24.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 38 from $_38 to bank.thing.devices[0].thingy.vbead_out*/
			translate(v = [5.5, 24.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 41 from bank.cells_in_ctrl_hole to $_41*/
			translate(v = [6.5, 25.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 42 from bank.cells_in_flush_hole to $_42*/
			translate(v = [6.5, 24.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 52 from bank.lysis_in_ctrl_hole to $_52*/
			translate(v = [6.5, 24.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 53 from bank.lysis_in_flush_hole to $_53*/
			translate(v = [6.5, 22.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 62 from bank.push_ctrl_hole to $_62*/
			translate(v = [6.5, 24.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from bank.push_flush_hole to $_63*/
			translate(v = [6.5, 23.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from $_69 to bank.thing.devices[0].thingy.vbead_out*/
			translate(v = [5.5, 24.5, -23.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 69 from $_69 to bank.thing.devices[0].thingy.vsep*/
			translate(v = [5.5, 23.5, -21.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from $_69 to bank.thing.devices[0].thingy.vsieve*/
			translate(v = [5.5, 24.5, -21.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 70 from $_70 to bank.thing.devices[0].thingy.vcell_out*/
			translate(v = [5.5, 25.5, -17.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 70 from $_70 to bank.thing.devices[0].thingy.vpump1*/
			translate(v = [5.5, 24.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 70 from $_70 to bank.thing.devices[0].thingy.vpump2*/
			translate(v = [5.5, 24.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from $_72 to bank.thing.devices[0].thingy.vpump1*/
			translate(v = [5.5, 24.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from $_72 to bank.thing.devices[0].thingy.vpump3*/
			translate(v = [5.5, 22.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from $_72 to bank.thing.devices[0].thingy.vsep*/
			translate(v = [5.5, 23.5, -21.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*Node $_37*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 25, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 25, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 25, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 24, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 24, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_53*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 22, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_62*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 24, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_63*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 23, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_69*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [6, 24, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_70*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [6, 25, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_72*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [6, 23, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*Edge 37 from $_37 to bank.thing.devices[0].thingy.vbead_in*/
			translate(v = [7.5, 25.5, -23.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 38 from $_38 to bank.thing.devices[0].thingy.vbead_in*/
			translate(v = [7.5, 25.5, -23.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 41 from $_41 to bank.thing.devices[0].thingy.vcell_in*/
			translate(v = [7.5, 25.5, -17.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 42 from $_42 to bank.thing.devices[0].thingy.vcell_in*/
			translate(v = [7.5, 25.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 52 from $_52 to bank.thing.devices[0].thingy.vlysis_in*/
			translate(v = [7.5, 23.5, -19.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 53 from $_53 to bank.thing.devices[0].thingy.vlysis_in*/
			translate(v = [7.5, 23.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 62 from $_62 to bank.thing.devices[0].thingy.vpush*/
			translate(v = [7.5, 24.5, -17.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 63 from $_63 to bank.thing.devices[0].thingy.vpush*/
			translate(v = [7.5, 24.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from bank.thing.devices[0].thingy.vbead_in to $_69*/
			translate(v = [6.5, 24.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 70 from bank.thing.devices[0].thingy.vcell_in to $_70*/
			translate(v = [6.5, 25.5, -18.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 70 from $_70 to bank.thing.devices[0].thingy.vpush*/
			translate(v = [7.5, 24.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from bank.thing.devices[0].thingy.vlysis_in to $_72*/
			translate(v = [6.5, 23.5, -20.5]) {
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
			/*Node bank.thing.devices[0].thingy.vbead_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 25, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vcell_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 25, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vlysis_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 23, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vpush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 24, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*Edge 39 from $_39 to bank.thing.devices[0].thingy.vbead_in*/
			translate(v = [7.5, 25.5, -23.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 43 from $_43 to bank.thing.devices[0].thingy.vcell_in*/
			translate(v = [7.5, 25.5, -17.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 50 from $_50 to bank.thing.devices[0].thingy.vlysis_in*/
			translate(v = [7.5, 23.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from $_64 to bank.thing.devices[0].thingy.vpush*/
			translate(v = [7.5, 24.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 8*/
	union() {
		%/*Nodes shell 8*/
		union() {
			/*Node $_39*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 25, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_43*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 25, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 22, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_64*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 23, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*Edge 39 from bank.beads_in_hole to $_39*/
			translate(v = [8.5, 25.5, -22.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 43 from bank.cells_in_hole to $_43*/
			translate(v = [8.5, 25.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from bank.lysis_buffer_in_hole to $_50*/
			translate(v = [8.5, 22.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from bank.push_line_hole to $_64*/
			translate(v = [8.5, 23.5, -16.5]) {
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
			/*Node bank.beads_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 25, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 24, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_buffer_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 21, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.push_line_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 22, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*Edge 2 from bank.beads_in_hole to $_2*/
			translate(v = [10.5, 25.5, -20.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 4 from bank.cells_in_hole to $_4*/
			translate(v = [10.5, 23.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 7 from bank.lysis_buffer_in_hole to $_7*/
			translate(v = [10.5, 20.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 9 from bank.push_line_hole to $_9*/
			translate(v = [10.5, 21.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 10*/
	union() {
		%/*Nodes shell 10*/
		union() {
			/*Node $_2*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 25, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 23, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 20, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 21, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union();
	}
}
