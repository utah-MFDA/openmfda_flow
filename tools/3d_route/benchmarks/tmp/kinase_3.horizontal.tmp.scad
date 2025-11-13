translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*Node $_45*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 8, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_23*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 11, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_57*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, 7, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_35*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 10, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_11*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 12, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_20*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 9, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_12*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_21*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_13*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 7, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_22*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 7, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 10, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 8, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 9, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 8, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14__0*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [0, 10, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*Edge 45 from one.ctrl_a[0].flush to $_45*/
			translate(v = [0.5, 8.5, 2.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 23 from one.ctrl_a[0].hole to $_23*/
			translate(v = [0.5, 11.5, 1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 57 from one.ctrl_a[12].flush to $_57*/
			translate(v = [0.5, 7.5, 1.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 35 from one.ctrl_a[12].hole to $_35*/
			translate(v = [0.5, 10.5, 1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 11 from one.pinholes[0].hole_out_a to $_11*/
			translate(v = [0.5, 12.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 20 from one.pinholes[0].hole_out_d to $_20*/
			translate(v = [0.5, 9.5, 1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 12 from one.pinholes[1].hole_out_a to $_12*/
			translate(v = [0.5, 9.5, 2.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 21 from one.pinholes[1].hole_out_d to $_21*/
			translate(v = [0.5, 10.5, 3.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 13 from one.pinholes[2].hole_out_a to $_13*/
			translate(v = [0.5, 7.5, 2.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 22 from one.pinholes[2].hole_out_d to $_22*/
			translate(v = [0.5, 9.5, 4.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_16__0 to $_16__1*/
			translate(v = [1.5, 7.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_17__0 to $_17__1*/
			translate(v = [1.5, 10.5, 0.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_15__0 to $_15__1*/
			translate(v = [1.5, 8.5, 0.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_18__0 to $_18__1*/
			translate(v = [1.5, 9.5, 0.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_19__0 to $_19__1*/
			translate(v = [1.5, 8.5, 1.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_14__0 to $_14__1*/
			translate(v = [1.5, 10.5, -0.5]) {
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
			/*Node one.ctrl_a[0].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 8, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, 11, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[12].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [1, 7, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[12].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [1, 10, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].hole_out_a*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 11, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].hole_out_d*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 9, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[1].hole_out_a*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[1].hole_out_d*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[2].hole_out_a*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 7, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[2].hole_out_d*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 7, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 10, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 8, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 9, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 8, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14__1*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [1, 10, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union() {
			/*Edge 67 from one.ctrl_a[0].flush to $_67*/
			translate(v = [2.5, 8.5, 3.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 68 from one.ctrl_a[0].hole to $_68*/
			translate(v = [2.5, 11.5, 1.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 73 from one.ctrl_a[12].flush to $_73*/
			translate(v = [2.5, 7.5, 2.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 74 from one.ctrl_a[12].hole to $_74*/
			translate(v = [2.5, 10.5, 1.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 104 from one.pinholes[0].hole_out_a to $_104*/
			translate(v = [2.5, 11.5, 2.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 107 from one.pinholes[0].hole_out_d to $_107*/
			translate(v = [2.5, 9.5, 1.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 111 from one.pinholes[1].hole_out_a to $_111*/
			translate(v = [2.5, 9.5, 2.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 114 from one.pinholes[1].hole_out_d to $_114*/
			translate(v = [2.5, 10.5, 3.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 118 from one.pinholes[2].hole_out_a to $_118*/
			translate(v = [2.5, 7.5, 3.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 121 from one.pinholes[2].hole_out_d to $_121*/
			translate(v = [2.5, 9.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_16__1 to $_16__2*/
			translate(v = [2.5, 7.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_17__1 to $_17__2*/
			translate(v = [2.5, 10.5, 0.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_15__1 to $_15__2*/
			translate(v = [2.5, 8.5, 0.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_18__1 to $_18__2*/
			translate(v = [2.5, 9.5, 0.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_19__1 to $_19__2*/
			translate(v = [2.5, 8.5, 1.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_14__1 to $_14__2*/
			translate(v = [2.5, 10.5, -0.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union() {
			/*Node $_67*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 8, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_68*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 11, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_73*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 7, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_74*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 10, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_58*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 10, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_36*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [2, 12, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_104*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 11, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_107*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 9, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_111*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_114*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_118*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 7, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_121*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [2, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_140*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 10, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_148*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 9, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_181*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 8, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_189*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [2, 8, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, 7, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, 10, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, 8, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, 9, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, 8, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14__2*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [2, 10, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 2*/
		union() {
			/*Edge 67 from $_67 to one.thingy.devices[2].thingy.v0*/
			translate(v = [3.5, 9.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 68 from $_68 to one.thingy.devices[0].thingy.v0*/
			translate(v = [3.5, 10.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 73 from $_73 to one.thingy.devices[2].thingy.v12*/
			translate(v = [3.5, 8.5, 2.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 74 from $_74 to one.thingy.devices[0].thingy.v12*/
			translate(v = [3.5, 11.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 58 from one.ctrl_s[0].flush to $_58*/
			translate(v = [2.5, 10.5, 4.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 36 from one.ctrl_s[0].hole to $_36*/
			translate(v = [2.5, 12.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 104 from $_104 to one.thingy.devices[0].thingy.v12*/
			translate(v = [3.5, 11.5, 2.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 107 from $_107 to one.thingy.devices[0].thingy.v0*/
			translate(v = [3.5, 10.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 111 from $_111 to one.thingy.devices[1].thingy.v12*/
			translate(v = [3.5, 8.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 114 from $_114 to one.thingy.devices[1].thingy.v0*/
			translate(v = [3.5, 9.5, 3.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 118 from $_118 to one.thingy.devices[2].thingy.v12*/
			translate(v = [3.5, 8.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 121 from $_121 to one.thingy.devices[2].thingy.v0*/
			translate(v = [3.5, 9.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 140 from one.thingy.devices[0].thingy.v0 to $_140*/
			translate(v = [2.5, 10.5, 2.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 140 from $_140 to one.thingy.devices[1].thingy.v0*/
			translate(v = [3.5, 9.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 148 from one.thingy.devices[0].thingy.v12 to $_148*/
			translate(v = [2.5, 9.5, 3.5]) {
				rotate(a = [0, 114.09484255211072, 63.43494882292201]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 148 from $_148 to one.thingy.devices[1].thingy.v12*/
			translate(v = [3.5, 8.5, 3.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 181 from one.thingy.devices[1].thingy.v0 to $_181*/
			translate(v = [2.5, 8.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 181 from $_181 to one.thingy.devices[2].thingy.v0*/
			translate(v = [3.5, 9.5, 4.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 189 from one.thingy.devices[1].thingy.v12 to $_189*/
			translate(v = [2.5, 8.5, 2.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 189 from $_189 to one.thingy.devices[2].thingy.v12*/
			translate(v = [3.5, 8.5, 2.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_16__2 to $_16__3*/
			translate(v = [3.5, 8.5, 4.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_17__2 to $_17__3*/
			translate(v = [3.5, 11.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_15__2 to $_15__3*/
			translate(v = [3.5, 9.5, 0.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_18__2 to $_18__3*/
			translate(v = [3.5, 10.5, 0.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_19__2 to $_19__3*/
			translate(v = [3.5, 9.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_14__2 to $_14__3*/
			translate(v = [3.5, 11.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 3*/
	union() {
		%/*Nodes shell 3*/
		union() {
			/*Node one.ctrl_s[0].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [3, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [3, 11, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 10, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v12*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 11, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 9, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v12*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 8, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v12*/
			color(alpha = 0.1, c = "black") {
				translate(v = [3, 8, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, 8, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, 11, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, 9, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, 10, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14__3*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [3, 11, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 3*/
		union() {
			/*Edge 93 from one.ctrl_s[0].flush to $_93*/
			translate(v = [4.5, 9.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 94 from one.ctrl_s[0].hole to $_94*/
			translate(v = [4.5, 12.5, 3.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 141 from one.thingy.devices[0].thingy.v0 to $_141*/
			translate(v = [4.5, 11.5, 2.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 141 from $_141 to one.thingy.devices[0].thingy.v12*/
			translate(v = [3.5, 11.5, 2.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 182 from one.thingy.devices[1].thingy.v0 to $_182*/
			translate(v = [4.5, 9.5, 4.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 182 from $_182 to one.thingy.devices[1].thingy.v12*/
			translate(v = [3.5, 8.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 222 from one.thingy.devices[2].thingy.v0 to $_222*/
			translate(v = [4.5, 9.5, 3.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 222 from $_222 to one.thingy.devices[2].thingy.v12*/
			translate(v = [3.5, 8.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_16__3 to $_16__4*/
			translate(v = [4.5, 9.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_17__3 to $_17__4*/
			translate(v = [4.5, 12.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_15__3 to $_15__4*/
			translate(v = [4.5, 10.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_18__3 to $_18__4*/
			translate(v = [4.5, 11.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_19__3 to $_19__4*/
			translate(v = [4.5, 10.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_14__3 to $_14__4*/
			translate(v = [4.5, 12.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 4*/
	union() {
		%/*Nodes shell 4*/
		union() {
			/*Node $_93*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_94*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [4, 12, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_141*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 11, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_169*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 11, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_182*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_210*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [4, 11, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_222*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [4, 9, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16__4*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [4, 9, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17__4*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [4, 12, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15__4*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [4, 10, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18__4*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [4, 11, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19__4*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [4, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14__4*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [4, 12, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 4*/
		union() {
			/*Edge 93 from $_93 to one.thingy.devices[2].thingy.vs0*/
			translate(v = [5.5, 10.5, 2.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 94 from $_94 to one.thingy.devices[0].thingy.vs0*/
			translate(v = [5.5, 12.5, 3.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 141 from $_141 to one.thingy.devices[0].thingy.vs0*/
			translate(v = [5.5, 12.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 169 from one.thingy.devices[0].thingy.vs0 to $_169*/
			translate(v = [4.5, 11.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 169 from $_169 to one.thingy.devices[1].thingy.vs0*/
			translate(v = [5.5, 10.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 182 from $_182 to one.thingy.devices[1].thingy.vs0*/
			translate(v = [5.5, 10.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 210 from one.thingy.devices[1].thingy.vs0 to $_210*/
			translate(v = [4.5, 11.5, 3.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 210 from $_210 to one.thingy.devices[2].thingy.vs0*/
			translate(v = [5.5, 10.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 222 from $_222 to one.thingy.devices[2].thingy.vs0*/
			translate(v = [5.5, 10.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_16__4 to $_16__5*/
			translate(v = [5.5, 9.5, 4.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_17__4 to $_17__5*/
			translate(v = [5.5, 12.5, 2.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_15__4 to $_15__5*/
			translate(v = [5.5, 10.5, 1.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_18__4 to $_18__5*/
			translate(v = [5.5, 10.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_19__4 to $_19__5*/
			translate(v = [5.5, 9.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_14__4 to $_14__5*/
			translate(v = [5.5, 12.5, 1.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 5*/
	union() {
		%/*Nodes shell 5*/
		union() {
			/*Node one.thingy.devices[0].thingy.vs0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 12, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.vs0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.vs0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [5, 10, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16__5*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [5, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17__5*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [5, 12, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15__5*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [5, 10, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18__5*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [5, 10, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19__5*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [5, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14__5*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [5, 12, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 5*/
		union() {
			/*Edge 137 from $_137 to one.thingy.devices[0].thingy.vs0*/
			translate(v = [5.5, 12.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 178 from $_178 to one.thingy.devices[1].thingy.vs0*/
			translate(v = [5.5, 10.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 219 from $_219 to one.thingy.devices[2].thingy.vs0*/
			translate(v = [5.5, 10.5, 2.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_16__5 to $_16__6*/
			translate(v = [6.5, 9.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_17__5 to $_17__6*/
			translate(v = [6.5, 13.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_15__5 to $_15__6*/
			translate(v = [6.5, 10.5, 2.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_18__5 to $_18__6*/
			translate(v = [6.5, 11.5, 0.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_19__5 to $_19__6*/
			translate(v = [6.5, 9.5, 3.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_14__5 to $_14__6*/
			translate(v = [6.5, 12.5, 0.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 6*/
	union() {
		%/*Nodes shell 6*/
		union() {
			/*Node $_61*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [6, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_39*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [6, 12, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_137*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 13, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_178*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 11, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_219*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [6, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16__6*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [6, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17__6*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [6, 13, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15__6*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [6, 10, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18__6*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [6, 11, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19__6*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [6, 9, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14__6*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [6, 12, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 6*/
		union() {
			/*Edge 61 from one.ctrl_s[3].flush to $_61*/
			translate(v = [6.5, 9.5, 2.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 39 from one.ctrl_s[3].hole to $_39*/
			translate(v = [6.5, 12.5, 4.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 137 from one.thingy.devices[0].thingy.column_lower to $_137*/
			translate(v = [6.5, 13.5, 4.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 178 from one.thingy.devices[1].thingy.column_lower to $_178*/
			translate(v = [6.5, 11.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 219 from one.thingy.devices[2].thingy.column_lower to $_219*/
			translate(v = [6.5, 10.5, 3.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_16__6 to $_16__7*/
			translate(v = [7.5, 9.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_17__6 to $_17__7*/
			translate(v = [7.5, 12.5, 3.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_15__6 to $_15__7*/
			translate(v = [7.5, 11.5, 2.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_18__6 to $_18__7*/
			translate(v = [7.5, 10.5, 0.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_19__6 to $_19__7*/
			translate(v = [7.5, 8.5, 3.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_14__6 to $_14__7*/
			translate(v = [7.5, 12.5, 0.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 7*/
	union() {
		%/*Nodes shell 7*/
		union() {
			/*Node one.ctrl_s[3].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [7, 9, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[3].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [7, 12, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.column_lower*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 13, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.column_lower*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 10, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.column_lower*/
			color(alpha = 0.1, c = "black") {
				translate(v = [7, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16__7*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [7, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17__7*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [7, 12, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15__7*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [7, 11, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18__7*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [7, 10, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19__7*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [7, 8, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14__7*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [7, 12, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 7*/
		union() {
			/*Edge 99 from one.ctrl_s[3].flush to $_99*/
			translate(v = [8.5, 8.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 100 from one.ctrl_s[3].hole to $_100*/
			translate(v = [8.5, 12.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_17 to $_17__7*/
			translate(v = [7.5, 12.5, 3.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_18 to $_18__7*/
			translate(v = [7.5, 10.5, 0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_19 to $_19__7*/
			translate(v = [7.5, 8.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 136 from one.thingy.devices[0].thingy.column_lower to $_136*/
			translate(v = [8.5, 13.5, 2.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 177 from one.thingy.devices[1].thingy.column_lower to $_177*/
			translate(v = [8.5, 10.5, 0.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 218 from one.thingy.devices[2].thingy.column_lower to $_218*/
			translate(v = [8.5, 9.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_16__7 to $_16__8*/
			translate(v = [8.5, 9.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_15__7 to $_15__8*/
			translate(v = [8.5, 11.5, 2.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_14__7 to $_14__8*/
			translate(v = [8.5, 12.5, 0.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 8*/
	union() {
		%/*Nodes shell 8*/
		union() {
			/*Node $_55*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 7, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_33*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 11, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_56*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 8, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_34*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 12, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_99*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 8, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_100*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [8, 12, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_17*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 12, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_18*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 11, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_19*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 7, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_136*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 13, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_172*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 12, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_177*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 10, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_213*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [8, 10, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_218*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [8, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16__8*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [8, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15__8*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [8, 11, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14__8*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [8, 12, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 8*/
		union() {
			/*Edge 55 from one.ctrl_a[10].flush to $_55*/
			translate(v = [8.5, 7.5, 2.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 33 from one.ctrl_a[10].hole to $_33*/
			translate(v = [8.5, 11.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 56 from one.ctrl_a[11].flush to $_56*/
			translate(v = [8.5, 8.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 34 from one.ctrl_a[11].hole to $_34*/
			translate(v = [8.5, 12.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 99 from $_99 to one.thingy.devices[2].thingy.vs3*/
			translate(v = [9.5, 9.5, 2.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 100 from $_100 to one.thingy.devices[0].thingy.vs3*/
			translate(v = [9.5, 13.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 17 from one.pinholes[0].hole_out_c to $_17*/
			translate(v = [8.5, 12.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 18 from one.pinholes[1].hole_out_c to $_18*/
			translate(v = [8.5, 11.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 19 from one.pinholes[2].hole_out_c to $_19*/
			translate(v = [8.5, 7.5, 4.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 136 from $_136 to one.thingy.devices[0].thingy.vs3*/
			translate(v = [9.5, 13.5, 3.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 172 from one.thingy.devices[0].thingy.vs3 to $_172*/
			translate(v = [8.5, 12.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 172 from $_172 to one.thingy.devices[1].thingy.vs3*/
			translate(v = [9.5, 11.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 177 from $_177 to one.thingy.devices[1].thingy.vs3*/
			translate(v = [9.5, 11.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 213 from one.thingy.devices[1].thingy.vs3 to $_213*/
			translate(v = [8.5, 10.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 213 from $_213 to one.thingy.devices[2].thingy.vs3*/
			translate(v = [9.5, 9.5, 2.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 218 from $_218 to one.thingy.devices[2].thingy.vs3*/
			translate(v = [9.5, 9.5, 2.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_16__8 to $_16__9*/
			translate(v = [9.5, 10.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge -1 from $_15__8 to $_15__9*/
			translate(v = [9.5, 11.5, 3.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge -1 from $_14__8 to $_14__9*/
			translate(v = [9.5, 13.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 9*/
	union() {
		%/*Nodes shell 9*/
		union() {
			/*Node one.ctrl_a[10].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 8, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[10].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 12, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[11].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [9, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[11].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [9, 13, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].hole_out_c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 13, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[1].hole_out_c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 12, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[2].hole_out_c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 8, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.vs3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 13, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.vs3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 11, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.vs3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [9, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16__9*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [9, 10, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15__9*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [9, 11, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14__9*/
			color(alpha = 0.1, c = "lightblue") {
				translate(v = [9, 13, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 9*/
		union() {
			/*Edge 69 from one.ctrl_a[10].flush to $_69*/
			translate(v = [10.5, 8.5, 2.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 70 from one.ctrl_a[10].hole to $_70*/
			translate(v = [10.5, 12.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 71 from one.ctrl_a[11].flush to $_71*/
			translate(v = [10.5, 9.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 72 from one.ctrl_a[11].hole to $_72*/
			translate(v = [10.5, 13.5, 2.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_14 to $_14__9*/
			translate(v = [9.5, 13.5, 1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 106 from one.pinholes[0].hole_out_c to $_106*/
			translate(v = [10.5, 13.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_15 to $_15__9*/
			translate(v = [9.5, 11.5, 3.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 113 from one.pinholes[1].hole_out_c to $_113*/
			translate(v = [10.5, 12.5, 1.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge -1 from $_16 to $_16__9*/
			translate(v = [9.5, 10.5, 5.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 120 from one.pinholes[2].hole_out_c to $_120*/
			translate(v = [10.5, 8.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 146 from $_146 to one.thingy.devices[0].thingy.vs3*/
			translate(v = [9.5, 13.5, 3.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 187 from $_187 to one.thingy.devices[1].thingy.vs3*/
			translate(v = [9.5, 11.5, 1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 225 from $_225 to one.thingy.devices[2].thingy.vs3*/
			translate(v = [9.5, 9.5, 2.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 10*/
	union() {
		%/*Nodes shell 10*/
		union() {
			/*Node $_69*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 8, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_70*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 12, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_71*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_72*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 13, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_52*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 8, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_30*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 14, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_53*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 8, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_31*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 13, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_54*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 10, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_32*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [10, 14, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_14*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 13, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_106*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 13, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_15*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 11, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_113*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 12, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_16*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 10, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_120*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 8, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_144*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 12, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_146*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 13, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_147*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 12, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_185*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 10, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_187*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 11, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_188*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [10, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_225*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [10, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 10*/
		union() {
			/*Edge 69 from $_69 to one.thingy.devices[2].thingy.v10*/
			translate(v = [11.5, 9.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 70 from $_70 to one.thingy.devices[0].thingy.v10*/
			translate(v = [11.5, 13.5, 4.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 71 from $_71 to one.thingy.devices[2].thingy.v11*/
			translate(v = [11.5, 9.5, 5.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 72 from $_72 to one.thingy.devices[0].thingy.v11*/
			translate(v = [11.5, 13.5, 3.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 52 from one.ctrl_a[7].flush to $_52*/
			translate(v = [10.5, 8.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 30 from one.ctrl_a[7].hole to $_30*/
			translate(v = [10.5, 14.5, 1.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 53 from one.ctrl_a[8].flush to $_53*/
			translate(v = [10.5, 8.5, 5.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 31 from one.ctrl_a[8].hole to $_31*/
			translate(v = [10.5, 13.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 54 from one.ctrl_a[9].flush to $_54*/
			translate(v = [10.5, 10.5, 4.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 32 from one.ctrl_a[9].hole to $_32*/
			translate(v = [10.5, 14.5, 4.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 14 from one.pinholes[0].hole_out_b to $_14*/
			translate(v = [10.5, 13.5, 1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 106 from $_106 to one.thingy.devices[0].thingy.v11*/
			translate(v = [11.5, 13.5, 3.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 15 from one.pinholes[1].hole_out_b to $_15*/
			translate(v = [10.5, 11.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 113 from $_113 to one.thingy.devices[1].thingy.v11*/
			translate(v = [11.5, 13.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 16 from one.pinholes[2].hole_out_b to $_16*/
			translate(v = [10.5, 10.5, 5.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 120 from $_120 to one.thingy.devices[2].thingy.v11*/
			translate(v = [11.5, 9.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 144 from one.thingy.devices[0].thingy.v10 to $_144*/
			translate(v = [10.5, 12.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 146 from one.thingy.devices[0].thingy.v10 to $_146*/
			translate(v = [10.5, 13.5, 3.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 144 from $_144 to one.thingy.devices[1].thingy.v10*/
			translate(v = [11.5, 11.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 147 from one.thingy.devices[0].thingy.v11 to $_147*/
			translate(v = [10.5, 12.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 147 from $_147 to one.thingy.devices[1].thingy.v11*/
			translate(v = [11.5, 13.5, 2.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 185 from one.thingy.devices[1].thingy.v10 to $_185*/
			translate(v = [10.5, 10.5, 2.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 187 from one.thingy.devices[1].thingy.v10 to $_187*/
			translate(v = [10.5, 11.5, 1.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 185 from $_185 to one.thingy.devices[2].thingy.v10*/
			translate(v = [11.5, 9.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 188 from one.thingy.devices[1].thingy.v11 to $_188*/
			translate(v = [10.5, 10.5, 3.5]) {
				rotate(a = [0, 107.54840061379231, 71.56505117707799]) {
					cube(size = [0.125, 0.125, 3.3166247903554]);
				}
			}
			/*Edge 188 from $_188 to one.thingy.devices[2].thingy.v11*/
			translate(v = [11.5, 9.5, 5.5]) {
				rotate(a = [0, 144.73561031724537, 135.0]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 225 from one.thingy.devices[2].thingy.v10 to $_225*/
			translate(v = [10.5, 9.5, 2.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 11*/
	union() {
		%/*Nodes shell 11*/
		union() {
			/*Node one.ctrl_a[7].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [11, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[7].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [11, 14, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[8].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [11, 9, 6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[8].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [11, 14, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[9].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [11, 10, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[9].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [11, 13, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].hole_out_b*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 13, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[1].hole_out_b*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 12, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[2].hole_out_b*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 11, 6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v10*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 13, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v11*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 13, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v10*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 11, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v11*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 13, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v10*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 9, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v11*/
			color(alpha = 0.1, c = "black") {
				translate(v = [11, 9, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 11*/
		union() {
			/*Edge 87 from one.ctrl_a[7].flush to $_87*/
			translate(v = [12.5, 10.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 88 from one.ctrl_a[7].hole to $_88*/
			translate(v = [12.5, 14.5, 3.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 89 from one.ctrl_a[8].flush to $_89*/
			translate(v = [12.5, 10.5, 5.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 90 from one.ctrl_a[8].hole to $_90*/
			translate(v = [12.5, 13.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 91 from one.ctrl_a[9].flush to $_91*/
			translate(v = [12.5, 9.5, 4.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 92 from one.ctrl_a[9].hole to $_92*/
			translate(v = [12.5, 13.5, 5.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 105 from one.pinholes[0].hole_out_b to $_105*/
			translate(v = [12.5, 14.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 112 from one.pinholes[1].hole_out_b to $_112*/
			translate(v = [12.5, 13.5, 4.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 119 from one.pinholes[2].hole_out_b to $_119*/
			translate(v = [12.5, 12.5, 5.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 145 from one.thingy.devices[0].thingy.v10 to $_145*/
			translate(v = [12.5, 14.5, 4.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 145 from $_145 to one.thingy.devices[0].thingy.v11*/
			translate(v = [11.5, 13.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 186 from one.thingy.devices[1].thingy.v10 to $_186*/
			translate(v = [12.5, 12.5, 2.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 186 from $_186 to one.thingy.devices[1].thingy.v11*/
			translate(v = [11.5, 13.5, 2.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 224 from one.thingy.devices[2].thingy.v10 to $_224*/
			translate(v = [12.5, 10.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 224 from $_224 to one.thingy.devices[2].thingy.v11*/
			translate(v = [11.5, 9.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 12*/
	union() {
		%/*Nodes shell 12*/
		union() {
			/*Node $_87*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [12, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_88*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [12, 14, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_89*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [12, 10, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_90*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [12, 13, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_91*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [12, 9, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_92*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [12, 13, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_60*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [12, 10, 6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_38*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [12, 12, 6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_105*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 14, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_112*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 13, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_119*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 12, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_145*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 14, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_156*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [12, 12, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_158*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [12, 12, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_159*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [12, 13, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_186*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 12, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_197*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [12, 11, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_199*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [12, 11, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_200*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [12, 11, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_224*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [12, 10, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 12*/
		union() {
			/*Edge 87 from $_87 to one.thingy.devices[2].thingy.v7*/
			translate(v = [13.5, 10.5, 4.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 88 from $_88 to one.thingy.devices[0].thingy.v7*/
			translate(v = [13.5, 13.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 89 from $_89 to one.thingy.devices[2].thingy.v8*/
			translate(v = [13.5, 11.5, 4.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 90 from $_90 to one.thingy.devices[0].thingy.v8*/
			translate(v = [13.5, 13.5, 3.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 91 from $_91 to one.thingy.devices[2].thingy.v9*/
			translate(v = [13.5, 10.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 92 from $_92 to one.thingy.devices[0].thingy.v9*/
			translate(v = [13.5, 14.5, 4.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 60 from one.ctrl_s[2].flush to $_60*/
			translate(v = [12.5, 10.5, 6.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 38 from one.ctrl_s[2].hole to $_38*/
			translate(v = [12.5, 12.5, 6.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 105 from $_105 to one.thingy.devices[0].thingy.v8*/
			translate(v = [13.5, 13.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 112 from $_112 to one.thingy.devices[1].thingy.v8*/
			translate(v = [13.5, 12.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 119 from $_119 to one.thingy.devices[2].thingy.v8*/
			translate(v = [13.5, 11.5, 4.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 145 from $_145 to one.thingy.devices[0].thingy.v9*/
			translate(v = [13.5, 14.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 156 from one.thingy.devices[0].thingy.v7 to $_156*/
			translate(v = [12.5, 12.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 156 from $_156 to one.thingy.devices[1].thingy.v7*/
			translate(v = [13.5, 12.5, 4.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 158 from one.thingy.devices[0].thingy.v8 to $_158*/
			translate(v = [12.5, 12.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 158 from $_158 to one.thingy.devices[1].thingy.v8*/
			translate(v = [13.5, 12.5, 5.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 159 from one.thingy.devices[0].thingy.v9 to $_159*/
			translate(v = [12.5, 13.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 159 from $_159 to one.thingy.devices[1].thingy.v9*/
			translate(v = [13.5, 12.5, 3.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 186 from $_186 to one.thingy.devices[1].thingy.v9*/
			translate(v = [13.5, 12.5, 3.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 197 from one.thingy.devices[1].thingy.v7 to $_197*/
			translate(v = [12.5, 11.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 197 from $_197 to one.thingy.devices[2].thingy.v7*/
			translate(v = [13.5, 10.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 199 from one.thingy.devices[1].thingy.v8 to $_199*/
			translate(v = [12.5, 11.5, 5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 199 from $_199 to one.thingy.devices[2].thingy.v8*/
			translate(v = [13.5, 11.5, 4.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 200 from one.thingy.devices[1].thingy.v9 to $_200*/
			translate(v = [12.5, 11.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 200 from $_200 to one.thingy.devices[2].thingy.v9*/
			translate(v = [13.5, 10.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 224 from $_224 to one.thingy.devices[2].thingy.v9*/
			translate(v = [13.5, 10.5, 5.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 13*/
	union() {
		%/*Nodes shell 13*/
		union() {
			/*Node one.ctrl_s[2].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [13, 11, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[2].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [13, 13, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v7*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 13, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v8*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 13, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v9*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 14, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v7*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 12, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v8*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 12, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v9*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 12, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v7*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 10, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v8*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 11, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v9*/
			color(alpha = 0.1, c = "black") {
				translate(v = [13, 10, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 13*/
		union() {
			/*Edge 97 from one.ctrl_s[2].flush to $_97*/
			translate(v = [14.5, 11.5, 5.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 98 from one.ctrl_s[2].hole to $_98*/
			translate(v = [14.5, 13.5, 5.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 133 from $_133 to one.thingy.devices[0].thingy.v7*/
			translate(v = [13.5, 13.5, 4.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 133 from $_133 to one.thingy.devices[0].thingy.v8*/
			translate(v = [13.5, 13.5, 3.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 157 from one.thingy.devices[0].thingy.v7 to $_157*/
			translate(v = [14.5, 14.5, 4.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 157 from $_157 to one.thingy.devices[0].thingy.v9*/
			translate(v = [13.5, 14.5, 4.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 174 from $_174 to one.thingy.devices[1].thingy.v7*/
			translate(v = [13.5, 12.5, 4.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 174 from $_174 to one.thingy.devices[1].thingy.v8*/
			translate(v = [13.5, 12.5, 5.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 198 from one.thingy.devices[1].thingy.v7 to $_198*/
			translate(v = [14.5, 12.5, 3.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 198 from $_198 to one.thingy.devices[1].thingy.v9*/
			translate(v = [13.5, 12.5, 3.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 215 from $_215 to one.thingy.devices[2].thingy.v7*/
			translate(v = [13.5, 10.5, 4.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 215 from $_215 to one.thingy.devices[2].thingy.v8*/
			translate(v = [13.5, 11.5, 4.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 228 from one.thingy.devices[2].thingy.v7 to $_228*/
			translate(v = [14.5, 10.5, 5.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 228 from $_228 to one.thingy.devices[2].thingy.v9*/
			translate(v = [13.5, 10.5, 5.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 14*/
	union() {
		%/*Nodes shell 14*/
		union() {
			/*Node $_97*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [14, 11, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_98*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [14, 13, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_64*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [14, 13, 6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_42*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [14, 11, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_66*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [14, 11, 6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_44*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [14, 14, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_133*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 13, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_157*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 14, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_171*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [14, 13, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_174*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 12, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_198*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 12, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_212*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [14, 12, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_215*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 11, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_228*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [14, 10, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 14*/
		union() {
			/*Edge 97 from $_97 to one.thingy.devices[2].thingy.vs2*/
			translate(v = [15.5, 10.5, 5.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 98 from $_98 to one.thingy.devices[0].thingy.vs2*/
			translate(v = [15.5, 13.5, 5.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 64 from one.pump_a[2].flush to $_64*/
			translate(v = [14.5, 13.5, 6.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 42 from one.pump_a[2].hole to $_42*/
			translate(v = [14.5, 11.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 66 from one.pump_b[1].flush to $_66*/
			translate(v = [14.5, 11.5, 6.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 44 from one.pump_b[1].hole to $_44*/
			translate(v = [14.5, 14.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 133 from one.thingy.devices[0].thingy.circulate1 to $_133*/
			translate(v = [14.5, 13.5, 3.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 157 from $_157 to one.thingy.devices[0].thingy.vs2*/
			translate(v = [15.5, 13.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 171 from one.thingy.devices[0].thingy.vs2 to $_171*/
			translate(v = [14.5, 13.5, 4.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 171 from $_171 to one.thingy.devices[1].thingy.vs2*/
			translate(v = [15.5, 13.5, 3.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 174 from one.thingy.devices[1].thingy.circulate1 to $_174*/
			translate(v = [14.5, 12.5, 5.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 198 from $_198 to one.thingy.devices[1].thingy.vs2*/
			translate(v = [15.5, 13.5, 3.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 212 from one.thingy.devices[1].thingy.vs2 to $_212*/
			translate(v = [14.5, 12.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 212 from $_212 to one.thingy.devices[2].thingy.vs2*/
			translate(v = [15.5, 10.5, 5.5]) {
				rotate(a = [0, 114.09484255211072, 116.56505117707799]) {
					cube(size = [0.125, 0.125, 2.449489742783178]);
				}
			}
			/*Edge 215 from one.thingy.devices[2].thingy.circulate1 to $_215*/
			translate(v = [14.5, 11.5, 4.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 228 from $_228 to one.thingy.devices[2].thingy.vs2*/
			translate(v = [15.5, 10.5, 5.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 15*/
	union() {
		%/*Nodes shell 15*/
		union() {
			/*Node one.pump_a[2].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [15, 14, 7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_a[2].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [15, 12, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[1].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [15, 12, 7]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [15, 15, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.circulate1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [15, 12, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.vs2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [15, 13, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.circulate1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [15, 11, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.vs2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [15, 13, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.circulate1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [15, 12, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.vs2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [15, 10, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 15*/
		union() {
			/*Edge 126 from one.pump_a[2].flush to $_126*/
			translate(v = [16.5, 13.5, 6.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 127 from one.pump_a[2].hole to $_127*/
			translate(v = [16.5, 11.5, 3.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 130 from one.pump_b[1].flush to $_130*/
			translate(v = [16.5, 11.5, 6.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 131 from one.pump_b[1].hole to $_131*/
			translate(v = [16.5, 14.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 132 from one.thingy.devices[0].thingy.circulate1 to $_132*/
			translate(v = [16.5, 11.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 168 from $_168 to one.thingy.devices[0].thingy.vs2*/
			translate(v = [15.5, 13.5, 5.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 173 from one.thingy.devices[1].thingy.circulate1 to $_173*/
			translate(v = [16.5, 10.5, 4.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 209 from $_209 to one.thingy.devices[1].thingy.vs2*/
			translate(v = [15.5, 13.5, 3.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 214 from one.thingy.devices[2].thingy.circulate1 to $_214*/
			translate(v = [16.5, 11.5, 4.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 232 from $_232 to one.thingy.devices[2].thingy.vs2*/
			translate(v = [15.5, 10.5, 5.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 16*/
	union() {
		%/*Nodes shell 16*/
		union() {
			/*Node $_63*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [16, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_41*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [16, 8, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_126*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [16, 13, 6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_127*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [16, 11, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_130*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [16, 11, 6]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_131*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [16, 14, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_132*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [16, 11, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_164*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [16, 9, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_167*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [16, 12, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_168*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [16, 13, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_173*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [16, 10, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_205*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [16, 11, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_208*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [16, 12, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_209*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [16, 12, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_214*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [16, 11, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_232*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [16, 10, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 16*/
		union() {
			/*Edge 63 from one.pump_a[1].flush to $_63*/
			translate(v = [16.5, 10.5, 3.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 41 from one.pump_a[1].hole to $_41*/
			translate(v = [16.5, 8.5, 0.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 126 from $_126 to one.thingy.devices[2].thingy.vp2*/
			translate(v = [17.5, 12.5, 5.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 127 from $_127 to one.thingy.devices[0].thingy.vp2*/
			translate(v = [17.5, 10.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 130 from $_130 to one.thingy.devices[2].thingy.vp4*/
			translate(v = [17.5, 11.5, 5.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 131 from $_131 to one.thingy.devices[0].thingy.vp4*/
			translate(v = [17.5, 13.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 132 from $_132 to one.thingy.devices[0].thingy.vp2*/
			translate(v = [17.5, 10.5, 2.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 164 from one.thingy.devices[0].thingy.vp2 to $_164*/
			translate(v = [16.5, 9.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 164 from $_164 to one.thingy.devices[1].thingy.vp2*/
			translate(v = [17.5, 10.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 167 from one.thingy.devices[0].thingy.vp4 to $_167*/
			translate(v = [16.5, 12.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 168 from one.thingy.devices[0].thingy.vp4 to $_168*/
			translate(v = [16.5, 13.5, 4.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 167 from $_167 to one.thingy.devices[1].thingy.vp4*/
			translate(v = [17.5, 12.5, 3.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 173 from $_173 to one.thingy.devices[1].thingy.vp2*/
			translate(v = [17.5, 10.5, 4.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 205 from one.thingy.devices[1].thingy.vp2 to $_205*/
			translate(v = [16.5, 11.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 205 from $_205 to one.thingy.devices[2].thingy.vp2*/
			translate(v = [17.5, 12.5, 5.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 208 from one.thingy.devices[1].thingy.vp4 to $_208*/
			translate(v = [16.5, 12.5, 4.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 209 from one.thingy.devices[1].thingy.vp4 to $_209*/
			translate(v = [16.5, 12.5, 3.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 208 from $_208 to one.thingy.devices[2].thingy.vp4*/
			translate(v = [17.5, 11.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 214 from $_214 to one.thingy.devices[2].thingy.vp2*/
			translate(v = [17.5, 12.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 232 from one.thingy.devices[2].thingy.vp4 to $_232*/
			translate(v = [16.5, 10.5, 5.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 17*/
	union() {
		%/*Nodes shell 17*/
		union() {
			/*Node one.pump_a[1].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [17, 11, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_a[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [17, 8, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.vp2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [17, 10, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.vp4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [17, 13, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.vp2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [17, 10, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.vp4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [17, 12, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.vp2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [17, 12, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.vp4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [17, 11, 5]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 17*/
		union() {
			/*Edge 124 from one.pump_a[1].flush to $_124*/
			translate(v = [18.5, 10.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 125 from one.pump_a[1].hole to $_125*/
			translate(v = [18.5, 7.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 139 from $_139 to one.thingy.devices[0].thingy.vp4*/
			translate(v = [17.5, 13.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 163 from $_163 to one.thingy.devices[0].thingy.vp2*/
			translate(v = [17.5, 10.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 180 from $_180 to one.thingy.devices[1].thingy.vp4*/
			translate(v = [17.5, 12.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 204 from $_204 to one.thingy.devices[1].thingy.vp2*/
			translate(v = [17.5, 10.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 221 from $_221 to one.thingy.devices[2].thingy.vp4*/
			translate(v = [17.5, 11.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 230 from $_230 to one.thingy.devices[2].thingy.vp2*/
			translate(v = [17.5, 12.5, 5.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 18*/
	union() {
		%/*Nodes shell 18*/
		union() {
			/*Node $_62*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [18, 8, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_40*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [18, 6, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_124*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [18, 10, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_125*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [18, 7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_65*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [18, 7, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_43*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [18, 9, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_139*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [18, 12, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_162*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [18, 7, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_163*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [18, 9, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_180*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [18, 11, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_203*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [18, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_204*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [18, 9, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_221*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [18, 10, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_230*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [18, 11, 4]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 18*/
		union() {
			/*Edge 62 from one.pump_a[0].flush to $_62*/
			translate(v = [18.5, 8.5, 1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 40 from one.pump_a[0].hole to $_40*/
			translate(v = [18.5, 6.5, -1.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 124 from $_124 to one.thingy.devices[2].thingy.vp1*/
			translate(v = [19.5, 10.5, 3.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 125 from $_125 to one.thingy.devices[0].thingy.vp1*/
			translate(v = [19.5, 8.5, 0.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 65 from one.pump_b[0].flush to $_65*/
			translate(v = [18.5, 7.5, 2.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 43 from one.pump_b[0].hole to $_43*/
			translate(v = [18.5, 9.5, -0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 139 from one.thingy.devices[0].thingy.column_upper to $_139*/
			translate(v = [18.5, 12.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 162 from one.thingy.devices[0].thingy.vp1 to $_162*/
			translate(v = [18.5, 7.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 163 from one.thingy.devices[0].thingy.vp1 to $_163*/
			translate(v = [18.5, 9.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 162 from $_162 to one.thingy.devices[1].thingy.vp1*/
			translate(v = [19.5, 8.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 180 from one.thingy.devices[1].thingy.column_upper to $_180*/
			translate(v = [18.5, 11.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 203 from one.thingy.devices[1].thingy.vp1 to $_203*/
			translate(v = [18.5, 9.5, 2.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 204 from one.thingy.devices[1].thingy.vp1 to $_204*/
			translate(v = [18.5, 9.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 203 from $_203 to one.thingy.devices[2].thingy.vp1*/
			translate(v = [19.5, 10.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 221 from one.thingy.devices[2].thingy.column_upper to $_221*/
			translate(v = [18.5, 10.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 230 from one.thingy.devices[2].thingy.vp1 to $_230*/
			translate(v = [18.5, 11.5, 4.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 19*/
	union() {
		%/*Nodes shell 19*/
		union() {
			/*Node one.pump_a[0].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [19, 8, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_a[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [19, 6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[0].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [19, 7, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pump_b[0].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [19, 9, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.column_upper*/
			color(alpha = 0.1, c = "black") {
				translate(v = [19, 11, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.vp1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [19, 8, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.column_upper*/
			color(alpha = 0.1, c = "black") {
				translate(v = [19, 10, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.vp1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [19, 8, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.column_upper*/
			color(alpha = 0.1, c = "black") {
				translate(v = [19, 9, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.vp1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [19, 10, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 19*/
		union() {
			/*Edge 122 from one.pump_a[0].flush to $_122*/
			translate(v = [20.5, 7.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 123 from one.pump_a[0].hole to $_123*/
			translate(v = [20.5, 5.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 128 from one.pump_b[0].flush to $_128*/
			translate(v = [20.5, 6.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 129 from one.pump_b[0].hole to $_129*/
			translate(v = [20.5, 9.5, 0.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 138 from one.thingy.devices[0].thingy.column_upper to $_138*/
			translate(v = [20.5, 10.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 161 from $_161 to one.thingy.devices[0].thingy.vp1*/
			translate(v = [19.5, 8.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 179 from one.thingy.devices[1].thingy.column_upper to $_179*/
			translate(v = [20.5, 10.5, 2.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 202 from $_202 to one.thingy.devices[1].thingy.vp1*/
			translate(v = [19.5, 8.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 220 from one.thingy.devices[2].thingy.column_upper to $_220*/
			translate(v = [20.5, 8.5, 3.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 229 from $_229 to one.thingy.devices[2].thingy.vp1*/
			translate(v = [19.5, 10.5, 3.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 20*/
	union() {
		%/*Nodes shell 20*/
		union() {
			/*Node $_59*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [20, 6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_37*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [20, 7, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_122*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [20, 7, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_123*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [20, 5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_128*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [20, 6, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_129*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [20, 9, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_138*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [20, 10, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_160*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [20, 6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_161*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [20, 7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_165*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [20, 8, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_179*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [20, 10, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_201*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [20, 8, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_202*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [20, 7, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_206*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [20, 8, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_220*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [20, 8, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_229*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [20, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 20*/
		union() {
			/*Edge 59 from one.ctrl_s[1].flush to $_59*/
			translate(v = [20.5, 6.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 37 from one.ctrl_s[1].hole to $_37*/
			translate(v = [20.5, 7.5, 3.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 122 from $_122 to one.thingy.devices[2].thingy.vp0*/
			translate(v = [21.5, 8.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 123 from $_123 to one.thingy.devices[0].thingy.vp0*/
			translate(v = [21.5, 6.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 128 from $_128 to one.thingy.devices[2].thingy.vp3*/
			translate(v = [21.5, 7.5, 2.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 129 from $_129 to one.thingy.devices[0].thingy.vp3*/
			translate(v = [21.5, 9.5, 1.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 138 from $_138 to one.thingy.devices[0].thingy.vp3*/
			translate(v = [21.5, 9.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 160 from one.thingy.devices[0].thingy.vp0 to $_160*/
			translate(v = [20.5, 6.5, -0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 161 from one.thingy.devices[0].thingy.vp0 to $_161*/
			translate(v = [20.5, 7.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 160 from $_160 to one.thingy.devices[1].thingy.vp0*/
			translate(v = [21.5, 7.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 165 from one.thingy.devices[0].thingy.vp3 to $_165*/
			translate(v = [20.5, 8.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 165 from $_165 to one.thingy.devices[1].thingy.vp3*/
			translate(v = [21.5, 9.5, 2.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 179 from $_179 to one.thingy.devices[1].thingy.vp3*/
			translate(v = [21.5, 9.5, 2.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 201 from one.thingy.devices[1].thingy.vp0 to $_201*/
			translate(v = [20.5, 8.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 202 from one.thingy.devices[1].thingy.vp0 to $_202*/
			translate(v = [20.5, 7.5, 1.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 201 from $_201 to one.thingy.devices[2].thingy.vp0*/
			translate(v = [21.5, 8.5, 1.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 206 from one.thingy.devices[1].thingy.vp3 to $_206*/
			translate(v = [20.5, 8.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 206 from $_206 to one.thingy.devices[2].thingy.vp3*/
			translate(v = [21.5, 7.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 220 from $_220 to one.thingy.devices[2].thingy.vp3*/
			translate(v = [21.5, 7.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 229 from one.thingy.devices[2].thingy.vp0 to $_229*/
			translate(v = [20.5, 9.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 21*/
	union() {
		%/*Nodes shell 21*/
		union() {
			/*Node one.ctrl_s[1].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [21, 5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_s[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [21, 8, 3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.vp0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [21, 6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.vp3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [21, 9, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.vp0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [21, 7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.vp3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [21, 9, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.vp0*/
			color(alpha = 0.1, c = "black") {
				translate(v = [21, 8, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.vp3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [21, 7, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 21*/
		union() {
			/*Edge 95 from one.ctrl_s[1].flush to $_95*/
			translate(v = [22.5, 4.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 96 from one.ctrl_s[1].hole to $_96*/
			translate(v = [22.5, 7.5, 2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 135 from $_135 to one.thingy.devices[0].thingy.vp0*/
			translate(v = [21.5, 6.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 166 from one.thingy.devices[0].thingy.vp3 to $_166*/
			translate(v = [22.5, 8.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 176 from $_176 to one.thingy.devices[1].thingy.vp0*/
			translate(v = [21.5, 7.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 207 from one.thingy.devices[1].thingy.vp3 to $_207*/
			translate(v = [22.5, 8.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 217 from $_217 to one.thingy.devices[2].thingy.vp0*/
			translate(v = [21.5, 8.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 231 from one.thingy.devices[2].thingy.vp3 to $_231*/
			translate(v = [22.5, 6.5, 1.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 22*/
	union() {
		%/*Nodes shell 22*/
		union() {
			/*Node $_50*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [22, 4, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_28*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [22, 4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_51*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [22, 3, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_29*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [22, 5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_95*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [22, 4, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_96*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [22, 7, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_135*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [22, 5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_166*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [22, 8, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_170*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [22, 7, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_176*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [22, 6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_207*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [22, 8, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_211*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [22, 6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_217*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [22, 7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_231*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [22, 6, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 22*/
		union() {
			/*Edge 50 from one.ctrl_a[5].flush to $_50*/
			translate(v = [22.5, 4.5, -2.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 28 from one.ctrl_a[5].hole to $_28*/
			translate(v = [22.5, 4.5, -1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 51 from one.ctrl_a[6].flush to $_51*/
			translate(v = [22.5, 3.5, -1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 29 from one.ctrl_a[6].hole to $_29*/
			translate(v = [22.5, 5.5, -0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 95 from $_95 to one.thingy.devices[2].thingy.vs1*/
			translate(v = [23.5, 5.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 96 from $_96 to one.thingy.devices[0].thingy.vs1*/
			translate(v = [23.5, 7.5, 1.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 135 from one.thingy.devices[0].thingy.circulate2 to $_135*/
			translate(v = [22.5, 5.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 166 from $_166 to one.thingy.devices[0].thingy.vs1*/
			translate(v = [23.5, 7.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 170 from one.thingy.devices[0].thingy.vs1 to $_170*/
			translate(v = [22.5, 7.5, 1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 170 from $_170 to one.thingy.devices[1].thingy.vs1*/
			translate(v = [23.5, 7.5, 0.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 176 from one.thingy.devices[1].thingy.circulate2 to $_176*/
			translate(v = [22.5, 6.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 207 from $_207 to one.thingy.devices[1].thingy.vs1*/
			translate(v = [23.5, 7.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 211 from one.thingy.devices[1].thingy.vs1 to $_211*/
			translate(v = [22.5, 6.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 211 from $_211 to one.thingy.devices[2].thingy.vs1*/
			translate(v = [23.5, 5.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 217 from one.thingy.devices[2].thingy.circulate2 to $_217*/
			translate(v = [22.5, 7.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 231 from $_231 to one.thingy.devices[2].thingy.vs1*/
			translate(v = [23.5, 5.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 23*/
	union() {
		%/*Nodes shell 23*/
		union() {
			/*Node one.ctrl_a[5].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [23, 4, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[5].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [23, 4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[6].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [23, 3, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[6].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [23, 5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.circulate2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [23, 4, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.vs1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [23, 7, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.circulate2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [23, 5, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.vs1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [23, 7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.circulate2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [23, 6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.vs1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [23, 5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 23*/
		union() {
			/*Edge 83 from one.ctrl_a[5].flush to $_83*/
			translate(v = [24.5, 3.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 84 from one.ctrl_a[5].hole to $_84*/
			translate(v = [24.5, 5.5, -1.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 85 from one.ctrl_a[6].flush to $_85*/
			translate(v = [24.5, 3.5, -0.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 86 from one.ctrl_a[6].hole to $_86*/
			translate(v = [24.5, 6.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 134 from one.thingy.devices[0].thingy.circulate2 to $_134*/
			translate(v = [24.5, 4.5, -1.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 155 from $_155 to one.thingy.devices[0].thingy.vs1*/
			translate(v = [23.5, 7.5, 1.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 175 from one.thingy.devices[1].thingy.circulate2 to $_175*/
			translate(v = [24.5, 4.5, 1.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 196 from $_196 to one.thingy.devices[1].thingy.vs1*/
			translate(v = [23.5, 7.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 216 from one.thingy.devices[2].thingy.circulate2 to $_216*/
			translate(v = [24.5, 5.5, -0.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 227 from $_227 to one.thingy.devices[2].thingy.vs1*/
			translate(v = [23.5, 5.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 24*/
	union() {
		%/*Nodes shell 24*/
		union() {
			/*Node $_49*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [24, 3, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_27*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [24, 5, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_83*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [24, 3, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_84*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [24, 5, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_85*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [24, 3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_86*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [24, 6, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_134*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [24, 4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_153*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [24, 6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_154*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [24, 6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_155*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [24, 7, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_175*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [24, 4, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_194*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [24, 5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_195*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [24, 4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_196*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [24, 6, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_216*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [24, 5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_227*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [24, 4, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 24*/
		union() {
			/*Edge 49 from one.ctrl_a[4].flush to $_49*/
			translate(v = [24.5, 3.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 27 from one.ctrl_a[4].hole to $_27*/
			translate(v = [24.5, 5.5, 1.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 83 from $_83 to one.thingy.devices[2].thingy.v5*/
			translate(v = [25.5, 4.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 84 from $_84 to one.thingy.devices[0].thingy.v5*/
			translate(v = [25.5, 5.5, -0.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 85 from $_85 to one.thingy.devices[2].thingy.v6*/
			translate(v = [25.5, 4.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 86 from $_86 to one.thingy.devices[0].thingy.v6*/
			translate(v = [25.5, 7.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 134 from $_134 to one.thingy.devices[0].thingy.v5*/
			translate(v = [25.5, 5.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 153 from one.thingy.devices[0].thingy.v5 to $_153*/
			translate(v = [24.5, 6.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 153 from $_153 to one.thingy.devices[1].thingy.v5*/
			translate(v = [25.5, 5.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 154 from one.thingy.devices[0].thingy.v6 to $_154*/
			translate(v = [24.5, 6.5, -0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 155 from one.thingy.devices[0].thingy.v6 to $_155*/
			translate(v = [24.5, 7.5, 0.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 154 from $_154 to one.thingy.devices[1].thingy.v6*/
			translate(v = [25.5, 5.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 175 from $_175 to one.thingy.devices[1].thingy.v5*/
			translate(v = [25.5, 5.5, 1.5]) {
				rotate(a = [0, 90.0, -135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 194 from one.thingy.devices[1].thingy.v5 to $_194*/
			translate(v = [24.5, 5.5, 0.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 194 from $_194 to one.thingy.devices[2].thingy.v5*/
			translate(v = [25.5, 4.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 195 from one.thingy.devices[1].thingy.v6 to $_195*/
			translate(v = [24.5, 4.5, 0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 196 from one.thingy.devices[1].thingy.v6 to $_196*/
			translate(v = [24.5, 6.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 195 from $_195 to one.thingy.devices[2].thingy.v6*/
			translate(v = [25.5, 4.5, 0.5]) {
				rotate(a = [0, 90.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 216 from $_216 to one.thingy.devices[2].thingy.v5*/
			translate(v = [25.5, 4.5, -0.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 227 from one.thingy.devices[2].thingy.v6 to $_227*/
			translate(v = [24.5, 4.5, -0.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 25*/
	union() {
		%/*Nodes shell 25*/
		union() {
			/*Node one.ctrl_a[4].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [25, 4, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[4].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [25, 6, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v5*/
			color(alpha = 0.1, c = "black") {
				translate(v = [25, 5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v6*/
			color(alpha = 0.1, c = "black") {
				translate(v = [25, 7, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v5*/
			color(alpha = 0.1, c = "black") {
				translate(v = [25, 5, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v6*/
			color(alpha = 0.1, c = "black") {
				translate(v = [25, 5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v5*/
			color(alpha = 0.1, c = "black") {
				translate(v = [25, 4, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v6*/
			color(alpha = 0.1, c = "black") {
				translate(v = [25, 4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 25*/
		union() {
			/*Edge 81 from one.ctrl_a[4].flush to $_81*/
			translate(v = [26.5, 3.5, 1.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 82 from one.ctrl_a[4].hole to $_82*/
			translate(v = [26.5, 5.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 152 from $_152 to one.thingy.devices[0].thingy.v5*/
			translate(v = [25.5, 5.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 152 from $_152 to one.thingy.devices[0].thingy.v6*/
			translate(v = [25.5, 7.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 193 from $_193 to one.thingy.devices[1].thingy.v5*/
			translate(v = [25.5, 5.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 193 from $_193 to one.thingy.devices[1].thingy.v6*/
			translate(v = [25.5, 5.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 226 from $_226 to one.thingy.devices[2].thingy.v5*/
			translate(v = [25.5, 4.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 226 from $_226 to one.thingy.devices[2].thingy.v6*/
			translate(v = [25.5, 4.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 26*/
	union() {
		%/*Nodes shell 26*/
		union() {
			/*Node $_46*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [26, 2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_24*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [26, 3, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_47*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [26, 1, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_25*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [26, 4, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_48*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [26, 5, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_26*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [26, 6, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_81*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [26, 3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_82*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [26, 5, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_151*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [26, 4, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_152*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [26, 6, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_192*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [26, 2, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_193*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [26, 4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_226*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [26, 3, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 26*/
		union() {
			/*Edge 46 from one.ctrl_a[1].flush to $_46*/
			translate(v = [26.5, 2.5, -1.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 24 from one.ctrl_a[1].hole to $_24*/
			translate(v = [26.5, 3.5, -2.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 47 from one.ctrl_a[2].flush to $_47*/
			translate(v = [26.5, 1.5, -1.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 25 from one.ctrl_a[2].hole to $_25*/
			translate(v = [26.5, 4.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 48 from one.ctrl_a[3].flush to $_48*/
			translate(v = [26.5, 5.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 26 from one.ctrl_a[3].hole to $_26*/
			translate(v = [26.5, 6.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 81 from $_81 to one.thingy.devices[2].thingy.v4*/
			translate(v = [27.5, 2.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 82 from $_82 to one.thingy.devices[0].thingy.v4*/
			translate(v = [27.5, 5.5, -0.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 151 from one.thingy.devices[0].thingy.v4 to $_151*/
			translate(v = [26.5, 4.5, -0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 152 from one.thingy.devices[0].thingy.v4 to $_152*/
			translate(v = [26.5, 6.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 151 from $_151 to one.thingy.devices[1].thingy.v4*/
			translate(v = [27.5, 3.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 192 from one.thingy.devices[1].thingy.v4 to $_192*/
			translate(v = [26.5, 2.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 193 from one.thingy.devices[1].thingy.v4 to $_193*/
			translate(v = [26.5, 4.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 192 from $_192 to one.thingy.devices[2].thingy.v4*/
			translate(v = [27.5, 2.5, 0.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 226 from one.thingy.devices[2].thingy.v4 to $_226*/
			translate(v = [26.5, 3.5, 0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 27*/
	union() {
		%/*Nodes shell 27*/
		union() {
			/*Node one.ctrl_a[1].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [27, 1, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[1].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [27, 3, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[2].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [27, 0, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[2].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [27, 3, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[3].flush*/
			color(alpha = 0.1, c = "lightgreen") {
				translate(v = [27, 4, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.ctrl_a[3].hole*/
			color(alpha = 0.1, c = "green") {
				translate(v = [27, 5, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [27, 5, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [27, 3, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v4*/
			color(alpha = 0.1, c = "black") {
				translate(v = [27, 2, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 27*/
		union() {
			/*Edge 75 from one.ctrl_a[1].flush to $_75*/
			translate(v = [28.5, 0.5, -1.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 76 from one.ctrl_a[1].hole to $_76*/
			translate(v = [28.5, 2.5, -3.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from one.ctrl_a[2].flush to $_77*/
			translate(v = [28.5, -0.5, -1.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 78 from one.ctrl_a[2].hole to $_78*/
			translate(v = [28.5, 3.5, 0.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 79 from one.ctrl_a[3].flush to $_79*/
			translate(v = [28.5, 3.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 80 from one.ctrl_a[3].hole to $_80*/
			translate(v = [28.5, 4.5, -2.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 143 from $_143 to one.thingy.devices[0].thingy.v4*/
			translate(v = [27.5, 5.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 184 from $_184 to one.thingy.devices[1].thingy.v4*/
			translate(v = [27.5, 3.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 223 from $_223 to one.thingy.devices[2].thingy.v4*/
			translate(v = [27.5, 2.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 28*/
	union() {
		%/*Nodes shell 28*/
		union() {
			/*Node $_75*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [28, 0, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_76*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [28, 2, -4]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_77*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [28, -1, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_78*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [28, 3, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_79*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [28, 3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_80*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [28, 4, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_142*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [28, 2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_143*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [28, 4, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_149*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [28, 2, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_150*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [28, 2, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_183*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [28, 1, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_184*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [28, 2, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_190*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [28, 0, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_191*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [28, 1, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_223*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [28, 1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 28*/
		union() {
			/*Edge 75 from $_75 to one.thingy.devices[2].thingy.v1*/
			translate(v = [29.5, 1.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 76 from $_76 to one.thingy.devices[0].thingy.v1*/
			translate(v = [29.5, 3.5, -2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 77 from $_77 to one.thingy.devices[2].thingy.v2*/
			translate(v = [29.5, 0.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 78 from $_78 to one.thingy.devices[0].thingy.v2*/
			translate(v = [29.5, 3.5, -0.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 79 from $_79 to one.thingy.devices[2].thingy.v3*/
			translate(v = [29.5, 2.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 80 from $_80 to one.thingy.devices[0].thingy.v3*/
			translate(v = [29.5, 3.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 142 from one.thingy.devices[0].thingy.v1 to $_142*/
			translate(v = [28.5, 2.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 143 from one.thingy.devices[0].thingy.v1 to $_143*/
			translate(v = [28.5, 4.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 142 from $_142 to one.thingy.devices[1].thingy.v1*/
			translate(v = [29.5, 2.5, -0.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 143 from $_143 to one.thingy.devices[0].thingy.v2*/
			translate(v = [29.5, 3.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 143 from $_143 to one.thingy.devices[0].thingy.v3*/
			translate(v = [29.5, 3.5, -1.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 149 from one.thingy.devices[0].thingy.v2 to $_149*/
			translate(v = [28.5, 2.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 149 from $_149 to one.thingy.devices[1].thingy.v2*/
			translate(v = [29.5, 1.5, 0.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 150 from one.thingy.devices[0].thingy.v3 to $_150*/
			translate(v = [28.5, 2.5, -2.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 150 from $_150 to one.thingy.devices[1].thingy.v3*/
			translate(v = [29.5, 1.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 183 from one.thingy.devices[1].thingy.v1 to $_183*/
			translate(v = [28.5, 1.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 184 from one.thingy.devices[1].thingy.v1 to $_184*/
			translate(v = [28.5, 2.5, -0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 183 from $_183 to one.thingy.devices[2].thingy.v1*/
			translate(v = [29.5, 1.5, -0.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 184 from $_184 to one.thingy.devices[1].thingy.v2*/
			translate(v = [29.5, 1.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 184 from $_184 to one.thingy.devices[1].thingy.v3*/
			translate(v = [29.5, 1.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 190 from one.thingy.devices[1].thingy.v2 to $_190*/
			translate(v = [28.5, 0.5, 0.5]) {
				rotate(a = [0, 90.0, 45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 190 from $_190 to one.thingy.devices[2].thingy.v2*/
			translate(v = [29.5, 0.5, -0.5]) {
				rotate(a = [0, 45.00000000000001, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 191 from one.thingy.devices[1].thingy.v3 to $_191*/
			translate(v = [28.5, 1.5, -2.5]) {
				rotate(a = [0, 45.00000000000001, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 191 from $_191 to one.thingy.devices[2].thingy.v3*/
			translate(v = [29.5, 2.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 223 from one.thingy.devices[2].thingy.v1 to $_223*/
			translate(v = [28.5, 1.5, -0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 223 from $_223 to one.thingy.devices[2].thingy.v2*/
			translate(v = [29.5, 0.5, -0.5]) {
				rotate(a = [0, 90.0, 135.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 223 from $_223 to one.thingy.devices[2].thingy.v3*/
			translate(v = [29.5, 2.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 29*/
	union() {
		%/*Nodes shell 29*/
		union() {
			/*Node one.thingy.devices[0].thingy.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [29, 3, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [29, 3, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[0].thingy.v3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [29, 3, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [29, 2, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [29, 1, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[1].thingy.v3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [29, 1, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v1*/
			color(alpha = 0.1, c = "black") {
				translate(v = [29, 1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v2*/
			color(alpha = 0.1, c = "black") {
				translate(v = [29, 0, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.thingy.devices[2].thingy.v3*/
			color(alpha = 0.1, c = "black") {
				translate(v = [29, 2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 29*/
		union() {
			/*Edge 101 from $_101 to one.thingy.devices[0].thingy.v1*/
			translate(v = [29.5, 3.5, -2.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 102 from $_102 to one.thingy.devices[0].thingy.v2*/
			translate(v = [29.5, 3.5, -0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 103 from $_103 to one.thingy.devices[0].thingy.v3*/
			translate(v = [29.5, 3.5, -1.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 108 from $_108 to one.thingy.devices[1].thingy.v1*/
			translate(v = [29.5, 2.5, -0.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 109 from $_109 to one.thingy.devices[1].thingy.v2*/
			translate(v = [29.5, 1.5, 0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 110 from $_110 to one.thingy.devices[1].thingy.v3*/
			translate(v = [29.5, 1.5, -1.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 115 from $_115 to one.thingy.devices[2].thingy.v1*/
			translate(v = [29.5, 1.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 116 from $_116 to one.thingy.devices[2].thingy.v2*/
			translate(v = [29.5, 0.5, -0.5]) {
				rotate(a = [0, 54.735610317245346, 45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 117 from $_117 to one.thingy.devices[2].thingy.v3*/
			translate(v = [29.5, 2.5, -1.5]) {
				rotate(a = [0, 90.0, -45.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
		}
	}
	/*Shell 30*/
	union() {
		%/*Nodes shell 30*/
		union() {
			/*Node $_101*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [30, 2, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_102*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [30, 2, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_103*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [30, 2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_108*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [30, 1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_109*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [30, 0, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_110*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [30, 0, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_115*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [30, 0, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_116*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [30, 1, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_117*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [30, 1, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 30*/
		union() {
			/*Edge 101 from one.pinholes[0].hole_in_a to $_101*/
			translate(v = [30.5, 2.5, -2.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 102 from one.pinholes[0].hole_in_b to $_102*/
			translate(v = [30.5, 2.5, -0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 103 from one.pinholes[0].hole_in_c to $_103*/
			translate(v = [30.5, 2.5, -1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 108 from one.pinholes[1].hole_in_a to $_108*/
			translate(v = [30.5, 1.5, -0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 109 from one.pinholes[1].hole_in_b to $_109*/
			translate(v = [30.5, 0.5, 1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 110 from one.pinholes[1].hole_in_c to $_110*/
			translate(v = [30.5, 0.5, -0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 115 from one.pinholes[2].hole_in_a to $_115*/
			translate(v = [30.5, 0.5, 0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 116 from one.pinholes[2].hole_in_b to $_116*/
			translate(v = [30.5, 1.5, 0.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*Edge 117 from one.pinholes[2].hole_in_c to $_117*/
			translate(v = [30.5, 1.5, -1.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
		}
	}
	/*Shell 31*/
	union() {
		%/*Nodes shell 31*/
		union() {
			/*Node one.pinholes[0].hole_in_a*/
			color(alpha = 0.1, c = "black") {
				translate(v = [31, 2, -3]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].hole_in_b*/
			color(alpha = 0.1, c = "black") {
				translate(v = [31, 2, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[0].hole_in_c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [31, 2, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[1].hole_in_a*/
			color(alpha = 0.1, c = "black") {
				translate(v = [31, 1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[1].hole_in_b*/
			color(alpha = 0.1, c = "black") {
				translate(v = [31, 0, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[1].hole_in_c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [31, 0, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[2].hole_in_a*/
			color(alpha = 0.1, c = "black") {
				translate(v = [31, 0, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[2].hole_in_b*/
			color(alpha = 0.1, c = "black") {
				translate(v = [31, 1, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node one.pinholes[2].hole_in_c*/
			color(alpha = 0.1, c = "black") {
				translate(v = [31, 1, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 31*/
		union() {
			/*Edge 2 from one.pinholes[0].hole_in_a to $_2*/
			translate(v = [32.5, 1.5, -1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 5 from one.pinholes[0].hole_in_b to $_5*/
			translate(v = [32.5, 2.5, 0.5]) {
				rotate(a = [0, 135.0, 180.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*Edge 8 from one.pinholes[0].hole_in_c to $_8*/
			translate(v = [32.5, 1.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 3 from one.pinholes[1].hole_in_a to $_3*/
			translate(v = [32.5, 0.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 6 from one.pinholes[1].hole_in_b to $_6*/
			translate(v = [32.5, 1.5, 2.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 9 from one.pinholes[1].hole_in_c to $_9*/
			translate(v = [32.5, 1.5, 0.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 4 from one.pinholes[2].hole_in_a to $_4*/
			translate(v = [32.5, 1.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, -135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 7 from one.pinholes[2].hole_in_b to $_7*/
			translate(v = [32.5, 0.5, 1.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*Edge 10 from one.pinholes[2].hole_in_c to $_10*/
			translate(v = [32.5, 0.5, -0.5]) {
				rotate(a = [0, 125.26438968275465, 135.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 32*/
	union() {
		%/*Nodes shell 32*/
		union() {
			/*Node $_2*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [32, 1, -2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_5*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [32, 2, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [32, 1, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_3*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [32, 0, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_6*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [32, 1, 2]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_9*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [32, 1, 0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_4*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [32, 1, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_7*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [32, 0, 1]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*Node $_10*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [32, 0, -1]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 32*/
		union();
	}
}
