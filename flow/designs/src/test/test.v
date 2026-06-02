module test (
    soln1,
    soln2,
    soln3,
    out
);

input soln1, soln2, soln3;
output out;

wire connect0, connect1, connect2, connect3;

p_resistor_0_1_14_10_6_5_5 resist0     (.in_fluid(soln1), .out_fluid(connect0));
p_resistor_0_1_20_15_11_8_5 resist1     (.in_fluid(soln2), .out_fluid(connect1));
p_resistor_0_1_40_30_20_15_5 resist2 (.in_fluid(soln3), .out_fluid(connect2));

diffmix_25px_0 mix0         (.a_fluid(connect0), .b_fluid(connect1), .out_fluid(connect3));
diffmix_25px_0 mix1         (.a_fluid(connect2), .b_fluid(connect3), .out_fluid(out));

endmodule