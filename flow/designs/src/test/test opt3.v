module test (
    in_air_valve1,
    in_air_dc,
    in_air_valve2,
    in_fluid,
    in_air,
    out_air_valve1,
    out_air_dc,
    out_air_valve2,
    out_fluid,
    out_air
);

    input in_air_valve1, in_air_dc, in_air_valve2, in_fluid, in_air;
    output out_air_valve1, out_air_dc, out_air_valve2, out_fluid, out_air;

    wire connect0, connect1;

    pump_40px_1 pump0 (
        .in_air_valve1(in_air_valve1),
        .in_air_dc(in_air_dc),
        .in_air_valve2(in_air_valve2),
        .in_fluid(in_fluid),
        .out_air_valve1(out_air_valve1),
        .out_air_dc(out_air_dc),
        .out_air_valve2(out_air_valve2),
        .out_fluid(connect0)
    );
    valve_20px_1 valve0 (.in_air(in_air), .in_fluid(connect0), .out_air(out_air), .out_fluid(connect1));
    serpentine_150px_0 serpentine0 (.in_fluid(connect1), .out_fluid(out_fluid));

endmodule