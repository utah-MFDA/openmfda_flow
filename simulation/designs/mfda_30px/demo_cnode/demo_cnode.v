module demo_cnode (
    soln1,
    soln2,
    soln3,
    out
);

input   soln1, soln2, soln3;
output  out;


wire    connect0,  connect1,  connect2,  connect3,  connect4,  connect5,  connect6;


// Specification
serpentine_50px_0   serp0   (.in_fluid(soln2), .out_fluid(connect0));
serpentine_150px_0  serp1   (.in_fluid(connect0), .out_fluid(connect1));

diffmix_25px_0      mix0    (.a_fluid(soln1), .b_fluid(connect1), .out_fluid(connect2));

serpentine_300px_2  serp2   (.in_fluid(soln3), .out_fluid(connect3));
serpentine_300px_2  serp3   (.in_fluid(connect3), .out_fluid(connect4));
serpentine_300px_2  serp4   (.in_fluid(connect4), .out_fluid(connect5));

diffmix_25px_0      mix1    (.a_fluid(connect2), .b_fluid(connect5), .out_fluid(connect6));

serpentine_300px_0  serp5  (.in_fluid(connect6), .out_fluid(out));


endmodule
