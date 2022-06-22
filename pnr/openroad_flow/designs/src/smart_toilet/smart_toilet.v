module smart_toilet (
    a_fluid,
    b_fluid,
    out_fluid
);

input a_fluid, b_fluid;
output out_fluid;

wire connect0;

serpentine_300px_0 serp0 (.in_fluid(a_fluid), .out_fluid(connect0));
diffmix_25px_0 mix0 (.a_fluid(connect0), .b_fluid(b_fluid), .out_fluid(out_fluid));

endmodule