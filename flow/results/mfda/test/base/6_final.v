module test (in_air0,
    in_air1,
    in_air2,
    in_air3,
    in_fluid,
    out_air0,
    out_air1,
    out_air2,
    out_air3,
    out_fluid);
 input in_air0;
 input in_air1;
 input in_air2;
 input in_air3;
 input in_fluid;
 output out_air0;
 output out_air1;
 output out_air2;
 output out_air3;
 output out_fluid;

 wire connect0;
 wire connect1;
 wire connect2;

 valve_20px_1 valve0 (.in_air(in_air0),
    .out_air(out_air0),
    .in_fluid(in_fluid),
    .out_fluid(connect0));
 valve_20px_1 valve1 (.in_air(in_air1),
    .out_air(out_air1),
    .in_fluid(connect0),
    .out_fluid(connect1));
 valve_20px_1 valve2 (.in_air(in_air2),
    .out_air(out_air2),
    .in_fluid(connect1),
    .out_fluid(connect2));
 valve_20px_1 valve3 (.in_air(in_air3),
    .out_air(out_air3),
    .in_fluid(connect2),
    .out_fluid(out_fluid));
endmodule
