module test (
    in_fluid,
    out_fluid
);

input in_fluid;
output out_fluid;

wire connect0, connect1, connect2;

serpentine_50px_0 serp0 (.in_fluid(in_fluid), .out_fluid(connect0));
serpentine_75px_0 serp1 (.in_fluid(connect0), .out_fluid(connect1));
serpentine_100px_0 serp2 (.in_fluid(connect1), .out_fluid(connect2));
serpentine_150px_0 serp3 (.in_fluid(connect2), .out_fluid(out_fluid));

endmodule