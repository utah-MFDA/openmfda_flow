translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_28*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [1, -1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1, 1, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_29*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [1, -1, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_30*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-1, 1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [1, 1, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, -1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_31*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-1, -1, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 1, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-1, -1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 28 from bank.pump1_flush_hole to $_28*/
			translate(v = [1.5, -0.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 15 from bank.pump1_hole to $_15*/
			translate(v = [-0.5, 1.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 29 from bank.pump2_flush_hole to $_29*/
			translate(v = [0.5, 1.5, -0.5]) {
				rotate(a = [0, 135.0, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 16 from bank.pump2_hole to $_16*/
			translate(v = [1.5, -0.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 30 from bank.pump3_flush_hole to $_30*/
			translate(v = [-0.5, 1.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 17 from bank.pump3_hole to $_17*/
			translate(v = [1.5, 1.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 18 from bank.sep_ctrl_hole to $_18*/
			translate(v = [0.5, -0.5, -0.5]) {
				rotate(a = [0, 135.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 31 from bank.sep_flush_hole to $_31*/
			translate(v = [-0.5, -0.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 19 from bank.sieve_ctrl_hole to $_19*/
			translate(v = [0.5, 1.5, 1.5]) {
				rotate(a = [0, 45.00000000000001, 90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 32 from bank.sieve_flush_hole to $_32*/
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
			/*Node bank.pump1_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [2, -2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.pump1_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-2, 2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.pump2_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [0, 2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.pump2_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [2, -2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.pump3_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-2, 2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.pump3_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [2, 2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.sep_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [0, -2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.sep_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-2, -2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.sieve_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [0, 2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.sieve_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-2, -2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge 56 from bank.pump1_flush_hole to $_56*/
			translate(v = [1.5, -0.5, -2.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 57 from bank.pump1_hole to $_57*/
			translate(v = [-0.5, 3.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 58 from bank.pump2_flush_hole to $_58*/
			translate(v = [1.5, 3.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from bank.pump2_hole to $_59*/
			translate(v = [3.5, -0.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 60 from bank.pump3_flush_hole to $_60*/
			translate(v = [-0.5, 3.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 61 from bank.pump3_hole to $_61*/
			translate(v = [1.5, 3.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 65 from bank.sep_ctrl_hole to $_65*/
			translate(v = [-0.5, -0.5, -2.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 66 from bank.sep_flush_hole to $_66*/
			translate(v = [-2.5, -0.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 67 from bank.sieve_ctrl_hole to $_67*/
			translate(v = [0.5, 3.5, 1.5]) {
				rotate(a = [0, 45.00000000000001, -90.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 68 from bank.sieve_flush_hole to $_68*/
			translate(v = [-2.5, -0.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_21*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [1, -3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-2, 3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_22*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [3, 3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [1, 3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_23*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3, 3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3, -3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, -3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [3, 3, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_13*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1, -3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_26*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-1, 3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_56*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [1, -1, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_57*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1, 3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_58*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [1, 3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_59*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [3, -1, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_60*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-1, 3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_61*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [1, 3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [3, -3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [3, 0, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_65*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-1, -1, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_66*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3, -1, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_67*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_68*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-3, -1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_20*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-2, -3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, -3, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 21 from bank.beads_ctrl_hole to $_21*/
			translate(v = [1.5, -2.5, 3.5]) {
				rotate(a = [0, 132.87598866663575, 158.19859051364818]) {
					cube(size = [0.125, 0.125, 7.3484692283495345]);
				}
			}
			/*Edge 34 from bank.beads_flush_hole to $_34*/
			translate(v = [-1.5, 3.5, 3.5]) {
				rotate(a = [0, 102.60438264837919, -116.56505117707799]) {
					cube(size = [0.125, 0.125, 4.58257569495584]);
				}
			}
			/*Edge 22 from bank.cells_in_ctrl_hole to $_22*/
			translate(v = [3.5, 3.5, 3.5]) {
				rotate(a = [0, 147.68846676257616, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*Edge 35 from bank.cells_in_flush_hole to $_35*/
			translate(v = [1.5, 3.5, 3.5]) {
				rotate(a = [0, 139.68445778922742, -45.0]) {
					cube(size = [0.125, 0.125, 6.557438524302]);
				}
			}
			/*Edge 23 from bank.cells_out_ctrl_hole to $_23*/
			translate(v = [2.5, 3.5, 3.5]) {
				rotate(a = [0, 140.49028771380608, 165.96375653207352]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*Edge 36 from bank.cells_out_flush_hole to $_36*/
			translate(v = [0.5, 3.5, 3.5]) {
				rotate(a = [0, 135.0, -143.13010235415598]) {
					cube(size = [0.125, 0.125, 7.0710678118654755]);
				}
			}
			/*Edge 11 from bank.collect_ctrl_hole to $_11*/
			translate(v = [-2.5, 3.5, 3.5]) {
				rotate(a = [0, 134.43824067114977, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*Edge 24 from bank.collect_flush_hole to $_24*/
			translate(v = [-2.5, -2.5, 3.5]) {
				rotate(a = [0, 134.43824067114977, 101.30993247402021]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*Edge 12 from bank.lysis_in_ctrl_hole to $_12*/
			translate(v = [0.5, -2.5, 3.5]) {
				rotate(a = [0, 131.4729343089405, 135.0]) {
					cube(size = [0.125, 0.125, 7.54983443527075]);
				}
			}
			/*Edge 25 from bank.lysis_in_flush_hole to $_25*/
			translate(v = [3.5, 3.5, 2.5]) {
				rotate(a = [0, 134.13174921203108, 165.96375653207352]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*Edge 13 from bank.lysis_out_ctrl_hole to $_13*/
			translate(v = [-0.5, -2.5, 3.5]) {
				rotate(a = [0, 127.9851672993556, 38.65980825409009]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 26 from bank.lysis_out_flush_hole to $_26*/
			translate(v = [-0.5, 3.5, 3.5]) {
				rotate(a = [0, 147.68846676257616, 18.43494882292201]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*Edge 56 from $_56 to bank.thing.devices[0].thingy.vpump1*/
			translate(v = [0.5, 4.5, 2.5]) {
				rotate(a = [0, 134.43824067114977, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*Edge 57 from $_57 to bank.thing.devices[0].thingy.vpump1*/
			translate(v = [0.5, 4.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 58 from $_58 to bank.thing.devices[0].thingy.vpump2*/
			translate(v = [0.5, 4.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 59 from $_59 to bank.thing.devices[0].thingy.vpump2*/
			translate(v = [0.5, 4.5, 0.5]) {
				rotate(a = [0, 80.26852452684238, -59.03624346792648]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*Edge 60 from $_60 to bank.thing.devices[0].thingy.vpump3*/
			translate(v = [0.5, 4.5, 1.5]) {
				rotate(a = [0, 144.73561031724537, -135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 61 from $_61 to bank.thing.devices[0].thingy.vpump3*/
			translate(v = [0.5, 4.5, 1.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 14 from bank.push_ctrl_hole to $_14*/
			translate(v = [3.5, -2.5, 3.5]) {
				rotate(a = [0, 101.0958032831364, 78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 27 from bank.push_flush_hole to $_27*/
			translate(v = [3.5, 0.5, 3.5]) {
				rotate(a = [0, 155.9051574478893, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 5.477225575051661]);
				}
			}
			/*Edge 65 from $_65 to bank.thing.devices[0].thingy.vsep*/
			translate(v = [-3.5, 2.5, 2.5]) {
				rotate(a = [0, 139.68445778922742, -45.0]) {
					cube(size = [0.125, 0.125, 6.557438524302]);
				}
			}
			/*Edge 66 from $_66 to bank.thing.devices[0].thingy.vsep*/
			translate(v = [-3.5, 2.5, 2.5]) {
				rotate(a = [0, 107.54840061379231, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 67 from $_67 to bank.thing.devices[0].thingy.vsieve*/
			translate(v = [-3.5, -1.5, 2.5]) {
				rotate(a = [0, 98.87639508097335, 51.34019174590991]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*Edge 68 from $_68 to bank.thing.devices[0].thingy.vsieve*/
			translate(v = [-3.5, -1.5, 2.5]) {
				rotate(a = [0, 154.7605981793211, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 20 from bank.waste_ctrl_hole to $_20*/
			translate(v = [-1.5, -2.5, 3.5]) {
				rotate(a = [0, 155.9051574478893, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 5.477225575051661]);
				}
			}
			/*Edge 33 from bank.waste_flush_hole to $_33*/
			translate(v = [2.5, -2.5, 3.5]) {
				rotate(a = [0, 134.43824067114977, -168.6900675259798]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
		}
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union() {
			/*Node bank.beads_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-4, -1, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.beads_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-4, -1, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_in_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [0, 4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_in_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 0, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_out_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-2, 4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_out_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-4, 0, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.collect_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-4, -2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.collect_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-4, 2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_in_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [-4, 1, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_in_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-1, 4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_out_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [4, 1, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_out_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [2, 4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.push_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [4, 2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.push_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [4, 2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vpump1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0, 4, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vpump2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0, 4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vpump3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0, 4, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vsep*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4, 2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vsieve*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-4, -2, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.waste_ctrl_hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [0, -4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.waste_flush_hole*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-3, -4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 37 from bank.beads_ctrl_hole to $_37*/
			translate(v = [-4.5, 2.5, 1.5]) {
				rotate(a = [0, 133.491519345092, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 38 from bank.beads_flush_hole to $_38*/
			translate(v = [-4.5, 2.5, 5.5]) {
				rotate(a = [0, 133.491519345092, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 41 from bank.cells_in_ctrl_hole to $_41*/
			translate(v = [-2.5, 5.5, -4.5]) {
				rotate(a = [0, 46.50848065490801, -18.43494882292201]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 42 from bank.cells_in_flush_hole to $_42*/
			translate(v = [1.5, 1.5, -4.5]) {
				rotate(a = [0, 46.50848065490801, -18.43494882292201]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 44 from bank.cells_out_ctrl_hole to $_44*/
			translate(v = [-4.5, 1.5, -1.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 45 from bank.cells_out_flush_hole to $_45*/
			translate(v = [-4.5, 3.5, -4.5]) {
				rotate(a = [0, 46.50848065490801, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 47 from bank.collect_ctrl_hole to $_47*/
			translate(v = [-4.5, 1.5, -4.5]) {
				rotate(a = [0, 46.50848065490801, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 48 from bank.collect_flush_hole to $_48*/
			translate(v = [-4.5, 5.5, -4.5]) {
				rotate(a = [0, 46.50848065490801, -71.56505117707799]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 52 from bank.lysis_in_ctrl_hole to $_52*/
			translate(v = [-4.5, 2.5, -4.5]) {
				rotate(a = [0, 25.239401820678914, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 53 from bank.lysis_in_flush_hole to $_53*/
			translate(v = [-0.5, 5.5, -4.5]) {
				rotate(a = [0, 18.434948822922017, -90.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 54 from bank.lysis_out_ctrl_hole to $_54*/
			translate(v = [5.5, 1.5, -4.5]) {
				rotate(a = [0, 18.434948822922017, 180.0]) {
					cube(size = [0.125, 0.125, 3.1622776601683795]);
				}
			}
			/*Edge 55 from bank.lysis_out_flush_hole to $_55*/
			translate(v = [5.5, 5.5, -4.5]) {
				rotate(a = [0, 46.50848065490801, -161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 62 from bank.push_ctrl_hole to $_62*/
			translate(v = [1.5, 5.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 63 from bank.push_flush_hole to $_63*/
			translate(v = [1.5, 5.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 69 from $_69 to bank.thing.devices[0].thingy.vsep*/
			translate(v = [-3.5, 2.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 69 from $_69 to bank.thing.devices[0].thingy.vsieve*/
			translate(v = [-3.5, -1.5, 2.5]) {
				rotate(a = [0, 107.54840061379231, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 70 from $_70 to bank.thing.devices[0].thingy.vpump1*/
			translate(v = [0.5, 4.5, 2.5]) {
				rotate(a = [0, 133.491519345092, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 70 from $_70 to bank.thing.devices[0].thingy.vpump2*/
			translate(v = [0.5, 4.5, 0.5]) {
				rotate(a = [0, 107.54840061379231, 161.56505117707798]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 71 from $_71 to bank.thing.devices[0].thingy.vsieve*/
			translate(v = [-3.5, -1.5, 2.5]) {
				rotate(a = [0, 133.491519345092, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 4.358898943540674]);
				}
			}
			/*Edge 72 from $_72 to bank.thing.devices[0].thingy.vpump1*/
			translate(v = [0.5, 4.5, 2.5]) {
				rotate(a = [0, 154.7605981793211, 135.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 72 from $_72 to bank.thing.devices[0].thingy.vpump3*/
			translate(v = [0.5, 4.5, 1.5]) {
				rotate(a = [0, 144.73561031724537, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 72 from $_72 to bank.thing.devices[0].thingy.vsep*/
			translate(v = [-3.5, 2.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 73 from $_73 to bank.thing.devices[0].thingy.vpump2*/
			translate(v = [0.5, 4.5, 0.5]) {
				rotate(a = [0, 144.73561031724537, 45.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 73 from $_73 to bank.thing.devices[0].thingy.vpump3*/
			translate(v = [0.5, 4.5, 1.5]) {
				rotate(a = [0, 154.7605981793211, 45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 74 from $_74 to bank.waste_ctrl_hole*/
			translate(v = [0.5, -3.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 75 from $_75 to bank.waste_flush_hole*/
			translate(v = [-2.5, -3.5, -1.5]) {
				rotate(a = [0, 129.76215915180506, 123.69006752597979]) {
					cube(size = [0.125, 0.125, 4.69041575982343]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*Node $_37*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5, 2, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5, 2, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3, 5, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [1, 1, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_44*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5, 1, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_45*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5, 3, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5, 1, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5, 5, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-5, 2, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_53*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-1, 5, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_54*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [5, 1, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_55*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [5, 5, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_62*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [1, 5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_63*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [1, 5, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_69*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-5, 1, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_70*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-3, 5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_71*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-5, 1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_72*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [-1, 5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_73*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 5, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_74*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [-3, -1, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_75*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [-5, -1, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 37 from $_37 to bank.thing.devices[0].thingy.vbead_in*/
			translate(v = [-5.5, 2.5, 1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 37 from $_37 to bank.thing.devices[0].thingy.vbead_out*/
			translate(v = [-5.5, 6.5, 1.5]) {
				rotate(a = [0, 90.0, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
			/*Edge 38 from $_38 to bank.thing.devices[0].thingy.vbead_in*/
			translate(v = [-5.5, 2.5, 1.5]) {
				rotate(a = [0, 14.036243467926484, 0.0]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
			/*Edge 38 from $_38 to bank.thing.devices[0].thingy.vbead_out*/
			translate(v = [-5.5, 6.5, 1.5]) {
				rotate(a = [0, 45.868250787968954, -75.96375653207353]) {
					cube(size = [0.125, 0.125, 5.744562646538029]);
				}
			}
			/*Edge 41 from $_41 to bank.thing.devices[0].thingy.vcell_in*/
			translate(v = [2.5, 6.5, -5.5]) {
				rotate(a = [0, 78.90419671686361, -168.6900675259798]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 42 from $_42 to bank.thing.devices[0].thingy.vcell_in*/
			translate(v = [2.5, 6.5, -5.5]) {
				rotate(a = [0, 78.90419671686361, -101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 44 from $_44 to bank.thing.devices[0].thingy.vcell_out*/
			translate(v = [0.5, 6.5, -5.5]) {
				rotate(a = [0, 60.50379150343357, -135.0]) {
					cube(size = [0.125, 0.125, 8.12403840463596]);
				}
			}
			/*Edge 45 from $_45 to bank.thing.devices[0].thingy.vcell_out*/
			translate(v = [0.5, 6.5, -5.5]) {
				rotate(a = [0, 80.26852452684238, -149.03624346792648]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*Edge 47 from $_47 to bank.thing.devices[0].thingy.vcollect*/
			translate(v = [-5.5, 6.5, 0.5]) {
				rotate(a = [0, 134.43824067114977, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*Edge 48 from $_48 to bank.thing.devices[0].thingy.vcollect*/
			translate(v = [-5.5, 6.5, 0.5]) {
				rotate(a = [0, 164.20683095173604, -45.0]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 52 from $_52 to bank.thing.devices[0].thingy.vlysis_in*/
			translate(v = [-1.5, 6.5, -1.5]) {
				rotate(a = [0, 120.96375653207352, -126.86989764584402]) {
					cube(size = [0.125, 0.125, 5.830951894845301]);
				}
			}
			/*Edge 53 from $_53 to bank.thing.devices[0].thingy.vlysis_in*/
			translate(v = [-1.5, 6.5, -1.5]) {
				rotate(a = [0, 154.7605981793211, -45.0]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 54 from $_54 to bank.thing.devices[0].thingy.vlysis_out*/
			translate(v = [1.5, 6.5, -5.5]) {
				rotate(a = [0, 81.12360491902666, -51.34019174590991]) {
					cube(size = [0.125, 0.125, 6.48074069840786]);
				}
			}
			/*Edge 55 from $_55 to bank.thing.devices[0].thingy.vlysis_out*/
			translate(v = [1.5, 6.5, -5.5]) {
				rotate(a = [0, 76.3669777746336, -14.036243467926477]) {
					cube(size = [0.125, 0.125, 4.242640687119285]);
				}
			}
			/*Edge 62 from $_62 to bank.thing.devices[0].thingy.vpush*/
			translate(v = [-0.5, 6.5, -5.5]) {
				rotate(a = [0, 24.094842552110695, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 5.477225575051661]);
				}
			}
			/*Edge 63 from $_63 to bank.thing.devices[0].thingy.vpush*/
			translate(v = [-0.5, 6.5, -5.5]) {
				rotate(a = [0, 65.9051574478893, -26.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 69 from bank.thing.devices[0].thingy.vbead_in to $_69*/
			translate(v = [-4.5, 1.5, 1.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 69 from $_69 to bank.thing.devices[0].thingy.vbead_out*/
			translate(v = [-5.5, 6.5, 1.5]) {
				rotate(a = [0, 90.0, -78.69006752597979]) {
					cube(size = [0.125, 0.125, 5.0990195135927845]);
				}
			}
			/*Edge 70 from bank.thing.devices[0].thingy.vcell_in to $_70*/
			translate(v = [-2.5, 5.5, -0.5]) {
				rotate(a = [0, 134.43824067114977, 11.309932474020213]) {
					cube(size = [0.125, 0.125, 7.14142842854285]);
				}
			}
			/*Edge 70 from $_70 to bank.thing.devices[0].thingy.vcell_out*/
			translate(v = [0.5, 6.5, -5.5]) {
				rotate(a = [0, 32.31153323742385, -161.56505117707798]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
			/*Edge 70 from $_70 to bank.thing.devices[0].thingy.vpush*/
			translate(v = [-0.5, 6.5, -5.5]) {
				rotate(a = [0, 24.094842552110695, -153.43494882292202]) {
					cube(size = [0.125, 0.125, 5.477225575051661]);
				}
			}
			/*Edge 71 from bank.thing.devices[0].thingy.vcollect to $_71*/
			translate(v = [-4.5, 1.5, -0.5]) {
				rotate(a = [0, 78.90419671686361, 101.30993247402021]) {
					cube(size = [0.125, 0.125, 5.196152422706632]);
				}
			}
			/*Edge 71 from $_71 to bank.thing.devices[0].thingy.vwaste*/
			translate(v = [-5.5, 2.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 72 from bank.thing.devices[0].thingy.vlysis_in to $_72*/
			translate(v = [-0.5, 5.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from bank.thing.devices[0].thingy.vlysis_out to $_73*/
			translate(v = [1.5, 5.5, -1.5]) {
				rotate(a = [0, 165.96375653207352, 90.0]) {
					cube(size = [0.125, 0.125, 4.123105625617661]);
				}
			}
			/*Edge 74 from bank.thing.devices[0].thingy.vwaste to $_74*/
			translate(v = [-2.5, -0.5, -4.5]) {
				rotate(a = [0, 40.31554221077258, 135.0]) {
					cube(size = [0.125, 0.125, 6.557438524302]);
				}
			}
			/*Edge 75 from bank.thing.devices[0].thingy.vwaste to $_75*/
			translate(v = [-4.5, -0.5, -4.5]) {
				rotate(a = [0, 32.31153323742385, 108.43494882292202]) {
					cube(size = [0.125, 0.125, 5.916079783099616]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*Node bank.thing.devices[0].thingy.vbead_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6, 2, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vbead_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6, 6, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vcell_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [2, 6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vcell_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0, 6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vcollect*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6, 6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vlysis_in*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-2, 6, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vlysis_out*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vpush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1, 6, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.thing.devices[0].thingy.vwaste*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6, 2, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 39 from $_39 to bank.thing.devices[0].thingy.vbead_in*/
			translate(v = [-5.5, 2.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 40 from $_40 to bank.thing.devices[0].thingy.vbead_out*/
			translate(v = [-5.5, 6.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 43 from $_43 to bank.thing.devices[0].thingy.vcell_in*/
			translate(v = [2.5, 6.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 46 from $_46 to bank.thing.devices[0].thingy.vcell_out*/
			translate(v = [0.5, 6.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 49 from $_49 to bank.thing.devices[0].thingy.vcollect*/
			translate(v = [-5.5, 6.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from $_50 to bank.thing.devices[0].thingy.vlysis_in*/
			translate(v = [-1.5, 6.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 51 from $_51 to bank.thing.devices[0].thingy.vlysis_out*/
			translate(v = [1.5, 6.5, -5.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from $_64 to bank.thing.devices[0].thingy.vpush*/
			translate(v = [-0.5, 6.5, -5.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from bank.thing.devices[0].thingy.vwaste to $_76*/
			translate(v = [-6.5, 3.5, -0.5]) {
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
			/*Node $_39*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7, 3, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7, 7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_43*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [1, 7, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_46*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-1, 7, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_49*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7, 7, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_50*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-1, 7, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_51*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 7, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_64*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 7, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_76*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-7, 3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*Edge 39 from bank.beads_in_hole to $_39*/
			translate(v = [-6.5, 3.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 40 from bank.beads_out_hole to $_40*/
			translate(v = [-6.5, 7.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 43 from bank.cells_in_hole to $_43*/
			translate(v = [1.5, 7.5, -6.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 46 from bank.cells_out_hole to $_46*/
			translate(v = [-0.5, 7.5, -6.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 49 from bank.collect_hole to $_49*/
			translate(v = [-6.5, 7.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 50 from bank.lysis_buffer_in_hole to $_50*/
			translate(v = [-0.5, 7.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 51 from bank.lysis_buffer_out_hole to $_51*/
			translate(v = [0.5, 7.5, -4.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 64 from bank.push_line_hole to $_64*/
			translate(v = [0.5, 7.5, -6.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from $_76 to bank.waste_out_hole*/
			translate(v = [-7.5, 2.5, 0.5]) {
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
			/*Node bank.beads_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 2, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.beads_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-6, 8, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0, 8, -6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.cells_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0, 8, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.collect_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_buffer_in_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [0, 8, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.lysis_buffer_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1, 8, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.push_line_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-1, 8, -8]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node bank.waste_out_hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [-8, 2, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*Edge 2 from bank.beads_in_hole to $_2*/
			translate(v = [-8.5, 3.5, -0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 3 from bank.beads_out_hole to $_3*/
			translate(v = [-5.5, 9.5, -0.5]) {
				rotate(a = [0, 90.0, -90.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 4 from bank.cells_in_hole to $_4*/
			translate(v = [-0.5, 9.5, -4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 5 from bank.cells_out_hole to $_5*/
			translate(v = [-0.5, 9.5, -8.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 6 from bank.collect_hole to $_6*/
			translate(v = [-8.5, 6.5, 0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 7 from bank.lysis_buffer_in_hole to $_7*/
			translate(v = [-0.5, 9.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 8 from bank.lysis_buffer_out_hole to $_8*/
			translate(v = [0.5, 9.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 9 from bank.push_line_hole to $_9*/
			translate(v = [0.5, 9.5, -6.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 10 from bank.waste_out_hole to $_10*/
			translate(v = [-8.5, 2.5, 0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 8*/
	union() {
		%/*Nodes shell 8*/
		union() {
			/*Node $_2*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-6, 9, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-1, 9, -5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-1, 9, -9]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-1, 9, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 9, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 9, -7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [-9, 2, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union();
	}
}
