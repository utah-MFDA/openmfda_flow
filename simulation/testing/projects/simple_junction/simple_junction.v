module simple_junction (
    soln1,
    soln2,
    out
);

input   soln1, soln2;
output  out;

// connect0,  

wire    connect1;
//,  connect2,  connect4,  connect5,  connect6,  connect7;
//,  connect8,  connect9,  connect3, 
//        connect10, connect11, connect12;

// serpentine_25px_0   serp0   (.in_fluid(soln1), .out_fluid(connect0));

//serpentine_50px_0   serp1   (.in_fluid(soln1), .out_fluid(connect1));
//serpentine_150px_0  serp2   (.in_fluid(connect1), .out_fluid(connect2));

//diffmix_25px_0      mix0    (.a_fluid(soln1), .b_fluid(connect2), .out_fluid(connect3));

//serpentine_300px_0  serp3   (.in_fluid(soln2), .out_fluid(connect4));
//serpentine_300px_0  serp4   (.in_fluid(connect4), .out_fluid(connect5));
//serpentine_300px_0  serp5   (.in_fluid(connect5), .out_fluid(connect6));
//serpentine_300px_0  serp6   (.in_fluid(connect6), .out_fluid(connect8));
// serpentine_300px_0  serp7   (.in_fluid(connect8), .out_fluid(connect9));
// serpentine_300px_0  serp8   (.in_fluid(connect9), .out_fluid(connect10));
// serpentine_300px_0  serp9   (.in_fluid(connect10), .out_fluid(connect11));
// serpentine_300px_0  serp10  (.in_fluid(connect11), .out_fluid(connect12));

diffmix_25px_0      mix1    (.a_fluid(soln1), .b_fluid(soln2), .out_fluid(connect1));

serpentine_300px_0  serp11  (.in_fluid(connect1), .out_fluid(out));

endmodule