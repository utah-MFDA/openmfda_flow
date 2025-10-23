translate(v = [-0.5, -0.5, 0]) {
	/*Shell 0*/
	union() {
		%/*Nodes shell 0*/
		union() {
			/*$_38*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, -23.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_16*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 24.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_50*/
			color(alpha = 0.1, c = "yellow") {
				translate(v = [0, -25.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_28*/
			color(alpha = 0.1, c = "orange") {
				translate(v = [0, 23.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_8*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 25.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_11*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, 22.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_12*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, -22.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*$_15*/
			color(alpha = 0.1, c = "pink") {
				translate(v = [0, -21.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 0*/
		union() {
			/*one.ctrl_a[0].flush - $_38*/
			translate(v = [0.5, -22.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.ctrl_a[0].hole - $_16*/
			translate(v = [0.5, 24.5, 25.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.ctrl_a[12].flush - $_50*/
			translate(v = [0.5, -24.5, 25.5]) {
				rotate(a = [0, 135.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.4142135623730951]);
				}
			}
			/*one.ctrl_a[12].hole - $_28*/
			translate(v = [0.5, 23.5, 25.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.pinholes[0].out[0].hole - $_8*/
			translate(v = [0.5, 25.5, 25.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.pinholes[0].out[3].hole - $_11*/
			translate(v = [0.5, 22.5, 25.5]) {
				rotate(a = [0, 90.0, 0.0]) {
					cube(size = [0.125, 0.125, 1.0]);
				}
			}
			/*one.pinholes[1].out[0].hole - $_12*/
			translate(v = [0.5, -21.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
			/*one.pinholes[1].out[3].hole - $_15*/
			translate(v = [0.5, -20.5, 25.5]) {
				rotate(a = [0, 125.26438968275465, -45.0]) {
					cube(size = [0.125, 0.125, 1.7320508075688772]);
				}
			}
		}
	}
	/*Shell 1*/
	union() {
		%/*Nodes shell 1*/
		union() {
			/*one.ctrl_a[0].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, -24.0, 24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 24.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[12].flush*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, -25.0, 24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.ctrl_a[12].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 23.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].out[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 25.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[0].out[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, 22.0, 25.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].out[0].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, -23.0, 24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
			/*one.pinholes[1].out[3].hole*/
			color(alpha = 0.1, c = "black") {
				translate(v = [1, -22.0, 24.0]) {
					cube(size = [1, 1, 1]);
				}
			}
		}
		/*Edges shell 1*/
		union();
	}
	/*Shell 2*/
	union() {
		%/*Nodes shell 2*/
		union();
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
	/*Shell 11*/
	union() {
		%/*Nodes shell 11*/
		union();
		/*Edges shell 11*/
		union();
	}
	/*Shell 12*/
	union() {
		%/*Nodes shell 12*/
		union();
		/*Edges shell 12*/
		union();
	}
	/*Shell 13*/
	union() {
		%/*Nodes shell 13*/
		union();
		/*Edges shell 13*/
		union();
	}
	/*Shell 14*/
	union() {
		%/*Nodes shell 14*/
		union();
		/*Edges shell 14*/
		union();
	}
	/*Shell 15*/
	union() {
		%/*Nodes shell 15*/
		union();
		/*Edges shell 15*/
		union();
	}
	/*Shell 16*/
	union() {
		%/*Nodes shell 16*/
		union();
		/*Edges shell 16*/
		union();
	}
	/*Shell 17*/
	union() {
		%/*Nodes shell 17*/
		union();
		/*Edges shell 17*/
		union();
	}
	/*Shell 18*/
	union() {
		%/*Nodes shell 18*/
		union();
		/*Edges shell 18*/
		union();
	}
	/*Shell 19*/
	union() {
		%/*Nodes shell 19*/
		union();
		/*Edges shell 19*/
		union();
	}
	/*Shell 20*/
	union() {
		%/*Nodes shell 20*/
		union();
		/*Edges shell 20*/
		union();
	}
	/*Shell 21*/
	union() {
		%/*Nodes shell 21*/
		union();
		/*Edges shell 21*/
		union();
	}
	/*Shell 22*/
	union() {
		%/*Nodes shell 22*/
		union();
		/*Edges shell 22*/
		union();
	}
	/*Shell 23*/
	union() {
		%/*Nodes shell 23*/
		union();
		/*Edges shell 23*/
		union();
	}
	/*Shell 24*/
	union() {
		%/*Nodes shell 24*/
		union();
		/*Edges shell 24*/
		union();
	}
	/*Shell 25*/
	union() {
		%/*Nodes shell 25*/
		union();
		/*Edges shell 25*/
		union();
	}
	/*Shell 26*/
	union() {
		%/*Nodes shell 26*/
		union();
		/*Edges shell 26*/
		union();
	}
	/*Shell 27*/
	union() {
		%/*Nodes shell 27*/
		union();
		/*Edges shell 27*/
		union();
	}
	/*Shell 28*/
	union() {
		%/*Nodes shell 28*/
		union();
		/*Edges shell 28*/
		union();
	}
	/*Shell 29*/
	union() {
		%/*Nodes shell 29*/
		union();
		/*Edges shell 29*/
		union();
	}
	/*Shell 30*/
	union() {
		%/*Nodes shell 30*/
		union();
		/*Edges shell 30*/
		union();
	}
	/*Shell 31*/
	union() {
		%/*Nodes shell 31*/
		union();
		/*Edges shell 31*/
		union();
	}
	/*Shell 32*/
	union() {
		%/*Nodes shell 32*/
		union();
		/*Edges shell 32*/
		union();
	}
}
