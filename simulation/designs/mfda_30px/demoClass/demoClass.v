module demoClass (out,
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
 wire connect4;
 wire connect5;
 wire connect6;

 diffmix_25px_0 mix0 (.a_fluid(soln1),
    .b_fluid(connect1),
    .out_fluid(connect2));
 diffmix_25px_0 mix1 (.a_fluid(connect2),
    .b_fluid(connect5),
    .out_fluid(connect6));
 serpentine_50px_0 serp0 (.in_fluid(soln2),
    .out_fluid(connect0));
 serpentine_150px_0 serp1 (.in_fluid(connect0),
    .out_fluid(connect1));
 serpentine_300px_2 serp2 (.in_fluid(soln3),
    .out_fluid(connect3));
 serpentine_300px_2 serp3 (.in_fluid(connect3),
    .out_fluid(connect4));
 serpentine_300px_2 serp4 (.in_fluid(connect4),
    .out_fluid(connect5));
 serpentine_300px_0 serp5 (.in_fluid(connect6),
    .out_fluid(out));
endmodule
