module mix_2_iter (
    soln1,
    soln2,
    soln3,
    out
);

input   soln1, soln2, soln3;
output  out;


wire    connect20, connect21, connect22, connect31, connect32, connect33, connect2, connect6;

// Specification
serpentine_300px_0  serp20   (.in_fluid(soln2),     .out_fluid(connect20));
serpentine_300px_0  serp21   (.in_fluid(connect20), .out_fluid(connect21));
serpentine_300px_0  serp22   (.in_fluid(connect21), .out_fluid(connect22));

diffmix_25px_0      mix0     (.a_fluid(soln1), .b_fluid(connect22), .out_fluid(connect2));

serpentine_300px_2  serp31   (.in_fluid(soln3),     .out_fluid(connect31));
serpentine_300px_2  serp32   (.in_fluid(connect31), .out_fluid(connect32));
serpentine_300px_2  serp33   (.in_fluid(connect32), .out_fluid(connect33));

diffmix_25px_0      mix1     (.a_fluid(connect2), .b_fluid(connect33), .out_fluid(connect6));

serpentine_300px_2  serp5    (.in_fluid(connect6), .out_fluid(out));

endmodule
