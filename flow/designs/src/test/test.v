module test (
    soln1,
    soln2,
    out1
);

input soln1, soln2;
output out1;

wire connect0, connect1;


p_resistor_0_10_14_10_6_5_5 resist0     (.in_fluid(soln1), .out_fluid(connect0));

p_resistor_0_1_40_30_20_15_5 resist1     (.in_fluid(soln2), .out_fluid(connect1));

//p_resistor_0_1_20_15_11_8_5 resist1     (.in_fluid(soln2), .out_fluid(out2));

//p_resistor_0_1_40_30_20_15_5 resist3 (.in_fluid(connect0), .out_fluid(out3));

diffmix_25px_0  mix0    (.a_fluid(connect0), .b_fluid(connect1), .out_fluid(out1));


endmodule