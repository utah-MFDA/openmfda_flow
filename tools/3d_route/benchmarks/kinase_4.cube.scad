translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*$_69*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-1.0, -1.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_47*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1.0, 1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_72*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-1.0, -1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_50*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1.0, -1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*one.pump_a[0].flush - $_69*/
			translate(v = [-0.5, -0.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pump_a[0].hole - $_47*/
			translate(v = [-0.5, 1.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pump_b[0].flush - $_72*/
			translate(v = [-0.5, -0.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pump_b[0].hole - $_50*/
			translate(v = [-0.5, -0.5, 1.5]) {
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
			/*one.pump_a[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, -2.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_a[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, 2.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_b[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, -2.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_b[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, -2.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*$_143 - one.pump_a[0].hole*/
			translate(v = [-1.5, 2.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_151 - one.pump_b[0].hole*/
			translate(v = [-1.5, -1.5, 2.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_279 - one.pump_a[0].flush*/
			translate(v = [-1.5, -1.5, 1.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_285 - one.pump_b[0].flush*/
			translate(v = [-1.5, -1.5, -1.5]) {
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
			/*$_66*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0.0, -3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_44*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -3.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_114*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-3.0, -3.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_143*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, 1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_144*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, 0.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_151*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -2.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_153*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -2.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_167*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-3.0, -3.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_196*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_202*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -3.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_215*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-3.0, -3.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_244*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -2.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_250*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -2.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_263*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-2.0, -3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_279*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -3.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_285*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_70*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3.0, -3.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_48*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, 3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_73*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3.0, 0.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_51*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0.0, -3.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*one.ctrl_s[1].flush - $_66*/
			translate(v = [0.5, -2.5, -2.5]) {
				rotate(a = [0, 114.09484255211072, -153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.ctrl_s[1].hole - $_44*/
			translate(v = [-2.5, -2.5, 3.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.column_upper.thing - $_114*/
			translate(v = [-2.5, -2.5, 1.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_114 - one.devices[0].thingy.vp3.thing*/
			translate(v = [-3.5, -1.5, -0.5]) {
				rotate(a = [0, 35.26438968275464, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.vp0.thing - $_143*/
			translate(v = [-2.5, 1.5, -2.5]) {
				rotate(a = [0, 114.09484255211072, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.vp0.thing - $_144*/
			translate(v = [-1.5, 0.5, -2.5]) {
				rotate(a = [0, 114.09484255211072, -153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_144 - one.devices[1].thingy.vp0.thing*/
			translate(v = [-3.5, -1.5, -3.5]) {
				rotate(a = [0, 70.52877936550931, 45.0]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[0].thingy.vp3.thing - $_151*/
			translate(v = [-2.5, -1.5, 1.5]) {
				rotate(a = [0, 153.43494882292202, 180.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*one.devices[0].thingy.vp3.thing - $_153*/
			translate(v = [-2.5, -1.5, 0.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_153 - one.devices[1].thingy.vp3.thing*/
			translate(v = [-3.5, -2.5, -1.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[1].thingy.column_upper.thing - $_167*/
			translate(v = [-2.5, -2.5, 0.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_167 - one.devices[1].thingy.vp3.thing*/
			translate(v = [-3.5, -2.5, -1.5]) {
				rotate(a = [0, 26.56505117707799, 0.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*one.devices[1].thingy.vp0.thing - $_196*/
			translate(v = [-2.5, -0.5, -1.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_196 - one.devices[2].thingy.vp0.thing*/
			translate(v = [-3.5, -2.5, -2.5]) {
				rotate(a = [0, 65.9051574478893, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[1].thingy.vp3.thing - $_202*/
			translate(v = [-2.5, -2.5, -0.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_202 - one.devices[2].thingy.vp3.thing*/
			translate(v = [-3.5, -3.5, -2.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[2].thingy.column_upper.thing - $_215*/
			translate(v = [-2.5, -2.5, -1.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_215 - one.devices[2].thingy.vp3.thing*/
			translate(v = [-3.5, -3.5, -2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.vp0.thing - $_244*/
			translate(v = [-2.5, -1.5, -0.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_244 - one.devices[3].thingy.vp0.thing*/
			translate(v = [-3.5, -1.5, -1.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[2].thingy.vp3.thing - $_250*/
			translate(v = [-2.5, -1.5, -1.5]) {
				rotate(a = [0, 114.09484255211072, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_250 - one.devices[3].thingy.vp3.thing*/
			translate(v = [-3.5, -2.5, -3.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[3].thingy.column_upper.thing - $_263*/
			translate(v = [-1.5, -2.5, -2.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 2.8284271247461903]);
				}
			}
			/*$_263 - one.devices[3].thingy.vp3.thing*/
			translate(v = [-3.5, -2.5, -3.5]) {
				rotate(a = [0, 63.43494882292201, 0.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*one.devices[3].thingy.vp0.thing - $_279*/
			translate(v = [-1.5, -2.5, 0.5]) {
				rotate(a = [0, 131.81031489577862, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[3].thingy.vp3.thing - $_285*/
			translate(v = [-2.5, -2.5, -2.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pump_a[1].flush - $_70*/
			translate(v = [-2.5, -2.5, 2.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.pump_a[1].hole - $_48*/
			translate(v = [-2.5, 3.5, -2.5]) {
				rotate(a = [0, 114.09484255211072, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.pump_b[1].flush - $_73*/
			translate(v = [-2.5, 0.5, -2.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pump_b[1].hole - $_51*/
			translate(v = [0.5, -2.5, 3.5]) {
				rotate(a = [0, 131.81031489577862, -153.43494882292202]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
		}
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union() {
			/*one.ctrl_s[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, -4.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.column_upper.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vp0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -1.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vp3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -2.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.column_upper.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vp0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -2.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vp3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -3.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.column_upper.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.vp0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.vp3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.column_upper.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -3.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.vp0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -2.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.vp3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -3.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_a[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_a[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, 1.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_b[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, 0.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_b[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, -4.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*one.ctrl_s[1].flush - $_102*/
			translate(v = [-2.5, -4.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_s[1].hole - $_103*/
			translate(v = [-4.5, -1.5, 0.5]) {
				rotate(a = [0, 65.9051574478893, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_111 - one.devices[0].thingy.vp0.thing*/
			translate(v = [-3.5, -0.5, -3.5]) {
				rotate(a = [0, 35.26438968275464, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.column_upper.thing - $_115*/
			translate(v = [-1.5, -4.5, -1.5]) {
				rotate(a = [0, 65.9051574478893, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.vp0.thing - $_145*/
			translate(v = [-1.5, 0.5, -4.5]) {
				rotate(a = [0, 65.9051574478893, -153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_146 - one.pump_a[1].hole*/
			translate(v = [-3.5, 1.5, -3.5]) {
				rotate(a = [0, 109.47122063449069, -45.0]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[0].thingy.vp3.thing - $_152*/
			translate(v = [-4.5, -0.5, 1.5]) {
				rotate(a = [0, 144.73561031724537, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_154 - one.pump_b[1].hole*/
			translate(v = [-1.5, -3.5, 1.5]) {
				rotate(a = [0, 153.43494882292202, -90.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*$_164 - one.devices[1].thingy.vp0.thing*/
			translate(v = [-3.5, -1.5, -3.5]) {
				rotate(a = [0, 35.26438968275464, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[1].thingy.column_upper.thing - $_168*/
			translate(v = [-4.5, -2.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.vp0.thing - $_197*/
			translate(v = [-2.5, -1.5, -4.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[1].thingy.vp3.thing - $_201*/
			translate(v = [-4.5, -0.5, 0.5]) {
				rotate(a = [0, 131.81031489577862, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*$_212 - one.devices[2].thingy.vp0.thing*/
			translate(v = [-3.5, -2.5, -2.5]) {
				rotate(a = [0, 48.189685104221404, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[2].thingy.column_upper.thing - $_216*/
			translate(v = [-4.5, -1.5, -1.5]) {
				rotate(a = [0, 131.81031489577862, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[2].thingy.vp0.thing - $_245*/
			translate(v = [-4.5, -3.5, -4.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[2].thingy.vp3.thing - $_249*/
			translate(v = [-4.5, -1.5, -0.5]) {
				rotate(a = [0, 131.81031489577862, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*$_260 - one.devices[3].thingy.vp0.thing*/
			translate(v = [-3.5, -1.5, -1.5]) {
				rotate(a = [0, 48.189685104221404, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[3].thingy.column_upper.thing - $_264*/
			translate(v = [-4.5, -0.5, -1.5]) {
				rotate(a = [0, 65.9051574478893, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[3].thingy.vp0.thing - $_280*/
			translate(v = [-4.5, -3.5, -2.5]) {
				rotate(a = [0, 65.9051574478893, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_281 - one.pump_a[1].flush*/
			translate(v = [-3.5, -3.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[3].thingy.vp3.thing - $_284*/
			translate(v = [-4.5, -4.5, -2.5]) {
				rotate(a = [0, 114.09484255211072, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_286 - one.pump_b[1].flush*/
			translate(v = [-3.5, 0.5, -3.5]) {
				rotate(a = [0, 35.26438968275464, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*$_57*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, 0.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_35*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 3.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_58*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, -5.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_36*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 2.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_102*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -5.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_103*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -2.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_67*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, 1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_45*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [1.0, -5.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_68*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2.0, 5.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_46*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4.0, 2.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_111*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, 0.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_115*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-2.0, -5.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_145*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-2.0, 0.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_146*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -1.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_147*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1.0, -2.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_152*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_154*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -5.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_155*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -5.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_158*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 0.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_164*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -3.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_168*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -3.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_197*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-3.0, -2.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_198*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -4.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_201*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -1.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_203*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_206*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -2.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_212*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_216*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -2.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_245*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -4.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_246*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-4.0, -5.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_249*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -2.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_251*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_254*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -4.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_260*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, 0.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_264*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_280*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -4.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_281*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -5.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_284*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -5.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_286*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_71*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, -3.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_49*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 2.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*one.ctrl_a[5].flush - $_57*/
			translate(v = [-4.5, 0.5, 2.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.ctrl_a[5].hole - $_35*/
			translate(v = [-4.5, 3.5, 2.5]) {
				rotate(a = [0, 107.54840061379231, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.ctrl_a[6].flush - $_58*/
			translate(v = [-4.5, -4.5, 1.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.ctrl_a[6].hole - $_36*/
			translate(v = [-4.5, 2.5, 3.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_102 - one.devices[3].thingy.vs1.thing*/
			translate(v = [-5.5, -5.5, -0.5]) {
				rotate(a = [0, 122.31153323742386, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_103 - one.devices[0].thingy.vs1.thing*/
			translate(v = [-5.5, 1.5, 2.5]) {
				rotate(a = [0, 122.31153323742386, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.ctrl_s[2].flush - $_67*/
			translate(v = [-4.5, 1.5, 1.5]) {
				rotate(a = [0, 131.81031489577862, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.ctrl_s[2].hole - $_45*/
			translate(v = [1.5, -4.5, 2.5]) {
				rotate(a = [0, 161.56505117707798, -90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*one.ctrl_s[3].flush - $_68*/
			translate(v = [2.5, 5.5, 4.5]) {
				rotate(a = [0, 35.26438968275464, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.ctrl_s[3].hole - $_46*/
			translate(v = [4.5, 2.5, 5.5]) {
				rotate(a = [0, 74.498640433063, -56.309932474020215]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.devices[0].thingy.circulate2.thing - $_111*/
			translate(v = [-4.5, 0.5, -1.5]) {
				rotate(a = [0, 36.69922520048988, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_115 - one.devices[0].thingy.vp4.thing*/
			translate(v = [0.5, -5.5, 1.5]) {
				rotate(a = [0, 143.30077479951012, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_145 - one.devices[0].thingy.vp1.thing*/
			translate(v = [-1.5, 1.5, -5.5]) {
				rotate(a = [0, 45.00000000000001, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[0].thingy.vp1.thing - $_146*/
			translate(v = [-1.5, -0.5, -4.5]) {
				rotate(a = [0, 116.56505117707799, 90.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*one.devices[0].thingy.vp1.thing - $_147*/
			translate(v = [-0.5, -1.5, -4.5]) {
				rotate(a = [0, 107.54840061379231, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_147 - one.devices[1].thingy.vp1.thing*/
			translate(v = [0.5, -0.5, -5.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_152 - one.devices[0].thingy.vs1.thing*/
			translate(v = [-5.5, 1.5, 2.5]) {
				rotate(a = [0, 114.09484255211072, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.vp4.thing - $_154*/
			translate(v = [-1.5, -4.5, -0.5]) {
				rotate(a = [0, 48.189685104221404, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[0].thingy.vp4.thing - $_155*/
			translate(v = [-2.5, -4.5, -0.5]) {
				rotate(a = [0, 57.68846676257615, -18.43494882292201]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_155 - one.devices[1].thingy.vp4.thing*/
			translate(v = [-5.5, -5.5, 0.5]) {
				rotate(a = [0, 107.54840061379231, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[0].thingy.vs1.thing - $_158*/
			translate(v = [-4.5, 0.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_158 - one.devices[1].thingy.vs1.thing*/
			translate(v = [-5.5, 1.5, -1.5]) {
				rotate(a = [0, 25.239401820678914, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[1].thingy.circulate2.thing - $_164*/
			translate(v = [-4.5, -2.5, -1.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_168 - one.devices[1].thingy.vp4.thing*/
			translate(v = [-5.5, -5.5, 0.5]) {
				rotate(a = [0, 107.54840061379231, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_197 - one.devices[1].thingy.vp1.thing*/
			translate(v = [0.5, -0.5, -5.5]) {
				rotate(a = [0, 72.4515993862077, -161.56505117707798]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[1].thingy.vp1.thing - $_198*/
			translate(v = [-2.5, -3.5, -4.5]) {
				rotate(a = [0, 103.26267600830484, 45.0]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_198 - one.devices[2].thingy.vp1.thing*/
			translate(v = [-5.5, -5.5, -5.5]) {
				rotate(a = [0, 74.498640433063, 33.690067525979785]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_201 - one.devices[1].thingy.vs1.thing*/
			translate(v = [-5.5, 1.5, -1.5]) {
				rotate(a = [0, 48.189685104221404, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[1].thingy.vp4.thing - $_203*/
			translate(v = [-4.5, -2.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_203 - one.devices[2].thingy.vp4.thing*/
			translate(v = [-5.5, 0.5, 0.5]) {
				rotate(a = [0, 133.491519345092, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.devices[1].thingy.vs1.thing - $_206*/
			translate(v = [-4.5, -1.5, 1.5]) {
				rotate(a = [0, 133.491519345092, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_206 - one.devices[2].thingy.vs1.thing*/
			translate(v = [-5.5, -0.5, -1.5]) {
				rotate(a = [0, 25.239401820678914, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[2].thingy.circulate2.thing - $_212*/
			translate(v = [-4.5, -0.5, -0.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_216 - one.devices[2].thingy.vp4.thing*/
			translate(v = [-5.5, 0.5, 0.5]) {
				rotate(a = [0, 131.81031489577862, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*$_245 - one.devices[2].thingy.vp1.thing*/
			translate(v = [-5.5, -5.5, -5.5]) {
				rotate(a = [0, 65.9051574478893, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[2].thingy.vp1.thing - $_246*/
			translate(v = [-3.5, -4.5, -2.5]) {
				rotate(a = [0, 143.30077479951012, -153.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_246 - one.devices[3].thingy.vp1.thing*/
			translate(v = [-5.5, -5.5, -2.5]) {
				rotate(a = [0, 90.0, 26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*$_249 - one.devices[2].thingy.vs1.thing*/
			translate(v = [-5.5, -0.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.vp4.thing - $_251*/
			translate(v = [-4.5, -0.5, -2.5]) {
				rotate(a = [0, 25.239401820678914, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_251 - one.devices[3].thingy.vp4.thing*/
			translate(v = [-5.5, -0.5, 0.5]) {
				rotate(a = [0, 161.56505117707798, 0.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*one.devices[2].thingy.vs1.thing - $_254*/
			translate(v = [-4.5, -3.5, -0.5]) {
				rotate(a = [0, 107.54840061379231, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_254 - one.devices[3].thingy.vs1.thing*/
			translate(v = [-5.5, -5.5, -0.5]) {
				rotate(a = [0, 90.0, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*one.devices[3].thingy.circulate2.thing - $_260*/
			translate(v = [-4.5, 0.5, 0.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_264 - one.devices[3].thingy.vp4.thing*/
			translate(v = [-5.5, -0.5, 0.5]) {
				rotate(a = [0, 153.43494882292202, 0.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*$_280 - one.devices[3].thingy.vp1.thing*/
			translate(v = [-5.5, -5.5, -2.5]) {
				rotate(a = [0, 90.0, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*one.devices[3].thingy.vp1.thing - $_281*/
			translate(v = [-4.5, -4.5, -0.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_284 - one.devices[3].thingy.vs1.thing*/
			translate(v = [-5.5, -5.5, -0.5]) {
				rotate(a = [0, 144.73561031724537, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[3].thingy.vp4.thing - $_286*/
			translate(v = [-4.5, 1.5, -1.5]) {
				rotate(a = [0, 48.189685104221404, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.pump_a[2].flush - $_71*/
			translate(v = [-4.5, -2.5, 1.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.pump_a[2].hole - $_49*/
			translate(v = [-4.5, 2.5, -0.5]) {
				rotate(a = [0, 122.31153323742386, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*one.ctrl_a[5].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -3.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[5].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 6.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[6].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[6].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 1.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[2].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1.0, -6.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[3].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1.0, 6.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [6.0, -1.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.circulate2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 2.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vp1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, 1.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vp4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0.0, -6.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vs1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 1.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.circulate2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 0.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vp1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0.0, -1.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vp4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vs1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.circulate2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 2.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.vp1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.vp4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 0.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.vs1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.circulate2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.vp1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.vp4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -1.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.vs1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_a[2].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_a[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*one.ctrl_a[5].flush - $_90*/
			translate(v = [-6.5, -3.5, 1.5]) {
				rotate(a = [0, 144.73561031724537, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.ctrl_a[5].hole - $_91*/
			translate(v = [-6.5, 2.5, -2.5]) {
				rotate(a = [0, 45.868250787968954, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.ctrl_a[6].flush - $_92*/
			translate(v = [-6.5, -6.5, -2.5]) {
				rotate(a = [0, 19.471220634490674, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.ctrl_a[6].hole - $_93*/
			translate(v = [-6.5, 2.5, 2.5]) {
				rotate(a = [0, 19.471220634490674, -45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.ctrl_s[2].flush - $_104*/
			translate(v = [-6.5, 3.5, 3.5]) {
				rotate(a = [0, 134.13174921203108, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.ctrl_s[2].hole - $_105*/
			translate(v = [-1.5, -6.5, 0.5]) {
				rotate(a = [0, 107.54840061379231, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.ctrl_s[3].flush - $_106*/
			translate(v = [-2.5, 5.5, 7.5]) {
				rotate(a = [0, 103.6330222253664, 14.036243467926477]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.ctrl_s[3].hole - $_107*/
			translate(v = [2.5, -2.5, 7.5]) {
				rotate(a = [0, 102.60438264837919, 26.56505117707799]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*one.devices[0].thingy.circulate2.thing - $_110*/
			translate(v = [-6.5, 1.5, -2.5]) {
				rotate(a = [0, 19.471220634490674, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_137 - one.devices[0].thingy.vs1.thing*/
			translate(v = [-5.5, 1.5, 2.5]) {
				rotate(a = [0, 160.52877936550934, 135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.devices[0].thingy.vp1.thing - $_148*/
			translate(v = [-2.5, 0.5, -6.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_149 - one.pump_a[2].hole*/
			translate(v = [-5.5, -0.5, -2.5]) {
				rotate(a = [0, 134.13174921203108, 14.036243467926477]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.devices[0].thingy.vp4.thing - $_156*/
			translate(v = [-0.5, -6.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.circulate2.thing - $_163*/
			translate(v = [-6.5, 1.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_190 - one.devices[1].thingy.vs1.thing*/
			translate(v = [-5.5, 1.5, -1.5]) {
				rotate(a = [0, 46.50848065490801, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.devices[1].thingy.vp1.thing - $_199*/
			translate(v = [-3.5, 0.5, -6.5]) {
				rotate(a = [0, 76.3669777746336, -14.036243467926477]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.devices[1].thingy.vp4.thing - $_204*/
			translate(v = [-2.5, -6.5, 0.5]) {
				rotate(a = [0, 90.0, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*one.devices[2].thingy.circulate2.thing - $_211*/
			translate(v = [-6.5, -1.5, -1.5]) {
				rotate(a = [0, 45.868250787968954, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*$_238 - one.devices[2].thingy.vs1.thing*/
			translate(v = [-5.5, -0.5, -1.5]) {
				rotate(a = [0, 53.96010656969614, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*one.devices[2].thingy.vp1.thing - $_247*/
			translate(v = [-6.5, -1.5, -3.5]) {
				rotate(a = [0, 115.8766900608275, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*one.devices[2].thingy.vp4.thing - $_252*/
			translate(v = [-6.5, 1.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[3].thingy.circulate2.thing - $_259*/
			translate(v = [-6.5, -5.5, 1.5]) {
				rotate(a = [0, 141.67118189854412, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*$_276 - one.devices[3].thingy.vs1.thing*/
			translate(v = [-5.5, -5.5, -0.5]) {
				rotate(a = [0, 57.68846676257615, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.devices[3].thingy.vp1.thing - $_282*/
			translate(v = [-6.5, -1.5, -0.5]) {
				rotate(a = [0, 115.8766900608275, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*$_283 - one.pump_a[2].flush*/
			translate(v = [-5.5, -5.5, -1.5]) {
				rotate(a = [0, 45.868250787968954, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.devices[3].thingy.vp4.thing - $_287*/
			translate(v = [-6.5, 3.5, 0.5]) {
				rotate(a = [0, 90.0, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*$_62*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_40*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-4.0, -7.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_56*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -1.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_34*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -4.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_90*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -4.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_91*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 2.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_92*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -7.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_93*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 2.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_59*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, 5.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_37*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -7.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_61*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -2.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_39*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -7.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_65*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, 7.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_43*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6.0, -1.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_104*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 3.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_105*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -7.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_106*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, 5.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_107*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2.0, -3.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_110*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, 1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_112*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0.0, -7.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_135*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 0.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_136*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_137*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, 2.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_148*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-3.0, 0.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_149*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, 0.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_150*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -4.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_156*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-1.0, -7.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_159*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-4.0, -7.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_160*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0.0, -7.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_163*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, 1.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_165*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0.0, -3.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_188*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -3.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_189*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_190*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -2.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_199*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-4.0, 0.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_200*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 0.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_204*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-3.0, -7.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_207*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -3.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_208*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -3.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_211*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -2.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_213*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-3.0, 1.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_236*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -3.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_237*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -7.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_238*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -5.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_247*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -2.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_248*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 2.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_252*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, 1.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_255*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_256*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 1.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_259*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -6.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_261*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, 1.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_276*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -3.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_282*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -2.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_283*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -2.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_287*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, 3.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*one.ctrl_a[10].flush - $_62*/
			translate(v = [-6.5, -0.5, 1.5]) {
				rotate(a = [0, 78.90419671686361, 101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[10].hole - $_40*/
			translate(v = [-3.5, -6.5, 1.5]) {
				rotate(a = [0, 140.49028771380608, -165.96375653207352]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*one.ctrl_a[4].flush - $_56*/
			translate(v = [-6.5, -0.5, 3.5]) {
				rotate(a = [0, 15.793169048263968, -135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[4].hole - $_34*/
			translate(v = [-6.5, -3.5, -3.5]) {
				rotate(a = [0, 134.13174921203108, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*$_90 - one.devices[3].thingy.v5.thing*/
			translate(v = [-7.5, -7.5, 3.5]) {
				rotate(a = [0, 115.8766900608275, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*$_91 - one.devices[0].thingy.v5.thing*/
			translate(v = [-7.5, -2.5, -1.5]) {
				rotate(a = [0, 101.0958032831364, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_92 - one.devices[3].thingy.v6.thing*/
			translate(v = [-7.5, -7.5, 2.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_93 - one.devices[0].thingy.v6.thing*/
			translate(v = [-7.5, -1.5, -2.5]) {
				rotate(a = [0, 39.50971228619393, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*one.ctrl_a[7].flush - $_59*/
			translate(v = [-6.5, 5.5, -1.5]) {
				rotate(a = [0, 32.31153323742385, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*one.ctrl_a[7].hole - $_37*/
			translate(v = [-6.5, -6.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[9].flush - $_61*/
			translate(v = [-6.5, -1.5, 0.5]) {
				rotate(a = [0, 78.90419671686361, 101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[9].hole - $_39*/
			translate(v = [-4.5, -6.5, 0.5]) {
				rotate(a = [0, 147.68846676257616, -161.56505117707798]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*one.ctrl_s[0].flush - $_65*/
			translate(v = [-6.5, 7.5, 7.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_s[0].hole - $_43*/
			translate(v = [6.5, -0.5, 7.5]) {
				rotate(a = [0, 65.9051574478893, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_104 - one.devices[3].thingy.vs2.thing*/
			translate(v = [-7.5, 2.5, 1.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_105 - one.devices[0].thingy.vs2.thing*/
			translate(v = [-1.5, -7.5, -0.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_106 - one.devices[3].thingy.vs3.thing*/
			translate(v = [-7.5, 0.5, 8.5]) {
				rotate(a = [0, 98.0494669755284, 45.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_107 - one.devices[0].thingy.vs3.thing*/
			translate(v = [-2.5, -7.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 8.660254037844387]);
				}
			}
			/*$_110 - one.devices[0].thingy.v5.thing*/
			translate(v = [-7.5, -2.5, -1.5]) {
				rotate(a = [0, 103.6330222253664, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.devices[0].thingy.column_lower.thing - $_112*/
			translate(v = [0.5, -6.5, 3.5]) {
				rotate(a = [0, 114.09484255211072, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_112 - one.devices[0].thingy.vs3.thing*/
			translate(v = [-2.5, -7.5, 2.5]) {
				rotate(a = [0, 72.4515993862077, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[0].thingy.v5.thing - $_135*/
			translate(v = [-6.5, 0.5, 1.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_135 - one.devices[1].thingy.v5.thing*/
			translate(v = [-7.5, 2.5, -2.5]) {
				rotate(a = [0, 29.205932247399414, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*one.devices[0].thingy.v6.thing - $_136*/
			translate(v = [-6.5, 1.5, -1.5]) {
				rotate(a = [0, 107.54840061379231, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[0].thingy.v6.thing - $_137*/
			translate(v = [-6.5, 2.5, -1.5]) {
				rotate(a = [0, 103.6330222253664, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_136 - one.devices[1].thingy.v6.thing*/
			translate(v = [-7.5, 2.5, 0.5]) {
				rotate(a = [0, 144.73561031724537, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_148 - one.devices[0].thingy.vp2.thing*/
			translate(v = [-0.5, -0.5, -7.5]) {
				rotate(a = [0, 65.9051574478893, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.vp2.thing - $_149*/
			translate(v = [-1.5, 0.5, -6.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.vp2.thing - $_150*/
			translate(v = [-2.5, -3.5, -6.5]) {
				rotate(a = [0, 105.501359566937, 56.309932474020215]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_150 - one.devices[1].thingy.vp2.thing*/
			translate(v = [-7.5, -0.5, -1.5]) {
				rotate(a = [0, 130.61285517607675, -30.96375653207352]) {
					cube(size = [0.125, 0.125, 7.681145747868608]);
				}
			}
			/*$_156 - one.devices[0].thingy.vs2.thing*/
			translate(v = [-1.5, -7.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.vs2.thing - $_159*/
			translate(v = [-3.5, -6.5, 0.5]) {
				rotate(a = [0, 114.09484255211072, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_159 - one.devices[1].thingy.vs2.thing*/
			translate(v = [-7.5, -7.5, 1.5]) {
				rotate(a = [0, 103.6330222253664, 14.036243467926477]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.devices[0].thingy.vs3.thing - $_160*/
			translate(v = [0.5, -6.5, 7.5]) {
				rotate(a = [0, 147.68846676257616, -161.56505117707798]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*$_160 - one.devices[1].thingy.vs3.thing*/
			translate(v = [-0.5, -7.5, 8.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_163 - one.devices[1].thingy.v5.thing*/
			translate(v = [-7.5, 2.5, -2.5]) {
				rotate(a = [0, 15.793169048263968, -45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[1].thingy.column_lower.thing - $_165*/
			translate(v = [0.5, -2.5, 7.5]) {
				rotate(a = [0, 81.95053302447161, -135.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_165 - one.devices[1].thingy.vs3.thing*/
			translate(v = [-0.5, -7.5, 8.5]) {
				rotate(a = [0, 101.0958032831364, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[1].thingy.v5.thing - $_188*/
			translate(v = [-6.5, -2.5, -1.5]) {
				rotate(a = [0, 101.0958032831364, 101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_188 - one.devices[2].thingy.v5.thing*/
			translate(v = [-7.5, -2.5, -2.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[1].thingy.v6.thing - $_189*/
			translate(v = [-6.5, -2.5, -2.5]) {
				rotate(a = [0, 59.52964053402026, 101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*one.devices[1].thingy.v6.thing - $_190*/
			translate(v = [-6.5, -1.5, 1.5]) {
				rotate(a = [0, 103.6330222253664, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_189 - one.devices[2].thingy.v6.thing*/
			translate(v = [-7.5, -7.5, 0.5]) {
				rotate(a = [0, 120.47035946597974, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*$_199 - one.devices[1].thingy.vp2.thing*/
			translate(v = [-7.5, -0.5, -1.5]) {
				rotate(a = [0, 140.49028771380608, 14.036243467926477]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*one.devices[1].thingy.vp2.thing - $_200*/
			translate(v = [-6.5, 0.5, -3.5]) {
				rotate(a = [0, 35.26438968275464, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_200 - one.devices[2].thingy.vp2.thing*/
			translate(v = [-7.5, -2.5, 1.5]) {
				rotate(a = [0, 147.68846676257616, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*$_204 - one.devices[1].thingy.vs2.thing*/
			translate(v = [-7.5, -7.5, 1.5]) {
				rotate(a = [0, 101.0958032831364, 11.309932474020213]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[1].thingy.vs2.thing - $_207*/
			translate(v = [-6.5, -2.5, 0.5]) {
				rotate(a = [0, 78.90419671686361, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_207 - one.devices[2].thingy.vs2.thing*/
			translate(v = [-7.5, 2.5, 2.5]) {
				rotate(a = [0, 111.41671403303363, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.477225575051661]);
				}
			}
			/*one.devices[1].thingy.vs3.thing - $_208*/
			translate(v = [-2.5, -2.5, 7.5]) {
				rotate(a = [0, 79.48026510934139, -68.19859051364818]) {
					cube(size = [0.125, 0.125, 5.477225575051661]);
				}
			}
			/*$_208 - one.devices[2].thingy.vs3.thing*/
			translate(v = [-7.5, 1.5, 8.5]) {
				rotate(a = [0, 98.87639508097335, -38.65980825409009]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*$_211 - one.devices[2].thingy.v5.thing*/
			translate(v = [-7.5, -2.5, -2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.column_lower.thing - $_213*/
			translate(v = [-2.5, 1.5, 7.5]) {
				rotate(a = [0, 81.95053302447161, -135.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_213 - one.devices[2].thingy.vs3.thing*/
			translate(v = [-7.5, 1.5, 8.5]) {
				rotate(a = [0, 101.30993247402021, 0.0]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*one.devices[2].thingy.v5.thing - $_236*/
			translate(v = [-6.5, -2.5, 2.5]) {
				rotate(a = [0, 168.6900675259798, 180.0]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*$_236 - one.devices[3].thingy.v5.thing*/
			translate(v = [-7.5, -7.5, 3.5]) {
				rotate(a = [0, 101.0958032831364, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[2].thingy.v6.thing - $_237*/
			translate(v = [-6.5, -6.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.v6.thing - $_238*/
			translate(v = [-6.5, -4.5, 1.5]) {
				rotate(a = [0, 107.54840061379231, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_237 - one.devices[3].thingy.v6.thing*/
			translate(v = [-7.5, -7.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_247 - one.devices[2].thingy.vp2.thing*/
			translate(v = [-7.5, -2.5, 1.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[2].thingy.vp2.thing - $_248*/
			translate(v = [-6.5, 2.5, 0.5]) {
				rotate(a = [0, 78.90419671686361, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_248 - one.devices[3].thingy.vp2.thing*/
			translate(v = [-7.5, 1.5, -2.5]) {
				rotate(a = [0, 25.239401820678914, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_252 - one.devices[2].thingy.vs2.thing*/
			translate(v = [-7.5, 2.5, 2.5]) {
				rotate(a = [0, 144.73561031724537, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[2].thingy.vs2.thing - $_255*/
			translate(v = [-6.5, 1.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_255 - one.devices[3].thingy.vs2.thing*/
			translate(v = [-7.5, 2.5, 1.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[2].thingy.vs3.thing - $_256*/
			translate(v = [-6.5, 1.5, 4.5]) {
				rotate(a = [0, 14.036243467926484, 180.0]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
			/*$_256 - one.devices[3].thingy.vs3.thing*/
			translate(v = [-7.5, 0.5, 8.5]) {
				rotate(a = [0, 160.52877936550934, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_259 - one.devices[3].thingy.v5.thing*/
			translate(v = [-7.5, -7.5, 3.5]) {
				rotate(a = [0, 131.81031489577862, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[3].thingy.column_lower.thing - $_261*/
			translate(v = [-6.5, 1.5, 3.5]) {
				rotate(a = [0, 15.793169048263968, 135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_261 - one.devices[3].thingy.vs3.thing*/
			translate(v = [-7.5, 0.5, 8.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[3].thingy.v6.thing - $_276*/
			translate(v = [-6.5, -2.5, 1.5]) {
				rotate(a = [0, 78.90419671686361, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_282 - one.devices[3].thingy.vp2.thing*/
			translate(v = [-7.5, 1.5, -2.5]) {
				rotate(a = [0, 57.68846676257615, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.devices[3].thingy.vp2.thing - $_283*/
			translate(v = [-6.5, -1.5, 2.5]) {
				rotate(a = [0, 147.68846676257616, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*$_287 - one.devices[3].thingy.vs2.thing*/
			translate(v = [-7.5, 2.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 7*/
	union() {
		%/*Nodes shell 7*/
		union() {
			/*one.ctrl_a[10].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 4.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[10].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[4].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -2.0, 8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[4].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[7].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 8.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[7].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[9].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 3.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[9].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 8.0, 8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [8.0, -2.0, 8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.column_lower.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [2.0, -8.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v5.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -3.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v6.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -2.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vp2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1.0, -1.0, -8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vs2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, -8.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vs3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-3.0, -8.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.column_lower.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-5.0, -8.0, 8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v5.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 2.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v6.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 2.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vp2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vs2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vs3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1.0, -8.0, 8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.column_lower.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -4.0, 8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v5.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v6.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.vp2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -3.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.vs2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 2.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.vs3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 1.0, 8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.column_lower.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 2.0, 8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v5.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v6.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.vp2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.vs2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 2.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.vs3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 0.0, 8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*one.ctrl_a[10].flush - $_76*/
			translate(v = [-8.5, 0.5, 5.5]) {
				rotate(a = [0, 126.03989343030386, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*one.ctrl_a[10].hole - $_77*/
			translate(v = [-8.5, -8.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[4].flush - $_88*/
			translate(v = [-8.5, -4.5, 9.5]) {
				rotate(a = [0, 107.54840061379231, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.ctrl_a[4].hole - $_89*/
			translate(v = [-8.5, -8.5, -6.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[7].flush - $_94*/
			translate(v = [-8.5, 4.5, 1.5]) {
				rotate(a = [0, 64.1233099391725, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*one.ctrl_a[7].hole - $_95*/
			translate(v = [-8.5, -8.5, -4.5]) {
				rotate(a = [0, 19.471220634490674, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.ctrl_a[9].flush - $_98*/
			translate(v = [-8.5, 0.5, 4.5]) {
				rotate(a = [0, 133.491519345092, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.ctrl_a[9].hole - $_99*/
			translate(v = [-8.5, -8.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_s[0].flush - $_100*/
			translate(v = [-8.5, 4.5, 9.5]) {
				rotate(a = [0, 103.6330222253664, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.ctrl_s[0].hole - $_101*/
			translate(v = [4.5, -5.5, 9.5]) {
				rotate(a = [0, 100.02498786207575, 45.0]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*$_108 - one.devices[0].thingy.vp2.thing*/
			translate(v = [-0.5, -0.5, -7.5]) {
				rotate(a = [0, 100.02498786207575, -135.0]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.devices[0].thingy.column_lower.thing - $_113*/
			translate(v = [3.5, -8.5, 5.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_124 - one.devices[0].thingy.vs3.thing*/
			translate(v = [-2.5, -7.5, 2.5]) {
				rotate(a = [0, 114.09484255211072, -153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_134 - one.devices[0].thingy.v5.thing*/
			translate(v = [-7.5, -2.5, -1.5]) {
				rotate(a = [0, 143.30077479951012, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_134 - one.devices[0].thingy.v6.thing*/
			translate(v = [-7.5, -1.5, -2.5]) {
				rotate(a = [0, 122.31153323742386, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_139 - one.devices[0].thingy.vs2.thing*/
			translate(v = [-1.5, -7.5, -0.5]) {
				rotate(a = [0, 133.491519345092, -161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_161 - one.devices[1].thingy.vp2.thing*/
			translate(v = [-7.5, -0.5, -1.5]) {
				rotate(a = [0, 25.239401820678914, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[1].thingy.column_lower.thing - $_166*/
			translate(v = [-0.5, -3.5, 9.5]) {
				rotate(a = [0, 100.02498786207575, -135.0]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*$_177 - one.devices[1].thingy.vs3.thing*/
			translate(v = [-0.5, -7.5, 8.5]) {
				rotate(a = [0, 134.13174921203108, -165.96375653207352]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*$_187 - one.devices[1].thingy.v5.thing*/
			translate(v = [-7.5, 2.5, -2.5]) {
				rotate(a = [0, 45.868250787968954, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*$_187 - one.devices[1].thingy.v6.thing*/
			translate(v = [-7.5, 2.5, 0.5]) {
				rotate(a = [0, 76.3669777746336, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_192 - one.devices[1].thingy.vs2.thing*/
			translate(v = [-7.5, -7.5, 1.5]) {
				rotate(a = [0, 107.54840061379231, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_209 - one.devices[2].thingy.vp2.thing*/
			translate(v = [-7.5, -2.5, 1.5]) {
				rotate(a = [0, 115.8766900608275, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*one.devices[2].thingy.column_lower.thing - $_214*/
			translate(v = [-3.5, 0.5, 9.5]) {
				rotate(a = [0, 100.02498786207575, -135.0]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*$_225 - one.devices[2].thingy.vs3.thing*/
			translate(v = [-7.5, 1.5, 8.5]) {
				rotate(a = [0, 65.9051574478893, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_235 - one.devices[2].thingy.v5.thing*/
			translate(v = [-7.5, -2.5, -2.5]) {
				rotate(a = [0, 38.32881810145588, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*$_235 - one.devices[2].thingy.v6.thing*/
			translate(v = [-7.5, -7.5, 0.5]) {
				rotate(a = [0, 65.9051574478893, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_240 - one.devices[2].thingy.vs2.thing*/
			translate(v = [-7.5, 2.5, 2.5]) {
				rotate(a = [0, 57.68846676257615, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_257 - one.devices[3].thingy.vp2.thing*/
			translate(v = [-7.5, 1.5, -2.5]) {
				rotate(a = [0, 29.205932247399414, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*one.devices[3].thingy.column_lower.thing - $_262*/
			translate(v = [-8.5, 3.5, 9.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_270 - one.devices[3].thingy.vs3.thing*/
			translate(v = [-7.5, 0.5, 8.5]) {
				rotate(a = [0, 65.9051574478893, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_275 - one.devices[3].thingy.v5.thing*/
			translate(v = [-7.5, -7.5, 3.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_275 - one.devices[3].thingy.v6.thing*/
			translate(v = [-7.5, -7.5, 2.5]) {
				rotate(a = [0, 19.471220634490674, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_277 - one.devices[3].thingy.vs2.thing*/
			translate(v = [-7.5, 2.5, 1.5]) {
				rotate(a = [0, 19.471220634490674, 135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
		}
	}
	/*Shell 8*/
	union() {
		%/*Nodes shell 8*/
		union() {
			/*$_52*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9.0, 9.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_30*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9.0, -9.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_76*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 0.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_77*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_63*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9.0, 1.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_41*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_64*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9.0, 9.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_42*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9.0, -9.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_53*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3.0, -3.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_31*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, -9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_54*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9.0, -9.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_32*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_55*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9.0, -9.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_33*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_88*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -5.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_89*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_94*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 4.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_95*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_60*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-9.0, 9.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_38*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_98*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 0.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_99*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_100*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 4.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_101*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4.0, -6.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_108*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -5.0, -9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_113*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [3.0, -9.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_123*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_124*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -9.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_133*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -5.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_134*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -5.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_138*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -5.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_139*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -9.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_142*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_157*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [3.0, -5.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_161*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, 0.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_166*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-1.0, -4.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_176*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -5.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_177*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -9.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_186*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -5.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_187*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -2.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_191*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -1.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_192*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -5.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_195*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -5.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_205*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1.0, -1.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_209*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, 1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_214*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-4.0, 0.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_224*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -2.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_225*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -1.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_234*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_235*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -6.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_239*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 3.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_240*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -1.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_243*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -1.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_253*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 3.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_257*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, 3.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_262*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, 3.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_270*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, 2.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_275*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -9.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_277*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, 3.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*one.ctrl_a[0].flush - $_52*/
			translate(v = [-8.5, 9.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[0].hole - $_30*/
			translate(v = [9.5, -8.5, 9.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_76 - one.devices[3].thingy.v10.thing*/
			translate(v = [-9.5, -2.5, 10.5]) {
				rotate(a = [0, 147.68846676257616, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*$_77 - one.devices[0].thingy.v10.thing*/
			translate(v = [-9.5, -9.5, 2.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[11].flush - $_63*/
			translate(v = [-8.5, 1.5, 9.5]) {
				rotate(a = [0, 78.90419671686361, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[11].hole - $_41*/
			translate(v = [-8.5, -8.5, 2.5]) {
				rotate(a = [0, 164.20683095173604, -135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[12].flush - $_64*/
			translate(v = [-8.5, 9.5, 9.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[12].hole - $_42*/
			translate(v = [9.5, -8.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[1].flush - $_53*/
			translate(v = [-2.5, -2.5, 9.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[1].hole - $_31*/
			translate(v = [-8.5, -8.5, -8.5]) {
				rotate(a = [0, 19.471220634490674, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.ctrl_a[2].flush - $_54*/
			translate(v = [-8.5, -8.5, 9.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[2].hole - $_32*/
			translate(v = [-8.5, -8.5, -1.5]) {
				rotate(a = [0, 15.793169048263968, -135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[3].flush - $_55*/
			translate(v = [-8.5, -8.5, 3.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.ctrl_a[3].hole - $_33*/
			translate(v = [-8.5, -8.5, -0.5]) {
				rotate(a = [0, 164.20683095173604, -135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_88 - one.devices[3].thingy.v4.thing*/
			translate(v = [-9.5, -9.5, 5.5]) {
				rotate(a = [0, 51.88707349901337, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*$_89 - one.devices[0].thingy.v4.thing*/
			translate(v = [-9.5, -9.5, -1.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_94 - one.devices[3].thingy.v7.thing*/
			translate(v = [-9.5, 4.5, 0.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_95 - one.devices[0].thingy.v7.thing*/
			translate(v = [-9.5, -9.5, -6.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.ctrl_a[8].flush - $_60*/
			translate(v = [-8.5, 9.5, -0.5]) {
				rotate(a = [0, 25.239401820678914, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.ctrl_a[8].hole - $_38*/
			translate(v = [-8.5, -8.5, -5.5]) {
				rotate(a = [0, 35.26438968275464, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_98 - one.devices[3].thingy.v9.thing*/
			translate(v = [-9.5, -1.5, 5.5]) {
				rotate(a = [0, 114.09484255211072, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_99 - one.devices[0].thingy.v9.thing*/
			translate(v = [-9.5, -9.5, 1.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_100 - one.devices[3].thingy.vs0.thing*/
			translate(v = [-9.5, 4.5, 10.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_101 - one.devices[0].thingy.vs0.thing*/
			translate(v = [4.5, -9.5, 10.5]) {
				rotate(a = [0, 104.0362434679265, 90.0]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
			/*one.devices[0].thingy.circulate1.thing - $_108*/
			translate(v = [-4.5, -4.5, -8.5]) {
				rotate(a = [0, 98.0494669755284, -135.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_113 - one.devices[0].thingy.vs0.thing*/
			translate(v = [4.5, -9.5, 10.5]) {
				rotate(a = [0, 164.20683095173604, 135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[0].thingy.v10.thing - $_123*/
			translate(v = [-8.5, -8.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.v10.thing - $_124*/
			translate(v = [-4.5, -8.5, 1.5]) {
				rotate(a = [0, 78.90419671686361, -168.6900675259798]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_123 - one.devices[1].thingy.v10.thing*/
			translate(v = [-9.5, -9.5, 4.5]) {
				rotate(a = [0, 154.7605981793211, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[0].thingy.v4.thing - $_133*/
			translate(v = [-8.5, -4.5, -2.5]) {
				rotate(a = [0, 78.90419671686361, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[0].thingy.v4.thing - $_134*/
			translate(v = [-8.5, -4.5, -4.5]) {
				rotate(a = [0, 59.52964053402026, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*$_133 - one.devices[1].thingy.v4.thing*/
			translate(v = [-9.5, 0.5, 2.5]) {
				rotate(a = [0, 134.43824067114977, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.devices[0].thingy.v7.thing - $_138*/
			translate(v = [-8.5, -4.5, -3.5]) {
				rotate(a = [0, 120.47035946597974, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*one.devices[0].thingy.v7.thing - $_139*/
			translate(v = [-4.5, -8.5, -3.5]) {
				rotate(a = [0, 120.47035946597974, -168.6900675259798]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*$_138 - one.devices[1].thingy.v7.thing*/
			translate(v = [-9.5, 0.5, 1.5]) {
				rotate(a = [0, 134.43824067114977, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_139 - one.devices[0].thingy.v9.thing*/
			translate(v = [-9.5, -9.5, 1.5]) {
				rotate(a = [0, 134.43824067114977, 11.309932474020213]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.devices[0].thingy.v9.thing - $_142*/
			translate(v = [-8.5, -8.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_142 - one.devices[1].thingy.v9.thing*/
			translate(v = [-9.5, -9.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.vs0.thing - $_157*/
			translate(v = [3.5, -4.5, 9.5]) {
				rotate(a = [0, 78.90419671686361, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_157 - one.devices[1].thingy.vs0.thing*/
			translate(v = [-1.5, 0.5, 10.5]) {
				rotate(a = [0, 98.0494669755284, -45.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.devices[1].thingy.circulate1.thing - $_161*/
			translate(v = [-8.5, 0.5, 1.5]) {
				rotate(a = [0, 134.43824067114977, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_166 - one.devices[1].thingy.vs0.thing*/
			translate(v = [-1.5, 0.5, 10.5]) {
				rotate(a = [0, 103.6330222253664, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.devices[1].thingy.v10.thing - $_176*/
			translate(v = [-8.5, -4.5, 5.5]) {
				rotate(a = [0, 101.0958032831364, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[1].thingy.v10.thing - $_177*/
			translate(v = [-4.5, -8.5, 4.5]) {
				rotate(a = [0, 90.0, -168.6900675259798]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*$_176 - one.devices[2].thingy.v10.thing*/
			translate(v = [-9.5, 0.5, 10.5]) {
				rotate(a = [0, 134.43824067114977, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.devices[1].thingy.v4.thing - $_186*/
			translate(v = [-8.5, -4.5, 1.5]) {
				rotate(a = [0, 78.90419671686361, 101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[1].thingy.v4.thing - $_187*/
			translate(v = [-8.5, -1.5, 1.5]) {
				rotate(a = [0, 65.9051574478893, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_186 - one.devices[2].thingy.v4.thing*/
			translate(v = [-9.5, -9.5, 0.5]) {
				rotate(a = [0, 78.90419671686361, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[1].thingy.v7.thing - $_191*/
			translate(v = [-8.5, -0.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v7.thing - $_192*/
			translate(v = [-8.5, -4.5, 0.5]) {
				rotate(a = [0, 78.90419671686361, 101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_191 - one.devices[2].thingy.v7.thing*/
			translate(v = [-9.5, -1.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_192 - one.devices[1].thingy.v9.thing*/
			translate(v = [-9.5, -9.5, -0.5]) {
				rotate(a = [0, 78.90419671686361, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[1].thingy.v9.thing - $_195*/
			translate(v = [-8.5, -4.5, 4.5]) {
				rotate(a = [0, 134.43824067114977, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_195 - one.devices[2].thingy.v9.thing*/
			translate(v = [-9.5, 0.5, 5.5]) {
				rotate(a = [0, 101.0958032831364, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[1].thingy.vs0.thing - $_205*/
			translate(v = [-0.5, -0.5, 9.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_205 - one.devices[2].thingy.vs0.thing*/
			translate(v = [0.5, -1.5, 10.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.circulate1.thing - $_209*/
			translate(v = [-8.5, 1.5, -0.5]) {
				rotate(a = [0, 45.56175932885022, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_214 - one.devices[2].thingy.vs0.thing*/
			translate(v = [0.5, -1.5, 10.5]) {
				rotate(a = [0, 102.60438264837919, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*one.devices[2].thingy.v10.thing - $_224*/
			translate(v = [-8.5, -1.5, 9.5]) {
				rotate(a = [0, 65.9051574478893, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[2].thingy.v10.thing - $_225*/
			translate(v = [-8.5, -0.5, 9.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_224 - one.devices[3].thingy.v10.thing*/
			translate(v = [-9.5, -2.5, 10.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.v4.thing - $_234*/
			translate(v = [-8.5, -8.5, 5.5]) {
				rotate(a = [0, 164.20683095173604, -135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[2].thingy.v4.thing - $_235*/
			translate(v = [-8.5, -5.5, 1.5]) {
				rotate(a = [0, 103.6330222253664, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_234 - one.devices[3].thingy.v4.thing*/
			translate(v = [-9.5, -9.5, 5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[2].thingy.v7.thing - $_239*/
			translate(v = [-8.5, 3.5, 4.5]) {
				rotate(a = [0, 134.43824067114977, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.devices[2].thingy.v7.thing - $_240*/
			translate(v = [-8.5, -0.5, 4.5]) {
				rotate(a = [0, 164.20683095173604, -135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_239 - one.devices[3].thingy.v7.thing*/
			translate(v = [-9.5, 4.5, 0.5]) {
				rotate(a = [0, 19.471220634490674, -45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_240 - one.devices[2].thingy.v9.thing*/
			translate(v = [-9.5, 0.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.v9.thing - $_243*/
			translate(v = [-8.5, -0.5, 5.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_243 - one.devices[3].thingy.v9.thing*/
			translate(v = [-9.5, -1.5, 5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[2].thingy.vs0.thing - $_253*/
			translate(v = [-4.5, 3.5, 9.5]) {
				rotate(a = [0, 81.95053302447161, -45.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_253 - one.devices[3].thingy.vs0.thing*/
			translate(v = [-9.5, 4.5, 10.5]) {
				rotate(a = [0, 101.0958032831364, -11.309932474020213]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[3].thingy.circulate1.thing - $_257*/
			translate(v = [-8.5, 3.5, 1.5]) {
				rotate(a = [0, 164.20683095173604, 135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_262 - one.devices[3].thingy.vs0.thing*/
			translate(v = [-9.5, 4.5, 10.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[3].thingy.v10.thing - $_270*/
			translate(v = [-8.5, 2.5, 9.5]) {
				rotate(a = [0, 78.90419671686361, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[3].thingy.v4.thing - $_275*/
			translate(v = [-8.5, -8.5, 6.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[3].thingy.v7.thing - $_277*/
			translate(v = [-8.5, 3.5, 5.5]) {
				rotate(a = [0, 164.20683095173604, 135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_277 - one.devices[3].thingy.v9.thing*/
			translate(v = [-9.5, -1.5, 5.5]) {
				rotate(a = [0, 90.0, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
		}
	}
	/*Shell 9*/
	union() {
		%/*Nodes shell 9*/
		union() {
			/*one.ctrl_a[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 10.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [10.0, -10.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[11].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -4.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[11].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[12].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 10.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[12].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [10.0, -10.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[2].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[3].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[8].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 10.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[8].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.circulate1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v10.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v7.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v9.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vs0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [4.0, -10.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.circulate1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -5.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v10.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 0.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v7.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 0.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v9.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vs0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, 0.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.circulate1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -4.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v10.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 0.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v7.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -2.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v9.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 0.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.vs0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0.0, -2.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.circulate1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 4.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v10.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -3.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v7.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 4.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v9.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -2.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.vs0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 4.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*one.ctrl_a[0].flush - $_74*/
			translate(v = [-10.5, 11.5, 6.5]) {
				rotate(a = [0, 144.73561031724537, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.ctrl_a[0].hole - $_75*/
			translate(v = [5.5, -4.5, 11.5]) {
				rotate(a = [0, 98.0494669755284, -45.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.ctrl_a[11].flush - $_78*/
			translate(v = [-10.5, 1.5, 11.5]) {
				rotate(a = [0, 101.0958032831364, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[11].hole - $_79*/
			translate(v = [-10.5, -10.5, 0.5]) {
				rotate(a = [0, 154.7605981793211, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.ctrl_a[12].flush - $_80*/
			translate(v = [-10.5, 5.5, 11.5]) {
				rotate(a = [0, 101.0958032831364, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[12].hole - $_81*/
			translate(v = [5.5, -10.5, 6.5]) {
				rotate(a = [0, 111.41671403303363, 11.309932474020213]) {
					cube(size = [0.125, 0.125, 5.477225575051661]);
				}
			}
			/*one.ctrl_a[1].flush - $_82*/
			translate(v = [-5.5, -5.5, 11.5]) {
				rotate(a = [0, 109.47122063449069, 45.0]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.ctrl_a[1].hole - $_83*/
			translate(v = [-10.5, -10.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[2].flush - $_84*/
			translate(v = [-10.5, -10.5, 11.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[2].hole - $_85*/
			translate(v = [-10.5, -10.5, -1.5]) {
				rotate(a = [0, 15.793169048263968, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[3].flush - $_86*/
			translate(v = [-10.5, -10.5, 9.5]) {
				rotate(a = [0, 154.7605981793211, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.ctrl_a[3].hole - $_87*/
			translate(v = [-10.5, -10.5, -0.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[8].flush - $_96*/
			translate(v = [-10.5, 5.5, -2.5]) {
				rotate(a = [0, 45.56175932885022, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.ctrl_a[8].hole - $_97*/
			translate(v = [-10.5, -10.5, -5.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.circulate1.thing - $_109*/
			translate(v = [-10.5, -10.5, -10.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_109 - one.devices[0].thingy.v7.thing*/
			translate(v = [-9.5, -9.5, -6.5]) {
				rotate(a = [0, 160.52877936550934, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_116 - one.devices[0].thingy.vs0.thing*/
			translate(v = [4.5, -9.5, 10.5]) {
				rotate(a = [0, 78.69006752597979, 143.13010235415598]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*$_121 - one.devices[0].thingy.v4.thing*/
			translate(v = [-9.5, -9.5, -1.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[0].thingy.v10.thing - $_122*/
			translate(v = [-10.5, -10.5, -2.5]) {
				rotate(a = [0, 15.793169048263968, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_122 - one.devices[0].thingy.v9.thing*/
			translate(v = [-9.5, -9.5, 1.5]) {
				rotate(a = [0, 160.52877936550934, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.devices[1].thingy.circulate1.thing - $_162*/
			translate(v = [-10.5, -0.5, -0.5]) {
				rotate(a = [0, 126.03989343030386, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*$_162 - one.devices[1].thingy.v7.thing*/
			translate(v = [-9.5, 0.5, 1.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_169 - one.devices[1].thingy.vs0.thing*/
			translate(v = [-1.5, 0.5, 10.5]) {
				rotate(a = [0, 77.39561735162083, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*$_174 - one.devices[1].thingy.v4.thing*/
			translate(v = [-9.5, 0.5, 2.5]) {
				rotate(a = [0, 134.43824067114977, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.devices[1].thingy.v10.thing - $_175*/
			translate(v = [-10.5, -10.5, 4.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_175 - one.devices[1].thingy.v9.thing*/
			translate(v = [-9.5, -9.5, -0.5]) {
				rotate(a = [0, 15.793169048263968, -135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[2].thingy.circulate1.thing - $_210*/
			translate(v = [-10.5, 1.5, -0.5]) {
				rotate(a = [0, 45.56175932885022, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_210 - one.devices[2].thingy.v7.thing*/
			translate(v = [-9.5, -1.5, -0.5]) {
				rotate(a = [0, 90.0, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*$_217 - one.devices[2].thingy.vs0.thing*/
			translate(v = [0.5, -1.5, 10.5]) {
				rotate(a = [0, 78.69006752597979, 143.13010235415598]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*$_222 - one.devices[2].thingy.v4.thing*/
			translate(v = [-9.5, -9.5, 0.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[2].thingy.v10.thing - $_223*/
			translate(v = [-10.5, -4.5, 6.5]) {
				rotate(a = [0, 51.88707349901337, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*$_223 - one.devices[2].thingy.v9.thing*/
			translate(v = [-9.5, 0.5, 5.5]) {
				rotate(a = [0, 78.90419671686361, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[3].thingy.circulate1.thing - $_258*/
			translate(v = [-10.5, 0.5, -4.5]) {
				rotate(a = [0, 76.3669777746336, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_258 - one.devices[3].thingy.v7.thing*/
			translate(v = [-9.5, 4.5, 0.5]) {
				rotate(a = [0, 140.49028771380608, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*$_265 - one.devices[3].thingy.vs0.thing*/
			translate(v = [-9.5, 4.5, 10.5]) {
				rotate(a = [0, 65.9051574478893, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_268 - one.devices[3].thingy.v4.thing*/
			translate(v = [-9.5, -9.5, 5.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[3].thingy.v10.thing - $_269*/
			translate(v = [-10.5, 2.5, 6.5]) {
				rotate(a = [0, 51.88707349901337, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*$_269 - one.devices[3].thingy.v9.thing*/
			translate(v = [-9.5, -1.5, 5.5]) {
				rotate(a = [0, 76.3669777746336, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
		}
	}
	/*Shell 10*/
	union() {
		%/*Nodes shell 10*/
		union() {
			/*$_74*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 11.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_75*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5.0, -5.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_78*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 1.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_79*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -11.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_80*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 5.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_81*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5.0, -11.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_82*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-6.0, -6.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_83*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -11.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_84*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -11.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_85*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -11.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_86*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -11.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_87*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -11.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_96*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 5.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_97*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -11.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_109*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -11.0, -11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_116*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0.0, -7.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_117*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0.0, -2.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_120*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -6.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_121*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -11.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_122*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -11.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_125*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -11.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_127*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0.0, -6.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_130*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -6.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_132*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -6.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_140*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -6.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_162*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_169*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0.0, -4.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_170*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 1.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_173*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -7.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_174*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -5.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_175*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -11.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_178*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -6.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_180*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -4.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_183*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -6.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_185*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -6.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_193*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -4.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_210*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, 1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_217*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-4.0, 1.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_218*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-6.0, 6.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_221*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -11.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_222*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -11.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_223*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -5.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_226*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -1.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_228*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-6.0, 1.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_231*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -11.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_233*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -11.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_241*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 0.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_258*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, 0.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_265*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, 6.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_268*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -11.0, 8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_269*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, 2.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union() {
			/*$_74 - one.devices[3].thingy.v0.thing*/
			translate(v = [-11.5, 12.5, 12.5]) {
				rotate(a = [0, 166.73732399169518, -45.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_75 - one.devices[0].thingy.v0.thing*/
			translate(v = [-0.5, -0.5, 12.5]) {
				rotate(a = [0, 97.89514210504579, -33.690067525979785]) {
					cube(size = [0.125, 0.125, 7.280109889280518]);
				}
			}
			/*$_78 - one.devices[3].thingy.v11.thing*/
			translate(v = [-11.5, -3.5, 12.5]) {
				rotate(a = [0, 101.0958032831364, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_79 - one.devices[0].thingy.v11.thing*/
			translate(v = [-11.5, -11.5, -1.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_80 - one.devices[3].thingy.v12.thing*/
			translate(v = [-11.5, 1.5, 12.5]) {
				rotate(a = [0, 103.6330222253664, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_81 - one.devices[0].thingy.v12.thing*/
			translate(v = [-0.5, -11.5, 12.5]) {
				rotate(a = [0, 134.60755087935968, 9.462322208025617]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*$_82 - one.devices[3].thingy.v1.thing*/
			translate(v = [-11.5, -4.5, 5.5]) {
				rotate(a = [0, 45.39244912064032, -9.462322208025617]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*$_83 - one.devices[0].thingy.v1.thing*/
			translate(v = [-11.5, -11.5, 1.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_84 - one.devices[3].thingy.v2.thing*/
			translate(v = [-11.5, -11.5, 12.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_85 - one.devices[0].thingy.v2.thing*/
			translate(v = [-11.5, -11.5, 2.5]) {
				rotate(a = [0, 160.52877936550934, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_86 - one.devices[3].thingy.v3.thing*/
			translate(v = [-11.5, -11.5, 3.5]) {
				rotate(a = [0, 13.262676008304837, 45.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_87 - one.devices[0].thingy.v3.thing*/
			translate(v = [-11.5, -11.5, -3.5]) {
				rotate(a = [0, 25.239401820678914, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_96 - one.devices[3].thingy.v8.thing*/
			translate(v = [-11.5, -0.5, 1.5]) {
				rotate(a = [0, 123.3287577974902, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 7.280109889280518]);
				}
			}
			/*$_97 - one.devices[0].thingy.v8.thing*/
			translate(v = [-11.5, -11.5, -11.5]) {
				rotate(a = [0, 13.262676008304837, 45.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_109 - one.devices[0].thingy.v8.thing*/
			translate(v = [-11.5, -11.5, -11.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.v0.thing - $_116*/
			translate(v = [0.5, -6.5, 11.5]) {
				rotate(a = [0, 80.66414096799606, 99.46232220802563]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*one.devices[0].thingy.v0.thing - $_117*/
			translate(v = [0.5, -1.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_116 - one.devices[0].thingy.v12.thing*/
			translate(v = [-0.5, -11.5, 12.5]) {
				rotate(a = [0, 101.0958032831364, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_117 - one.devices[1].thingy.v0.thing*/
			translate(v = [1.5, 2.5, 12.5]) {
				rotate(a = [0, 103.6330222253664, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.devices[0].thingy.v1.thing - $_120*/
			translate(v = [-10.5, -5.5, -2.5]) {
				rotate(a = [0, 56.671242202509795, -99.46232220802563]) {
					cube(size = [0.125, 0.125, 7.280109889280518]);
				}
			}
			/*one.devices[0].thingy.v1.thing - $_121*/
			translate(v = [-10.5, -10.5, 1.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_120 - one.devices[1].thingy.v1.thing*/
			translate(v = [-11.5, -0.5, 3.5]) {
				rotate(a = [0, 139.64089954333878, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.874007874011811]);
				}
			}
			/*$_121 - one.devices[0].thingy.v2.thing*/
			translate(v = [-11.5, -11.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_121 - one.devices[0].thingy.v3.thing*/
			translate(v = [-11.5, -11.5, -3.5]) {
				rotate(a = [0, 15.793169048263968, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_122 - one.devices[0].thingy.v11.thing*/
			translate(v = [-11.5, -11.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.v11.thing - $_125*/
			translate(v = [-10.5, -10.5, 2.5]) {
				rotate(a = [0, 160.52877936550934, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_125 - one.devices[1].thingy.v11.thing*/
			translate(v = [-11.5, -11.5, 0.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.v12.thing - $_127*/
			translate(v = [0.5, -5.5, 11.5]) {
				rotate(a = [0, 80.66414096799606, -99.46232220802563]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_127 - one.devices[1].thingy.v12.thing*/
			translate(v = [1.5, 0.5, 12.5]) {
				rotate(a = [0, 99.33585903200395, -99.46232220802563]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*one.devices[0].thingy.v2.thing - $_130*/
			translate(v = [-10.5, -5.5, -3.5]) {
				rotate(a = [0, 45.39244912064032, -99.46232220802563]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*$_130 - one.devices[1].thingy.v2.thing*/
			translate(v = [-11.5, 0.5, 2.5]) {
				rotate(a = [0, 134.60755087935968, -80.53767779197439]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*one.devices[0].thingy.v3.thing - $_132*/
			translate(v = [-10.5, -5.5, 2.5]) {
				rotate(a = [0, 134.60755087935968, -99.46232220802563]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*$_132 - one.devices[1].thingy.v3.thing*/
			translate(v = [-11.5, 0.5, 3.5]) {
				rotate(a = [0, 99.33585903200395, -80.53767779197439]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*one.devices[0].thingy.v8.thing - $_140*/
			translate(v = [-10.5, -5.5, -5.5]) {
				rotate(a = [0, 134.60755087935968, -99.46232220802563]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*$_140 - one.devices[1].thingy.v8.thing*/
			translate(v = [-11.5, 0.5, 0.5]) {
				rotate(a = [0, 134.60755087935968, -80.53767779197439]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*$_162 - one.devices[1].thingy.v8.thing*/
			translate(v = [-11.5, 0.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v0.thing - $_169*/
			translate(v = [0.5, -3.5, 11.5]) {
				rotate(a = [0, 80.66414096799606, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*one.devices[1].thingy.v0.thing - $_170*/
			translate(v = [-4.5, 1.5, 11.5]) {
				rotate(a = [0, 80.66414096799606, 9.462322208025617]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_169 - one.devices[1].thingy.v12.thing*/
			translate(v = [1.5, 0.5, 12.5]) {
				rotate(a = [0, 103.6330222253664, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_170 - one.devices[2].thingy.v0.thing*/
			translate(v = [0.5, 0.5, 12.5]) {
				rotate(a = [0, 101.0958032831364, 168.6900675259798]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[1].thingy.v1.thing - $_173*/
			translate(v = [-10.5, -6.5, 2.5]) {
				rotate(a = [0, 80.66414096799606, 99.46232220802563]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*one.devices[1].thingy.v1.thing - $_174*/
			translate(v = [-10.5, -4.5, -2.5]) {
				rotate(a = [0, 34.49623729009094, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 7.280109889280518]);
				}
			}
			/*$_173 - one.devices[2].thingy.v1.thing*/
			translate(v = [-11.5, -11.5, 4.5]) {
				rotate(a = [0, 111.41671403303363, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.477225575051661]);
				}
			}
			/*$_174 - one.devices[1].thingy.v2.thing*/
			translate(v = [-11.5, 0.5, 2.5]) {
				rotate(a = [0, 134.43824067114977, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_174 - one.devices[1].thingy.v3.thing*/
			translate(v = [-11.5, 0.5, 3.5]) {
				rotate(a = [0, 139.64089954333878, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.874007874011811]);
				}
			}
			/*$_175 - one.devices[1].thingy.v11.thing*/
			translate(v = [-11.5, -11.5, 0.5]) {
				rotate(a = [0, 19.471220634490674, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.devices[1].thingy.v11.thing - $_178*/
			translate(v = [-10.5, -5.5, 6.5]) {
				rotate(a = [0, 134.60755087935968, -99.46232220802563]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*$_178 - one.devices[2].thingy.v11.thing*/
			translate(v = [-11.5, 0.5, 12.5]) {
				rotate(a = [0, 134.60755087935968, -80.53767779197439]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*one.devices[1].thingy.v12.thing - $_180*/
			translate(v = [-4.5, -3.5, 11.5]) {
				rotate(a = [0, 82.10485789495422, 33.690067525979785]) {
					cube(size = [0.125, 0.125, 7.280109889280518]);
				}
			}
			/*$_180 - one.devices[2].thingy.v12.thing*/
			translate(v = [0.5, 2.5, 12.5]) {
				rotate(a = [0, 97.2962753010167, -129.8055710922652]) {
					cube(size = [0.125, 0.125, 7.874007874011811]);
				}
			}
			/*one.devices[1].thingy.v2.thing - $_183*/
			translate(v = [-10.5, -5.5, 1.5]) {
				rotate(a = [0, 80.66414096799606, 99.46232220802563]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_183 - one.devices[2].thingy.v2.thing*/
			translate(v = [-11.5, -11.5, 5.5]) {
				rotate(a = [0, 123.3287577974902, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 7.280109889280518]);
				}
			}
			/*one.devices[1].thingy.v3.thing - $_185*/
			translate(v = [-10.5, -5.5, 0.5]) {
				rotate(a = [0, 63.74762488227932, 99.46232220802563]) {
					cube(size = [0.125, 0.125, 6.782329983125268]);
				}
			}
			/*$_185 - one.devices[2].thingy.v3.thing*/
			translate(v = [-11.5, -11.5, -0.5]) {
				rotate(a = [0, 80.66414096799606, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*one.devices[1].thingy.v8.thing - $_193*/
			translate(v = [-10.5, -3.5, -5.5]) {
				rotate(a = [0, 34.49623729009094, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 7.280109889280518]);
				}
			}
			/*$_193 - one.devices[2].thingy.v8.thing*/
			translate(v = [-11.5, 2.5, 0.5]) {
				rotate(a = [0, 134.60755087935968, -80.53767779197439]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*$_210 - one.devices[2].thingy.v8.thing*/
			translate(v = [-11.5, 2.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.v0.thing - $_217*/
			translate(v = [-3.5, 1.5, 11.5]) {
				rotate(a = [0, 76.3669777746336, -14.036243467926477]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.devices[2].thingy.v0.thing - $_218*/
			translate(v = [-5.5, 6.5, 11.5]) {
				rotate(a = [0, 83.27863066063054, -45.0]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*$_217 - one.devices[2].thingy.v12.thing*/
			translate(v = [0.5, 2.5, 12.5]) {
				rotate(a = [0, 103.6330222253664, -165.96375653207352]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_218 - one.devices[3].thingy.v0.thing*/
			translate(v = [-11.5, 12.5, 12.5]) {
				rotate(a = [0, 96.72136933936946, -45.0]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*one.devices[2].thingy.v1.thing - $_221*/
			translate(v = [-10.5, -10.5, 7.5]) {
				rotate(a = [0, 154.7605981793211, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[2].thingy.v1.thing - $_222*/
			translate(v = [-10.5, -10.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_221 - one.devices[3].thingy.v1.thing*/
			translate(v = [-11.5, -4.5, 5.5]) {
				rotate(a = [0, 71.79923973546668, -80.53767779197439]) {
					cube(size = [0.125, 0.125, 6.4031242374328485]);
				}
			}
			/*$_222 - one.devices[2].thingy.v2.thing*/
			translate(v = [-11.5, -11.5, 5.5]) {
				rotate(a = [0, 144.73561031724537, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_222 - one.devices[2].thingy.v3.thing*/
			translate(v = [-11.5, -11.5, -0.5]) {
				rotate(a = [0, 19.471220634490674, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_223 - one.devices[2].thingy.v11.thing*/
			translate(v = [-11.5, 0.5, 12.5]) {
				rotate(a = [0, 139.64089954333878, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.874007874011811]);
				}
			}
			/*one.devices[2].thingy.v11.thing - $_226*/
			translate(v = [-10.5, -0.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_226 - one.devices[3].thingy.v11.thing*/
			translate(v = [-11.5, -3.5, 12.5]) {
				rotate(a = [0, 107.54840061379231, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[2].thingy.v12.thing - $_228*/
			translate(v = [-5.5, 1.5, 11.5]) {
				rotate(a = [0, 80.66414096799606, 9.462322208025617]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_228 - one.devices[3].thingy.v12.thing*/
			translate(v = [-11.5, 1.5, 12.5]) {
				rotate(a = [0, 99.46232220802563, 0.0]) {
					cube(size = [0.125, 0.125, 6.082762530298219]);
				}
			}
			/*one.devices[2].thingy.v2.thing - $_231*/
			translate(v = [-10.5, -10.5, 6.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_231 - one.devices[3].thingy.v2.thing*/
			translate(v = [-11.5, -11.5, 12.5]) {
				rotate(a = [0, 166.73732399169518, 45.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*one.devices[2].thingy.v3.thing - $_233*/
			translate(v = [-10.5, -10.5, 5.5]) {
				rotate(a = [0, 166.73732399169518, -135.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_233 - one.devices[3].thingy.v3.thing*/
			translate(v = [-11.5, -11.5, 3.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[2].thingy.v8.thing - $_241*/
			translate(v = [-10.5, 0.5, -3.5]) {
				rotate(a = [0, 29.205932247399414, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*$_241 - one.devices[3].thingy.v8.thing*/
			translate(v = [-11.5, -0.5, 1.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_258 - one.devices[3].thingy.v8.thing*/
			translate(v = [-11.5, -0.5, 1.5]) {
				rotate(a = [0, 166.73732399169518, 45.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*one.devices[3].thingy.v0.thing - $_265*/
			translate(v = [-10.5, 6.5, 11.5]) {
				rotate(a = [0, 80.66414096799606, 99.46232220802563]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_265 - one.devices[3].thingy.v12.thing*/
			translate(v = [-11.5, 1.5, 12.5]) {
				rotate(a = [0, 101.0958032831364, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[3].thingy.v1.thing - $_268*/
			translate(v = [-10.5, -10.5, 8.5]) {
				rotate(a = [0, 116.25237511772069, 99.46232220802563]) {
					cube(size = [0.125, 0.125, 6.782329983125268]);
				}
			}
			/*$_268 - one.devices[3].thingy.v2.thing*/
			translate(v = [-11.5, -11.5, 12.5]) {
				rotate(a = [0, 160.52877936550934, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_268 - one.devices[3].thingy.v3.thing*/
			translate(v = [-11.5, -11.5, 3.5]) {
				rotate(a = [0, 15.793169048263968, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_269 - one.devices[3].thingy.v11.thing*/
			translate(v = [-11.5, -3.5, 12.5]) {
				rotate(a = [0, 134.60755087935968, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
		}
	}
	/*Shell 11*/
	union() {
		%/*Nodes shell 11*/
		union() {
			/*one.devices[0].thingy.v0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1.0, -1.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -12.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v11.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -12.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v12.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1.0, -12.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -12.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -12.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v8.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -12.0, -12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1.0, 2.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -1.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v11.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -12.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v12.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1.0, 0.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 0.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 0.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v8.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 0.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0.0, 0.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -12.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v11.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 0.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v12.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0.0, 2.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -12.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -12.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[2].thingy.v8.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 2.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 12.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -5.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v11.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -4.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v12.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 1.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -12.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -12.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[3].thingy.v8.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 11*/
		union() {
			/*one.devices[0].thingy.v0.thing - $_118*/
			translate(v = [-1.5, -1.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.v1.thing - $_119*/
			translate(v = [-12.5, -12.5, 1.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[0].thingy.v11.thing - $_126*/
			translate(v = [-12.5, -12.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.v12.thing - $_128*/
			translate(v = [-0.5, -12.5, 13.5]) {
				rotate(a = [0, 135.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[0].thingy.v2.thing - $_129*/
			translate(v = [-12.5, -12.5, 2.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[0].thingy.v3.thing - $_131*/
			translate(v = [-12.5, -12.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.v8.thing - $_141*/
			translate(v = [-12.5, -12.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v0.thing - $_171*/
			translate(v = [2.5, 3.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v1.thing - $_172*/
			translate(v = [-12.5, 0.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v11.thing - $_179*/
			translate(v = [-12.5, -12.5, 0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[1].thingy.v12.thing - $_181*/
			translate(v = [2.5, -0.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v2.thing - $_182*/
			translate(v = [-12.5, 1.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v3.thing - $_184*/
			translate(v = [-12.5, 1.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v8.thing - $_194*/
			translate(v = [-12.5, 1.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.v0.thing - $_219*/
			translate(v = [0.5, -0.5, 13.5]) {
				rotate(a = [0, 135.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[2].thingy.v1.thing - $_220*/
			translate(v = [-12.5, -12.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.v11.thing - $_227*/
			translate(v = [-12.5, -0.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.v12.thing - $_229*/
			translate(v = [0.5, 3.5, 13.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[2].thingy.v2.thing - $_230*/
			translate(v = [-12.5, -12.5, 4.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.v3.thing - $_232*/
			translate(v = [-12.5, -12.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[2].thingy.v8.thing - $_242*/
			translate(v = [-12.5, 3.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[3].thingy.v0.thing - $_266*/
			translate(v = [-12.5, 13.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[3].thingy.v1.thing - $_267*/
			translate(v = [-12.5, -4.5, 5.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.devices[3].thingy.v11.thing - $_271*/
			translate(v = [-12.5, -3.5, 13.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[3].thingy.v12.thing - $_272*/
			translate(v = [-10.5, 0.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[3].thingy.v2.thing - $_273*/
			translate(v = [-12.5, -12.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[3].thingy.v3.thing - $_274*/
			translate(v = [-12.5, -10.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[3].thingy.v8.thing - $_278*/
			translate(v = [-12.5, 0.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 12*/
	union() {
		%/*Nodes shell 12*/
		union() {
			/*$_118*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-2.0, -2.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_119*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -13.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_126*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -13.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_128*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-1.0, -13.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_129*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -13.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_131*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -13.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_141*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -13.0, -13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_171*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2.0, 3.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_172*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -0.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_179*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -13.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_181*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2.0, -1.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_182*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 1.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_184*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 1.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_194*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_219*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-0.0, -1.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_220*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -13.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_227*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -1.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_229*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-0.0, 3.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_230*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -13.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_232*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -13.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_242*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 3.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_266*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 13.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_267*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -5.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_271*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -4.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_272*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -0.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_273*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -13.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_274*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -11.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_278*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -0.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 12*/
		union() {
			/*$_118 - one.pinholes[0].out[3].hole*/
			translate(v = [-2.5, -1.5, 14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_119 - one.pinholes[0].in[0].hole*/
			translate(v = [-13.5, -13.5, 1.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_126 - one.pinholes[0].out[2].hole*/
			translate(v = [-13.5, -13.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_128 - one.pinholes[0].out[0].hole*/
			translate(v = [0.5, -13.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_129 - one.pinholes[0].in[1].hole*/
			translate(v = [-13.5, -13.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_131 - one.pinholes[0].in[2].hole*/
			translate(v = [-13.5, -13.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_141 - one.pinholes[0].out[1].hole*/
			translate(v = [-13.5, -13.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_171 - one.pinholes[1].out[3].hole*/
			translate(v = [3.5, 4.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_172 - one.pinholes[1].in[0].hole*/
			translate(v = [-13.5, 1.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_179 - one.pinholes[1].out[2].hole*/
			translate(v = [-13.5, -13.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_181 - one.pinholes[1].out[0].hole*/
			translate(v = [3.5, -0.5, 14.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_182 - one.pinholes[1].in[1].hole*/
			translate(v = [-13.5, 2.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_184 - one.pinholes[1].in[2].hole*/
			translate(v = [-13.5, 2.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_194 - one.pinholes[1].out[1].hole*/
			translate(v = [-13.5, 2.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_219 - one.pinholes[2].out[3].hole*/
			translate(v = [0.5, -0.5, 14.5]) {
				rotate(a = [0, 180.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*$_220 - one.pinholes[2].in[0].hole*/
			translate(v = [-13.5, -13.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_227 - one.pinholes[2].out[2].hole*/
			translate(v = [-13.5, -1.5, 10.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_229 - one.pinholes[2].out[0].hole*/
			translate(v = [-0.5, 2.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_230 - one.pinholes[2].in[1].hole*/
			translate(v = [-13.5, -11.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_232 - one.pinholes[2].in[2].hole*/
			translate(v = [-13.5, -13.5, -2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_242 - one.pinholes[2].out[1].hole*/
			translate(v = [-13.5, 4.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_266 - one.pinholes[3].out[3].hole*/
			translate(v = [-13.5, 14.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_267 - one.pinholes[3].in[0].hole*/
			translate(v = [-13.5, -4.5, 5.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*$_271 - one.pinholes[3].out[2].hole*/
			translate(v = [-13.5, -3.5, 14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_272 - one.pinholes[3].out[0].hole*/
			translate(v = [-9.5, 0.5, 14.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_273 - one.pinholes[3].in[1].hole*/
			translate(v = [-13.5, -13.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_274 - one.pinholes[3].in[2].hole*/
			translate(v = [-13.5, -9.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_278 - one.pinholes[3].out[1].hole*/
			translate(v = [-13.5, 1.5, 3.5]) {
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
			/*one.pinholes[0].in[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -14.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].in[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -14.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].in[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -14.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].out[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-0.0, -14.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].out[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -14.0, -14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].out[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -14.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].out[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-3.0, -2.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].in[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 1.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].in[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 2.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].in[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 2.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].out[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3.0, -1.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].out[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 2.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].out[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -14.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].out[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3.0, 4.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[2].in[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -14.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[2].in[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -12.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[2].in[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -14.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[2].out[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1.0, 2.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[2].out[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 4.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[2].out[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -2.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[2].out[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-0.0, -1.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[3].in[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -5.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[3].in[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -14.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[3].in[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -10.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[3].out[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -0.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[3].out[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 1.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[3].out[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -4.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[3].out[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 14.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 13*/
		union() {
			/*one.pinholes[0].in[0].hole - $_2*/
			translate(v = [-14.5, -14.5, 1.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[0].in[1].hole - $_3*/
			translate(v = [-14.5, -14.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[0].in[2].hole - $_4*/
			translate(v = [-14.5, -14.5, -2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[0].out[0].hole - $_14*/
			translate(v = [0.5, -14.5, 15.5]) {
				rotate(a = [0, 135.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[0].out[1].hole - $_15*/
			translate(v = [-14.5, -14.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[0].out[2].hole - $_16*/
			translate(v = [-14.5, -14.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[0].out[3].hole - $_17*/
			translate(v = [-3.5, -1.5, 15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[1].in[0].hole - $_5*/
			translate(v = [-14.5, 2.5, 6.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[1].in[1].hole - $_6*/
			translate(v = [-14.5, 3.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[1].in[2].hole - $_7*/
			translate(v = [-14.5, 3.5, 6.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[1].out[0].hole - $_18*/
			translate(v = [4.5, -0.5, 15.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[1].out[1].hole - $_19*/
			translate(v = [-14.5, 3.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[1].out[2].hole - $_20*/
			translate(v = [-14.5, -14.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[1].out[3].hole - $_21*/
			translate(v = [2.5, 4.5, 15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[2].in[0].hole - $_8*/
			translate(v = [-14.5, -12.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[2].in[1].hole - $_9*/
			translate(v = [-14.5, -10.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[2].in[2].hole - $_10*/
			translate(v = [-14.5, -14.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[2].out[0].hole - $_22*/
			translate(v = [-0.5, 3.5, 15.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[2].out[1].hole - $_23*/
			translate(v = [-14.5, 5.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[2].out[2].hole - $_24*/
			translate(v = [-14.5, -1.5, 9.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[2].out[3].hole - $_25*/
			translate(v = [0.5, -1.5, 15.5]) {
				rotate(a = [0, 135.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[3].in[0].hole - $_11*/
			translate(v = [-14.5, -4.5, 5.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.pinholes[3].in[1].hole - $_12*/
			translate(v = [-14.5, -14.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[3].in[2].hole - $_13*/
			translate(v = [-14.5, -8.5, 1.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[3].out[0].hole - $_26*/
			translate(v = [-8.5, 0.5, 15.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[3].out[1].hole - $_27*/
			translate(v = [-14.5, 2.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[3].out[2].hole - $_28*/
			translate(v = [-14.5, -3.5, 15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[3].out[3].hole - $_29*/
			translate(v = [-14.5, 15.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 14*/
	union() {
		%/*Nodes shell 14*/
		union() {
			/*$_2*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -15.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_3*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -15.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_4*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -15.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_14*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-0.0, -15.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_15*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -15.0, -15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_16*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -15.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_17*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-4.0, -2.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_5*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 2.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_6*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 3.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_7*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 3.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_18*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4.0, -1.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_19*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 3.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_20*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -15.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_21*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2.0, 4.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -13.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_9*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -11.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_10*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -15.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_22*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-1.0, 3.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_23*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 5.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_24*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -2.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_25*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-0.0, -2.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_11*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -5.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_12*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -15.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_13*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -9.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_26*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -0.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_27*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 2.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_28*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -4.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_29*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 15.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 14*/
		union();
	}
}
