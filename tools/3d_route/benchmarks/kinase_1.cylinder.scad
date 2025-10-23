translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_51*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [1.0, -1.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_29*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1.0, -1.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 51 from one.pump_b[0].flush to $_51*/
			translate(v = [1.5, -0.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 29 from one.pump_b[0].hole to $_29*/
			translate(v = [-0.5, -0.5, -24.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 1*/
	union() {
		%/*Nodes shell 1*/
		union() {
			/*Node $_45*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-2.0, -2.0, -19.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_23*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, 2.0, -19.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-2.0, -2.0, -24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_26*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -2.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [2.0, -2.0, -24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0.0, -2.0, -24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2.0, -2.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_30*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2.0, -2.0, -23.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge 45 from one.ctrl_s[1].flush to $_45*/
			translate(v = [-1.5, -1.5, -18.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 23 from one.ctrl_s[1].hole to $_23*/
			translate(v = [-1.5, 2.5, -18.5]) {
				rotate(a = [0, 65.9051574478893, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 117 from one.devices[0].thingy.vp3.thing to one.pump_b[0].hole*/
			translate(v = [0.5, -1.5, -23.5]) {
				rotate(a = [0, 35.26438968275464, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 119 from one.devices[0].thingy.vp3.thing to one.pump_b[0].flush*/
			translate(v = [2.5, -1.5, -23.5]) {
				rotate(a = [0, 35.26438968275464, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 48 from one.pump_a[0].flush to $_48*/
			translate(v = [-1.5, -1.5, -23.5]) {
				rotate(a = [0, 35.26438968275464, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 26 from one.pump_a[0].hole to $_26*/
			translate(v = [-1.5, -1.5, -24.5]) {
				rotate(a = [0, 35.26438968275464, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 52 from one.pump_b[1].flush to $_52*/
			translate(v = [2.5, -1.5, -24.5]) {
				rotate(a = [0, 35.26438968275464, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 30 from one.pump_b[1].hole to $_30*/
			translate(v = [-1.5, -1.5, -22.5]) {
				rotate(a = [0, 48.189685104221404, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_36*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3.0, -3.0, -15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -3.0, -14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3.0, -3.0, -19.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, -3.0, -16.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-3.0, -3.0, -18.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-3.0, 0.0, -18.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_46*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3.0, -3.0, -20.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [3.0, -3.0, -17.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.column_upper.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3.0, -3.0, -20.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.vp3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1.0, -3.0, -22.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_a[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-3.0, -3.0, -22.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_a[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-3.0, -3.0, -23.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_49*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3.0, -3.0, -17.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3.0, 3.0, -17.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3.0, -3.0, -23.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0.0, -3.0, -21.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 36 from one.ctrl_a[5].flush to $_36*/
			translate(v = [-2.5, -2.5, -14.5]) {
				rotate(a = [0, 19.471220634490674, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 14 from one.ctrl_a[5].hole to $_14*/
			translate(v = [-2.5, -2.5, -13.5]) {
				rotate(a = [0, 19.471220634490674, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 37 from one.ctrl_a[6].flush to $_37*/
			translate(v = [-2.5, -2.5, -18.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 15 from one.ctrl_a[6].hole to $_15*/
			translate(v = [-2.5, -2.5, -15.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 81 from one.ctrl_s[1].flush to one.devices[0].thingy.vs1.thing*/
			translate(v = [1.5, -3.5, -17.5]) {
				rotate(a = [0, 90.0, 165.96375653207352]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
			/*Edge 82 from one.ctrl_s[1].hole to one.devices[0].thingy.vs1.thing*/
			translate(v = [1.5, -3.5, -17.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 5.656854249492381]);
				}
			}
			/*Edge 46 from one.ctrl_s[2].flush to $_46*/
			translate(v = [-2.5, -2.5, -19.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 24 from one.ctrl_s[2].hole to $_24*/
			translate(v = [3.5, -2.5, -16.5]) {
				rotate(a = [0, 45.868250787968954, -165.96375653207352]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*Edge 94 from one.devices[0].thingy.column_upper.thing to one.devices[0].thingy.vp4.thing*/
			translate(v = [-0.5, -3.5, -18.5]) {
				rotate(a = [0, 103.6330222253664, 14.036243467926477]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 109 from one.devices[0].thingy.vp0.thing to one.pump_a[0].hole*/
			translate(v = [-2.5, -2.5, -22.5]) {
				rotate(a = [0, 38.32881810145588, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*Edge 110 from one.devices[0].thingy.vp0.thing to one.pump_a[0].flush*/
			translate(v = [-2.5, -2.5, -21.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 118 from one.devices[0].thingy.vp3.thing to one.devices[0].thingy.vs1.thing*/
			translate(v = [1.5, -3.5, -17.5]) {
				rotate(a = [0, 165.96375653207352, 90.0]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
			/*Edge 120 from one.devices[0].thingy.vp4.thing to one.pump_b[1].hole*/
			translate(v = [0.5, -2.5, -20.5]) {
				rotate(a = [0, 35.26438968275464, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 121 from one.devices[0].thingy.vp4.thing to one.pump_b[1].flush*/
			translate(v = [3.5, -2.5, -22.5]) {
				rotate(a = [0, 45.868250787968954, -165.96375653207352]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*Edge 49 from one.pump_a[1].flush to $_49*/
			translate(v = [-2.5, -2.5, -16.5]) {
				rotate(a = [0, 45.868250787968954, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*Edge 27 from one.pump_a[1].hole to $_27*/
			translate(v = [-2.5, 3.5, -16.5]) {
				rotate(a = [0, 19.471220634490674, 135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
		}
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union() {
			/*Node one.ctrl_a[5].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, -11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[5].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, -10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[6].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, -16.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[6].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, -13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[2].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, -17.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1.0, -4.0, -13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-4.0, -4.0, -8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-4.0, -4.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.circulate2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, -4.0, -15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.vp0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, 0.0, -19.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.vp4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1.0, -4.0, -19.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.vs1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1.0, -4.0, -18.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_a[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, 1.0, -13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_a[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4.0, 4.0, -13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-4.0, -4.0, -12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_28*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-4.0, -4.0, -14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 69 from one.ctrl_a[5].flush to one.devices[0].thingy.v5.thing*/
			translate(v = [-4.5, -4.5, -12.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 70 from one.ctrl_a[5].hole to one.devices[0].thingy.v5.thing*/
			translate(v = [-4.5, -4.5, -12.5]) {
				rotate(a = [0, 25.239401820678914, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 71 from one.ctrl_a[6].flush to one.devices[0].thingy.v6.thing*/
			translate(v = [-1.5, -4.5, -14.5]) {
				rotate(a = [0, 114.09484255211072, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 72 from one.ctrl_a[6].hole to one.devices[0].thingy.v6.thing*/
			translate(v = [-1.5, -4.5, -14.5]) {
				rotate(a = [0, 48.189685104221404, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*Edge 83 from one.ctrl_s[2].flush to one.devices[0].thingy.vs2.thing*/
			translate(v = [-0.5, -4.5, -15.5]) {
				rotate(a = [0, 107.54840061379231, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 84 from one.ctrl_s[2].hole to one.devices[0].thingy.vs2.thing*/
			translate(v = [-0.5, -4.5, -15.5]) {
				rotate(a = [0, 18.434948822922017, 90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 47 from one.ctrl_s[3].flush to $_47*/
			translate(v = [-3.5, -3.5, -7.5]) {
				rotate(a = [0, 154.7605981793211, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 25 from one.ctrl_s[3].hole to $_25*/
			translate(v = [-3.5, -3.5, -6.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 89 from one.devices[0].thingy.circulate2.thing to one.devices[0].thingy.v5.thing*/
			translate(v = [-4.5, -4.5, -12.5]) {
				rotate(a = [0, 144.73561031724537, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 106 from one.devices[0].thingy.v6.thing to one.devices[0].thingy.vs1.thing*/
			translate(v = [1.5, -3.5, -17.5]) {
				rotate(a = [0, 46.50848065490801, -161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 111 from one.devices[0].thingy.vp0.thing to one.devices[0].thingy.vp1.thing*/
			translate(v = [-4.5, 1.5, -15.5]) {
				rotate(a = [0, 154.7605981793211, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 112 from one.devices[0].thingy.vp1.thing to one.pump_a[1].hole*/
			translate(v = [-3.5, 4.5, -12.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 113 from one.devices[0].thingy.vp1.thing to one.pump_a[1].flush*/
			translate(v = [-3.5, 1.5, -12.5]) {
				rotate(a = [0, 161.56505117707798, 180.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 122 from one.devices[0].thingy.vp4.thing to one.devices[0].thingy.vs2.thing*/
			translate(v = [-0.5, -4.5, -15.5]) {
				rotate(a = [0, 161.56505117707798, 90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 50 from one.pump_a[2].flush to $_50*/
			translate(v = [-3.5, -3.5, -11.5]) {
				rotate(a = [0, 90.0, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 28 from one.pump_a[2].hole to $_28*/
			translate(v = [-3.5, -3.5, -13.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*Node $_41*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, -5.0, -14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -5.0, -12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, -5.0, -9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_13*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -5.0, -8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, -5.0, -17.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -5.0, -15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, -5.0, -16.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -5.0, -10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_44*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5.0, -5.0, -25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_22*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5.0, -5.0, -24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[3].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-5.0, -5.0, -11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-5.0, -5.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v5.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-5.0, -5.0, -13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v6.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2.0, -5.0, -15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.vp1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-5.0, 1.0, -16.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.vs2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1.0, -5.0, -16.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_a[2].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-5.0, -1.0, -12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_a[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-5.0, -1.0, -11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 41 from one.ctrl_a[10].flush to $_41*/
			translate(v = [-4.5, -4.5, -13.5]) {
				rotate(a = [0, 19.471220634490674, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 19 from one.ctrl_a[10].hole to $_19*/
			translate(v = [-4.5, -4.5, -11.5]) {
				rotate(a = [0, 19.471220634490674, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 35 from one.ctrl_a[4].flush to $_35*/
			translate(v = [-4.5, -4.5, -8.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 13 from one.ctrl_a[4].hole to $_13*/
			translate(v = [-4.5, -4.5, -7.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 38 from one.ctrl_a[7].flush to $_38*/
			translate(v = [-4.5, -4.5, -16.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 16 from one.ctrl_a[7].hole to $_16*/
			translate(v = [-4.5, -4.5, -14.5]) {
				rotate(a = [0, 45.868250787968954, 104.0362434679265]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*Edge 40 from one.ctrl_a[9].flush to $_40*/
			translate(v = [-4.5, -4.5, -15.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 18 from one.ctrl_a[9].hole to $_18*/
			translate(v = [-4.5, -4.5, -9.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 44 from one.ctrl_s[0].flush to $_44*/
			translate(v = [-4.5, -4.5, -24.5]) {
				rotate(a = [0, 19.471220634490674, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 22 from one.ctrl_s[0].hole to $_22*/
			translate(v = [-4.5, -4.5, -23.5]) {
				rotate(a = [0, 19.471220634490674, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 85 from one.ctrl_s[3].flush to one.devices[0].thingy.vs3.thing*/
			translate(v = [-5.5, -5.5, -10.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 86 from one.ctrl_s[3].hole to one.devices[0].thingy.vs3.thing*/
			translate(v = [-5.5, -5.5, -10.5]) {
				rotate(a = [0, 19.471220634490674, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 105 from $_105 to one.devices[0].thingy.v5.thing*/
			translate(v = [-4.5, -4.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 105 from $_105 to one.devices[0].thingy.v6.thing*/
			translate(v = [-1.5, -4.5, -14.5]) {
				rotate(a = [0, 53.96010656969614, -165.96375653207352]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*Edge 107 from $_107 to one.devices[0].thingy.vs2.thing*/
			translate(v = [-0.5, -4.5, -15.5]) {
				rotate(a = [0, 19.471220634490674, -45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 114 from one.devices[0].thingy.vp1.thing to one.devices[0].thingy.vp2.thing*/
			translate(v = [-5.5, 2.5, -11.5]) {
				rotate(a = [0, 160.52877936550934, -45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 115 from one.devices[0].thingy.vp2.thing to one.pump_a[2].hole*/
			translate(v = [-4.5, -0.5, -10.5]) {
				rotate(a = [0, 107.54840061379231, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 116 from one.devices[0].thingy.vp2.thing to one.pump_a[2].flush*/
			translate(v = [-4.5, -0.5, -11.5]) {
				rotate(a = [0, 90.0, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*Node one.ctrl_a[10].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[10].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[4].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[4].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[7].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -14.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[7].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -1.0, -11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[9].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -13.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[9].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -21.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -20.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.column_lower.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_105*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-6.0, -6.0, -12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_107*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0.0, -6.0, -12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.vp2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, 2.0, -12.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.vs3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6.0, -6.0, -11.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 55 from one.ctrl_a[10].flush to one.devices[0].thingy.v10.thing*/
			translate(v = [-6.5, -6.5, -6.5]) {
				rotate(a = [0, 154.7605981793211, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 56 from one.ctrl_a[10].hole to one.devices[0].thingy.v10.thing*/
			translate(v = [-6.5, -6.5, -6.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from one.ctrl_a[4].flush to one.devices[0].thingy.v4.thing*/
			translate(v = [-6.5, -6.5, -5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 68 from one.ctrl_a[4].hole to one.devices[0].thingy.v4.thing*/
			translate(v = [-6.5, -6.5, -5.5]) {
				rotate(a = [0, 154.7605981793211, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 73 from one.ctrl_a[7].flush to one.devices[0].thingy.v7.thing*/
			translate(v = [0.5, -6.5, -7.5]) {
				rotate(a = [0, 134.60755087935968, 170.5376777919744]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*Edge 74 from one.ctrl_a[7].hole to one.devices[0].thingy.v7.thing*/
			translate(v = [0.5, -6.5, -7.5]) {
				rotate(a = [0, 109.47122063449069, 135.0]) {
					cube(size = [0.125, 0.125, 9.0]);
				}
			}
			/*Edge 77 from one.ctrl_a[9].flush to one.devices[0].thingy.v9.thing*/
			translate(v = [0.5, -6.5, -6.5]) {
				rotate(a = [0, 134.60755087935968, 170.5376777919744]) {
					cube(size = [0.125, 0.125, 8.54400374531753]);
				}
			}
			/*Edge 78 from one.ctrl_a[9].hole to one.devices[0].thingy.v9.thing*/
			translate(v = [0.5, -6.5, -6.5]) {
				rotate(a = [0, 90.0, 170.5376777919744]) {
					cube(size = [0.125, 0.125, 6.082762530298219]);
				}
			}
			/*Edge 79 from one.ctrl_s[0].flush to one.devices[0].thingy.vs0.thing*/
			translate(v = [-6.5, -6.5, -14.5]) {
				rotate(a = [0, 166.73732399169518, 45.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*Edge 80 from one.ctrl_s[0].hole to one.devices[0].thingy.vs0.thing*/
			translate(v = [-6.5, -6.5, -14.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 87 from one.devices[0].thingy.circulate1.thing to one.devices[0].thingy.vp2.thing*/
			translate(v = [-5.5, 2.5, -11.5]) {
				rotate(a = [0, 13.262676008304837, -135.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*Edge 92 from one.devices[0].thingy.column_lower.thing to one.devices[0].thingy.vs0.thing*/
			translate(v = [-6.5, -6.5, -14.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 100 from one.devices[0].thingy.v10.thing to one.devices[0].thingy.vs3.thing*/
			translate(v = [-5.5, -5.5, -10.5]) {
				rotate(a = [0, 19.471220634490674, -135.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 105 from one.devices[0].thingy.v4.thing to $_105*/
			translate(v = [-5.5, -5.5, -11.5]) {
				rotate(a = [0, 13.262676008304837, -135.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*Edge 107 from one.devices[0].thingy.v7.thing to $_107*/
			translate(v = [0.5, -5.5, -11.5]) {
				rotate(a = [0, 14.036243467926484, -90.0]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
			/*Edge 107 from $_107 to one.devices[0].thingy.v9.thing*/
			translate(v = [0.5, -6.5, -6.5]) {
				rotate(a = [0, 168.6900675259798, 90.0]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*Node $_31*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -7.0, -10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -7.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -7.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_20*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -7.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_43*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -7.0, -8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_21*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -7.0, -9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -7.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -7.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -7.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -7.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -7.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -6.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-7.0, -7.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-7.0, -7.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.circulate1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-7.0, 1.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v10.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-7.0, -7.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v4.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-7.0, -7.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v7.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0.0, -7.0, -8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v9.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0.0, -7.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.vs0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-7.0, -7.0, -15.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*Edge 31 from one.ctrl_a[0].flush to $_31*/
			translate(v = [-6.5, -6.5, -9.5]) {
				rotate(a = [0, 10.024987862075765, -135.0]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 9 from one.ctrl_a[0].hole to $_9*/
			translate(v = [-6.5, -6.5, -4.5]) {
				rotate(a = [0, 164.20683095173604, -135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 42 from one.ctrl_a[11].flush to $_42*/
			translate(v = [-6.5, -6.5, -2.5]) {
				rotate(a = [0, 11.421753658962311, -135.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*Edge 20 from one.ctrl_a[11].hole to $_20*/
			translate(v = [-6.5, -6.5, -0.5]) {
				rotate(a = [0, 10.024987862075765, -135.0]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 43 from one.ctrl_a[12].flush to $_43*/
			translate(v = [-6.5, -6.5, -7.5]) {
				rotate(a = [0, 10.024987862075765, -135.0]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 21 from one.ctrl_a[12].hole to $_21*/
			translate(v = [-6.5, -6.5, -8.5]) {
				rotate(a = [0, 10.024987862075765, -135.0]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 32 from one.ctrl_a[1].flush to $_32*/
			translate(v = [-6.5, -6.5, -1.5]) {
				rotate(a = [0, 11.421753658962311, -135.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*Edge 10 from one.ctrl_a[1].hole to $_10*/
			translate(v = [-6.5, -6.5, 3.5]) {
				rotate(a = [0, 169.97501213792424, -135.0]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 33 from one.ctrl_a[2].flush to $_33*/
			translate(v = [-6.5, -6.5, -3.5]) {
				rotate(a = [0, 11.421753658962311, -135.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*Edge 11 from one.ctrl_a[2].hole to $_11*/
			translate(v = [-6.5, -6.5, 1.5]) {
				rotate(a = [0, 169.97501213792424, -135.0]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 34 from one.ctrl_a[3].flush to $_34*/
			translate(v = [-6.5, -6.5, 4.5]) {
				rotate(a = [0, 168.5782463410377, -135.0]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*Edge 12 from one.ctrl_a[3].hole to $_12*/
			translate(v = [-6.5, -5.5, 4.5]) {
				rotate(a = [0, 164.3838705949755, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 8.306623862918075]);
				}
			}
			/*Edge 39 from one.ctrl_a[8].flush to $_39*/
			translate(v = [-6.5, -6.5, 0.5]) {
				rotate(a = [0, 169.97501213792424, -135.0]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 17 from one.ctrl_a[8].hole to $_17*/
			translate(v = [-6.5, -6.5, 2.5]) {
				rotate(a = [0, 169.97501213792424, -135.0]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 88 from one.devices[0].thingy.circulate1.thing to $_88*/
			translate(v = [-7.5, 1.5, 0.5]) {
				rotate(a = [0, 170.5376777919744, 0.0]) {
					cube(size = [0.125, 0.125, 6.082762530298219]);
				}
			}
			/*Edge 88 from $_88 to one.devices[0].thingy.v7.thing*/
			translate(v = [0.5, -6.5, -7.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 13.856406460551018]);
				}
			}
			/*Edge 95 from $_95 to one.devices[0].thingy.vs0.thing*/
			translate(v = [-6.5, -6.5, -14.5]) {
				rotate(a = [0, 13.262676008304837, -135.0]) {
					cube(size = [0.125, 0.125, 6.164414002968976]);
				}
			}
			/*Edge 98 from $_98 to one.devices[0].thingy.v4.thing*/
			translate(v = [-6.5, -6.5, -5.5]) {
				rotate(a = [0, 10.024987862075765, -135.0]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 99 from one.devices[0].thingy.v10.thing to $_99*/
			translate(v = [-7.5, -7.5, 1.5]) {
				rotate(a = [0, 169.97501213792424, 45.0]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 99 from $_99 to one.devices[0].thingy.v9.thing*/
			translate(v = [0.5, -6.5, -6.5]) {
				rotate(a = [0, 45.222078889031444, -172.8749836510982]) {
					cube(size = [0.125, 0.125, 11.357816691600547]);
				}
			}
		}
	}
	/*Shell 7*/
	union() {
		%/*Nodes shell 7*/
		union() {
			/*Node one.ctrl_a[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -10.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[11].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, 4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[11].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, 7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[12].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[12].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[1].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, 5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[2].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, 3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[3].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[8].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -8.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[8].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8.0, -8.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_88*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8.0, 1.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_95*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8.0, -8.0, -9.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_98*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8.0, -8.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_99*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-8.0, -8.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*Edge 53 from one.ctrl_a[0].flush to one.devices[0].thingy.v0.thing*/
			translate(v = [-8.5, -8.5, -6.5]) {
				rotate(a = [0, 15.793169048263968, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 54 from one.ctrl_a[0].hole to one.devices[0].thingy.v0.thing*/
			translate(v = [-8.5, -8.5, -6.5]) {
				rotate(a = [0, 154.7605981793211, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 57 from one.ctrl_a[11].flush to one.devices[0].thingy.v11.thing*/
			translate(v = [-8.5, -8.5, 2.5]) {
				rotate(a = [0, 35.26438968275464, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 58 from one.ctrl_a[11].hole to one.devices[0].thingy.v11.thing*/
			translate(v = [-8.5, -8.5, 2.5]) {
				rotate(a = [0, 15.793169048263968, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 59 from one.ctrl_a[12].flush to one.devices[0].thingy.v12.thing*/
			translate(v = [-8.5, -8.5, -4.5]) {
				rotate(a = [0, 15.793169048263968, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 60 from one.ctrl_a[12].hole to one.devices[0].thingy.v12.thing*/
			translate(v = [-8.5, -8.5, -4.5]) {
				rotate(a = [0, 19.471220634490674, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 61 from one.ctrl_a[1].flush to one.devices[0].thingy.v1.thing*/
			translate(v = [-8.5, -8.5, 0.5]) {
				rotate(a = [0, 15.793169048263968, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 62 from one.ctrl_a[1].hole to one.devices[0].thingy.v1.thing*/
			translate(v = [-8.5, -8.5, 0.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 63 from one.ctrl_a[2].flush to one.devices[0].thingy.v2.thing*/
			translate(v = [-8.5, -8.5, -1.5]) {
				rotate(a = [0, 15.793169048263968, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 64 from one.ctrl_a[2].hole to one.devices[0].thingy.v2.thing*/
			translate(v = [-8.5, -8.5, -1.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 65 from one.ctrl_a[3].flush to one.devices[0].thingy.v3.thing*/
			translate(v = [-8.5, -8.5, 1.5]) {
				rotate(a = [0, 160.52877936550934, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 66 from one.ctrl_a[3].hole to one.devices[0].thingy.v3.thing*/
			translate(v = [-8.5, -8.5, 1.5]) {
				rotate(a = [0, 164.20683095173604, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 75 from one.ctrl_a[8].flush to one.devices[0].thingy.v8.thing*/
			translate(v = [-8.5, -2.5, -2.5]) {
				rotate(a = [0, 134.43824067114977, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*Edge 76 from one.ctrl_a[8].hole to one.devices[0].thingy.v8.thing*/
			translate(v = [-8.5, -2.5, -2.5]) {
				rotate(a = [0, 120.47035946597974, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*Edge 88 from $_88 to one.devices[0].thingy.v8.thing*/
			translate(v = [-8.5, -2.5, -2.5]) {
				rotate(a = [0, 53.96010656969614, 75.96375653207353]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*Edge 95 from one.devices[0].thingy.v0.thing to $_95*/
			translate(v = [-7.5, -7.5, -8.5]) {
				rotate(a = [0, 35.26438968275464, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 95 from $_95 to one.devices[0].thingy.v12.thing*/
			translate(v = [-8.5, -8.5, -4.5]) {
				rotate(a = [0, 160.52877936550934, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 98 from one.devices[0].thingy.v1.thing to $_98*/
			translate(v = [-7.5, -7.5, 2.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 98 from $_98 to one.devices[0].thingy.v2.thing*/
			translate(v = [-8.5, -8.5, -1.5]) {
				rotate(a = [0, 19.471220634490674, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 98 from $_98 to one.devices[0].thingy.v3.thing*/
			translate(v = [-8.5, -8.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 99 from $_99 to one.devices[0].thingy.v11.thing*/
			translate(v = [-8.5, -8.5, 2.5]) {
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
			/*Node one.devices[0].thingy.v0.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9.0, -9.0, -7.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v1.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9.0, -9.0, -0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v11.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9.0, -9.0, 2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v12.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9.0, -9.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v2.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9.0, -9.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v3.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9.0, -9.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.devices[0].thingy.v8.thing*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-9.0, -3.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*Edge 96 from one.devices[0].thingy.v0.thing to one.pinholes[0].out[3].hole*/
			translate(v = [-9.5, -9.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 97 from one.devices[0].thingy.v1.thing to one.pinholes[0].in[0].hole*/
			translate(v = [-9.5, -9.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 101 from one.devices[0].thingy.v11.thing to one.pinholes[0].out[2].hole*/
			translate(v = [-9.5, -9.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 102 from one.devices[0].thingy.v12.thing to one.pinholes[0].out[0].hole*/
			translate(v = [-9.5, -9.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 103 from one.devices[0].thingy.v2.thing to one.pinholes[0].in[1].hole*/
			translate(v = [-9.5, -9.5, -1.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 104 from one.devices[0].thingy.v3.thing to one.pinholes[0].in[2].hole*/
			translate(v = [-9.5, -7.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 108 from one.devices[0].thingy.v8.thing to one.pinholes[0].out[1].hole*/
			translate(v = [-9.5, -3.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 9*/
	union() {
		%/*Nodes shell 9*/
		union() {
			/*Node one.pinholes[0].in[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].in[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].in[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -8.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].out[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -4.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].out[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -4.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].out[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, 1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].out[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-10.0, -10.0, -6.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*Edge 2 from one.pinholes[0].in[0].hole to $_2*/
			translate(v = [-10.5, -8.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 3 from one.pinholes[0].in[1].hole to $_3*/
			translate(v = [-10.5, -10.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 4 from one.pinholes[0].in[2].hole to $_4*/
			translate(v = [-10.5, -6.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 5 from one.pinholes[0].out[0].hole to $_5*/
			translate(v = [-10.5, -10.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 6 from one.pinholes[0].out[1].hole to $_6*/
			translate(v = [-10.5, -3.5, -1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 7 from one.pinholes[0].out[2].hole to $_7*/
			translate(v = [-10.5, -10.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 8 from one.pinholes[0].out[3].hole to $_8*/
			translate(v = [-10.5, -10.5, -4.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
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
				translate(v = [-11.0, -9.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -11.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -7.0, -1.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -11.0, -3.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -4.0, -2.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -11.0, 0.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-11.0, -11.0, -5.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union();
	}
}
