module test (
    a_fluid,
    b_fluid,
    out_fluid
);

input a_fluid, b_fluid;
output out_fluid;

wire connect0, connect1;

serpentine_300px_0 serp0 (.in_fluid(a_fluid), .out_fluid(connect0));
serpentine_300px_0 serp1 (.in_fluid(connect0), .out_fluid(connect1));
diffmix_25px_0 mix0 (.a_fluid(connect1), .b_fluid(b_fluid), .out_fluid(out_fluid));

endmodule