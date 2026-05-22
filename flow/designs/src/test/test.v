module test (
    soln1,
    soln2,
    soln3,
    out
);

input soln1, soln2, soln3;
output out;

wire connect0, connect1, connect2, connect3, connect4, connect5, connect6, connect7, connect8, connect9;

p_serpentine_0_360_30_62 serp0     (.in_fluid(soln1), .out_fluid(connect0));
serpentine_50px_0 serp1     (.in_fluid(soln2), .out_fluid(connect1));
p_resistor_1_13_10_5_4_5 resist0 (.in_fluid(soln3), .out_fluid(connect2));
//serpentine_50px_0 serp2     (.in_fluid(soln3), .out_fluid(connect2));

diffmix_25px_0 mix0         (.a_fluid(connect0), .b_fluid(connect1), .out_fluid(connect3));
diffmix_25px_0 mix1         (.a_fluid(connect2), .b_fluid(connect3), .out_fluid(out));

endmodule