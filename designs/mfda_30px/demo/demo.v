module demo (
    soln1,
    soln2,
    soln3,
    out
);

input   soln1, soln2, soln3;
output  out;


wire    connect0,  connect1,  connect2,  connect3,  connect4,  connect5,  connect6;
//,  connect7,  connect8,  connect9,
//        connect10, connect11, connect12;


// Specification
serpentine_50px_0   serp0   (.in_fluid(soln2), .out_fluid(connect0));
serpentine_150px_0  serp1   (.in_fluid(connect0), .out_fluid(connect1));

diffmix_25px_0      mix0    (.a_fluid(soln1), .b_fluid(connect1), .out_fluid(connect2));

serpentine_300px_2  serp2   (.in_fluid(soln3), .out_fluid(connect3));
serpentine_300px_2  serp3   (.in_fluid(connect3), .out_fluid(connect4));
serpentine_300px_2  serp4   (.in_fluid(connect4), .out_fluid(connect5));

diffmix_25px_0      mix1    (.a_fluid(connect2), .b_fluid(connect5), .out_fluid(connect6));

serpentine_300px_0  serp5  (.in_fluid(connect6), .out_fluid(out));

// Implemented
// serpentine_300px_2  serp0   (.in_fluid(soln2), .out_fluid(connect0));

// diffmix_25px_0      mix0    (.a_fluid(soln1), .b_fluid(connect0), .out_fluid(connect1));

// serpentine_300px_2  serp1   (.in_fluid(soln3), .out_fluid(connect2));
// serpentine_300px_2  serp2   (.in_fluid(connect2), .out_fluid(connect3));
// serpentine_300px_2  serp3   (.in_fluid(connect3), .out_fluid(connect4));
// serpentine_300px_2  serp4   (.in_fluid(connect4), .out_fluid(connect5));
// serpentine_300px_2  serp5   (.in_fluid(connect5), .out_fluid(connect6));
// serpentine_300px_2  serp6   (.in_fluid(connect6), .out_fluid(connect7));

// diffmix_25px_0      mix1    (.a_fluid(connect1), .b_fluid(connect7), .out_fluid(connect8));

// serpentine_300px_0  serp7  (.in_fluid(connect8), .out_fluid(out));

endmodule
