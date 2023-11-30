module route_test (
    in_air0,
    in_air1,
    in_air2,
    in_fluid,
    out_air0,
    out_air1,
    out_air2,
    out_fluid
);

input in_air0, in_air1, in_air2, in_fluid;
output out_air0, out_air1, out_air2, out_fluid;

pump_40px_1 pump1           (.in_air_valve1(in_air0), .in_air_dc(in_air1), .in_air_valve2(in_air2), .in_fluid(in_fluid),
                             .out_air_valve1(out_air0), .out_air_dc(out_air1), .out_air_valve2(out_air2), .out_fluid(out_fluid));

endmodule