module multiplex_test (
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
	soln14,
	soln15,
	soln16,
	soln17,
	soln18,
	out1,
	out2,
	out3,
	out4,
	out5,
	out6,
	out7,
	out8 
);
input	soln1, soln2, soln3, soln4, soln5, soln6, soln7, soln8, soln9, soln10, soln11, soln12, soln13, soln14, soln15, soln16, soln17, soln18;
output	out1, out2, out3, out4, out5, out6, out7, out8;

wire	connect0, connect1, connect2, connect3, connect4, connect5, connect6, connect7, connect8, connect9, connect10, connect11, connect12, connect13, connect14, connect15, connect16, connect17, connect18, connect19, connect20, connect21, connect22, connect23, connect24, connect25, connect26, connect27, connect28, connect29, connect30, connect31, connect32, connect33;

    
// albumin
p_resistor_0_3_20_15_11_8_5	resist0	(.in_fluid(soln1), .out_fluid(connect0));

p_resistor_0_2_20_15_11_8_5	resist1	(.in_fluid(soln2), .out_fluid(connect1));

p_resistor_0_1_40_30_20_15_5	resist2	(.in_fluid(soln3), .out_fluid(connect2));

p_resistor_0_1_40_30_20_15_5	resist3	(.in_fluid(soln4), .out_fluid(connect3));
diffmix_25px_0	mix0	(.a_fluid(connect0), .b_fluid(connect1), .out_fluid(connect4));
diffmix_25px_0	mix1	(.a_fluid(connect2), .b_fluid(connect4), .out_fluid(connect5));
diffmix_25px_0	mix2	(.a_fluid(connect3), .b_fluid(connect5), .out_fluid(out1));

// caffeine
p_resistor_0_5_20_15_11_8_5	resist6	(.in_fluid(soln1), .out_fluid(connect6));

p_resistor_0_1_40_30_20_15_5	resist7	(.in_fluid(soln5), .out_fluid(connect7));

p_resistor_0_1_40_30_20_15_5	resist8	(.in_fluid(soln6), .out_fluid(connect8));
diffmix_25px_0	mix3	(.a_fluid(connect6), .b_fluid(connect7), .out_fluid(connect9));
diffmix_25px_0	mix4	(.a_fluid(connect8), .b_fluid(connect9), .out_fluid(out2));

// calcium
p_resistor_0_1_14_10_6_5_5	resist10	(.in_fluid(soln1), .out_fluid(connect10));

p_resistor_0_8_40_30_20_15_5	resist11	(.in_fluid(soln7), .out_fluid(connect11));

p_resistor_0_1_40_30_20_15_5	resist12	(.in_fluid(soln8), .out_fluid(connect12));
diffmix_25px_0	mix5	(.a_fluid(connect10), .b_fluid(connect11), .out_fluid(connect13));
diffmix_25px_0	mix6	(.a_fluid(connect12), .b_fluid(connect13), .out_fluid(out3));

// cocaine
p_resistor_0_1_20_15_11_8_5	resist14	(.in_fluid(soln1), .out_fluid(connect14));

p_resistor_0_2_40_30_20_15_5	resist15	(.in_fluid(soln9), .out_fluid(connect15));

p_resistor_0_1_40_30_20_15_5	resist16	(.in_fluid(soln10), .out_fluid(connect16));
diffmix_25px_0	mix7	(.a_fluid(connect14), .b_fluid(connect15), .out_fluid(connect17));
diffmix_25px_0	mix8	(.a_fluid(connect16), .b_fluid(connect17), .out_fluid(out4));

// ethyl
p_resistor_0_5_20_15_11_8_5	resist18	(.in_fluid(soln1), .out_fluid(connect18));

p_resistor_0_2_40_30_20_15_5	resist19	(.in_fluid(soln11), .out_fluid(connect19));

p_resistor_0_1_40_30_20_15_5	resist20	(.in_fluid(soln12), .out_fluid(connect20));
diffmix_25px_0	mix9	(.a_fluid(connect18), .b_fluid(connect19), .out_fluid(connect21));
diffmix_25px_0	mix10	(.a_fluid(connect20), .b_fluid(connect21), .out_fluid(out5));

// ketone
p_resistor_0_1_40_30_20_15_5	resist22	(.in_fluid(soln1), .out_fluid(connect22));

p_resistor_0_1_40_30_20_15_5	resist23	(.in_fluid(soln13), .out_fluid(connect23));
diffmix_25px_0	mix11	(.a_fluid(connect22), .b_fluid(connect23), .out_fluid(out6));

// nitrite
p_resistor_0_2_40_30_20_15_5	resist24	(.in_fluid(soln14), .out_fluid(connect24));

p_resistor_0_2_40_30_20_15_5	resist25	(.in_fluid(soln15), .out_fluid(connect25));

p_resistor_0_1_40_30_20_15_5	resist26	(.in_fluid(soln1), .out_fluid(connect26));
diffmix_25px_0	mix12	(.a_fluid(connect24), .b_fluid(connect25), .out_fluid(connect27));
diffmix_25px_0	mix13	(.a_fluid(connect26), .b_fluid(connect27), .out_fluid(out7));

// salicylic_acid
p_resistor_0_5_20_15_11_8_5	resist28	(.in_fluid(soln1), .out_fluid(connect28));

p_resistor_0_1_20_15_11_8_5	resist29	(.in_fluid(soln16), .out_fluid(connect29));

p_resistor_0_2_40_30_20_15_5	resist30	(.in_fluid(soln17), .out_fluid(connect30));

p_resistor_0_1_40_30_20_15_5	resist31	(.in_fluid(soln18), .out_fluid(connect31));
diffmix_25px_0	mix14	(.a_fluid(connect28), .b_fluid(connect29), .out_fluid(connect32));
diffmix_25px_0	mix15	(.a_fluid(connect30), .b_fluid(connect32), .out_fluid(connect33));
diffmix_25px_0	mix16	(.a_fluid(connect31), .b_fluid(connect33), .out_fluid(out8));

    
endmodule
    