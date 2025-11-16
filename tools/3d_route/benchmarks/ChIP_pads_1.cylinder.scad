translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_22*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [3, -3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_23*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [3, -1, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_44*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [3, -3, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_45*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [3, -3, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 22 from thingy.ctrl_stage_in_hole to $_22*/
			translate(v = [3.5, -2.5, -0.5]) {
				rotate(a = [0, 122.31153323742386, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 23 from thingy.ctrl_stage_out_hole to $_23*/
			translate(v = [3.5, -0.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 44 from thingy.flush_stage_in_hole to $_44*/
			translate(v = [3.5, -2.5, 0.5]) {
				rotate(a = [0, 154.7605981793211, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 45 from thingy.flush_stage_out_hole to $_45*/
			translate(v = [3.5, -2.5, 2.5]) {
				rotate(a = [0, 154.7605981793211, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
		}
	}
	/*Shell 1*/
	union() {
		%/*Nodes shell 1*/
		union() {
			/*Node thingy.ctrl_stage_in_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [4, 0, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_stage_out_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [4, -4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_in_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, -4, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_out_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, -4, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge 69 from thingy.ctrl_stage_in_hole to $_69*/
			translate(v = [5.5, -2.5, 0.5]) {
				rotate(a = [0, 133.491519345092, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 71 from thingy.ctrl_stage_out_hole to $_71*/
			translate(v = [5.5, -4.5, -2.5]) {
				rotate(a = [0, 25.239401820678914, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 90 from thingy.flush_stage_in_hole to $_90*/
			translate(v = [5.5, -4.5, 0.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 92 from thingy.flush_stage_out_hole to $_92*/
			translate(v = [4.5, -4.5, -2.5]) {
				rotate(a = [0, 26.56505117707799, 90.0]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_18*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [1, -5, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5, -1, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_69*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5, -3, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_71*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5, -5, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_21*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5, -3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5, -3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_20*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, -5, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -5, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_54*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [5, -3, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_55*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [3, -5, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_56*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, -5, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_46*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [5, -3, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_90*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5, -5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_92*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, -5, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_43*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [3, -5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [5, -3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [5, -5, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [3, -5, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5, -3, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5, -4, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 18 from thingy.ctrl_prep_inlet_hole to $_18*/
			translate(v = [1.5, -4.5, 2.5]) {
				rotate(a = [0, 133.491519345092, -18.43494882292201]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 24 from thingy.ctrl_sieve_hole to $_24*/
			translate(v = [5.5, -0.5, -6.5]) {
				rotate(a = [0, 133.491519345092, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 69 from $_69 to thingy.thingy.chamber[0].first.vring_in*/
			translate(v = [4.5, -5.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 71 from $_71 to thingy.thingy.chamber[0].first.vring_out*/
			translate(v = [4.5, -5.5, -5.5]) {
				rotate(a = [0, 25.239401820678914, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 21 from thingy.ctrl_sv1_hole to $_21*/
			translate(v = [5.5, -2.5, -0.5]) {
				rotate(a = [0, 46.50848065490801, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 19 from thingy.ctrl_v1_hole to $_19*/
			translate(v = [5.5, -2.5, 1.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 20 from thingy.ctrl_v2_hole to $_20*/
			translate(v = [2.5, -4.5, 3.5]) {
				rotate(a = [0, 133.491519345092, -18.43494882292201]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 40 from thingy.flush_prep_inlet_hole to $_40*/
			translate(v = [2.5, -4.5, 1.5]) {
				rotate(a = [0, 133.491519345092, -18.43494882292201]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 54 from thingy.flush_pump_pinholes[0].hole to $_54*/
			translate(v = [5.5, -2.5, -2.5]) {
				rotate(a = [0, 129.76215915180506, -123.69006752597979]) {
					cube(size = [0.125, 0.125, 4.69041575982343]);
				}
			}
			/*Edge 55 from thingy.flush_pump_pinholes[1].hole to $_55*/
			translate(v = [3.5, -4.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 56 from thingy.flush_pump_pinholes[2].hole to $_56*/
			translate(v = [0.5, -4.5, -2.5]) {
				rotate(a = [0, 154.7605981793211, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 46 from thingy.flush_sieve_hole to $_46*/
			translate(v = [5.5, -2.5, -6.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 90 from $_90 to thingy.thingy.chamber[0].first.vring_in*/
			translate(v = [4.5, -5.5, -2.5]) {
				rotate(a = [0, 25.239401820678914, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 92 from $_92 to thingy.thingy.chamber[0].first.vring_out*/
			translate(v = [4.5, -5.5, -5.5]) {
				rotate(a = [0, 18.434948822922017, 90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 43 from thingy.flush_sv1_hole to $_43*/
			translate(v = [3.5, -4.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 41 from thingy.flush_v1_hole to $_41*/
			translate(v = [5.5, -2.5, 3.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 42 from thingy.flush_v2_hole to $_42*/
			translate(v = [5.5, -4.5, -1.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 32 from thingy.pump_pinholes[0].hole to $_32*/
			translate(v = [3.5, -4.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 33 from thingy.pump_pinholes[1].hole to $_33*/
			translate(v = [5.5, -2.5, -1.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 34 from thingy.pump_pinholes[2].hole to $_34*/
			translate(v = [5.5, -3.5, -0.5]) {
				rotate(a = [0, 143.30077479951012, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
		}
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union() {
			/*Node thingy.ctrl_prep_inlet_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [4, -6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_sieve_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [6, -4, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_sv1_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [4, -6, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_v1_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [4, -6, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_v2_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [5, -6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_prep_inlet_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [5, -6, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_pump_pinholes[0].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, -6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_pump_pinholes[1].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [6, -2, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_pump_pinholes[2].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, -6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_sieve_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, -6, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_sv1_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [6, -2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_v1_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, -6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_v2_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, -6, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.pump_pinholes[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [6, -2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.pump_pinholes[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [4, -6, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.pump_pinholes[2].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [4, -6, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vring_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [4, -6, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vring_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [4, -6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 65 from thingy.ctrl_prep_inlet_hole to $_65*/
			translate(v = [7.5, -6.5, -3.5]) {
				rotate(a = [0, 46.50848065490801, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 68 from thingy.ctrl_sieve_hole to $_68*/
			translate(v = [3.5, -6.5, -12.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 73 from thingy.ctrl_sv1_hole to $_73*/
			translate(v = [7.5, -5.5, -0.5]) {
				rotate(a = [0, 45.0, 180.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 74 from thingy.ctrl_v1_hole to $_74*/
			translate(v = [7.5, -6.5, -4.5]) {
				rotate(a = [0, 46.50848065490801, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 75 from thingy.ctrl_v2_hole to $_75*/
			translate(v = [7.5, -6.5, 3.5]) {
				rotate(a = [0, 143.30077479951012, 153.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 83 from thingy.flush_prep_inlet_hole to $_83*/
			translate(v = [7.5, -5.5, -4.5]) {
				rotate(a = [0, 33.690067525979785, 180.0]) {
					cube(size = [0.125, 0.125, 3.605551275463989]);
				}
			}
			/*Edge 86 from thingy.flush_pump_pinholes[0].hole to $_86*/
			translate(v = [6.5, -6.5, -8.5]) {
				rotate(a = [0, 46.50848065490801, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 87 from thingy.flush_pump_pinholes[1].hole to $_87*/
			translate(v = [7.5, -4.5, -8.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 88 from thingy.flush_pump_pinholes[2].hole to $_88*/
			translate(v = [4.5, -6.5, -8.5]) {
				rotate(a = [0, 46.50848065490801, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 89 from thingy.flush_sieve_hole to $_89*/
			translate(v = [7.5, -6.5, -12.5]) {
				rotate(a = [0, 46.50848065490801, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 94 from thingy.flush_sv1_hole to $_94*/
			translate(v = [7.5, -4.5, -0.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 95 from thingy.flush_v1_hole to $_95*/
			translate(v = [7.5, -6.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 96 from thingy.flush_v2_hole to $_96*/
			translate(v = [7.5, -5.5, 3.5]) {
				rotate(a = [0, 123.6900675259798, 180.0]) {
					cube(size = [0.125, 0.125, 3.605551275463989]);
				}
			}
			/*Edge 105 from thingy.pump_pinholes[0].hole to $_105*/
			translate(v = [7.5, -3.5, -4.5]) {
				rotate(a = [0, 36.69922520048988, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 106 from thingy.pump_pinholes[1].hole to $_106*/
			translate(v = [7.5, -6.5, -7.5]) {
				rotate(a = [0, 46.50848065490801, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 107 from thingy.pump_pinholes[2].hole to $_107*/
			translate(v = [7.5, -6.5, -6.5]) {
				rotate(a = [0, 46.50848065490801, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 113 from $_113 to thingy.thingy.chamber[0].first.vring_in*/
			translate(v = [4.5, -5.5, -2.5]) {
				rotate(a = [0, 131.81031489577862, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*Edge 113 from $_113 to thingy.thingy.chamber[0].first.vring_out*/
			translate(v = [4.5, -5.5, -5.5]) {
				rotate(a = [0, 65.9051574478893, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 114 from thingy.thingy.chamber[0].first.vring_in to $_114*/
			translate(v = [7.5, -6.5, -0.5]) {
				rotate(a = [0, 122.31153323742386, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 115 from thingy.thingy.chamber[0].first.vring_out to $_115*/
			translate(v = [7.5, -6.5, -8.5]) {
				rotate(a = [0, 46.50848065490801, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*Node $_28*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, -7, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -7, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_13*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -5, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -6, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -3, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -3, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_65*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -7, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_30*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -4, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_31*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -7, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_68*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [3, -7, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_26*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -4, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -6, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_73*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_74*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -7, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_75*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -7, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -7, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -7, -14]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -2, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -3, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -7, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -2, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_83*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -6, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -2, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_53*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -7, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_86*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, -7, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_87*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -5, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_88*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -7, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_89*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -7, -13]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -5, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_49*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, -7, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_94*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_95*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -7, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_96*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -6, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_105*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -4, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_106*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -7, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_107*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -7, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_113*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -7, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_114*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [7, -7, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_115*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [7, -7, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_116*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [7, -3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_120*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [7, -7, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_121*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [7, -7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 28 from thingy.ctrl_bead_hole to $_28*/
			translate(v = [6.5, -6.5, -5.5]) {
				rotate(a = [0, 65.9051574478893, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 25 from thingy.ctrl_collect_hole to $_25*/
			translate(v = [7.5, -6.5, -10.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 13 from thingy.ctrl_inlet_pinholes[0].hole to $_13*/
			translate(v = [7.5, -4.5, -4.5]) {
				rotate(a = [0, 72.4515993862077, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 14 from thingy.ctrl_inlet_pinholes[1].hole to $_14*/
			translate(v = [7.5, -5.5, -8.5]) {
				rotate(a = [0, 48.189685104221404, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*Edge 15 from thingy.ctrl_inlet_pinholes[2].hole to $_15*/
			translate(v = [7.5, -2.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 16 from thingy.ctrl_inlet_pinholes[3].hole to $_16*/
			translate(v = [7.5, -2.5, -6.5]) {
				rotate(a = [0, 25.239401820678914, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 17 from thingy.ctrl_inlet_pinholes[4].hole to $_17*/
			translate(v = [7.5, -4.5, 0.5]) {
				rotate(a = [0, 72.4515993862077, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 65 from $_65 to thingy.thingy.prep.vin*/
			translate(v = [8.5, -7.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 30 from thingy.ctrl_prep_outlet_pinholes[0].hole to $_30*/
			translate(v = [7.5, -3.5, -5.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 31 from thingy.ctrl_prep_outlet_pinholes[1].hole to $_31*/
			translate(v = [7.5, -6.5, 2.5]) {
				rotate(a = [0, 154.7605981793211, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 68 from $_68 to thingy.thingy.chamber[0].first.vsieve*/
			translate(v = [4.5, -7.5, -9.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 26 from thingy.ctrl_stage_inlet_hole to $_26*/
			translate(v = [7.5, -3.5, -9.5]) {
				rotate(a = [0, 18.434948822922017, 0.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 27 from thingy.ctrl_stage_outlet_hole to $_27*/
			translate(v = [7.5, -5.5, -9.5]) {
				rotate(a = [0, 90.0, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 73 from $_73 to thingy.thingy.prep.sv1*/
			translate(v = [8.5, -3.5, 2.5]) {
				rotate(a = [0, 143.30077479951012, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 74 from $_74 to thingy.thingy.prep.v1*/
			translate(v = [8.5, -3.5, -2.5]) {
				rotate(a = [0, 122.31153323742386, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 75 from $_75 to thingy.thingy.prep.v2*/
			translate(v = [8.5, -4.5, 0.5]) {
				rotate(a = [0, 36.69922520048988, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 50 from thingy.flush_bead_hole to $_50*/
			translate(v = [7.5, -6.5, -9.5]) {
				rotate(a = [0, 35.26438968275464, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 47 from thingy.flush_collect_hole to $_47*/
			translate(v = [7.5, -6.5, -13.5]) {
				rotate(a = [0, 25.239401820678914, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 35 from thingy.flush_inlet_pinholes[0].hole to $_35*/
			translate(v = [7.5, -3.5, 0.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 36 from thingy.flush_inlet_pinholes[1].hole to $_36*/
			translate(v = [7.5, -1.5, -3.5]) {
				rotate(a = [0, 114.09484255211072, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 37 from thingy.flush_inlet_pinholes[2].hole to $_37*/
			translate(v = [7.5, -2.5, -4.5]) {
				rotate(a = [0, 25.239401820678914, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 38 from thingy.flush_inlet_pinholes[3].hole to $_38*/
			translate(v = [7.5, -6.5, -1.5]) {
				rotate(a = [0, 35.26438968275464, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 39 from thingy.flush_inlet_pinholes[4].hole to $_39*/
			translate(v = [7.5, -1.5, 0.5]) {
				rotate(a = [0, 65.9051574478893, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 83 from $_83 to thingy.thingy.prep.vin*/
			translate(v = [8.5, -7.5, -2.5]) {
				rotate(a = [0, 131.81031489577862, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*Edge 52 from thingy.flush_prep_outlet_pinholes[0].hole to $_52*/
			translate(v = [7.5, -1.5, -5.5]) {
				rotate(a = [0, 46.50848065490801, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 53 from thingy.flush_prep_outlet_pinholes[1].hole to $_53*/
			translate(v = [7.5, -6.5, 4.5]) {
				rotate(a = [0, 143.30077479951012, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 86 from $_86 to thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet*/
			translate(v = [8.5, -4.5, -5.5]) {
				rotate(a = [0, 136.68614334171696, -135.0]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
			/*Edge 87 from $_87 to thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			translate(v = [8.5, -7.5, -5.5]) {
				rotate(a = [0, 133.491519345092, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 88 from $_88 to thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			translate(v = [4.5, -7.5, -5.5]) {
				rotate(a = [0, 161.56505117707798, 90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 89 from $_89 to thingy.thingy.chamber[0].first.vsieve*/
			translate(v = [4.5, -7.5, -9.5]) {
				rotate(a = [0, 133.491519345092, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 48 from thingy.flush_stage_inlet_hole to $_48*/
			translate(v = [7.5, -4.5, -9.5]) {
				rotate(a = [0, 72.4515993862077, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 49 from thingy.flush_stage_outlet_hole to $_49*/
			translate(v = [4.5, -6.5, -9.5]) {
				rotate(a = [0, 18.434948822922017, -90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 94 from $_94 to thingy.thingy.prep.sv1*/
			translate(v = [8.5, -3.5, 2.5]) {
				rotate(a = [0, 154.7605981793211, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 95 from $_95 to thingy.thingy.prep.v1*/
			translate(v = [8.5, -3.5, -2.5]) {
				rotate(a = [0, 90.0, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 96 from $_96 to thingy.thingy.prep.v2*/
			translate(v = [8.5, -4.5, 0.5]) {
				rotate(a = [0, 25.239401820678914, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 105 from $_105 to thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet*/
			translate(v = [8.5, -4.5, -5.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 106 from $_106 to thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			translate(v = [8.5, -7.5, -5.5]) {
				rotate(a = [0, 144.73561031724537, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 107 from $_107 to thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			translate(v = [4.5, -7.5, -5.5]) {
				rotate(a = [0, 107.54840061379231, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 113 from thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet to $_113*/
			translate(v = [6.5, -6.5, -4.5]) {
				rotate(a = [0, 109.47122063449069, 45.0]) {
					cube(size = [0.125, 0.125, 3.0]);
				}
			}
			/*Edge 113 from $_113 to thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			translate(v = [4.5, -7.5, -5.5]) {
				rotate(a = [0, 65.9051574478893, 26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 114 from $_114 to thingy.thingy.prep.vout3*/
			translate(v = [8.5, -7.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 115 from $_115 to thingy.thingy.chamber[0].first.vsieve*/
			translate(v = [4.5, -7.5, -9.5]) {
				rotate(a = [0, 72.4515993862077, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 116 from thingy.thingy.prep.sv1 to $_116*/
			translate(v = [7.5, -2.5, -0.5]) {
				rotate(a = [0, 25.239401820678914, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 116 from $_116 to thingy.thingy.prep.v1*/
			translate(v = [8.5, -3.5, -2.5]) {
				rotate(a = [0, 35.26438968275464, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 116 from $_116 to thingy.thingy.prep.v2*/
			translate(v = [8.5, -4.5, 0.5]) {
				rotate(a = [0, 114.09484255211072, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 120 from thingy.thingy.prep.vout3 to $_120*/
			translate(v = [7.5, -6.5, 1.5]) {
				rotate(a = [0, 154.7605981793211, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 121 from thingy.thingy.prep.vout3 to $_121*/
			translate(v = [7.5, -6.5, 0.5]) {
				rotate(a = [0, 144.73561031724537, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*Node thingy.ctrl_bead_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [8, -8, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_collect_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [8, -8, -12]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [8, -8, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [8, -8, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[2].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [8, -4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[3].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [8, -4, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_inlet_pinholes[4].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [8, -8, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_prep_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [8, -4, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_prep_outlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [8, -8, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_stage_inlet_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [8, -4, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ctrl_stage_outlet_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [8, -8, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_bead_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, -8, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_collect_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, -8, -11]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, -4, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, -4, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[2].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, -4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[3].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, -8, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_inlet_pinholes[4].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, -4, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_prep_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, -5, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_prep_outlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, -5, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_inlet_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [8, -8, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.flush_stage_outlet_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, -8, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [8, -5, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [8, -8, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [4, -8, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vsieve*/
			color(alpha = 0.1, c = "black") {
				translate(v = [4, -8, -10]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.sv1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [8, -4, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [8, -4, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [8, -5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vin*/
			color(alpha = 0.1, c = "black") {
				translate(v = [8, -8, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vout3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [8, -8, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 58 from thingy.ctrl_bead_hole to $_58*/
			translate(v = [9.5, -8.5, -1.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 59 from thingy.ctrl_collect_hole to $_59*/
			translate(v = [9.5, -8.5, -8.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 60 from thingy.ctrl_inlet_pinholes[0].hole to $_60*/
			translate(v = [9.5, -8.5, -0.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 61 from thingy.ctrl_inlet_pinholes[1].hole to $_61*/
			translate(v = [9.5, -8.5, -3.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 62 from thingy.ctrl_inlet_pinholes[2].hole to $_62*/
			translate(v = [9.5, -4.5, -2.5]) {
				rotate(a = [0, 25.239401820678914, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 63 from thingy.ctrl_inlet_pinholes[3].hole to $_63*/
			translate(v = [9.5, -4.5, -0.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 64 from thingy.ctrl_inlet_pinholes[4].hole to $_64*/
			translate(v = [9.5, -4.5, 3.5]) {
				rotate(a = [0, 122.31153323742386, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 66 from thingy.ctrl_prep_outlet_pinholes[0].hole to $_66*/
			translate(v = [9.5, -1.5, -2.5]) {
				rotate(a = [0, 143.30077479951012, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 67 from thingy.ctrl_prep_outlet_pinholes[1].hole to $_67*/
			translate(v = [9.5, -8.5, 2.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 70 from thingy.ctrl_stage_inlet_hole to $_70*/
			translate(v = [9.5, -4.5, -3.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 72 from thingy.ctrl_stage_outlet_hole to $_72*/
			translate(v = [9.5, -8.5, -6.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 76 from thingy.flush_bead_hole to $_76*/
			translate(v = [9.5, -8.5, -4.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 77 from thingy.flush_collect_hole to $_77*/
			translate(v = [9.5, -8.5, -7.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 78 from thingy.flush_inlet_pinholes[0].hole to $_78*/
			translate(v = [9.5, -5.5, 2.5]) {
				rotate(a = [0, 143.30077479951012, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 79 from thingy.flush_inlet_pinholes[1].hole to $_79*/
			translate(v = [9.5, -4.5, -1.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 80 from thingy.flush_inlet_pinholes[2].hole to $_80*/
			translate(v = [9.5, -4.5, 1.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 81 from thingy.flush_inlet_pinholes[3].hole to $_81*/
			translate(v = [9.5, -8.5, -2.5]) {
				rotate(a = [0, 25.239401820678914, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 82 from thingy.flush_inlet_pinholes[4].hole to $_82*/
			translate(v = [9.5, -4.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 84 from thingy.flush_prep_outlet_pinholes[0].hole to $_84*/
			translate(v = [9.5, -1.5, 0.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 85 from thingy.flush_prep_outlet_pinholes[1].hole to $_85*/
			translate(v = [9.5, -4.5, 0.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 91 from thingy.flush_stage_inlet_hole to $_91*/
			translate(v = [9.5, -8.5, -5.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 93 from thingy.flush_stage_outlet_hole to $_93*/
			translate(v = [5.5, -8.5, -3.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 110 from $_110 to thingy.thingy.chamber[0].first.vpump1.valves[0].vinlet*/
			translate(v = [8.5, -4.5, -5.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 110 from $_110 to thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			translate(v = [8.5, -7.5, -5.5]) {
				rotate(a = [0, 72.4515993862077, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 111 from $_111 to thingy.thingy.chamber[0].first.vsieve*/
			translate(v = [4.5, -7.5, -9.5]) {
				rotate(a = [0, 25.239401820678914, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 112 from $_112 to thingy.thingy.chamber[0].first.vpump2.valves[0].vinlet*/
			translate(v = [8.5, -7.5, -5.5]) {
				rotate(a = [0, 46.50848065490801, -161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 112 from $_112 to thingy.thingy.chamber[0].first.vpump3.valves[0].vinlet*/
			translate(v = [4.5, -7.5, -5.5]) {
				rotate(a = [0, 25.239401820678914, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 117 from thingy.thingy.prep.sv1 to $_117*/
			translate(v = [9.5, -5.5, -0.5]) {
				rotate(a = [0, 36.69922520048988, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 117 from $_117 to thingy.thingy.prep.v2*/
			translate(v = [8.5, -4.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from $_117 to thingy.thingy.prep.vout3*/
			translate(v = [8.5, -7.5, -1.5]) {
				rotate(a = [0, 65.9051574478893, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 118 from thingy.thingy.prep.v1 to $_118*/
			translate(v = [9.5, -5.5, 0.5]) {
				rotate(a = [0, 143.30077479951012, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 118 from $_118 to thingy.thingy.prep.vin*/
			translate(v = [8.5, -7.5, -2.5]) {
				rotate(a = [0, 36.69922520048988, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 119 from thingy.thingy.prep.vin to $_119*/
			translate(v = [9.5, -8.5, 0.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*Node $_58*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -9, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_59*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -9, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_60*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -9, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_61*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -9, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_62*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -5, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_63*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_64*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -5, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_66*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -2, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_67*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_70*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -5, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_72*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -9, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_76*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -9, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_77*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -9, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_78*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [9, -6, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_79*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [9, -5, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_80*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [9, -5, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_81*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [9, -9, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_82*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [9, -5, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_84*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [9, -2, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_85*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [9, -5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_91*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [9, -9, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_93*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5, -9, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_110*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [9, -5, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_111*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [5, -9, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_112*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [5, -9, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_117*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [9, -6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_118*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [9, -6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_119*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [9, -9, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*Edge 58 from $_58 to thingy.thingy.chamber[0].first.vbead*/
			translate(v = [10.5, -5.5, -1.5]) {
				rotate(a = [0, 90.0, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 59 from $_59 to thingy.thingy.chamber[0].first.vcollect*/
			translate(v = [6.5, -9.5, -5.5]) {
				rotate(a = [0, 133.491519345092, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 60 from $_60 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [10.5, -5.5, -0.5]) {
				rotate(a = [0, 90.0, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 61 from $_61 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [10.5, -5.5, -2.5]) {
				rotate(a = [0, 107.54840061379231, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 62 from $_62 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [10.5, -6.5, 0.5]) {
				rotate(a = [0, 143.30077479951012, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 63 from $_63 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [10.5, -7.5, 0.5]) {
				rotate(a = [0, 107.54840061379231, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 64 from $_64 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [10.5, -5.5, 0.5]) {
				rotate(a = [0, 25.239401820678914, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 66 from $_66 to thingy.thingy.prep.vout1*/
			translate(v = [10.5, -3.5, 0.5]) {
				rotate(a = [0, 143.30077479951012, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 67 from $_67 to thingy.thingy.prep.vout2*/
			translate(v = [10.5, -6.5, -0.5]) {
				rotate(a = [0, 36.69922520048988, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 70 from $_70 to thingy.thingy.chamber[0].first.vinlet*/
			translate(v = [10.5, -5.5, -3.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 72 from $_72 to thingy.thingy.chamber[0].first.voutlet*/
			translate(v = [6.5, -9.5, -3.5]) {
				rotate(a = [0, 133.491519345092, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 76 from $_76 to thingy.thingy.chamber[0].first.vbead*/
			translate(v = [10.5, -5.5, -1.5]) {
				rotate(a = [0, 133.491519345092, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 77 from $_77 to thingy.thingy.chamber[0].first.vcollect*/
			translate(v = [6.5, -9.5, -5.5]) {
				rotate(a = [0, 122.31153323742386, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 78 from $_78 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [10.5, -5.5, -0.5]) {
				rotate(a = [0, 18.434948822922017, 180.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 79 from $_79 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [10.5, -5.5, -2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 80 from $_80 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [10.5, -6.5, 0.5]) {
				rotate(a = [0, 65.9051574478893, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 81 from $_81 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [10.5, -7.5, 0.5]) {
				rotate(a = [0, 154.7605981793211, -135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 82 from $_82 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [10.5, -5.5, 0.5]) {
				rotate(a = [0, 35.26438968275464, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 84 from $_84 to thingy.thingy.prep.vout1*/
			translate(v = [10.5, -3.5, 0.5]) {
				rotate(a = [0, 90.0, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 85 from $_85 to thingy.thingy.prep.vout2*/
			translate(v = [10.5, -6.5, -0.5]) {
				rotate(a = [0, 65.9051574478893, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 91 from $_91 to thingy.thingy.chamber[0].first.vinlet*/
			translate(v = [10.5, -5.5, -3.5]) {
				rotate(a = [0, 122.31153323742386, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 93 from $_93 to thingy.thingy.chamber[0].first.voutlet*/
			translate(v = [6.5, -9.5, -3.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 110 from thingy.thingy.chamber[0].first.vbead to $_110*/
			translate(v = [9.5, -4.5, -4.5]) {
				rotate(a = [0, 25.239401820678914, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 110 from $_110 to thingy.thingy.chamber[0].first.vinlet*/
			translate(v = [10.5, -5.5, -3.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 111 from thingy.thingy.chamber[0].first.vcollect to $_111*/
			translate(v = [5.5, -8.5, -6.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 112 from thingy.thingy.chamber[0].first.voutlet to $_112*/
			translate(v = [5.5, -8.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from $_117 to thingy.thingy.prep.vout2*/
			translate(v = [10.5, -6.5, -0.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 118 from $_118 to thingy.thingy.prep.vout1*/
			translate(v = [10.5, -3.5, 0.5]) {
				rotate(a = [0, 90.0, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 119 from $_119 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [10.5, -5.5, -0.5]) {
				rotate(a = [0, 72.4515993862077, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 119 from $_119 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [10.5, -5.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 119 from $_119 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [10.5, -6.5, 0.5]) {
				rotate(a = [0, 90.0, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.23606797749979]);
				}
			}
			/*Edge 119 from $_119 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [10.5, -7.5, 0.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 119 from $_119 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [10.5, -5.5, 0.5]) {
				rotate(a = [0, 90.0, -108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
		}
	}
	/*Shell 7*/
	union() {
		%/*Nodes shell 7*/
		union() {
			/*Node thingy.thingy.chamber[0].first.vbead*/
			color(alpha = 0.1, c = "black") {
				translate(v = [10, -6, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vcollect*/
			color(alpha = 0.1, c = "black") {
				translate(v = [6, -10, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [10, -6, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.chamber[0].first.voutlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [6, -10, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vout1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [10, -4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.prep.vout2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [10, -7, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[0].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [10, -6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[1].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [10, -6, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[2].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [10, -7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[3].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [10, -8, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.thingy.vinlet.valves[4].vinlet*/
			color(alpha = 0.1, c = "black") {
				translate(v = [10, -6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*Edge 57 from $_57 to thingy.thingy.chamber[0].first.vcollect*/
			translate(v = [6.5, -9.5, -5.5]) {
				rotate(a = [0, 36.69922520048988, -153.43494882292202]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 97 from $_97 to thingy.thingy.chamber[0].first.vbead*/
			translate(v = [10.5, -5.5, -1.5]) {
				rotate(a = [0, 18.434948822922017, 0.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 98 from $_98 to thingy.thingy.vinlet.valves[0].vinlet*/
			translate(v = [10.5, -5.5, -0.5]) {
				rotate(a = [0, 35.26438968275464, -45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 99 from $_99 to thingy.thingy.vinlet.valves[1].vinlet*/
			translate(v = [10.5, -5.5, -2.5]) {
				rotate(a = [0, 25.239401820678914, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 100 from $_100 to thingy.thingy.vinlet.valves[2].vinlet*/
			translate(v = [10.5, -6.5, 0.5]) {
				rotate(a = [0, 154.7605981793211, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 101 from $_101 to thingy.thingy.vinlet.valves[3].vinlet*/
			translate(v = [10.5, -7.5, 0.5]) {
				rotate(a = [0, 133.491519345092, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 102 from $_102 to thingy.thingy.vinlet.valves[4].vinlet*/
			translate(v = [10.5, -5.5, 0.5]) {
				rotate(a = [0, 154.7605981793211, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 103 from $_103 to thingy.thingy.prep.vout1*/
			translate(v = [10.5, -3.5, 0.5]) {
				rotate(a = [0, 143.30077479951012, -63.43494882292201]) {
					cube(size = [0.125, 0.125, 3.7416573867739413]);
				}
			}
			/*Edge 104 from $_104 to thingy.thingy.prep.vout2*/
			translate(v = [10.5, -6.5, -0.5]) {
				rotate(a = [0, 46.50848065490801, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 108 from $_108 to thingy.thingy.chamber[0].first.vinlet*/
			translate(v = [10.5, -5.5, -3.5]) {
				rotate(a = [0, 18.434948822922017, 0.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 109 from $_109 to thingy.thingy.chamber[0].first.voutlet*/
			translate(v = [6.5, -9.5, -3.5]) {
				rotate(a = [0, 18.434948822922017, -90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
		}
	}
	/*Shell 8*/
	union() {
		%/*Nodes shell 8*/
		union() {
			/*Node $_57*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -11, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_97*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [11, -6, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_98*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [11, -7, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_99*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [11, -7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_100*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [11, -8, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_101*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [11, -11, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_102*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [11, -7, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_103*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [11, -6, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_104*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [11, -4, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_108*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [11, -6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_109*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -11, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*Edge 57 from thingy.collect_pinholes[0].hole to $_57*/
			translate(v = [4.5, -10.5, -2.5]) {
				rotate(a = [0, 18.434948822922017, -90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 97 from thingy.hole to $_97*/
			translate(v = [11.5, -5.5, 1.5]) {
				rotate(a = [0, 161.56505117707798, 0.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 98 from thingy.prep_inlet_pinholes[0].hole to $_98*/
			translate(v = [11.5, -6.5, 1.5]) {
				rotate(a = [0, 133.491519345092, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 99 from thingy.prep_inlet_pinholes[1].hole to $_99*/
			translate(v = [11.5, -6.5, 0.5]) {
				rotate(a = [0, 133.491519345092, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 100 from thingy.prep_inlet_pinholes[2].hole to $_100*/
			translate(v = [11.5, -7.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 101 from thingy.prep_inlet_pinholes[3].hole to $_101*/
			translate(v = [11.5, -10.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 102 from thingy.prep_inlet_pinholes[4].hole to $_102*/
			translate(v = [11.5, -6.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 103 from thingy.prep_outlet_pinholes[0].hole to $_103*/
			translate(v = [11.5, -5.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 104 from thingy.prep_outlet_pinholes[1].hole to $_104*/
			translate(v = [11.5, -3.5, 2.5]) {
				rotate(a = [0, 161.56505117707798, 0.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 108 from thingy.ring_inlet_pinholes[0].hole to $_108*/
			translate(v = [11.5, -5.5, -0.5]) {
				rotate(a = [0, 18.434948822922017, 0.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 109 from thingy.ring_outlet_pinholes[0].hole to $_109*/
			translate(v = [6.5, -10.5, -0.5]) {
				rotate(a = [0, 18.434948822922017, -90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
		}
	}
	/*Shell 9*/
	union() {
		%/*Nodes shell 9*/
		union() {
			/*Node thingy.collect_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [4, -12, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [12, -6, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [12, -4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [12, -4, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[2].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [12, -5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [12, -8, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_inlet_pinholes[4].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [12, -4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [12, -3, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.prep_outlet_pinholes[1].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [12, -4, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ring_inlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [12, -6, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node thingy.ring_outlet_pinholes[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [6, -12, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*Edge 11 from thingy.collect_pinholes[0].hole to $_11*/
			translate(v = [4.5, -12.5, -2.5]) {
				rotate(a = [0, 18.434948822922017, 90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 12 from thingy.hole to $_12*/
			translate(v = [13.5, -8.5, -4.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 2 from thingy.prep_inlet_pinholes[0].hole to $_2*/
			translate(v = [13.5, -6.5, -4.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 3 from thingy.prep_inlet_pinholes[1].hole to $_3*/
			translate(v = [13.5, -6.5, -5.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 4 from thingy.prep_inlet_pinholes[2].hole to $_4*/
			translate(v = [13.5, -7.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 5 from thingy.prep_inlet_pinholes[3].hole to $_5*/
			translate(v = [13.5, -10.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 6 from thingy.prep_inlet_pinholes[4].hole to $_6*/
			translate(v = [13.5, -6.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 8 from thingy.prep_outlet_pinholes[0].hole to $_8*/
			translate(v = [13.5, -5.5, -2.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 9 from thingy.prep_outlet_pinholes[1].hole to $_9*/
			translate(v = [13.5, -6.5, -3.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 7 from thingy.ring_inlet_pinholes[0].hole to $_7*/
			translate(v = [13.5, -8.5, -0.5]) {
				rotate(a = [0, 46.50848065490801, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 10 from thingy.ring_outlet_pinholes[0].hole to $_10*/
			translate(v = [6.5, -12.5, -0.5]) {
				rotate(a = [0, 18.434948822922017, 90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
		}
	}
	/*Shell 10*/
	union() {
		%/*Nodes shell 10*/
		union() {
			/*Node $_11*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, -13, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [13, -9, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_2*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [13, -7, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [13, -7, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [13, -8, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [13, -11, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [13, -7, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [13, -6, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [13, -7, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [13, -9, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, -13, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union();
	}
}
