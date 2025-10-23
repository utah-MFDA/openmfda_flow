translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_72*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [1.0, -1.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1.0, -1.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 72 from one.pump_b[0].flush to $_72*/
			translate(v = [1.5, -0.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from one.pump_b[0].hole to $_50*/
			translate(v = [-0.5, -0.5, -24.5]) {
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
			/*Node $_66*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2.0, -2.0, -19.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_44*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -2.0, -19.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_69*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2.0, -2.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, 2.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [2.0, 0.0, -24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, -2.0, -24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_73*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-2.0, -2.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_51*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -2.0, -23.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge 66 from one.ctrl_s[1].flush to $_66*/
			translate(v = [2.5, -1.5, -18.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 44 from one.ctrl_s[1].hole to $_44*/
			translate(v = [-1.5, -1.5, -18.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 151 from one.devices[0].thingy.vp3.thing to one.pump_b[0].hole*/
			translate(v = [-1.5, -1.5, -23.5]) {
				rotate(a = [0, 90.0, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 285 from one.devices[3].thingy.vp3.thing to one.pump_b[0].flush*/
			translate(v = [2.5, 0.5, -23.5]) {
				rotate(a = [0, 90.0, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 69 from one.pump_a[0].flush to $_69*/
			translate(v = [2.5, -1.5, -24.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 47 from one.pump_a[0].hole to $_47*/
			translate(v = [-1.5, 2.5, -24.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 73 from one.pump_b[1].flush to $_73*/
			translate(v = [-1.5, -1.5, -24.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 51 from one.pump_b[1].hole to $_51*/
			translate(v = [-1.5, -1.5, -22.5]) {
				rotate(a = [0, 90.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_57*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [3.0, -3.0, -20.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1.0, -3.0, -20.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_58*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [3.0, 1.0, -20.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -1.000000000010631, -20.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3.0, -2.0, -20.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-3.0, -2.0, -20.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_67*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [3.0, -3.0, -22.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_45*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -3.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.column_upper.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0.0, -3.0, -24.999999990303447]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.vp3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0.0, -3.0, -24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[1].thingy.column_upper.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1.0, -3.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[1].thingy.vp3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1.0, -3.0, -24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[2].thingy.column_upper.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [2.000000023224491, -3.0, -24.999999980904875]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[2].thingy.vp3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [2.000000013572193, -3.0, -24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[3].thingy.column_upper.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3.0, -2.0, -23.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[3].thingy.vp3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3.0, -2.0, -24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_a[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3.0, -2.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_a[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-3.0, 2.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_70*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [3.0, -3.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, 1.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1.0, -3.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, -3.0, -23.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union();
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union();
		/*Edges shell 3*/
		union();
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union();
		/*Edges shell 4*/
		union();
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union();
		/*Edges shell 5*/
		union();
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union();
		/*Edges shell 6*/
		union();
	}
	/*Shell 7*/
	union() {
		%/*Nodes shell 7*/
		union();
		/*Edges shell 7*/
		union();
	}
	/*Shell 8*/
	union() {
		%/*Nodes shell 8*/
		union();
		/*Edges shell 8*/
		union();
	}
	/*Shell 9*/
	union() {
		%/*Nodes shell 9*/
		union();
		/*Edges shell 9*/
		union();
	}
	/*Shell 10*/
	union() {
		%/*Nodes shell 10*/
		union();
		/*Edges shell 10*/
		union();
	}
}
