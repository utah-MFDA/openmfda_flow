module foo ();
	wire \+5V ;
	wire \/result ;
	wire \/signal ;
	wire \GND ;
	wire \Net-(U1A-+) ;
	wire \unconnected-(U1-Pad7) ;
	wire \unconnected-(U1B-+-Pad5) ;
	wire \unconnected-(U1B---Pad6) ;
	\Barrel_Jack \J1 (
		.\1 (\+5V ),
		.\2 (\GND )
	);
	\100k \R2 (
		.\1 (\Net-(U1A-+) ),
		.\2 (\/result )
	);
	\100k \R1 (
		.\1 (\/signal ),
		.\2 (\Net-(U1A-+) )
	);
	\AudioJack2 \J3 (
		.\S (\GND ),
		.\T (\/result )
	);
	\AudioJack2 \J2 (
		.\S (\GND ),
		.\T (\/signal )
	);
	\TL072 \U1 (
		.\1 (\/result ),
		.\2 (\GND ),
		.\3 (\Net-(U1A-+) ),
		.\4 (\GND ),
		.\5 (\unconnected-(U1B-+-Pad5) ),
		.\6 (\unconnected-(U1B---Pad6) ),
		.\7 (\unconnected-(U1-Pad7) ),
		.\8 (\+5V )
	);
endmodule
