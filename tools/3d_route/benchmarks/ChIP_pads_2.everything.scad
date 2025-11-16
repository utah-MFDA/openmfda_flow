translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_13*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, -15, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, -11, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_28*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, -16, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, -17, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, -14, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_56*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, -15, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, -16, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, -16, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, -15, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, -10, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 13 from thingy.collect_pinholes[0].hole to $_13*/
			translate(v = [0.5, -14.5, -21.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 14 from thingy.collect_pinholes[1].hole to $_14*/
			translate(v = [0.5, -10.5, -20.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 28 from thingy.ctrl_collect_hole to $_28*/
			translate(v = [0.5, -15.5, -20.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 34 from thingy.ctrl_prep_outlet_pinholes[1].hole to $_34*/
			translate(v = [0.5, -16.5, -19.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 50 from thingy.flush_collect_hole to $_50*/
			translate(v = [0.5, -13.5, -24.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 56 from thingy.flush_prep_outlet_pinholes[1].hole to $_56*/
			translate(v = [0.5, -14.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 10 from thingy.prep_outlet_pinholes[1].hole to $_10*/
			translate(v = [0.5, -15.5, -21.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_9__0 to $_9__1*/
			translate(v = [1.5, -15.5, -13.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_11__0 to $_11__1*/
			translate(v = [1.5, -14.5, -9.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_12__0 to $_12__1*/
			translate(v = [1.5, -10.5, -17.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
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
				translate(v = [1, -14, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.collect_pinholes[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, -11, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_collect_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, -15, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_prep_outlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, -17, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_collect_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, -13, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_prep_outlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, -16, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_outlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, -16, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, -16, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, -15, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, -11, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge 60 from thingy.collect_pinholes[0].hole to $_60*/
			translate(v = [2.5, -13.5, -21.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 61 from thingy.collect_pinholes[1].hole to $_61*/
			translate(v = [2.5, -10.5, -22.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 63 from thingy.ctrl_collect_hole to $_63*/
			translate(v = [2.5, -14.5, -21.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 71 from thingy.ctrl_prep_outlet_pinholes[1].hole to $_71*/
			translate(v = [2.5, -16.5, -19.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 81 from thingy.flush_collect_hole to $_81*/
			translate(v = [2.5, -12.5, -24.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 89 from thingy.flush_prep_outlet_pinholes[1].hole to $_89*/
			translate(v = [2.5, -15.5, -18.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 108 from thingy.prep_outlet_pinholes[1].hole to $_108*/
			translate(v = [2.5, -15.5, -20.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_9__1 to $_9__2*/
			translate(v = [2.5, -16.5, -13.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_11__1 to $_11__2*/
			translate(v = [2.5, -15.5, -10.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_12__1 to $_12__2*/
			translate(v = [2.5, -11.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_60*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -14, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_61*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -11, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_63*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -15, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_71*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -17, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -17, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -17, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_23*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -13, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_81*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -13, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_89*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -16, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_49*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -16, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_46*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -17, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_45*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -15, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_108*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, -16, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_118*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -13, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, -17, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, -16, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, -12, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 60 from $_60 to thingy.thingy.chamber[0].first.vcollect*/
			translate(v = [3.5, -13.5, -21.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 61 from $_61 to thingy.thingy.chamber[1].first.vcollect*/
			translate(v = [3.5, -11.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 63 from $_63 to thingy.thingy.chamber[0].first.vcollect*/
			translate(v = [3.5, -13.5, -21.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 71 from $_71 to thingy.thingy.prep.vout2*/
			translate(v = [3.5, -15.5, -19.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 27 from thingy.ctrl_sieve_hole to $_27*/
			translate(v = [2.5, -16.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 24 from thingy.ctrl_sv1_hole to $_24*/
			translate(v = [2.5, -16.5, -17.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 23 from thingy.ctrl_v2_hole to $_23*/
			translate(v = [2.5, -12.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 81 from $_81 to thingy.thingy.chamber[1].first.vcollect*/
			translate(v = [3.5, -11.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 89 from $_89 to thingy.thingy.prep.vout2*/
			translate(v = [3.5, -15.5, -19.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 49 from thingy.flush_sieve_hole to $_49*/
			translate(v = [2.5, -15.5, -24.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 46 from thingy.flush_sv1_hole to $_46*/
			translate(v = [2.5, -16.5, -20.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 45 from thingy.flush_v2_hole to $_45*/
			translate(v = [2.5, -14.5, -16.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 108 from $_108 to thingy.thingy.prep.vout2*/
			translate(v = [3.5, -15.5, -19.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 118 from thingy.thingy.chamber[0].first.vcollect to $_118*/
			translate(v = [2.5, -12.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 118 from $_118 to thingy.thingy.chamber[1].first.vcollect*/
			translate(v = [3.5, -11.5, -23.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_9__2 to $_9__3*/
			translate(v = [3.5, -17.5, -13.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_11__2 to $_11__3*/
			translate(v = [3.5, -16.5, -11.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_12__2 to $_12__3*/
			translate(v = [3.5, -12.5, -16.5]) {
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
			/*Node thingy.ctrl_sieve_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, -16, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_sv1_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, -18, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_v2_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, -14, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_sieve_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, -15, -25]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_sv1_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, -17, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_v2_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, -15, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vcollect*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -14, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[1].first.vcollect*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -12, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vout2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, -16, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, -18, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, -17, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, -13, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 72 from thingy.ctrl_sieve_hole to $_72*/
			translate(v = [4.5, -14.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from thingy.ctrl_sv1_hole to $_77*/
			translate(v = [4.5, -16.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 79 from thingy.ctrl_v2_hole to $_79*/
			translate(v = [4.5, -13.5, -18.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 93 from thingy.flush_sieve_hole to $_93*/
			translate(v = [4.5, -13.5, -23.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 98 from thingy.flush_sv1_hole to $_98*/
			translate(v = [4.5, -17.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 100 from thingy.flush_v2_hole to $_100*/
			translate(v = [4.5, -14.5, -16.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_9 to $_9__3*/
			translate(v = [3.5, -17.5, -13.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_11 to $_11__3*/
			translate(v = [3.5, -16.5, -11.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_12 to $_12__3*/
			translate(v = [3.5, -12.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 119 from thingy.thingy.chamber[0].first.vcollect to $_119*/
			translate(v = [4.5, -13.5, -20.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 133 from thingy.thingy.chamber[1].first.vcollect to $_133*/
			translate(v = [4.5, -12.5, -22.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 138 from $_138 to thingy.thingy.prep.vout2*/
			translate(v = [3.5, -15.5, -19.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*Node $_33*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -21, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_72*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -15, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -18, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_26*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -19, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_30*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -18, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_77*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -17, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_22*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -19, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_79*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -14, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_55*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -19, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_59*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -17, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_93*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -14, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -16, -24]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -11, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -19, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_98*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -18, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_44*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -15, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_100*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -15, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -19, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -18, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -18, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -14, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_119*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -14, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_131*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -14, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_133*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -13, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_138*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -16, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_141*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -16, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_142*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -17, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 33 from thingy.ctrl_prep_outlet_pinholes[0].hole to $_33*/
			translate(v = [4.5, -20.5, -10.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 72 from $_72 to thingy.thingy.chamber[0].first.vsieve*/
			translate(v = [5.5, -14.5, -21.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 25 from thingy.ctrl_stage_in_hole to $_25*/
			translate(v = [4.5, -17.5, -19.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 26 from thingy.ctrl_stage_out_hole to $_26*/
			translate(v = [4.5, -18.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 30 from thingy.ctrl_stage_outlet_hole to $_30*/
			translate(v = [4.5, -17.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from $_77 to thingy.thingy.prep.sv1*/
			translate(v = [5.5, -16.5, -17.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 22 from thingy.ctrl_v1_hole to $_22*/
			translate(v = [4.5, -18.5, -14.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 79 from $_79 to thingy.thingy.prep.v2*/
			translate(v = [5.5, -14.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 55 from thingy.flush_prep_outlet_pinholes[0].hole to $_55*/
			translate(v = [4.5, -18.5, -10.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from thingy.flush_pump_pinholes[2].hole to $_59*/
			translate(v = [4.5, -16.5, -15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 93 from $_93 to thingy.thingy.chamber[1].first.vsieve*/
			translate(v = [5.5, -13.5, -22.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 47 from thingy.flush_stage_in_hole to $_47*/
			translate(v = [4.5, -15.5, -23.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 48 from thingy.flush_stage_out_hole to $_48*/
			translate(v = [4.5, -10.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 52 from thingy.flush_stage_outlet_hole to $_52*/
			translate(v = [4.5, -18.5, -18.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 98 from $_98 to thingy.thingy.prep.sv1*/
			translate(v = [5.5, -16.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 44 from thingy.flush_v1_hole to $_44*/
			translate(v = [4.5, -14.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 100 from $_100 to thingy.thingy.prep.v2*/
			translate(v = [5.5, -14.5, -17.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 9 from thingy.prep_outlet_pinholes[0].hole to $_9*/
			translate(v = [4.5, -18.5, -13.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 37 from thingy.pump_pinholes[2].hole to $_37*/
			translate(v = [4.5, -17.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 11 from thingy.ring_outlet_pinholes[0].hole to $_11*/
			translate(v = [4.5, -17.5, -12.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 12 from thingy.ring_outlet_pinholes[1].hole to $_12*/
			translate(v = [4.5, -13.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 119 from $_119 to thingy.thingy.chamber[0].first.vsieve*/
			translate(v = [5.5, -14.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 131 from thingy.thingy.chamber[0].first.vsieve to $_131*/
			translate(v = [4.5, -13.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 131 from $_131 to thingy.thingy.chamber[1].first.vsieve*/
			translate(v = [5.5, -13.5, -22.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 133 from $_133 to thingy.thingy.chamber[1].first.vsieve*/
			translate(v = [5.5, -13.5, -22.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 138 from thingy.thingy.prep.sv1 to $_138*/
			translate(v = [4.5, -15.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 138 from $_138 to thingy.thingy.prep.v2*/
			translate(v = [5.5, -14.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 138 from $_138 to thingy.thingy.prep.vout3*/
			translate(v = [5.5, -16.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 141 from thingy.thingy.prep.vout3 to $_141*/
			translate(v = [4.5, -15.5, -19.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 142 from thingy.thingy.prep.vout3 to $_142*/
			translate(v = [4.5, -16.5, -18.5]) {
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
			/*Node thingy.ctrl_prep_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, -21, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_stage_in_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, -18, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_stage_out_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, -18, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_stage_outlet_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, -19, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_v1_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, -18, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_prep_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, -20, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_pump_pinholes[2].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, -17, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_in_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, -16, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_out_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, -12, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_outlet_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, -18, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_v1_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, -16, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -20, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.pump_pinholes[2].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, -19, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ring_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -18, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ring_outlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -15, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vsieve*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -15, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[1].first.vsieve*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -14, -23]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.sv1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -17, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -15, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vout3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, -17, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 70 from thingy.ctrl_prep_outlet_pinholes[0].hole to $_70*/
			translate(v = [6.5, -19.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from thingy.ctrl_stage_in_hole to $_73*/
			translate(v = [6.5, -17.5, -19.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 75 from thingy.ctrl_stage_out_hole to $_75*/
			translate(v = [6.5, -16.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from thingy.ctrl_stage_outlet_hole to $_76*/
			translate(v = [6.5, -18.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 78 from thingy.ctrl_v1_hole to $_78*/
			translate(v = [6.5, -17.5, -14.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 88 from thingy.flush_prep_outlet_pinholes[0].hole to $_88*/
			translate(v = [6.5, -18.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 92 from thingy.flush_pump_pinholes[2].hole to $_92*/
			translate(v = [6.5, -15.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 94 from thingy.flush_stage_in_hole to $_94*/
			translate(v = [6.5, -15.5, -21.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 96 from thingy.flush_stage_out_hole to $_96*/
			translate(v = [6.5, -12.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 97 from thingy.flush_stage_outlet_hole to $_97*/
			translate(v = [6.5, -17.5, -17.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 99 from thingy.flush_v1_hole to $_99*/
			translate(v = [6.5, -16.5, -14.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 107 from thingy.prep_outlet_pinholes[0].hole to $_107*/
			translate(v = [6.5, -19.5, -13.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 111 from thingy.pump_pinholes[2].hole to $_111*/
			translate(v = [6.5, -18.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 114 from thingy.ring_outlet_pinholes[0].hole to $_114*/
			translate(v = [6.5, -18.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 115 from thingy.ring_outlet_pinholes[1].hole to $_115*/
			translate(v = [6.5, -15.5, -18.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 128 from $_128 to thingy.thingy.prep.vout3*/
			translate(v = [5.5, -16.5, -19.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 130 from $_130 to thingy.thingy.chamber[0].first.vsieve*/
			translate(v = [5.5, -14.5, -21.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 136 from $_136 to thingy.thingy.chamber[1].first.vsieve*/
			translate(v = [5.5, -13.5, -22.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 137 from thingy.thingy.prep.sv1 to $_137*/
			translate(v = [6.5, -15.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 137 from $_137 to thingy.thingy.prep.v2*/
			translate(v = [5.5, -14.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*Node $_21*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -17, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_70*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -20, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_73*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -18, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_75*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -17, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_76*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -19, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_78*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -18, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_43*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, -15, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_88*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, -19, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_57*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, -13, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_58*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, -19, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_92*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, -16, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_94*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -16, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_96*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -13, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_97*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -18, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_99*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, -17, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_107*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -20, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -20, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -20, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_111*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -19, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_114*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -19, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_115*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -16, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_121*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -18, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_126*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, -17, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_127*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -17, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_128*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -17, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_129*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -15, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_130*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -15, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_136*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -13, -22]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_137*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -16, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*Edge 21 from thingy.ctrl_prep_inlet_hole to $_21*/
			translate(v = [6.5, -16.5, -13.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 70 from $_70 to thingy.thingy.prep.vout1*/
			translate(v = [7.5, -18.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from $_73 to thingy.thingy.chamber[0].first.vring_in*/
			translate(v = [7.5, -17.5, -19.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 75 from $_75 to thingy.thingy.chamber[0].first.vring_out*/
			translate(v = [7.5, -15.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from $_76 to thingy.thingy.chamber[0].first.voutlet*/
			translate(v = [7.5, -18.5, -15.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 78 from $_78 to thingy.thingy.prep.v1*/
			translate(v = [7.5, -16.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 43 from thingy.flush_prep_inlet_hole to $_43*/
			translate(v = [6.5, -14.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 88 from $_88 to thingy.thingy.prep.vout1*/
			translate(v = [7.5, -18.5, -13.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 57 from thingy.flush_pump_pinholes[0].hole to $_57*/
			translate(v = [6.5, -12.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 58 from thingy.flush_pump_pinholes[1].hole to $_58*/
			translate(v = [6.5, -18.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 92 from $_92 to thingy.thingy.chamber[1].first.vpump3.valves[0].vinlet*/
			translate(v = [7.5, -15.5, -18.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 94 from $_94 to thingy.thingy.chamber[1].first.vring_in*/
			translate(v = [7.5, -15.5, -20.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 96 from $_96 to thingy.thingy.chamber[1].first.vring_out*/
			translate(v = [7.5, -13.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 97 from $_97 to thingy.thingy.chamber[1].first.voutlet*/
			translate(v = [7.5, -16.5, -17.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 99 from $_99 to thingy.thingy.prep.v1*/
			translate(v = [7.5, -16.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 107 from $_107 to thingy.thingy.prep.vout1*/
			translate(v = [7.5, -18.5, -13.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 35 from thingy.pump_pinholes[0].hole to $_35*/
			translate(v = [6.5, -19.5, -16.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 36 from thingy.pump_pinholes[1].hole to $_36*/
			translate(v = [6.5, -19.5, -14.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 111 from $_111 to thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			translate(v = [7.5, -17.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 114 from $_114 to thingy.thingy.chamber[0].first.voutlet*/
			translate(v = [7.5, -18.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 115 from $_115 to thingy.thingy.chamber[1].first.voutlet*/
			translate(v = [7.5, -16.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 121 from thingy.thingy.chamber[0].first.voutlet to $_121*/
			translate(v = [6.5, -17.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 121 from $_121 to thingy.thingy.chamber[1].first.voutlet*/
			translate(v = [7.5, -16.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 126 from thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet to $_126*/
			translate(v = [6.5, -16.5, -17.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 126 from $_126 to thingy.thingy.chamber[1].first.vpump3.valves[0].vinlet*/
			translate(v = [7.5, -15.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 127 from thingy.thingy.chamber[0].first.vring_in to $_127*/
			translate(v = [6.5, -16.5, -19.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 128 from thingy.thingy.chamber[0].first.vring_in to $_128*/
			translate(v = [6.5, -16.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 127 from $_127 to thingy.thingy.chamber[1].first.vring_in*/
			translate(v = [7.5, -15.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 128 from $_128 to thingy.thingy.chamber[1].first.vring_in*/
			translate(v = [7.5, -15.5, -20.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 129 from thingy.thingy.chamber[0].first.vring_out to $_129*/
			translate(v = [6.5, -14.5, -19.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 130 from thingy.thingy.chamber[0].first.vring_out to $_130*/
			translate(v = [6.5, -14.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 129 from $_129 to thingy.thingy.chamber[1].first.vring_out*/
			translate(v = [7.5, -13.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 136 from thingy.thingy.chamber[1].first.vring_out to $_136*/
			translate(v = [6.5, -12.5, -21.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 137 from $_137 to thingy.thingy.prep.v1*/
			translate(v = [7.5, -16.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
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
				translate(v = [7, -18, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_prep_inlet_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, -16, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_pump_pinholes[0].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, -14, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_pump_pinholes[1].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, -20, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.pump_pinholes[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, -19, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.pump_pinholes[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, -21, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.voutlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -19, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -18, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vring_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -18, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vring_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -16, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[1].first.voutlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -17, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[1].first.vpump3.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -16, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[1].first.vring_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -16, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[1].first.vring_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -14, -21]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -17, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vout1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, -19, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*Edge 69 from thingy.ctrl_prep_inlet_hole to $_69*/
			translate(v = [8.5, -18.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 87 from thingy.flush_prep_inlet_hole to $_87*/
			translate(v = [8.5, -16.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 90 from thingy.flush_pump_pinholes[0].hole to $_90*/
			translate(v = [8.5, -14.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 91 from thingy.flush_pump_pinholes[1].hole to $_91*/
			translate(v = [8.5, -18.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 109 from thingy.pump_pinholes[0].hole to $_109*/
			translate(v = [8.5, -17.5, -16.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 110 from thingy.pump_pinholes[1].hole to $_110*/
			translate(v = [8.5, -19.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 122 from thingy.thingy.chamber[0].first.voutlet to $_122*/
			translate(v = [8.5, -18.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 122 from $_122 to thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			translate(v = [7.5, -17.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 124 from $_124 to thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			translate(v = [7.5, -17.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 124 from $_124 to thingy.thingy.chamber[0].first.vring_in*/
			translate(v = [7.5, -17.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 124 from $_124 to thingy.thingy.chamber[0].first.vring_out*/
			translate(v = [7.5, -15.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 134 from thingy.thingy.chamber[1].first.voutlet to $_134*/
			translate(v = [8.5, -16.5, -17.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 134 from $_134 to thingy.thingy.chamber[1].first.vpump3.valves[0].vinlet*/
			translate(v = [7.5, -15.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 135 from $_135 to thingy.thingy.chamber[1].first.vpump3.valves[0].vinlet*/
			translate(v = [7.5, -15.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 135 from $_135 to thingy.thingy.chamber[1].first.vring_in*/
			translate(v = [7.5, -15.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 135 from $_135 to thingy.thingy.chamber[1].first.vring_out*/
			translate(v = [7.5, -13.5, -20.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 139 from thingy.thingy.prep.v1 to $_139*/
			translate(v = [8.5, -17.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 139 from $_139 to thingy.thingy.prep.vout1*/
			translate(v = [7.5, -18.5, -13.5]) {
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
			/*Node $_31*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -16, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -14, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -15, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -18, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -19, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_20*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -19, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_69*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -19, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_29*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -15, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_53*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -17, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -14, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -18, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -13, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -20, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -17, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_87*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -17, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_90*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -15, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_91*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -19, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_51*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -18, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_109*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -18, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_110*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, -20, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_122*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, -19, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_123*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -16, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_124*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, -17, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_125*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, -18, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_134*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, -17, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_135*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, -15, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_139*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, -18, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*Edge 31 from thingy.ctrl_bead_hole to $_31*/
			translate(v = [8.5, -15.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 16 from thingy.ctrl_inlet_pinholes[0].hole to $_16*/
			translate(v = [8.5, -13.5, -10.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 17 from thingy.ctrl_inlet_pinholes[1].hole to $_17*/
			translate(v = [8.5, -14.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 18 from thingy.ctrl_inlet_pinholes[2].hole to $_18*/
			translate(v = [8.5, -17.5, -10.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 19 from thingy.ctrl_inlet_pinholes[3].hole to $_19*/
			translate(v = [8.5, -18.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 20 from thingy.ctrl_inlet_pinholes[4].hole to $_20*/
			translate(v = [8.5, -18.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from $_69 to thingy.thingy.prep.vin*/
			translate(v = [9.5, -17.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 29 from thingy.ctrl_stage_inlet_hole to $_29*/
			translate(v = [8.5, -14.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 53 from thingy.flush_bead_hole to $_53*/
			translate(v = [8.5, -16.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 38 from thingy.flush_inlet_pinholes[0].hole to $_38*/
			translate(v = [8.5, -13.5, -12.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 39 from thingy.flush_inlet_pinholes[1].hole to $_39*/
			translate(v = [8.5, -17.5, -13.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 40 from thingy.flush_inlet_pinholes[2].hole to $_40*/
			translate(v = [8.5, -12.5, -10.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 41 from thingy.flush_inlet_pinholes[3].hole to $_41*/
			translate(v = [8.5, -19.5, -12.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 42 from thingy.flush_inlet_pinholes[4].hole to $_42*/
			translate(v = [8.5, -16.5, -11.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 87 from $_87 to thingy.thingy.prep.vin*/
			translate(v = [9.5, -17.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 90 from $_90 to thingy.thingy.chamber[1].first.vpump1.valves[0].vinlet*/
			translate(v = [9.5, -15.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 91 from $_91 to thingy.thingy.chamber[1].first.vpump2.valves[0].vinlet*/
			translate(v = [9.5, -17.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 51 from thingy.flush_stage_inlet_hole to $_51*/
			translate(v = [8.5, -17.5, -17.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 109 from $_109 to thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet*/
			translate(v = [9.5, -16.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 110 from $_110 to thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			translate(v = [9.5, -18.5, -15.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 122 from $_122 to thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			translate(v = [9.5, -18.5, -15.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 123 from thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet to $_123*/
			translate(v = [8.5, -15.5, -17.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 124 from thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet to $_124*/
			translate(v = [8.5, -16.5, -18.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 123 from $_123 to thingy.thingy.chamber[1].first.vpump1.valves[0].vinlet*/
			translate(v = [9.5, -15.5, -18.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 125 from thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet to $_125*/
			translate(v = [8.5, -17.5, -15.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 125 from $_125 to thingy.thingy.chamber[1].first.vpump2.valves[0].vinlet*/
			translate(v = [9.5, -17.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 134 from $_134 to thingy.thingy.chamber[1].first.vpump2.valves[0].vinlet*/
			translate(v = [9.5, -17.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 135 from thingy.thingy.chamber[1].first.vpump1.valves[0].vinlet to $_135*/
			translate(v = [8.5, -14.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 139 from $_139 to thingy.thingy.prep.vin*/
			translate(v = [9.5, -17.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
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
				translate(v = [9, -17, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, -15, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, -16, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[2].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, -18, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[3].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, -18, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[4].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, -20, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_stage_inlet_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, -16, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_bead_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, -18, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, -15, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, -19, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[2].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, -14, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[3].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, -20, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[4].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, -18, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_inlet_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, -19, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -17, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -19, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[1].first.vpump1.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -16, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[1].first.vpump2.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -18, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vin*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, -18, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*Edge 62 from thingy.ctrl_bead_hole to $_62*/
			translate(v = [10.5, -15.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from thingy.ctrl_inlet_pinholes[0].hole to $_64*/
			translate(v = [10.5, -15.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 65 from thingy.ctrl_inlet_pinholes[1].hole to $_65*/
			translate(v = [10.5, -15.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 66 from thingy.ctrl_inlet_pinholes[2].hole to $_66*/
			translate(v = [10.5, -16.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from thingy.ctrl_inlet_pinholes[3].hole to $_67*/
			translate(v = [10.5, -18.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 68 from thingy.ctrl_inlet_pinholes[4].hole to $_68*/
			translate(v = [10.5, -18.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from thingy.ctrl_stage_inlet_hole to $_74*/
			translate(v = [10.5, -16.5, -16.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 80 from thingy.flush_bead_hole to $_80*/
			translate(v = [10.5, -17.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 82 from thingy.flush_inlet_pinholes[0].hole to $_82*/
			translate(v = [10.5, -15.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 83 from thingy.flush_inlet_pinholes[1].hole to $_83*/
			translate(v = [10.5, -17.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 84 from thingy.flush_inlet_pinholes[2].hole to $_84*/
			translate(v = [10.5, -14.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 85 from thingy.flush_inlet_pinholes[3].hole to $_85*/
			translate(v = [10.5, -18.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 86 from thingy.flush_inlet_pinholes[4].hole to $_86*/
			translate(v = [10.5, -18.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 95 from thingy.flush_stage_inlet_hole to $_95*/
			translate(v = [10.5, -17.5, -19.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from $_117 to thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet*/
			translate(v = [9.5, -16.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from $_117 to thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			translate(v = [9.5, -18.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 132 from $_132 to thingy.thingy.chamber[1].first.vpump1.valves[0].vinlet*/
			translate(v = [9.5, -15.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 132 from $_132 to thingy.thingy.chamber[1].first.vpump2.valves[0].vinlet*/
			translate(v = [9.5, -17.5, -16.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 140 from thingy.thingy.prep.vin to $_140*/
			translate(v = [10.5, -16.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 10*/
	union() {
		%/*Nodes shell 10*/
		union() {
			/*Node $_62*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -16, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_64*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -16, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_65*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -16, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_66*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -17, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_67*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -19, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_68*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -19, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_74*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -17, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_80*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -18, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_82*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, -16, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_83*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, -18, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_84*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, -15, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_85*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, -19, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_86*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, -19, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_95*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -18, -20]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_116*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -17, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_117*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, -18, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_120*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, -16, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_132*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, -17, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_140*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, -17, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union() {
			/*Edge 62 from $_62 to thingy.thingy.chamber[0].first.vbead*/
			translate(v = [11.5, -16.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from $_64 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [11.5, -16.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 65 from $_65 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [11.5, -16.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 66 from $_66 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [11.5, -15.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from $_67 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [11.5, -17.5, -15.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 68 from $_68 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [11.5, -17.5, -14.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 74 from $_74 to thingy.thingy.chamber[0].first.vinlet*/
			translate(v = [11.5, -16.5, -17.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 80 from $_80 to thingy.thingy.chamber[1].first.vbead*/
			translate(v = [11.5, -17.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 82 from $_82 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [11.5, -16.5, -13.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 83 from $_83 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [11.5, -16.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 84 from $_84 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [11.5, -15.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 85 from $_85 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [11.5, -17.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 86 from $_86 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [11.5, -17.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 95 from $_95 to thingy.thingy.chamber[1].first.vinlet*/
			translate(v = [11.5, -16.5, -18.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 116 from thingy.thingy.chamber[0].first.vbead to $_116*/
			translate(v = [10.5, -16.5, -15.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 117 from thingy.thingy.chamber[0].first.vbead to $_117*/
			translate(v = [10.5, -17.5, -16.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 116 from $_116 to thingy.thingy.chamber[1].first.vbead*/
			translate(v = [11.5, -17.5, -16.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from $_117 to thingy.thingy.chamber[0].first.vinlet*/
			translate(v = [11.5, -16.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 120 from thingy.thingy.chamber[0].first.vinlet to $_120*/
			translate(v = [10.5, -15.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 120 from $_120 to thingy.thingy.chamber[1].first.vinlet*/
			translate(v = [11.5, -16.5, -18.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 132 from thingy.thingy.chamber[1].first.vbead to $_132*/
			translate(v = [10.5, -16.5, -17.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 132 from $_132 to thingy.thingy.chamber[1].first.vinlet*/
			translate(v = [11.5, -16.5, -18.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 140 from $_140 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [11.5, -16.5, -13.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 140 from $_140 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [11.5, -16.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 140 from $_140 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [11.5, -15.5, -13.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 140 from $_140 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [11.5, -17.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 140 from $_140 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [11.5, -17.5, -14.5]) {
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
			/*Node thingy.thingy.chamber[0].first.vbead*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, -17, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, -17, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[1].first.vbead*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, -18, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[1].first.vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, -17, -19]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, -17, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[1].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, -17, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[2].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, -16, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[3].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, -18, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[4].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, -18, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 11*/
		union() {
			/*Edge 101 from $_101 to thingy.thingy.chamber[0].first.vbead*/
			translate(v = [11.5, -16.5, -16.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 101 from $_101 to thingy.thingy.chamber[1].first.vbead*/
			translate(v = [11.5, -17.5, -16.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 102 from $_102 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [11.5, -16.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 103 from $_103 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [11.5, -16.5, -15.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 104 from $_104 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [11.5, -15.5, -13.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 105 from $_105 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [11.5, -17.5, -15.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 106 from $_106 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [11.5, -17.5, -14.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 112 from $_112 to thingy.thingy.chamber[0].first.vinlet*/
			translate(v = [11.5, -16.5, -17.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 113 from $_113 to thingy.thingy.chamber[1].first.vinlet*/
			translate(v = [11.5, -16.5, -18.5]) {
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
			/*Node $_101*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, -18, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_102*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, -16, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_103*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, -17, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_104*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, -15, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_105*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, -19, -15]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_106*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, -18, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_112*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, -17, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_113*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, -16, -18]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 12*/
		union() {
			/*Edge 101 from thingy.hole to $_101*/
			translate(v = [12.5, -17.5, -16.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 102 from thingy.prep_inlet_pinholes[0].hole to $_102*/
			translate(v = [12.5, -15.5, -12.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 103 from thingy.prep_inlet_pinholes[1].hole to $_103*/
			translate(v = [12.5, -16.5, -14.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 104 from thingy.prep_inlet_pinholes[2].hole to $_104*/
			translate(v = [12.5, -14.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 105 from thingy.prep_inlet_pinholes[3].hole to $_105*/
			translate(v = [12.5, -18.5, -14.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 106 from thingy.prep_inlet_pinholes[4].hole to $_106*/
			translate(v = [12.5, -17.5, -13.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 112 from thingy.ring_inlet_pinholes[0].hole to $_112*/
			translate(v = [12.5, -16.5, -16.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 113 from thingy.ring_inlet_pinholes[1].hole to $_113*/
			translate(v = [12.5, -15.5, -17.5]) {
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
				translate(v = [13, -18, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, -15, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, -16, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, -14, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, -19, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[4].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, -18, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ring_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, -17, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ring_inlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, -15, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 13*/
		union() {
			/*Edge 15 from thingy.hole to $_15*/
			translate(v = [14.5, -17.5, -16.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 2 from thingy.prep_inlet_pinholes[0].hole to $_2*/
			translate(v = [14.5, -13.5, -11.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 3 from thingy.prep_inlet_pinholes[1].hole to $_3*/
			translate(v = [14.5, -14.5, -12.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 4 from thingy.prep_inlet_pinholes[2].hole to $_4*/
			translate(v = [14.5, -12.5, -10.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 5 from thingy.prep_inlet_pinholes[3].hole to $_5*/
			translate(v = [14.5, -17.5, -13.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 6 from thingy.prep_inlet_pinholes[4].hole to $_6*/
			translate(v = [14.5, -18.5, -12.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 7 from thingy.ring_inlet_pinholes[0].hole to $_7*/
			translate(v = [14.5, -16.5, -15.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 8 from thingy.ring_inlet_pinholes[1].hole to $_8*/
			translate(v = [14.5, -13.5, -16.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 14*/
	union() {
		%/*Nodes shell 14*/
		union() {
			/*Node $_15*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, -18, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_2*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, -14, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, -15, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, -13, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, -18, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, -19, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, -17, -16]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, -14, -17]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 14*/
		union();
	}
}
