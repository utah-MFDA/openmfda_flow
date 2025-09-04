module ketone_v2 (
	soln1,
	soln2,
	out 
);
input	soln1, soln2;
output	out;

wire	connect0,	connect1;

    
p_serpentine_0_60_30_9	serp0	(.in_fluid(soln1), .out_fluid(connect0));

p_serpentine_0_30_30_1	serp1	(.in_fluid(soln2), .out_fluid(connect1));
diffmix_25px_0	mix0	(.a_fluid(connect0), .b_fluid(connect1), .out_fluid(out));

    
endmodule
    