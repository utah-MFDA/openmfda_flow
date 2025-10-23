translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*$_55*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-1.0, -1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_33*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1.0, -1.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_58*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-1.0, 1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_36*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1.0, -1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*one.pump_a[0].flush - $_55*/
			translate(v = [-0.5, -0.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pump_a[0].hole - $_33*/
			translate(v = [-0.5, -0.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pump_b[0].flush - $_58*/
			translate(v = [-0.5, 1.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pump_b[0].hole - $_36*/
			translate(v = [-0.5, -0.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
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
				translate(v = [-2.0, -2.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_a[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, -2.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_b[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, 2.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_b[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, -2.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*$_129 - one.pump_a[0].hole*/
			translate(v = [-1.5, -1.5, 1.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_137 - one.pump_b[0].hole*/
			translate(v = [-1.5, -1.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_169 - one.pump_a[0].flush*/
			translate(v = [-1.5, -1.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_175 - one.pump_b[0].flush*/
			translate(v = [-1.5, 2.5, -1.5]) {
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
			/*$_52*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3.0, 3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_30*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_100*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-2.0, 0.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_129*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -3.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_130*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -3.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_137*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_139*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -0.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_153*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-3.0, 1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_169*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -3.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_175*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, 1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_56*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3.0, -3.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_34*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -3.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_59*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3.0, 3.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_37*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, 3.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*one.ctrl_s[1].flush - $_52*/
			translate(v = [-2.5, 3.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_s[1].hole - $_30*/
			translate(v = [-2.5, -2.5, -2.5]) {
				rotate(a = [0, 48.189685104221404, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[0].thingy.column_upper.thing - $_100*/
			translate(v = [-1.5, 0.5, -2.5]) {
				rotate(a = [0, 114.09484255211072, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_100 - one.devices[0].thingy.vp3.thing*/
			translate(v = [-3.5, 0.5, -3.5]) {
				rotate(a = [0, 63.43494882292201, 0.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*one.devices[0].thingy.vp0.thing - $_129*/
			translate(v = [-2.5, -2.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.vp0.thing - $_130*/
			translate(v = [-2.5, -2.5, 2.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_130 - one.devices[1].thingy.vp0.thing*/
			translate(v = [-3.5, -0.5, 1.5]) {
				rotate(a = [0, 65.9051574478893, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.vp3.thing - $_137*/
			translate(v = [-2.5, -0.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.vp3.thing - $_139*/
			translate(v = [-2.5, 0.5, -2.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_139 - one.devices[1].thingy.vp3.thing*/
			translate(v = [-3.5, 2.5, -3.5]) {
				rotate(a = [0, 65.9051574478893, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[1].thingy.column_upper.thing - $_153*/
			translate(v = [-2.5, 1.5, -1.5]) {
				rotate(a = [0, 131.81031489577862, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*$_153 - one.devices[1].thingy.vp3.thing*/
			translate(v = [-3.5, 2.5, -3.5]) {
				rotate(a = [0, 35.26438968275464, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[1].thingy.vp0.thing - $_169*/
			translate(v = [-2.5, -2.5, 3.5]) {
				rotate(a = [0, 131.81031489577862, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[1].thingy.vp3.thing - $_175*/
			translate(v = [-2.5, 1.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pump_a[1].flush - $_56*/
			translate(v = [-2.5, -2.5, 0.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.pump_a[1].hole - $_34*/
			translate(v = [-2.5, -2.5, -0.5]) {
				rotate(a = [0, 35.26438968275464, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.pump_b[1].flush - $_59*/
			translate(v = [-2.5, 3.5, 1.5]) {
				rotate(a = [0, 144.73561031724537, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.pump_b[1].hole - $_37*/
			translate(v = [-2.5, 3.5, 0.5]) {
				rotate(a = [0, 144.73561031724537, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
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
				translate(v = [-4.0, 4.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.column_upper.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, 1.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vp0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vp3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, 0.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.column_upper.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, 3.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vp0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vp3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, 2.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_a[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_a[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_b[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, 4.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_b[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, 4.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*one.ctrl_s[1].flush - $_88*/
			translate(v = [-4.5, 2.5, -4.5]) {
				rotate(a = [0, 65.9051574478893, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.ctrl_s[1].hole - $_89*/
			translate(v = [-4.5, 0.5, -2.5]) {
				rotate(a = [0, 35.26438968275464, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_97 - one.devices[0].thingy.vp0.thing*/
			translate(v = [-3.5, -3.5, 0.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[0].thingy.column_upper.thing - $_101*/
			translate(v = [-4.5, 1.5, -4.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[0].thingy.vp0.thing - $_131*/
			translate(v = [-4.5, -4.5, -1.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_132 - one.pump_a[1].hole*/
			translate(v = [-3.5, -3.5, 1.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.vp3.thing - $_138*/
			translate(v = [-4.5, -1.5, -4.5]) {
				rotate(a = [0, 65.9051574478893, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_140 - one.pump_b[1].hole*/
			translate(v = [-3.5, 4.5, -1.5]) {
				rotate(a = [0, 114.09484255211072, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_150 - one.devices[1].thingy.vp0.thing*/
			translate(v = [-3.5, -0.5, 1.5]) {
				rotate(a = [0, 131.81031489577862, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[1].thingy.column_upper.thing - $_154*/
			translate(v = [-4.5, 3.5, -4.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[1].thingy.vp0.thing - $_170*/
			translate(v = [-4.5, -0.5, -0.5]) {
				rotate(a = [0, 26.56505117707799, 0.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*$_171 - one.pump_a[1].flush*/
			translate(v = [-3.5, -3.5, -1.5]) {
				rotate(a = [0, 65.9051574478893, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[1].thingy.vp3.thing - $_174*/
			translate(v = [-4.5, 0.5, -3.5]) {
				rotate(a = [0, 90.0, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*$_176 - one.pump_b[1].flush*/
			translate(v = [-3.5, 4.5, -0.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*$_43*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, 5.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_21*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -5.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_44*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, 4.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_22*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -3.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_88*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 2.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_89*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 0.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_53*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, -1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_31*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -1.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_54*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, 5.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_32*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -5.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_97*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -5.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_101*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, 1.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_131*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -5.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_132*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -5.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_133*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -3.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_138*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -2.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_140*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 2.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_141*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_144*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 0.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_150*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, 1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_154*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, 3.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_170*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, -1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_171*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -2.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_174*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, 0.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_176*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, 3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_57*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, -4.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_35*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -5.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*one.ctrl_a[5].flush - $_43*/
			translate(v = [-4.5, 5.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[5].hole - $_21*/
			translate(v = [-4.5, -4.5, -2.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.ctrl_a[6].flush - $_44*/
			translate(v = [-4.5, 4.5, -4.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.ctrl_a[6].hole - $_22*/
			translate(v = [-4.5, -2.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_88 - one.devices[1].thingy.vs1.thing*/
			translate(v = [-5.5, 1.5, -4.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_89 - one.devices[0].thingy.vs1.thing*/
			translate(v = [-5.5, -0.5, -3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_s[2].flush - $_53*/
			translate(v = [-4.5, -0.5, -1.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.ctrl_s[2].hole - $_31*/
			translate(v = [-4.5, -0.5, -4.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_s[3].flush - $_54*/
			translate(v = [-4.5, 5.5, -3.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.ctrl_s[3].hole - $_32*/
			translate(v = [-4.5, -4.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.circulate2.thing - $_97*/
			translate(v = [-4.5, -4.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_101 - one.devices[0].thingy.vp4.thing*/
			translate(v = [-5.5, 1.5, -3.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_131 - one.devices[0].thingy.vp1.thing*/
			translate(v = [-5.5, -3.5, -1.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[0].thingy.vp1.thing - $_132*/
			translate(v = [-4.5, -4.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.vp1.thing - $_133*/
			translate(v = [-4.5, -2.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_133 - one.devices[1].thingy.vp1.thing*/
			translate(v = [-5.5, -1.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_138 - one.devices[0].thingy.vs1.thing*/
			translate(v = [-5.5, -0.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.vp4.thing - $_140*/
			translate(v = [-4.5, 2.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.vp4.thing - $_141*/
			translate(v = [-4.5, 1.5, -2.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_141 - one.devices[1].thingy.vp4.thing*/
			translate(v = [-5.5, 2.5, -3.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.vs1.thing - $_144*/
			translate(v = [-4.5, 0.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_144 - one.devices[1].thingy.vs1.thing*/
			translate(v = [-5.5, 1.5, -4.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[1].thingy.circulate2.thing - $_150*/
			translate(v = [-4.5, 1.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_154 - one.devices[1].thingy.vp4.thing*/
			translate(v = [-5.5, 2.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_170 - one.devices[1].thingy.vp1.thing*/
			translate(v = [-5.5, -1.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.vp1.thing - $_171*/
			translate(v = [-4.5, -1.5, -0.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_174 - one.devices[1].thingy.vs1.thing*/
			translate(v = [-5.5, 1.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.vp4.thing - $_176*/
			translate(v = [-4.5, 3.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pump_a[2].flush - $_57*/
			translate(v = [-4.5, -3.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pump_a[2].hole - $_35*/
			translate(v = [-4.5, -4.5, -4.5]) {
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
			/*one.ctrl_a[5].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 4.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[5].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -4.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[6].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 3.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[6].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -2.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[2].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -0.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 0.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[3].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 5.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -4.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.circulate2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -4.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vp1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -4.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vp4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 1.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vs1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -1.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.circulate2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 2.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vp1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -2.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vp4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 2.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vs1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 1.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_a[2].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -3.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pump_a[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -4.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*one.ctrl_a[5].flush - $_76*/
			translate(v = [-6.5, 1.5, -1.5]) {
				rotate(a = [0, 122.31153323742386, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.ctrl_a[5].hole - $_77*/
			translate(v = [-6.5, -2.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[6].flush - $_78*/
			translate(v = [-6.5, 0.5, -2.5]) {
				rotate(a = [0, 122.31153323742386, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.ctrl_a[6].hole - $_79*/
			translate(v = [-6.5, -1.5, -3.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.ctrl_s[2].flush - $_90*/
			translate(v = [-6.5, 2.5, -3.5]) {
				rotate(a = [0, 48.189685104221404, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.ctrl_s[2].hole - $_91*/
			translate(v = [-6.5, 2.5, -4.5]) {
				rotate(a = [0, 114.09484255211072, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.ctrl_s[3].flush - $_92*/
			translate(v = [-6.5, 2.5, -0.5]) {
				rotate(a = [0, 133.491519345092, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.ctrl_s[3].hole - $_93*/
			translate(v = [-6.5, -0.5, -1.5]) {
				rotate(a = [0, 133.491519345092, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.devices[0].thingy.circulate2.thing - $_96*/
			translate(v = [-6.5, -1.5, 0.5]) {
				rotate(a = [0, 114.09484255211072, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_123 - one.devices[0].thingy.vs1.thing*/
			translate(v = [-5.5, -0.5, -3.5]) {
				rotate(a = [0, 36.69922520048988, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.devices[0].thingy.vp1.thing - $_134*/
			translate(v = [-6.5, -0.5, 0.5]) {
				rotate(a = [0, 122.31153323742386, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_135 - one.pump_a[2].hole*/
			translate(v = [-5.5, -3.5, -3.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.devices[0].thingy.vp4.thing - $_142*/
			translate(v = [-6.5, 1.5, -3.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.devices[1].thingy.circulate2.thing - $_149*/
			translate(v = [-6.5, 1.5, 1.5]) {
				rotate(a = [0, 154.7605981793211, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_166 - one.devices[1].thingy.vs1.thing*/
			translate(v = [-5.5, 1.5, -4.5]) {
				rotate(a = [0, 57.68846676257615, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.devices[1].thingy.vp1.thing - $_172*/
			translate(v = [-6.5, 0.5, 1.5]) {
				rotate(a = [0, 143.30077479951012, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_173 - one.pump_a[2].flush*/
			translate(v = [-5.5, -2.5, -3.5]) {
				rotate(a = [0, 57.68846676257615, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.devices[1].thingy.vp4.thing - $_177*/
			translate(v = [-6.5, -0.5, -2.5]) {
				rotate(a = [0, 107.54840061379231, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*$_48*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -3.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_26*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 4.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_42*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -4.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_20*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 2.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_76*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_77*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -3.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_78*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 0.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_79*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -2.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_45*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, 4.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_23*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -3.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_47*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, 3.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_25*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 1.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_51*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -6.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_29*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -5.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_90*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 2.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_91*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 2.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_92*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 2.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_93*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_96*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -2.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_98*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, 0.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_121*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 0.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_122*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_123*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, 1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_134*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -1.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_135*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_136*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 2.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_142*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, 1.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_145*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -1.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_146*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 0.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_149*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, 1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_151*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -1.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_166*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -2.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_172*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, 0.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_173*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, 0.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_177*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7.0, -1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*one.ctrl_a[10].flush - $_48*/
			translate(v = [-6.5, -2.5, 2.5]) {
				rotate(a = [0, 133.491519345092, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.ctrl_a[10].hole - $_26*/
			translate(v = [-6.5, 4.5, 1.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.ctrl_a[4].flush - $_42*/
			translate(v = [-6.5, -3.5, 2.5]) {
				rotate(a = [0, 133.491519345092, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.ctrl_a[4].hole - $_20*/
			translate(v = [-6.5, 2.5, 0.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_76 - one.devices[1].thingy.v5.thing*/
			translate(v = [-7.5, -1.5, 1.5]) {
				rotate(a = [0, 133.491519345092, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_77 - one.devices[0].thingy.v5.thing*/
			translate(v = [-7.5, 0.5, -2.5]) {
				rotate(a = [0, 72.4515993862077, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_78 - one.devices[1].thingy.v6.thing*/
			translate(v = [-7.5, 1.5, -0.5]) {
				rotate(a = [0, 144.73561031724537, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_79 - one.devices[0].thingy.v6.thing*/
			translate(v = [-7.5, 1.5, -2.5]) {
				rotate(a = [0, 107.54840061379231, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.ctrl_a[7].flush - $_45*/
			translate(v = [-6.5, 4.5, -1.5]) {
				rotate(a = [0, 46.50848065490801, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.ctrl_a[7].hole - $_23*/
			translate(v = [-6.5, -2.5, 0.5]) {
				rotate(a = [0, 57.68846676257615, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.ctrl_a[9].flush - $_47*/
			translate(v = [-6.5, 3.5, 1.5]) {
				rotate(a = [0, 107.54840061379231, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.ctrl_a[9].hole - $_25*/
			translate(v = [-6.5, 1.5, 0.5]) {
				rotate(a = [0, 57.68846676257615, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.ctrl_s[0].flush - $_51*/
			translate(v = [-6.5, -5.5, 7.5]) {
				rotate(a = [0, 133.491519345092, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.ctrl_s[0].hole - $_29*/
			translate(v = [-1.5, -4.5, -6.5]) {
				rotate(a = [0, 105.501359566937, 123.69006752597979]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_90 - one.devices[1].thingy.vs2.thing*/
			translate(v = [-7.5, -0.5, -1.5]) {
				rotate(a = [0, 122.31153323742386, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_91 - one.devices[0].thingy.vs2.thing*/
			translate(v = [-7.5, 0.5, -1.5]) {
				rotate(a = [0, 143.30077479951012, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_92 - one.devices[1].thingy.vs3.thing*/
			translate(v = [-7.5, -0.5, 0.5]) {
				rotate(a = [0, 107.54840061379231, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_93 - one.devices[0].thingy.vs3.thing*/
			translate(v = [-7.5, 2.5, -0.5]) {
				rotate(a = [0, 107.54840061379231, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_96 - one.devices[0].thingy.v5.thing*/
			translate(v = [-7.5, 0.5, -2.5]) {
				rotate(a = [0, 36.69922520048988, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.devices[0].thingy.column_lower.thing - $_98*/
			translate(v = [-6.5, 0.5, -3.5]) {
				rotate(a = [0, 90.0, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*$_98 - one.devices[0].thingy.vs3.thing*/
			translate(v = [-7.5, 2.5, -0.5]) {
				rotate(a = [0, 143.30077479951012, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.devices[0].thingy.v5.thing - $_121*/
			translate(v = [-6.5, 0.5, 0.5]) {
				rotate(a = [0, 161.56505117707798, 180.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*$_121 - one.devices[1].thingy.v5.thing*/
			translate(v = [-7.5, -1.5, 1.5]) {
				rotate(a = [0, 114.09484255211072, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.v6.thing - $_122*/
			translate(v = [-6.5, 1.5, -2.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.devices[0].thingy.v6.thing - $_123*/
			translate(v = [-6.5, 1.5, -0.5]) {
				rotate(a = [0, 153.43494882292202, 180.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*$_122 - one.devices[1].thingy.v6.thing*/
			translate(v = [-7.5, 1.5, -0.5]) {
				rotate(a = [0, 153.43494882292202, 0.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*$_134 - one.devices[0].thingy.vp2.thing*/
			translate(v = [-7.5, -0.5, 2.5]) {
				rotate(a = [0, 153.43494882292202, 0.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*one.devices[0].thingy.vp2.thing - $_135*/
			translate(v = [-6.5, -0.5, -0.5]) {
				rotate(a = [0, 18.434948822922017, 180.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*one.devices[0].thingy.vp2.thing - $_136*/
			translate(v = [-6.5, 2.5, 1.5]) {
				rotate(a = [0, 72.4515993862077, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_136 - one.devices[1].thingy.vp2.thing*/
			translate(v = [-7.5, -0.5, 1.5]) {
				rotate(a = [0, 90.0, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*$_142 - one.devices[0].thingy.vs2.thing*/
			translate(v = [-7.5, 0.5, -1.5]) {
				rotate(a = [0, 144.73561031724537, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.vs2.thing - $_145*/
			translate(v = [-6.5, -0.5, -3.5]) {
				rotate(a = [0, 35.26438968275464, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_145 - one.devices[1].thingy.vs2.thing*/
			translate(v = [-7.5, -0.5, -1.5]) {
				rotate(a = [0, 153.43494882292202, 0.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*one.devices[0].thingy.vs3.thing - $_146*/
			translate(v = [-6.5, 0.5, -0.5]) {
				rotate(a = [0, 90.0, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*$_146 - one.devices[1].thingy.vs3.thing*/
			translate(v = [-7.5, -0.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_149 - one.devices[1].thingy.v5.thing*/
			translate(v = [-7.5, -1.5, 1.5]) {
				rotate(a = [0, 90.0, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*one.devices[1].thingy.column_lower.thing - $_151*/
			translate(v = [-6.5, -0.5, 2.5]) {
				rotate(a = [0, 131.81031489577862, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*$_151 - one.devices[1].thingy.vs3.thing*/
			translate(v = [-7.5, -0.5, 0.5]) {
				rotate(a = [0, 26.56505117707799, 0.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*one.devices[1].thingy.v6.thing - $_166*/
			translate(v = [-6.5, -1.5, -2.5]) {
				rotate(a = [0, 57.68846676257615, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_172 - one.devices[1].thingy.vp2.thing*/
			translate(v = [-7.5, -0.5, 1.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[1].thingy.vp2.thing - $_173*/
			translate(v = [-6.5, 0.5, -1.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_177 - one.devices[1].thingy.vs2.thing*/
			translate(v = [-7.5, -0.5, -1.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
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
				translate(v = [-8.0, 0.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[10].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[4].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[4].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[7].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[7].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 0.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[9].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 0.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[9].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -2.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -3.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_s[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -2.0, -8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.column_lower.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 2.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v5.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 0.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v6.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 1.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vp2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -1.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vs2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 0.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vs3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 2.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.column_lower.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 1.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v5.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -2.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v6.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, 1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vp2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vs2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -1.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vs3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -1.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*one.ctrl_a[10].flush - $_62*/
			translate(v = [-8.5, -4.5, 3.5]) {
				rotate(a = [0, 128.11292650098662, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*one.ctrl_a[10].hole - $_63*/
			translate(v = [-8.5, 2.5, 3.5]) {
				rotate(a = [0, 164.20683095173604, -45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[4].flush - $_74*/
			translate(v = [-8.5, 2.5, 2.5]) {
				rotate(a = [0, 133.491519345092, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*one.ctrl_a[4].hole - $_75*/
			translate(v = [-8.5, -1.5, 2.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[7].flush - $_80*/
			translate(v = [-8.5, -3.5, 6.5]) {
				rotate(a = [0, 134.43824067114977, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.ctrl_a[7].hole - $_81*/
			translate(v = [-8.5, -3.5, 7.5]) {
				rotate(a = [0, 140.49028771380608, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*one.ctrl_a[9].flush - $_84*/
			translate(v = [-8.5, 1.5, 5.5]) {
				rotate(a = [0, 164.20683095173604, -45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[9].hole - $_85*/
			translate(v = [-8.5, 1.5, 2.5]) {
				rotate(a = [0, 90.0, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*one.ctrl_s[0].flush - $_86*/
			translate(v = [-8.5, 2.5, 5.5]) {
				rotate(a = [0, 101.0958032831364, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_s[0].hole - $_87*/
			translate(v = [-8.5, 3.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 8.660254037844387]);
				}
			}
			/*$_94 - one.devices[0].thingy.vp2.thing*/
			translate(v = [-7.5, -0.5, 2.5]) {
				rotate(a = [0, 107.54840061379231, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[0].thingy.column_lower.thing - $_99*/
			translate(v = [-8.5, 7.5, 0.5]) {
				rotate(a = [0, 128.11292650098662, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*$_110 - one.devices[0].thingy.vs3.thing*/
			translate(v = [-7.5, 2.5, -0.5]) {
				rotate(a = [0, 45.56175932885022, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_120 - one.devices[0].thingy.v5.thing*/
			translate(v = [-7.5, 0.5, -2.5]) {
				rotate(a = [0, 32.31153323742385, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*$_120 - one.devices[0].thingy.v6.thing*/
			translate(v = [-7.5, 1.5, -2.5]) {
				rotate(a = [0, 39.50971228619393, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*$_125 - one.devices[0].thingy.vs2.thing*/
			translate(v = [-7.5, 0.5, -1.5]) {
				rotate(a = [0, 45.868250787968954, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*$_147 - one.devices[1].thingy.vp2.thing*/
			translate(v = [-7.5, -0.5, 1.5]) {
				rotate(a = [0, 24.094842552110695, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 5.477225575051661]);
				}
			}
			/*one.devices[1].thingy.column_lower.thing - $_152*/
			translate(v = [-8.5, 6.5, 5.5]) {
				rotate(a = [0, 134.43824067114977, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*$_160 - one.devices[1].thingy.vs3.thing*/
			translate(v = [-7.5, -0.5, 0.5]) {
				rotate(a = [0, 19.471220634490674, 135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_165 - one.devices[1].thingy.v5.thing*/
			translate(v = [-7.5, -1.5, 1.5]) {
				rotate(a = [0, 53.96010656969614, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*$_165 - one.devices[1].thingy.v6.thing*/
			translate(v = [-7.5, 1.5, -0.5]) {
				rotate(a = [0, 15.793169048263968, 135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_167 - one.devices[1].thingy.vs2.thing*/
			translate(v = [-7.5, -0.5, -1.5]) {
				rotate(a = [0, 32.31153323742385, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
		}
	}
	/*Shell 8*/
	union() {
		%/*Nodes shell 8*/
		union() {
			/*$_38*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-2.0, 9.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_16*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, 9.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_62*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -5.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_63*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 2.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_49*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-2.0, 2.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_27*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 3.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_50*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-2.0, 9.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_28*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, 9.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_39*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-2.0, 9.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_17*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -1.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_40*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-2.0, 0.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_18*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, 1.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_41*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-2.0, 3.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_19*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -2.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_74*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 2.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_75*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -2.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_80*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -4.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_81*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -4.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_46*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-2.0, -4.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_24*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -2.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_84*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 1.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_85*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 1.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_86*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 2.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_87*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_94*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -4.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_99*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, 7.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_109*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -3.0, 8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_110*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -3.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_119*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 2.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_120*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -3.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_124*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -9.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_125*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -4.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_128*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, -4.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_143*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-9.0, 7.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_147*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -3.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_152*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, 6.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_160*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, 0.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_165*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, 2.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_167*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9.0, -4.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*one.ctrl_a[0].flush - $_38*/
			translate(v = [-1.5, 9.5, -0.5]) {
				rotate(a = [0, 45.868250787968954, 165.96375653207352]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.ctrl_a[0].hole - $_16*/
			translate(v = [-2.5, 9.5, 4.5]) {
				rotate(a = [0, 150.7940677526006, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*$_62 - one.devices[1].thingy.v10.thing*/
			translate(v = [-9.5, -0.5, 6.5]) {
				rotate(a = [0, 126.03989343030386, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*$_63 - one.devices[0].thingy.v10.thing*/
			translate(v = [-9.5, 1.5, 6.5]) {
				rotate(a = [0, 154.7605981793211, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.ctrl_a[11].flush - $_49*/
			translate(v = [-1.5, 2.5, 9.5]) {
				rotate(a = [0, 79.97501213792427, -135.0]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.ctrl_a[11].hole - $_27*/
			translate(v = [-8.5, 3.5, 9.5]) {
				rotate(a = [0, 76.3669777746336, -104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.ctrl_a[12].flush - $_50*/
			translate(v = [-1.5, 9.5, -1.5]) {
				rotate(a = [0, 45.868250787968954, 165.96375653207352]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.ctrl_a[12].hole - $_28*/
			translate(v = [-1.5, 9.5, 4.5]) {
				rotate(a = [0, 134.13174921203108, 165.96375653207352]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.ctrl_a[1].flush - $_39*/
			translate(v = [-1.5, 9.5, 9.5]) {
				rotate(a = [0, 76.3669777746336, 165.96375653207352]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.ctrl_a[1].hole - $_17*/
			translate(v = [-1.5, -0.5, 9.5]) {
				rotate(a = [0, 79.97501213792427, 135.0]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.ctrl_a[2].flush - $_40*/
			translate(v = [-1.5, 0.5, 9.5]) {
				rotate(a = [0, 76.3669777746336, 165.96375653207352]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.ctrl_a[2].hole - $_18*/
			translate(v = [-1.5, 1.5, 9.5]) {
				rotate(a = [0, 79.97501213792427, -135.0]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.ctrl_a[3].flush - $_41*/
			translate(v = [-1.5, 3.5, 9.5]) {
				rotate(a = [0, 78.69006752597979, -143.13010235415598]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*one.ctrl_a[3].hole - $_19*/
			translate(v = [-1.5, -1.5, 9.5]) {
				rotate(a = [0, 79.97501213792427, 135.0]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*$_74 - one.devices[1].thingy.v4.thing*/
			translate(v = [-9.5, 5.5, 5.5]) {
				rotate(a = [0, 133.491519345092, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_75 - one.devices[0].thingy.v4.thing*/
			translate(v = [-9.5, 1.5, 5.5]) {
				rotate(a = [0, 133.491519345092, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_80 - one.devices[1].thingy.v7.thing*/
			translate(v = [-9.5, -4.5, 5.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_81 - one.devices[0].thingy.v7.thing*/
			translate(v = [-9.5, -4.5, 3.5]) {
				rotate(a = [0, 19.471220634490674, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.ctrl_a[8].flush - $_46*/
			translate(v = [-1.5, -3.5, 9.5]) {
				rotate(a = [0, 78.69006752597979, 143.13010235415598]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*one.ctrl_a[8].hole - $_24*/
			translate(v = [-8.5, -1.5, 0.5]) {
				rotate(a = [0, 131.81031489577862, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*$_84 - one.devices[1].thingy.v9.thing*/
			translate(v = [-9.5, 0.5, 6.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_85 - one.devices[0].thingy.v9.thing*/
			translate(v = [-9.5, 0.5, 5.5]) {
				rotate(a = [0, 154.7605981793211, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_86 - one.devices[1].thingy.vs0.thing*/
			translate(v = [-9.5, 5.5, 2.5]) {
				rotate(a = [0, 46.50848065490801, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*$_87 - one.devices[0].thingy.vs0.thing*/
			translate(v = [-9.5, 5.5, 1.5]) {
				rotate(a = [0, 150.7940677526006, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*one.devices[0].thingy.circulate1.thing - $_94*/
			translate(v = [-8.5, -3.5, 1.5]) {
				rotate(a = [0, 122.31153323742386, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*$_99 - one.devices[0].thingy.vs0.thing*/
			translate(v = [-9.5, 5.5, 1.5]) {
				rotate(a = [0, 114.09484255211072, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.v10.thing - $_109*/
			translate(v = [-8.5, -2.5, 8.5]) {
				rotate(a = [0, 115.8766900608275, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*one.devices[0].thingy.v10.thing - $_110*/
			translate(v = [-8.5, -2.5, 4.5]) {
				rotate(a = [0, 64.1233099391725, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*$_109 - one.devices[1].thingy.v10.thing*/
			translate(v = [-9.5, -0.5, 6.5]) {
				rotate(a = [0, 48.189685104221404, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*one.devices[0].thingy.v4.thing - $_119*/
			translate(v = [-8.5, 2.5, 7.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[0].thingy.v4.thing - $_120*/
			translate(v = [-8.5, -2.5, 2.5]) {
				rotate(a = [0, 53.96010656969614, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*$_119 - one.devices[1].thingy.v4.thing*/
			translate(v = [-9.5, 5.5, 5.5]) {
				rotate(a = [0, 57.68846676257615, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*one.devices[0].thingy.v7.thing - $_124*/
			translate(v = [-8.5, -8.5, 7.5]) {
				rotate(a = [0, 134.13174921203108, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*one.devices[0].thingy.v7.thing - $_125*/
			translate(v = [-8.5, -3.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_124 - one.devices[1].thingy.v7.thing*/
			translate(v = [-9.5, -4.5, 5.5]) {
				rotate(a = [0, 64.1233099391725, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*$_125 - one.devices[0].thingy.v9.thing*/
			translate(v = [-9.5, 0.5, 5.5]) {
				rotate(a = [0, 126.03989343030386, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*one.devices[0].thingy.v9.thing - $_128*/
			translate(v = [-8.5, -3.5, 4.5]) {
				rotate(a = [0, 76.3669777746336, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_128 - one.devices[1].thingy.v9.thing*/
			translate(v = [-9.5, 0.5, 6.5]) {
				rotate(a = [0, 115.8766900608275, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*one.devices[0].thingy.vs0.thing - $_143*/
			translate(v = [-8.5, 7.5, 1.5]) {
				rotate(a = [0, 90.0, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*$_143 - one.devices[1].thingy.vs0.thing*/
			translate(v = [-9.5, 5.5, 2.5]) {
				rotate(a = [0, 114.09484255211072, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[1].thingy.circulate1.thing - $_147*/
			translate(v = [-8.5, -2.5, 6.5]) {
				rotate(a = [0, 114.09484255211072, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_152 - one.devices[1].thingy.vs0.thing*/
			translate(v = [-9.5, 5.5, 2.5]) {
				rotate(a = [0, 25.239401820678914, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[1].thingy.v10.thing - $_160*/
			translate(v = [-8.5, 0.5, 4.5]) {
				rotate(a = [0, 35.26438968275464, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[1].thingy.v4.thing - $_165*/
			translate(v = [-8.5, 2.5, 4.5]) {
				rotate(a = [0, 72.4515993862077, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[1].thingy.v7.thing - $_167*/
			translate(v = [-8.5, -3.5, 3.5]) {
				rotate(a = [0, 35.26438968275464, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_167 - one.devices[1].thingy.v9.thing*/
			translate(v = [-9.5, 0.5, 6.5]) {
				rotate(a = [0, 126.03989343030386, -75.96375653207353]) {
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
				translate(v = [-6.0, 10.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-5.0, 10.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[11].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -2.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[11].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -1.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[12].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 10.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[12].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 10.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 10.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 3.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[2].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 1.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -3.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[3].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 0.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 2.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[8].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -1.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[8].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 0.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.circulate1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -1.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v10.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 1.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 1.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v7.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -5.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v9.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 0.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.vs0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 5.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.circulate1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -1.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v10.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -1.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 5.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v7.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -5.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v9.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 0.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.vs0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, 5.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*one.ctrl_a[0].flush - $_60*/
			translate(v = [-10.5, 11.5, -1.5]) {
				rotate(a = [0, 45.56175932885022, -11.309932474020213]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.ctrl_a[0].hole - $_61*/
			translate(v = [-5.5, 11.5, -4.5]) {
				rotate(a = [0, 15.793169048263968, -45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[11].flush - $_64*/
			translate(v = [-10.5, -1.5, 11.5]) {
				rotate(a = [0, 101.30993247402021, 0.0]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*one.ctrl_a[11].hole - $_65*/
			translate(v = [-10.5, 4.5, 11.5]) {
				rotate(a = [0, 101.0958032831364, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[12].flush - $_66*/
			translate(v = [-10.5, 11.5, -2.5]) {
				rotate(a = [0, 45.56175932885022, -11.309932474020213]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.ctrl_a[12].hole - $_67*/
			translate(v = [-10.5, 11.5, -4.5]) {
				rotate(a = [0, 45.56175932885022, -11.309932474020213]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.ctrl_a[1].flush - $_68*/
			translate(v = [-10.5, 11.5, 6.5]) {
				rotate(a = [0, 51.88707349901337, -11.309932474020213]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*one.ctrl_a[1].hole - $_69*/
			translate(v = [-10.5, 8.5, 11.5]) {
				rotate(a = [0, 98.0494669755284, -45.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.ctrl_a[2].flush - $_70*/
			translate(v = [-10.5, 6.5, 11.5]) {
				rotate(a = [0, 98.0494669755284, -45.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.ctrl_a[2].hole - $_71*/
			translate(v = [-10.5, 2.5, 11.5]) {
				rotate(a = [0, 98.0494669755284, -45.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.ctrl_a[3].flush - $_72*/
			translate(v = [-10.5, 5.5, 11.5]) {
				rotate(a = [0, 98.0494669755284, -45.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.ctrl_a[3].hole - $_73*/
			translate(v = [-10.5, 3.5, 11.5]) {
				rotate(a = [0, 101.0958032831364, -11.309932474020213]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[8].flush - $_82*/
			translate(v = [-10.5, 0.5, 11.5]) {
				rotate(a = [0, 101.0958032831364, -11.309932474020213]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.ctrl_a[8].hole - $_83*/
			translate(v = [-10.5, -4.5, 3.5]) {
				rotate(a = [0, 134.43824067114977, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*one.devices[0].thingy.circulate1.thing - $_95*/
			translate(v = [-10.5, 0.5, 2.5]) {
				rotate(a = [0, 154.7605981793211, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_95 - one.devices[0].thingy.v7.thing*/
			translate(v = [-9.5, -4.5, 3.5]) {
				rotate(a = [0, 101.0958032831364, 101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_102 - one.devices[0].thingy.vs0.thing*/
			translate(v = [-9.5, 5.5, 1.5]) {
				rotate(a = [0, 164.20683095173604, 135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_107 - one.devices[0].thingy.v4.thing*/
			translate(v = [-9.5, 1.5, 5.5]) {
				rotate(a = [0, 78.90419671686361, 101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[0].thingy.v10.thing - $_108*/
			translate(v = [-10.5, 3.5, 6.5]) {
				rotate(a = [0, 90.0, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*$_108 - one.devices[0].thingy.v9.thing*/
			translate(v = [-9.5, 0.5, 5.5]) {
				rotate(a = [0, 72.4515993862077, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*one.devices[1].thingy.circulate1.thing - $_148*/
			translate(v = [-10.5, 0.5, 6.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_148 - one.devices[1].thingy.v7.thing*/
			translate(v = [-9.5, -4.5, 5.5]) {
				rotate(a = [0, 78.90419671686361, 101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_155 - one.devices[1].thingy.vs0.thing*/
			translate(v = [-9.5, 5.5, 2.5]) {
				rotate(a = [0, 164.20683095173604, 135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_158 - one.devices[1].thingy.v4.thing*/
			translate(v = [-9.5, 5.5, 5.5]) {
				rotate(a = [0, 35.26438968275464, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*one.devices[1].thingy.v10.thing - $_159*/
			translate(v = [-10.5, -2.5, 11.5]) {
				rotate(a = [0, 155.9051574478893, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 5.477225575051661]);
				}
			}
			/*$_159 - one.devices[1].thingy.v9.thing*/
			translate(v = [-9.5, 0.5, 6.5]) {
				rotate(a = [0, 32.31153323742385, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
		}
	}
	/*Shell 10*/
	union() {
		%/*Nodes shell 10*/
		union() {
			/*$_60*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 11.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_61*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-6.0, 11.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_64*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -2.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_65*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 4.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_66*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 11.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_67*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 11.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_68*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 11.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_69*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 8.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_70*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 6.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_71*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 2.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_72*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 5.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_73*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 3.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_82*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 0.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_83*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -5.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_95*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, 0.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_102*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, 6.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_103*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 11.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_106*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 11.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_107*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, 6.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_108*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, 3.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_111*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, -1.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_113*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 11.0, -8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_116*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 1.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_118*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 7.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_126*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-11.0, 0.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_148*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, 0.0, 6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_155*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, 6.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_158*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, 6.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_159*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -3.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union() {
			/*$_60 - one.devices[1].thingy.v0.thing*/
			translate(v = [-11.5, 12.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_61 - one.devices[0].thingy.v0.thing*/
			translate(v = [-4.5, 12.5, -0.5]) {
				rotate(a = [0, 160.52877936550934, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*$_64 - one.devices[1].thingy.v11.thing*/
			translate(v = [-11.5, 3.5, 12.5]) {
				rotate(a = [0, 101.0958032831364, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*$_65 - one.devices[0].thingy.v11.thing*/
			translate(v = [-11.5, -1.5, 12.5]) {
				rotate(a = [0, 99.33585903200395, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_66 - one.devices[1].thingy.v12.thing*/
			translate(v = [-11.5, 5.5, -1.5]) {
				rotate(a = [0, 99.33585903200395, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_67 - one.devices[0].thingy.v12.thing*/
			translate(v = [-11.5, 12.5, -1.5]) {
				rotate(a = [0, 154.7605981793211, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_68 - one.devices[1].thingy.v1.thing*/
			translate(v = [-11.5, 12.5, 12.5]) {
				rotate(a = [0, 166.73732399169518, -45.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_69 - one.devices[0].thingy.v1.thing*/
			translate(v = [-11.5, 5.5, 5.5]) {
				rotate(a = [0, 27.791305644779214, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 6.782329983125268]);
				}
			}
			/*$_70 - one.devices[1].thingy.v2.thing*/
			translate(v = [-11.5, 0.5, 12.5]) {
				rotate(a = [0, 99.33585903200395, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_71 - one.devices[0].thingy.v2.thing*/
			translate(v = [-11.5, 4.5, 12.5]) {
				rotate(a = [0, 114.09484255211072, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_72 - one.devices[1].thingy.v3.thing*/
			translate(v = [-11.5, 2.5, 12.5]) {
				rotate(a = [0, 107.54840061379231, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_73 - one.devices[0].thingy.v3.thing*/
			translate(v = [-11.5, 1.5, 12.5]) {
				rotate(a = [0, 114.09484255211072, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*$_82 - one.devices[1].thingy.v8.thing*/
			translate(v = [-11.5, -5.5, 12.5]) {
				rotate(a = [0, 99.33585903200395, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_83 - one.devices[0].thingy.v8.thing*/
			translate(v = [-11.5, 1.5, 1.5]) {
				rotate(a = [0, 71.79923973546668, -80.53767779197439]) {
					cube(size = [0.125, 0.125, 6.4031242374328485]);
				}
			}
			/*$_95 - one.devices[0].thingy.v8.thing*/
			translate(v = [-11.5, 1.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.v0.thing - $_102*/
			translate(v = [-10.5, 6.5, -3.5]) {
				rotate(a = [0, 70.52877936550931, 45.0]) {
					cube(size = [0.125, 0.125, 9.0]);
				}
			}
			/*one.devices[0].thingy.v0.thing - $_103*/
			translate(v = [-10.5, 11.5, -6.5]) {
				rotate(a = [0, 45.39244912064032, 9.462322208025617]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*$_102 - one.devices[0].thingy.v12.thing*/
			translate(v = [-11.5, 12.5, -1.5]) {
				rotate(a = [0, 108.20076026453332, -80.53767779197439]) {
					cube(size = [0.125, 0.125, 6.4031242374328485]);
				}
			}
			/*$_103 - one.devices[1].thingy.v0.thing*/
			translate(v = [-11.5, 12.5, -0.5]) {
				rotate(a = [0, 166.73732399169518, -45.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*one.devices[0].thingy.v1.thing - $_106*/
			translate(v = [-10.5, 11.5, 11.5]) {
				rotate(a = [0, 134.60755087935968, -99.46232220802563]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*one.devices[0].thingy.v1.thing - $_107*/
			translate(v = [-10.5, 6.5, 6.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_106 - one.devices[1].thingy.v1.thing*/
			translate(v = [-11.5, 12.5, 12.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_107 - one.devices[0].thingy.v2.thing*/
			translate(v = [-11.5, 4.5, 12.5]) {
				rotate(a = [0, 159.56068242674178, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 6.4031242374328485]);
				}
			}
			/*$_107 - one.devices[0].thingy.v3.thing*/
			translate(v = [-11.5, 1.5, 12.5]) {
				rotate(a = [0, 139.64089954333878, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.874007874011811]);
				}
			}
			/*$_108 - one.devices[0].thingy.v11.thing*/
			translate(v = [-11.5, -1.5, 12.5]) {
				rotate(a = [0, 139.64089954333878, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.874007874011811]);
				}
			}
			/*one.devices[0].thingy.v11.thing - $_111*/
			translate(v = [-10.5, -0.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_111 - one.devices[1].thingy.v11.thing*/
			translate(v = [-11.5, 3.5, 12.5]) {
				rotate(a = [0, 103.6330222253664, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*one.devices[0].thingy.v12.thing - $_113*/
			translate(v = [-10.5, 11.5, -7.5]) {
				rotate(a = [0, 13.262676008304837, 135.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_113 - one.devices[1].thingy.v12.thing*/
			translate(v = [-11.5, 5.5, -1.5]) {
				rotate(a = [0, 134.60755087935968, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*one.devices[0].thingy.v2.thing - $_116*/
			translate(v = [-10.5, 1.5, 11.5]) {
				rotate(a = [0, 72.4515993862077, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*$_116 - one.devices[1].thingy.v2.thing*/
			translate(v = [-11.5, 0.5, 12.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.v3.thing - $_118*/
			translate(v = [-10.5, 7.5, 11.5]) {
				rotate(a = [0, 80.66414096799606, -99.46232220802563]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_118 - one.devices[1].thingy.v3.thing*/
			translate(v = [-11.5, 2.5, 12.5]) {
				rotate(a = [0, 101.0958032831364, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*one.devices[0].thingy.v8.thing - $_126*/
			translate(v = [-10.5, 0.5, 7.5]) {
				rotate(a = [0, 166.73732399169518, 135.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*$_126 - one.devices[1].thingy.v8.thing*/
			translate(v = [-11.5, -5.5, 12.5]) {
				rotate(a = [0, 129.42003156390732, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 7.874007874011811]);
				}
			}
			/*$_148 - one.devices[1].thingy.v8.thing*/
			translate(v = [-11.5, -5.5, 12.5]) {
				rotate(a = [0, 134.60755087935968, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*one.devices[1].thingy.v0.thing - $_155*/
			translate(v = [-10.5, 6.5, -2.5]) {
				rotate(a = [0, 71.79923973546668, 99.46232220802563]) {
					cube(size = [0.125, 0.125, 6.4031242374328485]);
				}
			}
			/*$_155 - one.devices[1].thingy.v12.thing*/
			translate(v = [-11.5, 5.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v1.thing - $_158*/
			translate(v = [-10.5, 6.5, 7.5]) {
				rotate(a = [0, 50.57996843609273, 99.46232220802563]) {
					cube(size = [0.125, 0.125, 7.874007874011811]);
				}
			}
			/*$_158 - one.devices[1].thingy.v2.thing*/
			translate(v = [-11.5, 0.5, 12.5]) {
				rotate(a = [0, 129.42003156390732, 80.53767779197439]) {
					cube(size = [0.125, 0.125, 7.874007874011811]);
				}
			}
			/*$_158 - one.devices[1].thingy.v3.thing*/
			translate(v = [-11.5, 2.5, 12.5]) {
				rotate(a = [0, 140.49028771380608, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*$_159 - one.devices[1].thingy.v11.thing*/
			translate(v = [-11.5, 3.5, 12.5]) {
				rotate(a = [0, 99.33585903200395, -80.53767779197439]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
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
				translate(v = [-5.0, 12.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 5.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v11.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -2.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v12.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 12.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 4.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 1.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[0].thingy.v8.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 1.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 12.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 12.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v11.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 3.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v12.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 5.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 0.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, 2.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.devices[1].thingy.v8.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-12.0, -6.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 11*/
		union() {
			/*one.devices[0].thingy.v0.thing - $_104*/
			translate(v = [-4.5, 13.5, -0.5]) {
				rotate(a = [0, 90.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.devices[0].thingy.v1.thing - $_105*/
			translate(v = [-12.5, 4.5, 5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[0].thingy.v11.thing - $_112*/
			translate(v = [-12.5, -1.5, 13.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[0].thingy.v12.thing - $_114*/
			translate(v = [-12.5, 13.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.v2.thing - $_115*/
			translate(v = [-12.5, 3.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.v3.thing - $_117*/
			translate(v = [-12.5, 0.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[0].thingy.v8.thing - $_127*/
			translate(v = [-12.5, 2.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v0.thing - $_156*/
			translate(v = [-12.5, 11.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v1.thing - $_157*/
			translate(v = [-12.5, 13.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v11.thing - $_161*/
			translate(v = [-12.5, 2.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v12.thing - $_162*/
			translate(v = [-12.5, 6.5, -1.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.devices[1].thingy.v2.thing - $_163*/
			translate(v = [-12.5, -0.5, 13.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v3.thing - $_164*/
			translate(v = [-12.5, 1.5, 11.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.devices[1].thingy.v8.thing - $_168*/
			translate(v = [-12.5, -5.5, 13.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 12*/
	union() {
		%/*Nodes shell 12*/
		union() {
			/*$_104*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, 13.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_105*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 4.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_112*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -2.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_114*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 13.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_115*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 3.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_117*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 0.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_127*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 2.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_156*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 11.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_157*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 13.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_161*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 2.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_162*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 6.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_163*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -1.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_164*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, 1.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_168*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-13.0, -6.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 12*/
		union() {
			/*$_104 - one.pinholes[0].out[3].hole*/
			translate(v = [-4.5, 14.5, -1.5]) {
				rotate(a = [0, 45.00000000000001, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_105 - one.pinholes[0].in[0].hole*/
			translate(v = [-13.5, 4.5, 5.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*$_112 - one.pinholes[0].out[2].hole*/
			translate(v = [-13.5, -0.5, 12.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_114 - one.pinholes[0].out[0].hole*/
			translate(v = [-13.5, 14.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_115 - one.pinholes[0].in[1].hole*/
			translate(v = [-13.5, 2.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_117 - one.pinholes[0].in[2].hole*/
			translate(v = [-13.5, -0.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_127 - one.pinholes[0].out[1].hole*/
			translate(v = [-13.5, 2.5, 0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*$_156 - one.pinholes[1].out[3].hole*/
			translate(v = [-13.5, 10.5, 0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_157 - one.pinholes[1].in[0].hole*/
			translate(v = [-13.5, 14.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_161 - one.pinholes[1].out[2].hole*/
			translate(v = [-13.5, 1.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_162 - one.pinholes[1].out[0].hole*/
			translate(v = [-13.5, 6.5, -1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*$_163 - one.pinholes[1].in[1].hole*/
			translate(v = [-13.5, 0.5, 14.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*$_164 - one.pinholes[1].in[2].hole*/
			translate(v = [-13.5, 1.5, 10.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*$_168 - one.pinholes[1].out[1].hole*/
			translate(v = [-13.5, -5.5, 14.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
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
				translate(v = [-14.0, 4.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].in[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 2.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].in[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -1.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].out[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 14.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].out[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 2.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].out[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -1.0, 12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].out[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-5.0, 14.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].in[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 14.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].in[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 0.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].in[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 1.0, 10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].out[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 6.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].out[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, -6.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].out[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 1.0, 14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].out[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-14.0, 10.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 13*/
		union() {
			/*one.pinholes[0].in[0].hole - $_2*/
			translate(v = [-14.5, 4.5, 5.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.pinholes[0].in[1].hole - $_3*/
			translate(v = [-14.5, 1.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[0].in[2].hole - $_4*/
			translate(v = [-14.5, -0.5, 15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[0].out[0].hole - $_8*/
			translate(v = [-14.5, 15.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[0].out[1].hole - $_9*/
			translate(v = [-14.5, 2.5, 0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.pinholes[0].out[2].hole - $_10*/
			translate(v = [-14.5, -0.5, 11.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[0].out[3].hole - $_11*/
			translate(v = [-4.5, 15.5, -0.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[1].in[0].hole - $_5*/
			translate(v = [-14.5, 15.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[1].in[1].hole - $_6*/
			translate(v = [-14.5, -0.5, 13.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[1].in[2].hole - $_7*/
			translate(v = [-14.5, 1.5, 9.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[1].out[0].hole - $_12*/
			translate(v = [-14.5, 6.5, -2.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[1].out[1].hole - $_13*/
			translate(v = [-14.5, -5.5, 15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.pinholes[1].out[2].hole - $_14*/
			translate(v = [-14.5, 0.5, 15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[1].out[3].hole - $_15*/
			translate(v = [-14.5, 9.5, 0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
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
				translate(v = [-15.0, 4.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_3*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 1.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_4*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -1.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 15.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_9*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 2.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_10*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -1.0, 11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_11*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-5.0, 15.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_5*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 15.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_6*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -1.0, 13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_7*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 1.0, 9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_12*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 6.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_13*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, -6.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_14*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 0.0, 15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_15*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-15.0, 9.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 14*/
		union();
	}
}
