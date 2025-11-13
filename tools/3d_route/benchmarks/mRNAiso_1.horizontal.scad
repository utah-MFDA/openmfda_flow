translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_12*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 4, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 1, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 1, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_21*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 2, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 2, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 2, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 3, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 3, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 12 from bank.devices[0].thingy.vcollect to $_12*/
			translate(v = [0.5, 4.5, -0.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 25 from bank.devices[0].thingy.vcollect to $_25*/
			translate(v = [0.5, 4.5, 0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 6 from bank.devices[0].thingy.vcollect to $_6*/
			translate(v = [0.5, 3.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 14 from bank.devices[0].thingy.vlysis_out to $_14*/
			translate(v = [0.5, 2.5, 2.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 27 from bank.devices[0].thingy.vlysis_out to $_27*/
			translate(v = [0.5, 1.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 8 from bank.devices[0].thingy.vlysis_out to $_8*/
			translate(v = [0.5, 1.5, 3.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 21 from bank.devices[0].thingy.vwaste to $_21*/
			translate(v = [0.5, 2.5, 0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 34 from bank.devices[0].thingy.vwaste to $_34*/
			translate(v = [0.5, 2.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 10 from bank.devices[0].thingy.vwaste to $_10*/
			translate(v = [0.5, 2.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_5__0 to $_5__1*/
			translate(v = [1.5, 3.5, 3.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_3__0 to $_3__1*/
			translate(v = [1.5, 3.5, 1.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 1*/
	union() {
		%/*Nodes shell 1*/
		union() {
			/*Node bank.devices[0].thingy.vcollect*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vlysis_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 2, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vwaste*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 3, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge -1 from $_3 to $_3__1*/
			translate(v = [1.5, 3.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_5 to $_5__1*/
			translate(v = [1.5, 3.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 40 from bank.devices[0].thingy.vcollect to $_40*/
			translate(v = [2.5, 4.5, 1.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 40 from $_40 to bank.devices[0].thingy.vwaste*/
			translate(v = [1.5, 3.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 42 from bank.devices[0].thingy.vlysis_out to $_42*/
			translate(v = [2.5, 3.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
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
				translate(v = [2, 4, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 2, 6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 2, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 4, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [2, 4, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [2, 3, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 3, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_29*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 4, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 2, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_30*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 4, 6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 5, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_31*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 5, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 4, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_20*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 3, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 3 from bank.devices[0].thingy.vbead_out to $_3*/
			translate(v = [2.5, 4.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 24 from bank.devices[0].thingy.vcell_out to $_24*/
			translate(v = [2.5, 2.5, 6.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 39 from bank.devices[0].thingy.vcell_out to $_39*/
			translate(v = [2.5, 2.5, 5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 5 from bank.devices[0].thingy.vcell_out to $_5*/
			translate(v = [2.5, 4.5, 4.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 40 from $_40 to bank.devices[0].thingy.vsieve*/
			translate(v = [3.5, 3.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 42 from $_42 to bank.devices[0].thingy.vpump2*/
			translate(v = [3.5, 4.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 42 from $_42 to bank.devices[0].thingy.vpump3*/
			translate(v = [3.5, 4.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 16 from bank.devices[0].thingy.vpump1 to $_16*/
			translate(v = [2.5, 3.5, 5.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 29 from bank.devices[0].thingy.vpump1 to $_29*/
			translate(v = [2.5, 4.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 17 from bank.devices[0].thingy.vpump2 to $_17*/
			translate(v = [2.5, 2.5, 4.5]) {
				rotate(a = [0, 65.9051574478893, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 30 from bank.devices[0].thingy.vpump2 to $_30*/
			translate(v = [2.5, 4.5, 6.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 18 from bank.devices[0].thingy.vpump3 to $_18*/
			translate(v = [2.5, 5.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 31 from bank.devices[0].thingy.vpump3 to $_31*/
			translate(v = [2.5, 3.5, 3.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 19 from bank.devices[0].thingy.vsep to $_19*/
			translate(v = [2.5, 5.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 32 from bank.devices[0].thingy.vsep to $_32*/
			translate(v = [2.5, 4.5, 3.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 20 from bank.devices[0].thingy.vsieve to $_20*/
			translate(v = [2.5, 3.5, 2.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 33 from bank.devices[0].thingy.vsieve to $_33*/
			translate(v = [2.5, 3.5, 1.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union() {
			/*Node bank.devices[0].thingy.vbead_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vcell_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 3, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vpump1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 3, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vpump2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 4, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vpump3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 4, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vsep*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 4, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vsieve*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 3, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 22 from $_22 to bank.devices[0].thingy.vbead_out*/
			translate(v = [3.5, 3.5, 1.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 35 from $_35 to bank.devices[0].thingy.vbead_out*/
			translate(v = [3.5, 3.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 37 from $_37 to bank.devices[0].thingy.vbead_out*/
			translate(v = [3.5, 3.5, 1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 37 from $_37 to bank.devices[0].thingy.vsep*/
			translate(v = [3.5, 4.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 37 from $_37 to bank.devices[0].thingy.vsieve*/
			translate(v = [3.5, 3.5, 2.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 38 from $_38 to bank.devices[0].thingy.vcell_out*/
			translate(v = [3.5, 3.5, 5.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 38 from $_38 to bank.devices[0].thingy.vpump1*/
			translate(v = [3.5, 3.5, 4.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 38 from $_38 to bank.devices[0].thingy.vpump2*/
			translate(v = [3.5, 4.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 41 from $_41 to bank.devices[0].thingy.vpump1*/
			translate(v = [3.5, 3.5, 4.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 41 from $_41 to bank.devices[0].thingy.vpump3*/
			translate(v = [3.5, 4.5, 3.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 41 from $_41 to bank.devices[0].thingy.vsep*/
			translate(v = [3.5, 4.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*Node $_22*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 2, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 2, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_23*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 1, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 3, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_13*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 1, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_26*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 1, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 1, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_28*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 1, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 22 from bank.devices[0].thingy.vbead_in to $_22*/
			translate(v = [4.5, 2.5, 1.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 35 from bank.devices[0].thingy.vbead_in to $_35*/
			translate(v = [4.5, 2.5, 0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 37 from bank.devices[0].thingy.vbead_in to $_37*/
			translate(v = [4.5, 3.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 23 from bank.devices[0].thingy.vcell_in to $_23*/
			translate(v = [4.5, 2.5, 2.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 36 from bank.devices[0].thingy.vcell_in to $_36*/
			translate(v = [4.5, 1.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 38 from bank.devices[0].thingy.vcell_in to $_38*/
			translate(v = [4.5, 3.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 38 from $_38 to bank.devices[0].thingy.vpush*/
			translate(v = [5.5, 2.5, 4.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 13 from bank.devices[0].thingy.vlysis_in to $_13*/
			translate(v = [4.5, 1.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 26 from bank.devices[0].thingy.vlysis_in to $_26*/
			translate(v = [4.5, 1.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 41 from bank.devices[0].thingy.vlysis_in to $_41*/
			translate(v = [4.5, 3.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 15 from bank.devices[0].thingy.vpush to $_15*/
			translate(v = [4.5, 1.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 28 from bank.devices[0].thingy.vpush to $_28*/
			translate(v = [4.5, 1.5, 4.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*Node bank.devices[0].thingy.vbead_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 2, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vcell_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 2, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vlysis_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vpush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 2, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 2 from bank.devices[0].thingy.vbead_in to $_2*/
			translate(v = [6.5, 1.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 4 from bank.devices[0].thingy.vcell_in to $_4*/
			translate(v = [6.5, 1.5, 3.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 7 from bank.devices[0].thingy.vlysis_in to $_7*/
			translate(v = [6.5, 1.5, 2.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 9 from bank.devices[0].thingy.vpush to $_9*/
			translate(v = [6.5, 1.5, 4.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*Node $_2*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 1, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 1, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 1, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 1, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union();
	}
}
