module caffeine (out,
    soln1,
    soln2,
    soln3);
 output out;
 input soln1;
 input soln2;
 input soln3;

 wire connect0;
 wire connect1;
 wire connect2;
 wire connect3;

 diffmix_25px_0 mix0 (.a_fluid(connect0),
    .b_fluid(connect1),
    .out_fluid(connect3));
 diffmix_25px_0 mix1 (.a_fluid(connect2),
    .b_fluid(connect3),
    .out_fluid(out));
 p_serpentine_0_360_30_81 serp0 (.in_fluid(soln1),
    .out_fluid(connect0));
 p_serpentine_0_30_30_1 serp1 (.in_fluid(soln2),
    .out_fluid(connect1));
 p_serpentine_0_30_30_1 serp2 (.in_fluid(soln3),
    .out_fluid(connect2));
endmodule
