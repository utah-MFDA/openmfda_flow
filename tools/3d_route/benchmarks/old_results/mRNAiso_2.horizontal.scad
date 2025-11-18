translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_21*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 7, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_51*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 6, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 8, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_23*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 8, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_55*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 8, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 9, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_30*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 7, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_63*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 6, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 7, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 6, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 5, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 9, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 7, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_43*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 4, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 4, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 5, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 7, 8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 5, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 10, 9]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 21 from bank.devices[0].thingy.vcollect to $_21*/
			translate(v = [0.5, 7.5, 16.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 51 from bank.devices[0].thingy.vcollect to $_51*/
			translate(v = [0.5, 6.5, 16.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 10 from bank.devices[0].thingy.vcollect to $_10*/
			translate(v = [0.5, 8.5, 15.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 51 from $_51 to bank.devices[1].thingy.vcollect*/
			translate(v = [1.5, 5.5, 15.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 23 from bank.devices[0].thingy.vlysis_out to $_23*/
			translate(v = [0.5, 8.5, 11.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 55 from bank.devices[0].thingy.vlysis_out to $_55*/
			translate(v = [0.5, 8.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 14 from bank.devices[0].thingy.vlysis_out to $_14*/
			translate(v = [0.5, 9.5, 11.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 55 from $_55 to bank.devices[1].thingy.vlysis_out*/
			translate(v = [1.5, 8.5, 11.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 30 from bank.devices[0].thingy.vwaste to $_30*/
			translate(v = [0.5, 7.5, 14.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 63 from bank.devices[0].thingy.vwaste to $_63*/
			translate(v = [0.5, 6.5, 15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 18 from bank.devices[0].thingy.vwaste to $_18*/
			translate(v = [0.5, 7.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from $_63 to bank.devices[1].thingy.vwaste*/
			translate(v = [1.5, 5.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 34 from bank.devices[1].thingy.vcollect to $_34*/
			translate(v = [0.5, 6.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 11 from bank.devices[1].thingy.vcollect to $_11*/
			translate(v = [0.5, 5.5, 16.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 36 from bank.devices[1].thingy.vlysis_out to $_36*/
			translate(v = [0.5, 9.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 15 from bank.devices[1].thingy.vlysis_out to $_15*/
			translate(v = [0.5, 7.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 43 from bank.devices[1].thingy.vwaste to $_43*/
			translate(v = [0.5, 4.5, 14.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 19 from bank.devices[1].thingy.vwaste to $_19*/
			translate(v = [0.5, 4.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_4__0 to $_4__1*/
			translate(v = [1.5, 6.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_8__0 to $_8__1*/
			translate(v = [1.5, 7.5, 8.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_5__0 to $_5__1*/
			translate(v = [1.5, 6.5, 16.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_9__0 to $_9__1*/
			translate(v = [1.5, 10.5, 9.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
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
				translate(v = [1, 7, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vlysis_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 9, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vwaste*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 6, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vcollect*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 5, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vlysis_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 8, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vwaste*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 5, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 6, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 7, 8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 6, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 10, 9]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge -1 from $_4 to $_4__1*/
			translate(v = [1.5, 6.5, 15.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_8 to $_8__1*/
			translate(v = [1.5, 7.5, 8.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 52 from bank.devices[0].thingy.vcollect to $_52*/
			translate(v = [2.5, 7.5, 14.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 52 from $_52 to bank.devices[0].thingy.vwaste*/
			translate(v = [1.5, 6.5, 14.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 56 from bank.devices[0].thingy.vlysis_out to $_56*/
			translate(v = [2.5, 10.5, 12.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_5 to $_5__1*/
			translate(v = [1.5, 6.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_9 to $_9__1*/
			translate(v = [1.5, 10.5, 9.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from bank.devices[1].thingy.vcollect to $_67*/
			translate(v = [2.5, 6.5, 15.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 67 from $_67 to bank.devices[1].thingy.vwaste*/
			translate(v = [1.5, 5.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from bank.devices[1].thingy.vlysis_out to $_69*/
			translate(v = [2.5, 9.5, 12.5]) {
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
			/*Node $_4*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 7, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 11, 9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 11, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 8, 9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [2, 7, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_56*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [2, 10, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 8, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_57*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 11, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_26*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 8, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_58*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 9, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 10, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_59*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 11, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_28*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 8, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_61*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 9, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_29*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 7, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_62*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 6, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 7, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_66*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 9, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 11, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_67*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [2, 6, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_69*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [2, 9, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 9, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 8, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 12, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 9, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 6, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 4 from bank.devices[0].thingy.vbead_out to $_4*/
			translate(v = [2.5, 7.5, 15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 33 from bank.devices[0].thingy.vcell_out to $_33*/
			translate(v = [2.5, 11.5, 9.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from bank.devices[0].thingy.vcell_out to $_50*/
			translate(v = [2.5, 11.5, 11.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 8 from bank.devices[0].thingy.vcell_out to $_8*/
			translate(v = [2.5, 8.5, 9.5]) {
				rotate(a = [0, 65.9051574478893, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 50 from $_50 to bank.devices[1].thingy.vcell_out*/
			translate(v = [3.5, 10.5, 11.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 52 from $_52 to bank.devices[0].thingy.vsieve*/
			translate(v = [3.5, 7.5, 15.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 56 from $_56 to bank.devices[0].thingy.vpump2*/
			translate(v = [3.5, 9.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 56 from $_56 to bank.devices[0].thingy.vpump3*/
			translate(v = [3.5, 11.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 25 from bank.devices[0].thingy.vpump1 to $_25*/
			translate(v = [2.5, 8.5, 12.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 57 from bank.devices[0].thingy.vpump1 to $_57*/
			translate(v = [2.5, 11.5, 12.5]) {
				rotate(a = [0, 90.0, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 57 from $_57 to bank.devices[1].thingy.vpump1*/
			translate(v = [3.5, 10.5, 12.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 26 from bank.devices[0].thingy.vpump2 to $_26*/
			translate(v = [2.5, 8.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 58 from bank.devices[0].thingy.vpump2 to $_58*/
			translate(v = [2.5, 9.5, 11.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 58 from $_58 to bank.devices[1].thingy.vpump2*/
			translate(v = [3.5, 8.5, 11.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 27 from bank.devices[0].thingy.vpump3 to $_27*/
			translate(v = [2.5, 10.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from bank.devices[0].thingy.vpump3 to $_59*/
			translate(v = [2.5, 11.5, 13.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 59 from $_59 to bank.devices[1].thingy.vpump3*/
			translate(v = [3.5, 10.5, 13.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 28 from bank.devices[0].thingy.vsep to $_28*/
			translate(v = [2.5, 8.5, 14.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 61 from bank.devices[0].thingy.vsep to $_61*/
			translate(v = [2.5, 9.5, 15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 61 from $_61 to bank.devices[1].thingy.vsep*/
			translate(v = [3.5, 8.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 29 from bank.devices[0].thingy.vsieve to $_29*/
			translate(v = [2.5, 7.5, 16.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 62 from bank.devices[0].thingy.vsieve to $_62*/
			translate(v = [2.5, 6.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 62 from $_62 to bank.devices[1].thingy.vsieve*/
			translate(v = [3.5, 6.5, 15.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 5 from bank.devices[1].thingy.vbead_out to $_5*/
			translate(v = [2.5, 7.5, 17.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 66 from bank.devices[1].thingy.vcell_out to $_66*/
			translate(v = [2.5, 9.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 9 from bank.devices[1].thingy.vcell_out to $_9*/
			translate(v = [2.5, 11.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from $_67 to bank.devices[1].thingy.vsieve*/
			translate(v = [3.5, 6.5, 15.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 69 from $_69 to bank.devices[1].thingy.vpump2*/
			translate(v = [3.5, 8.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from $_69 to bank.devices[1].thingy.vpump3*/
			translate(v = [3.5, 10.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 38 from bank.devices[1].thingy.vpump1 to $_38*/
			translate(v = [2.5, 9.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 39 from bank.devices[1].thingy.vpump2 to $_39*/
			translate(v = [2.5, 8.5, 11.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 40 from bank.devices[1].thingy.vpump3 to $_40*/
			translate(v = [2.5, 12.5, 12.5]) {
				rotate(a = [0, 65.9051574478893, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 41 from bank.devices[1].thingy.vsep to $_41*/
			translate(v = [2.5, 9.5, 14.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 42 from bank.devices[1].thingy.vsieve to $_42*/
			translate(v = [2.5, 6.5, 16.5]) {
				rotate(a = [0, 135.0, 0.0]) {
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
				translate(v = [3, 7, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vcell_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 10, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vpump1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 9, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vpump2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 9, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vpump3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 11, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vsep*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 9, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vsieve*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 7, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vbead_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 7, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vcell_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 10, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vpump1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 10, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vpump2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 8, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vpump3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 10, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vsep*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 8, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vsieve*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 6, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 31 from $_31 to bank.devices[0].thingy.vbead_out*/
			translate(v = [3.5, 7.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 46 from $_46 to bank.devices[0].thingy.vbead_out*/
			translate(v = [3.5, 7.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 46 from $_46 to bank.devices[1].thingy.vbead_out*/
			translate(v = [3.5, 7.5, 16.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 47 from $_47 to bank.devices[0].thingy.vbead_out*/
			translate(v = [3.5, 7.5, 14.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 47 from $_47 to bank.devices[0].thingy.vsep*/
			translate(v = [3.5, 9.5, 14.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 47 from $_47 to bank.devices[0].thingy.vsieve*/
			translate(v = [3.5, 7.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 49 from $_49 to bank.devices[0].thingy.vcell_out*/
			translate(v = [3.5, 10.5, 10.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 49 from $_49 to bank.devices[0].thingy.vpump1*/
			translate(v = [3.5, 9.5, 12.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 49 from $_49 to bank.devices[0].thingy.vpump2*/
			translate(v = [3.5, 9.5, 11.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 54 from $_54 to bank.devices[0].thingy.vpump1*/
			translate(v = [3.5, 9.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 54 from $_54 to bank.devices[0].thingy.vpump3*/
			translate(v = [3.5, 11.5, 13.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 54 from $_54 to bank.devices[0].thingy.vsep*/
			translate(v = [3.5, 9.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 44 from $_44 to bank.devices[1].thingy.vbead_out*/
			translate(v = [3.5, 7.5, 16.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 64 from $_64 to bank.devices[1].thingy.vbead_out*/
			translate(v = [3.5, 7.5, 16.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 64 from $_64 to bank.devices[1].thingy.vsep*/
			translate(v = [3.5, 8.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from $_64 to bank.devices[1].thingy.vsieve*/
			translate(v = [3.5, 6.5, 15.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 65 from $_65 to bank.devices[1].thingy.vcell_out*/
			translate(v = [3.5, 10.5, 11.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 65 from $_65 to bank.devices[1].thingy.vpump1*/
			translate(v = [3.5, 10.5, 12.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 65 from $_65 to bank.devices[1].thingy.vpump2*/
			translate(v = [3.5, 8.5, 11.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 68 from $_68 to bank.devices[1].thingy.vpump1*/
			translate(v = [3.5, 10.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 68 from $_68 to bank.devices[1].thingy.vpump3*/
			translate(v = [3.5, 10.5, 13.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 68 from $_68 to bank.devices[1].thingy.vsep*/
			translate(v = [3.5, 8.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*Node $_31*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 6, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_46*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 8, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 8, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 12, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 11, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_49*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 10, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_22*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 9, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_53*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 9, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_54*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 10, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 10, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_60*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 8, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_44*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 7, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_64*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 7, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_45*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 11, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_65*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 9, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 10, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_68*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 9, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 10, 9]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 31 from bank.devices[0].thingy.vbead_in to $_31*/
			translate(v = [4.5, 6.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 46 from bank.devices[0].thingy.vbead_in to $_46*/
			translate(v = [4.5, 8.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 47 from bank.devices[0].thingy.vbead_in to $_47*/
			translate(v = [4.5, 8.5, 14.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 46 from $_46 to bank.devices[1].thingy.vbead_in*/
			translate(v = [5.5, 8.5, 15.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 32 from bank.devices[0].thingy.vcell_in to $_32*/
			translate(v = [4.5, 12.5, 12.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 48 from bank.devices[0].thingy.vcell_in to $_48*/
			translate(v = [4.5, 11.5, 10.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 49 from bank.devices[0].thingy.vcell_in to $_49*/
			translate(v = [4.5, 10.5, 11.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 48 from $_48 to bank.devices[1].thingy.vcell_in*/
			translate(v = [5.5, 10.5, 11.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 49 from $_49 to bank.devices[0].thingy.vpush*/
			translate(v = [5.5, 9.5, 11.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 22 from bank.devices[0].thingy.vlysis_in to $_22*/
			translate(v = [4.5, 9.5, 15.5]) {
				rotate(a = [0, 153.43494882292202, 0.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 53 from bank.devices[0].thingy.vlysis_in to $_53*/
			translate(v = [4.5, 9.5, 14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 54 from bank.devices[0].thingy.vlysis_in to $_54*/
			translate(v = [4.5, 10.5, 13.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 53 from $_53 to bank.devices[1].thingy.vlysis_in*/
			translate(v = [5.5, 10.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 24 from bank.devices[0].thingy.vpush to $_24*/
			translate(v = [4.5, 10.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 60 from bank.devices[0].thingy.vpush to $_60*/
			translate(v = [4.5, 8.5, 11.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 60 from $_60 to bank.devices[1].thingy.vpush*/
			translate(v = [5.5, 9.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 44 from bank.devices[1].thingy.vbead_in to $_44*/
			translate(v = [4.5, 7.5, 17.5]) {
				rotate(a = [0, 144.73561031724537, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 64 from bank.devices[1].thingy.vbead_in to $_64*/
			translate(v = [4.5, 7.5, 15.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 45 from bank.devices[1].thingy.vcell_in to $_45*/
			translate(v = [4.5, 11.5, 12.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 65 from bank.devices[1].thingy.vcell_in to $_65*/
			translate(v = [4.5, 9.5, 11.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 65 from $_65 to bank.devices[1].thingy.vpush*/
			translate(v = [5.5, 9.5, 10.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 35 from bank.devices[1].thingy.vlysis_in to $_35*/
			translate(v = [4.5, 10.5, 12.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 68 from bank.devices[1].thingy.vlysis_in to $_68*/
			translate(v = [4.5, 9.5, 13.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 37 from bank.devices[1].thingy.vpush to $_37*/
			translate(v = [4.5, 10.5, 9.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
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
				translate(v = [5, 7, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vcell_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 11, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vlysis_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 9, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[0].thingy.vpush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 9, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vbead_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 8, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vcell_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 10, 11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vlysis_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 10, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.devices[1].thingy.vpush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 9, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 2 from bank.devices[0].thingy.vbead_in to $_2*/
			translate(v = [6.5, 6.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 6 from bank.devices[0].thingy.vcell_in to $_6*/
			translate(v = [6.5, 10.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 12 from bank.devices[0].thingy.vlysis_in to $_12*/
			translate(v = [6.5, 8.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 16 from bank.devices[0].thingy.vpush to $_16*/
			translate(v = [6.5, 8.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 3 from bank.devices[1].thingy.vbead_in to $_3*/
			translate(v = [6.5, 7.5, 14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 7 from bank.devices[1].thingy.vcell_in to $_7*/
			translate(v = [6.5, 9.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 13 from bank.devices[1].thingy.vlysis_in to $_13*/
			translate(v = [6.5, 9.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 17 from bank.devices[1].thingy.vpush to $_17*/
			translate(v = [6.5, 8.5, 9.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
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
				translate(v = [6, 6, 13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 10, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 8, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 8, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 7, 14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 9, 10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_13*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 9, 12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 8, 9]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union();
	}
}
