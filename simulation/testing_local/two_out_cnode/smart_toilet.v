module smart_toilet (
    soln1,
    soln2,
    soln3,
    out
);

input   soln1, soln2, soln3;
output  out;

wire    connect1,  connect2,  connect3,  connect4,  connect6,  connect7;

serpentine_50px_0   serp1   (.in_fluid(soln2), .out_fluid(connect1));
serpentine_50px_0   serp12  (.in_fluid(soln2), .out_fluid(connect2));
serpentine_150px_0  serp2   (.in_fluid(connect1), .out_fluid(connect2));

diffmix_25px_0      mix0    (.a_fluid(soln1), .b_fluid(connect2), .out_fluid(connect3));

serpentine_300px_0  serp3   (.in_fluid(soln3), .out_fluid(connect4));
serpentine_300px_0  serp4   (.in_fluid(connect4), .out_fluid(connect6));
serpentine_300px_0  serp5   (.in_fluid(connect4), .out_fluid(out));



diffmix_25px_0      mix1    (.a_fluid(connect3), .b_fluid(connect6), .out_fluid(connect7));

serpentine_300px_0  serp11  (.in_fluid(connect7), .out_fluid(out));

endmodule