// main test module

module test (
	soln1,
	soln2,
	soln3,
	soln4,
	soln5,
	soln6,
	soln7,
	soln8,
	soln9,
	soln10,
	soln11,
	soln12,
	soln13,
	out1,
	out2,
	out3,
	out4
);
input	soln1, soln2, soln3, soln4, soln5, soln6, soln7, soln8, soln9, soln10, soln11, soln12, soln13;
output	out1, out2, out3, out4;


wire	connect0,	connect1,	connect2,	connect3,	connect4,	connect5, connect6, connect7, connect8, connect9,
connect10, connect11, connect12, connect13, connect14, connect15, connect16, connect17, connect18, connect19, connect20,
connect21, connect22, connect23;

// albumin1
p_resistor_0_3_20_15_11_8_5	resist0	(.in_fluid(soln1), .out_fluid(connect0));

p_resistor_0_2_20_15_11_8_5	resist1	(.in_fluid(soln2), .out_fluid(connect1));

p_resistor_0_1_40_30_20_15_5	resist2	(.in_fluid(soln3), .out_fluid(connect2));

p_resistor_0_1_40_30_20_15_5	resist3	(.in_fluid(soln4), .out_fluid(connect3));
diffmix_25px_0	mix0	(.a_fluid(connect0), .b_fluid(connect1), .out_fluid(connect4));
diffmix_25px_0	mix1	(.a_fluid(connect2), .b_fluid(connect4), .out_fluid(connect5));
diffmix_25px_0	mix2	(.a_fluid(connect3), .b_fluid(connect5), .out_fluid(out1));

// albumin2
p_resistor_0_3_20_15_11_8_5	resist4	(.in_fluid(soln1), .out_fluid(connect6));

p_resistor_0_2_20_15_11_8_5	resist5	(.in_fluid(soln5), .out_fluid(connect7));

p_resistor_0_1_40_30_20_15_5	resist6	(.in_fluid(soln6), .out_fluid(connect8));

p_resistor_0_1_40_30_20_15_5	resist7	(.in_fluid(soln7), .out_fluid(connect9));
diffmix_25px_0	mix3	(.a_fluid(connect6), .b_fluid(connect7), .out_fluid(connect10));
diffmix_25px_0	mix4	(.a_fluid(connect8), .b_fluid(connect10), .out_fluid(connect11));
diffmix_25px_0	mix5	(.a_fluid(connect9), .b_fluid(connect11), .out_fluid(out2));

// albumin3
p_resistor_0_3_20_15_11_8_5	resist8	(.in_fluid(soln1), .out_fluid(connect12));

p_resistor_0_2_20_15_11_8_5	resist9	(.in_fluid(soln8), .out_fluid(connect13));

p_resistor_0_1_40_30_20_15_5	resist10	(.in_fluid(soln9), .out_fluid(connect14));

p_resistor_0_1_40_30_20_15_5	resist11    (.in_fluid(soln10), .out_fluid(connect15));
diffmix_25px_0	mix6	(.a_fluid(connect12), .b_fluid(connect13), .out_fluid(connect16));
diffmix_25px_0	mix7	(.a_fluid(connect14), .b_fluid(connect16), .out_fluid(connect17));
diffmix_25px_0	mix8	(.a_fluid(connect15), .b_fluid(connect17), .out_fluid(out3));

// albumin4
p_resistor_0_3_20_15_11_8_5	resist12	(.in_fluid(soln1), .out_fluid(connect18));

p_resistor_0_2_20_15_11_8_5	resist13	(.in_fluid(soln11), .out_fluid(connect19));

p_resistor_0_1_40_30_20_15_5	resist14	(.in_fluid(soln12), .out_fluid(connect20));

p_resistor_0_1_40_30_20_15_5	resist15    (.in_fluid(soln13), .out_fluid(connect21));
diffmix_25px_0	mix9	(.a_fluid(connect18), .b_fluid(connect19), .out_fluid(connect22));
diffmix_25px_0	mix10	(.a_fluid(connect20), .b_fluid(connect22), .out_fluid(connect23));
diffmix_25px_0	mix11	(.a_fluid(connect21), .b_fluid(connect23), .out_fluid(out4));

endmodule


