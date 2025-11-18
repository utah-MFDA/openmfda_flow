translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_11*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 11, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 11, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_31*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 12, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 12, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_53*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 13, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 12, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 11, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 17, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 11 from thingy.collect_pinholes[0].hole to $_11*/
			translate(v = [0.5, 11.5, 15.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 25 from thingy.ctrl_collect_hole to $_25*/
			translate(v = [0.5, 11.5, 17.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 31 from thingy.ctrl_prep_outlet_pinholes[1].hole to $_31*/
			translate(v = [0.5, 12.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 47 from thingy.flush_collect_hole to $_47*/
			translate(v = [0.5, 12.5, 15.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 53 from thingy.flush_prep_outlet_pinholes[1].hole to $_53*/
			translate(v = [0.5, 13.5, 19.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 9 from thingy.prep_outlet_pinholes[1].hole to $_9*/
			translate(v = [0.5, 12.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_8__0 to $_8__1*/
			translate(v = [1.5, 12.5, 24.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_10__0 to $_10__1*/
			translate(v = [1.5, 17.5, 25.5]) {
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
			/*Node thingy.collect_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 12, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_collect_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, 12, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_prep_outlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, 13, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_collect_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 13, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_prep_outlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 14, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_outlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 13, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 12, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 17, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge 57 from thingy.collect_pinholes[0].hole to $_57*/
			translate(v = [2.5, 13.5, 16.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from thingy.ctrl_collect_hole to $_59*/
			translate(v = [2.5, 13.5, 15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from thingy.ctrl_prep_outlet_pinholes[1].hole to $_67*/
			translate(v = [2.5, 14.5, 18.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from thingy.flush_collect_hole to $_77*/
			translate(v = [2.5, 14.5, 15.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 85 from thingy.flush_prep_outlet_pinholes[1].hole to $_85*/
			translate(v = [2.5, 15.5, 18.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 104 from thingy.prep_outlet_pinholes[1].hole to $_104*/
			translate(v = [2.5, 14.5, 20.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_8__1 to $_8__2*/
			translate(v = [2.5, 13.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_10__1 to $_10__2*/
			translate(v = [2.5, 17.5, 24.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_57*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 13, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_59*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 13, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_67*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 14, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 14, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_21*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 15, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_20*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 15, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_77*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 14, 15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_85*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 15, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_46*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 14, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_43*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 14, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 16, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_104*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 14, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, 13, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, 17, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 57 from $_57 to thingy.thingy.chamber[0].first.vcollect*/
			translate(v = [3.5, 14.5, 16.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 59 from $_59 to thingy.thingy.chamber[0].first.vcollect*/
			translate(v = [3.5, 14.5, 16.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from $_67 to thingy.thingy.prep.vout2*/
			translate(v = [3.5, 15.5, 19.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 24 from thingy.ctrl_sieve_hole to $_24*/
			translate(v = [2.5, 14.5, 17.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 21 from thingy.ctrl_sv1_hole to $_21*/
			translate(v = [2.5, 15.5, 24.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 20 from thingy.ctrl_v2_hole to $_20*/
			translate(v = [2.5, 15.5, 17.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from $_77 to thingy.thingy.chamber[0].first.vcollect*/
			translate(v = [3.5, 14.5, 16.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 85 from $_85 to thingy.thingy.prep.vout2*/
			translate(v = [3.5, 15.5, 19.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 46 from thingy.flush_sieve_hole to $_46*/
			translate(v = [2.5, 14.5, 21.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 43 from thingy.flush_sv1_hole to $_43*/
			translate(v = [2.5, 14.5, 19.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 42 from thingy.flush_v2_hole to $_42*/
			translate(v = [2.5, 16.5, 19.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 104 from $_104 to thingy.thingy.prep.vout2*/
			translate(v = [3.5, 15.5, 19.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_8__2 to $_8__3*/
			translate(v = [3.5, 14.5, 24.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_10__2 to $_10__3*/
			translate(v = [3.5, 17.5, 23.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union() {
			/*Node thingy.ctrl_sieve_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 15, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_sv1_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 15, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_v2_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 16, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_sieve_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 14, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_sv1_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 15, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_v2_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 16, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vcollect*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 14, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vout2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 15, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, 14, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, 17, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 68 from thingy.ctrl_sieve_hole to $_68*/
			translate(v = [4.5, 16.5, 18.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 73 from thingy.ctrl_sv1_hole to $_73*/
			translate(v = [4.5, 16.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 75 from thingy.ctrl_v2_hole to $_75*/
			translate(v = [4.5, 17.5, 19.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 89 from thingy.flush_sieve_hole to $_89*/
			translate(v = [4.5, 15.5, 19.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 94 from thingy.flush_sv1_hole to $_94*/
			translate(v = [4.5, 16.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 96 from thingy.flush_v2_hole to $_96*/
			translate(v = [4.5, 16.5, 19.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_8 to $_8__3*/
			translate(v = [3.5, 14.5, 24.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_10 to $_10__3*/
			translate(v = [3.5, 17.5, 23.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 111 from thingy.thingy.chamber[0].first.vcollect to $_111*/
			translate(v = [4.5, 15.5, 17.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from $_117 to thingy.thingy.prep.vout2*/
			translate(v = [3.5, 15.5, 19.5]) {
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
			/*Node $_30*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 15, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_68*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 16, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_22*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 13, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_23*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 15, 16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 12, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_73*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 16, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 19, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_75*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 17, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 15, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_56*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 13, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_89*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 15, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_44*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 17, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_45*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 17, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_49*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 12, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_94*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 16, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 16, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_96*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 16, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 15, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 17, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 17, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_111*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 15, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_117*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 16, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_120*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 15, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_121*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 15, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 30 from thingy.ctrl_prep_outlet_pinholes[0].hole to $_30*/
			translate(v = [4.5, 15.5, 25.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 68 from $_68 to thingy.thingy.chamber[0].first.vsieve*/
			translate(v = [5.5, 16.5, 18.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 22 from thingy.ctrl_stage_in_hole to $_22*/
			translate(v = [4.5, 13.5, 19.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 23 from thingy.ctrl_stage_out_hole to $_23*/
			translate(v = [4.5, 15.5, 16.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 27 from thingy.ctrl_stage_outlet_hole to $_27*/
			translate(v = [4.5, 12.5, 20.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 73 from $_73 to thingy.thingy.prep.sv1*/
			translate(v = [5.5, 17.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 19 from thingy.ctrl_v1_hole to $_19*/
			translate(v = [4.5, 19.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 75 from $_75 to thingy.thingy.prep.v2*/
			translate(v = [5.5, 17.5, 20.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 52 from thingy.flush_prep_outlet_pinholes[0].hole to $_52*/
			translate(v = [4.5, 15.5, 24.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 56 from thingy.flush_pump_pinholes[2].hole to $_56*/
			translate(v = [4.5, 13.5, 23.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 89 from $_89 to thingy.thingy.chamber[0].first.vsieve*/
			translate(v = [5.5, 16.5, 18.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 44 from thingy.flush_stage_in_hole to $_44*/
			translate(v = [4.5, 17.5, 24.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 45 from thingy.flush_stage_out_hole to $_45*/
			translate(v = [4.5, 17.5, 18.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 49 from thingy.flush_stage_outlet_hole to $_49*/
			translate(v = [4.5, 12.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 94 from $_94 to thingy.thingy.prep.sv1*/
			translate(v = [5.5, 17.5, 21.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 41 from thingy.flush_v1_hole to $_41*/
			translate(v = [4.5, 16.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 96 from $_96 to thingy.thingy.prep.v2*/
			translate(v = [5.5, 17.5, 20.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 8 from thingy.prep_outlet_pinholes[0].hole to $_8*/
			translate(v = [4.5, 15.5, 23.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 34 from thingy.pump_pinholes[2].hole to $_34*/
			translate(v = [4.5, 17.5, 23.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 10 from thingy.ring_outlet_pinholes[0].hole to $_10*/
			translate(v = [4.5, 17.5, 22.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 111 from $_111 to thingy.thingy.chamber[0].first.vsieve*/
			translate(v = [5.5, 16.5, 18.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from thingy.thingy.prep.sv1 to $_117*/
			translate(v = [4.5, 16.5, 20.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from $_117 to thingy.thingy.prep.v2*/
			translate(v = [5.5, 17.5, 20.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 117 from $_117 to thingy.thingy.prep.vout3*/
			translate(v = [5.5, 16.5, 20.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 120 from thingy.thingy.prep.vout3 to $_120*/
			translate(v = [4.5, 15.5, 20.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 121 from thingy.thingy.prep.vout3 to $_121*/
			translate(v = [4.5, 15.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*Node thingy.ctrl_prep_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 16, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_stage_in_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 14, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_stage_out_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 16, 17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_stage_outlet_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 13, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_v1_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 20, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_prep_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 16, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_pump_pinholes[2].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 14, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_in_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 16, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_out_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 18, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_outlet_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 13, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_v1_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, 17, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 16, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.pump_pinholes[2].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, 17, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ring_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 16, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vsieve*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 16, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.sv1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 17, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 17, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vout3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 16, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 66 from thingy.ctrl_prep_outlet_pinholes[0].hole to $_66*/
			translate(v = [6.5, 17.5, 24.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from thingy.ctrl_stage_in_hole to $_69*/
			translate(v = [6.5, 15.5, 20.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 71 from thingy.ctrl_stage_out_hole to $_71*/
			translate(v = [6.5, 17.5, 18.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from thingy.ctrl_stage_outlet_hole to $_72*/
			translate(v = [6.5, 14.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from thingy.ctrl_v1_hole to $_74*/
			translate(v = [6.5, 20.5, 23.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 84 from thingy.flush_prep_outlet_pinholes[0].hole to $_84*/
			translate(v = [6.5, 17.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 88 from thingy.flush_pump_pinholes[2].hole to $_88*/
			translate(v = [6.5, 15.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 90 from thingy.flush_stage_in_hole to $_90*/
			translate(v = [6.5, 15.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 92 from thingy.flush_stage_out_hole to $_92*/
			translate(v = [6.5, 19.5, 18.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 93 from thingy.flush_stage_outlet_hole to $_93*/
			translate(v = [6.5, 14.5, 23.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 95 from thingy.flush_v1_hole to $_95*/
			translate(v = [6.5, 18.5, 23.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 103 from thingy.prep_outlet_pinholes[0].hole to $_103*/
			translate(v = [6.5, 17.5, 23.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 107 from thingy.pump_pinholes[2].hole to $_107*/
			translate(v = [6.5, 17.5, 21.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 109 from thingy.ring_outlet_pinholes[0].hole to $_109*/
			translate(v = [6.5, 16.5, 22.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 114 from $_114 to thingy.thingy.prep.vout3*/
			translate(v = [5.5, 16.5, 20.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 115 from $_115 to thingy.thingy.chamber[0].first.vsieve*/
			translate(v = [5.5, 16.5, 18.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 116 from thingy.thingy.prep.sv1 to $_116*/
			translate(v = [6.5, 18.5, 21.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 116 from $_116 to thingy.thingy.prep.v2*/
			translate(v = [5.5, 17.5, 20.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*Node $_18*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 18, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_66*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 17, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_69*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 15, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_71*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 17, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_72*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 14, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_74*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 20, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 20, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_84*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 17, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_54*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 18, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_55*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 14, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_88*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 15, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_90*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 15, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_92*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 19, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_93*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 14, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_95*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 18, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_103*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 17, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 19, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 18, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_107*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 17, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_109*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 16, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_114*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 17, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_115*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 17, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_116*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 18, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*Edge 18 from thingy.ctrl_prep_inlet_hole to $_18*/
			translate(v = [6.5, 18.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 66 from $_66 to thingy.thingy.prep.vout1*/
			translate(v = [7.5, 18.5, 24.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 69 from $_69 to thingy.thingy.chamber[0].first.vring_in*/
			translate(v = [7.5, 16.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 71 from $_71 to thingy.thingy.chamber[0].first.vring_out*/
			translate(v = [7.5, 18.5, 19.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from $_72 to thingy.thingy.chamber[0].first.voutlet*/
			translate(v = [7.5, 15.5, 22.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from $_74 to thingy.thingy.prep.v1*/
			translate(v = [7.5, 19.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 40 from thingy.flush_prep_inlet_hole to $_40*/
			translate(v = [6.5, 20.5, 22.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 84 from $_84 to thingy.thingy.prep.vout1*/
			translate(v = [7.5, 18.5, 24.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 54 from thingy.flush_pump_pinholes[0].hole to $_54*/
			translate(v = [6.5, 18.5, 19.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 55 from thingy.flush_pump_pinholes[1].hole to $_55*/
			translate(v = [6.5, 14.5, 18.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 88 from $_88 to thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			translate(v = [7.5, 16.5, 20.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 90 from $_90 to thingy.thingy.chamber[0].first.vring_in*/
			translate(v = [7.5, 16.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 92 from $_92 to thingy.thingy.chamber[0].first.vring_out*/
			translate(v = [7.5, 18.5, 19.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 93 from $_93 to thingy.thingy.chamber[0].first.voutlet*/
			translate(v = [7.5, 15.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 95 from $_95 to thingy.thingy.prep.v1*/
			translate(v = [7.5, 19.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 103 from $_103 to thingy.thingy.prep.vout1*/
			translate(v = [7.5, 18.5, 24.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 32 from thingy.pump_pinholes[0].hole to $_32*/
			translate(v = [6.5, 19.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 33 from thingy.pump_pinholes[1].hole to $_33*/
			translate(v = [6.5, 18.5, 20.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 107 from $_107 to thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			translate(v = [7.5, 16.5, 20.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 109 from $_109 to thingy.thingy.chamber[0].first.voutlet*/
			translate(v = [7.5, 15.5, 22.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 114 from thingy.thingy.chamber[0].first.vring_in to $_114*/
			translate(v = [6.5, 17.5, 20.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 115 from thingy.thingy.chamber[0].first.vring_out to $_115*/
			translate(v = [6.5, 17.5, 19.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 116 from $_116 to thingy.thingy.prep.v1*/
			translate(v = [7.5, 19.5, 22.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 7*/
	union() {
		%/*Nodes shell 7*/
		union() {
			/*Node thingy.ctrl_prep_inlet_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, 19, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_prep_inlet_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, 20, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_pump_pinholes[0].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, 17, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_pump_pinholes[1].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, 15, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.pump_pinholes[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, 18, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.pump_pinholes[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, 19, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.voutlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 15, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 16, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vring_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 16, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vring_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 18, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 19, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vout1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 18, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*Edge 65 from thingy.ctrl_prep_inlet_hole to $_65*/
			translate(v = [8.5, 20.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 83 from thingy.flush_prep_inlet_hole to $_83*/
			translate(v = [8.5, 19.5, 22.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 86 from thingy.flush_pump_pinholes[0].hole to $_86*/
			translate(v = [8.5, 16.5, 18.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 87 from thingy.flush_pump_pinholes[1].hole to $_87*/
			translate(v = [8.5, 16.5, 20.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 105 from thingy.pump_pinholes[0].hole to $_105*/
			translate(v = [8.5, 17.5, 19.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 106 from thingy.pump_pinholes[1].hole to $_106*/
			translate(v = [8.5, 18.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 112 from thingy.thingy.chamber[0].first.voutlet to $_112*/
			translate(v = [8.5, 16.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 112 from $_112 to thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			translate(v = [7.5, 16.5, 20.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 113 from $_113 to thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			translate(v = [7.5, 16.5, 20.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 113 from $_113 to thingy.thingy.chamber[0].first.vring_in*/
			translate(v = [7.5, 16.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 113 from $_113 to thingy.thingy.chamber[0].first.vring_out*/
			translate(v = [7.5, 18.5, 19.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 118 from thingy.thingy.prep.v1 to $_118*/
			translate(v = [8.5, 19.5, 23.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 118 from $_118 to thingy.thingy.prep.vout1*/
			translate(v = [7.5, 18.5, 24.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 8*/
	union() {
		%/*Nodes shell 8*/
		union() {
			/*Node $_28*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 15, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_13*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 17, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 18, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 24, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 25, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 18, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_65*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 20, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_26*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 20, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 14, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 17, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 17, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 25, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 24, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 17, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_83*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 19, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_86*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 16, 18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_87*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 16, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 17, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_105*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 17, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_106*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 18, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_112*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 16, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_113*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 17, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_118*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 19, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*Edge 28 from thingy.ctrl_bead_hole to $_28*/
			translate(v = [8.5, 15.5, 24.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 13 from thingy.ctrl_inlet_pinholes[0].hole to $_13*/
			translate(v = [8.5, 17.5, 18.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 14 from thingy.ctrl_inlet_pinholes[1].hole to $_14*/
			translate(v = [8.5, 18.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 15 from thingy.ctrl_inlet_pinholes[2].hole to $_15*/
			translate(v = [8.5, 24.5, 25.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 16 from thingy.ctrl_inlet_pinholes[3].hole to $_16*/
			translate(v = [8.5, 25.5, 22.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 17 from thingy.ctrl_inlet_pinholes[4].hole to $_17*/
			translate(v = [8.5, 18.5, 20.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 65 from $_65 to thingy.thingy.prep.vin*/
			translate(v = [9.5, 20.5, 22.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 26 from thingy.ctrl_stage_inlet_hole to $_26*/
			translate(v = [8.5, 20.5, 23.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 50 from thingy.flush_bead_hole to $_50*/
			translate(v = [8.5, 14.5, 23.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 35 from thingy.flush_inlet_pinholes[0].hole to $_35*/
			translate(v = [8.5, 17.5, 23.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 36 from thingy.flush_inlet_pinholes[1].hole to $_36*/
			translate(v = [8.5, 17.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 37 from thingy.flush_inlet_pinholes[2].hole to $_37*/
			translate(v = [8.5, 25.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 38 from thingy.flush_inlet_pinholes[3].hole to $_38*/
			translate(v = [8.5, 24.5, 24.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 39 from thingy.flush_inlet_pinholes[4].hole to $_39*/
			translate(v = [8.5, 17.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 83 from $_83 to thingy.thingy.prep.vin*/
			translate(v = [9.5, 20.5, 22.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 86 from $_86 to thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet*/
			translate(v = [9.5, 17.5, 19.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 87 from $_87 to thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			translate(v = [9.5, 17.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 48 from thingy.flush_stage_inlet_hole to $_48*/
			translate(v = [8.5, 17.5, 22.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 105 from $_105 to thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet*/
			translate(v = [9.5, 17.5, 19.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 106 from $_106 to thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			translate(v = [9.5, 17.5, 21.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 112 from $_112 to thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			translate(v = [9.5, 17.5, 21.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 113 from thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet to $_113*/
			translate(v = [8.5, 17.5, 20.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 118 from $_118 to thingy.thingy.prep.vin*/
			translate(v = [9.5, 20.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 9*/
	union() {
		%/*Nodes shell 9*/
		union() {
			/*Node thingy.ctrl_bead_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 15, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 18, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 19, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[2].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 24, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[3].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 24, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[4].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 19, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_stage_inlet_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 21, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_bead_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 15, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 18, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 18, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[2].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 24, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[3].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 23, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[4].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 18, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_inlet_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 17, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 17, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 17, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vin*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 20, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*Edge 58 from thingy.ctrl_bead_hole to $_58*/
			translate(v = [10.5, 16.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 60 from thingy.ctrl_inlet_pinholes[0].hole to $_60*/
			translate(v = [10.5, 19.5, 20.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 61 from thingy.ctrl_inlet_pinholes[1].hole to $_61*/
			translate(v = [10.5, 20.5, 23.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 62 from thingy.ctrl_inlet_pinholes[2].hole to $_62*/
			translate(v = [10.5, 23.5, 23.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from thingy.ctrl_inlet_pinholes[3].hole to $_63*/
			translate(v = [10.5, 23.5, 20.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from thingy.ctrl_inlet_pinholes[4].hole to $_64*/
			translate(v = [10.5, 20.5, 19.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 70 from thingy.ctrl_stage_inlet_hole to $_70*/
			translate(v = [10.5, 20.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from thingy.flush_bead_hole to $_76*/
			translate(v = [10.5, 16.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 78 from thingy.flush_inlet_pinholes[0].hole to $_78*/
			translate(v = [10.5, 19.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 79 from thingy.flush_inlet_pinholes[1].hole to $_79*/
			translate(v = [10.5, 19.5, 23.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 80 from thingy.flush_inlet_pinholes[2].hole to $_80*/
			translate(v = [10.5, 23.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 81 from thingy.flush_inlet_pinholes[3].hole to $_81*/
			translate(v = [10.5, 23.5, 22.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 82 from thingy.flush_inlet_pinholes[4].hole to $_82*/
			translate(v = [10.5, 19.5, 19.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 91 from thingy.flush_stage_inlet_hole to $_91*/
			translate(v = [10.5, 18.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 110 from $_110 to thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet*/
			translate(v = [9.5, 17.5, 19.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 110 from $_110 to thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			translate(v = [9.5, 17.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 119 from thingy.thingy.prep.vin to $_119*/
			translate(v = [10.5, 21.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 10*/
	union() {
		%/*Nodes shell 10*/
		union() {
			/*Node $_58*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 16, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_60*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 19, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_61*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 20, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_62*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 23, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_63*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 23, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_64*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 20, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_70*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 20, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_76*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 16, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_78*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 19, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_79*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 19, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_80*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 23, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_81*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 23, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_82*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 19, 19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_91*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 18, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_110*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 18, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_119*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 21, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union() {
			/*Edge 58 from $_58 to thingy.thingy.chamber[0].first.vbead*/
			translate(v = [11.5, 17.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 60 from $_60 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [11.5, 20.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 61 from $_61 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [11.5, 20.5, 22.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 62 from $_62 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [11.5, 22.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from $_63 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [11.5, 22.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from $_64 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [11.5, 20.5, 20.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 70 from $_70 to thingy.thingy.chamber[0].first.vinlet*/
			translate(v = [11.5, 19.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from $_76 to thingy.thingy.chamber[0].first.vbead*/
			translate(v = [11.5, 17.5, 21.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 78 from $_78 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [11.5, 20.5, 21.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 79 from $_79 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [11.5, 20.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 80 from $_80 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [11.5, 22.5, 22.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 81 from $_81 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [11.5, 22.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 82 from $_82 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [11.5, 20.5, 20.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 91 from $_91 to thingy.thingy.chamber[0].first.vinlet*/
			translate(v = [11.5, 19.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 110 from thingy.thingy.chamber[0].first.vbead to $_110*/
			translate(v = [10.5, 18.5, 20.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 110 from $_110 to thingy.thingy.chamber[0].first.vinlet*/
			translate(v = [11.5, 19.5, 21.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 119 from $_119 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [11.5, 20.5, 21.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 119 from $_119 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [11.5, 20.5, 22.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 119 from $_119 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [11.5, 22.5, 22.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 119 from $_119 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [11.5, 22.5, 21.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 119 from $_119 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [11.5, 20.5, 20.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 11*/
	union() {
		%/*Nodes shell 11*/
		union() {
			/*Node thingy.thingy.chamber[0].first.vbead*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 17, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 19, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 20, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[1].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 20, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[2].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 22, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[3].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 22, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[4].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 20, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 11*/
		union() {
			/*Edge 97 from $_97 to thingy.thingy.chamber[0].first.vbead*/
			translate(v = [11.5, 17.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 98 from $_98 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [11.5, 20.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 99 from $_99 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [11.5, 20.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 100 from $_100 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [11.5, 22.5, 22.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 101 from $_101 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [11.5, 22.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 102 from $_102 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [11.5, 20.5, 20.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 108 from $_108 to thingy.thingy.chamber[0].first.vinlet*/
			translate(v = [11.5, 19.5, 21.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 12*/
	union() {
		%/*Nodes shell 12*/
		union() {
			/*Node $_97*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 16, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_98*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 19, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_99*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 19, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_100*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 22, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_101*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 23, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_102*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 21, 20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_108*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 20, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 12*/
		union() {
			/*Edge 97 from thingy.hole to $_97*/
			translate(v = [12.5, 16.5, 22.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 98 from thingy.prep_inlet_pinholes[0].hole to $_98*/
			translate(v = [12.5, 19.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 99 from thingy.prep_inlet_pinholes[1].hole to $_99*/
			translate(v = [12.5, 19.5, 23.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 100 from thingy.prep_inlet_pinholes[2].hole to $_100*/
			translate(v = [12.5, 22.5, 23.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 101 from thingy.prep_inlet_pinholes[3].hole to $_101*/
			translate(v = [12.5, 23.5, 22.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 102 from thingy.prep_inlet_pinholes[4].hole to $_102*/
			translate(v = [12.5, 21.5, 20.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 108 from thingy.ring_inlet_pinholes[0].hole to $_108*/
			translate(v = [12.5, 20.5, 22.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 13*/
	union() {
		%/*Nodes shell 13*/
		union() {
			/*Node thingy.hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 15, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 18, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 18, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 23, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 24, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[4].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 22, 21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ring_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 21, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 13*/
		union() {
			/*Edge 12 from thingy.hole to $_12*/
			translate(v = [14.5, 15.5, 22.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 2 from thingy.prep_inlet_pinholes[0].hole to $_2*/
			translate(v = [14.5, 17.5, 24.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 3 from thingy.prep_inlet_pinholes[1].hole to $_3*/
			translate(v = [14.5, 17.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 4 from thingy.prep_inlet_pinholes[2].hole to $_4*/
			translate(v = [14.5, 24.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 5 from thingy.prep_inlet_pinholes[3].hole to $_5*/
			translate(v = [14.5, 25.5, 23.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 6 from thingy.prep_inlet_pinholes[4].hole to $_6*/
			translate(v = [14.5, 23.5, 22.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 7 from thingy.ring_inlet_pinholes[0].hole to $_7*/
			translate(v = [14.5, 21.5, 23.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 14*/
	union() {
		%/*Nodes shell 14*/
		union() {
			/*Node $_12*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 15, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_2*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 17, 24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 17, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 24, 25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 25, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 23, 22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 21, 23]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 14*/
		union();
	}
}
