module demoPCell (
    soln1,
    soln2,
    soln3,
    out
);

input   soln1, soln2, soln3;
output  out;


wire    connect0,  connect1,  connect2,  connect3, connect41, connect42, connect5,  connect6; 


// Specification
serpentine_50px_0   serp0   (.in_fluid(soln2), .out_fluid(connect0));
serpentine_150px_0  serp1   (.in_fluid(connect0), .out_fluid(connect1));

diffmix_25px_0      mix0    (.a_fluid(soln1), .b_fluid(connect1), .out_fluid(connect2));

serpentine_150px_0       serp2   (.in_fluid(soln3), .out_fluid(connect3));
// parameteric serpentine
p_serpentine_0_180_30_4  serp3  (.in_fluid(connect3), .out_fluid(connect41));
serpentine_150px_0       serp4   (.in_fluid(connect41), .out_fluid(connect5));

serpentine_150px_0  serp5   (.in_fluid(connect3), .out_fluid(connect42));
serpentine_150px_0  serp6   (.in_fluid(connect42), .out_fluid(connect5));

diffmix_25px_0      mix1    (.a_fluid(connect2), .b_fluid(connect5), .out_fluid(connect6));

serpentine_150px_0  serp7  (.in_fluid(connect6), .out_fluid(out));


endmodule
