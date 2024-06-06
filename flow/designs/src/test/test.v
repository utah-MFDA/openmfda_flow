module test (
    in_air0,
    in_air1,
    in_air2,
    in_air3,
    in_air4,
    in_air5,
    in_air6,
    in_fluid0,
    in_fluid1,
    out_air0,
    out_air1,
    out_air2,
    out_air3,
    out_air4,
    out_air5,
    out_air6,
    out_fluid
);

input in_air0, in_air1, in_air2, in_air3, in_air4, in_air5, in_air6, in_fluid0, in_fluid1;
output out_air0, out_air1, out_air2, out_air3, out_air4, out_air5, out_air6, out_fluid;

wire connect0, connect1, connect2, connect3, connect4, connect5, connect6, connect7, connect8, connect9;

valve_20px_1 valve0         (.in_air(in_air0), .in_fluid(in_fluid0), .out_air(out_air0), .out_fluid(connect0));
pump_40px_0 pump0           (.in_air_valve1(in_air1), .in_air_dc(in_air2), .in_air_valve2(in_air3), .in_fluid(connect0),
                             .out_air_valve1(out_air1), .out_air_dc(out_air2), .out_air_valve2(out_air3), .out_fluid(connect1));
pump_40px_1 pump1           (.in_air_valve1(in_air4), .in_air_dc(in_air5), .in_air_valve2(in_air6), .in_fluid(connect1),
                             .out_air_valve1(out_air4), .out_air_dc(out_air5), .out_air_valve2(out_air6), .out_fluid(connect2));
serpentine_25px_0 serp0     (.in_fluid(connect2), .out_fluid(connect3));
serpentine_50px_0 serp1     (.in_fluid(connect3), .out_fluid(connect4));
serpentine_75px_0 serp2     (.in_fluid(connect4), .out_fluid(connect5));
serpentine_100px_0 serp3    (.in_fluid(connect5), .out_fluid(connect6));
serpentine_150px_0 serp4    (.in_fluid(connect6), .out_fluid(connect7));
serpentine_200px_0 serp5    (.in_fluid(connect7), .out_fluid(connect8));
serpentine_300px_0 serp6    (.in_fluid(connect8), .out_fluid(connect9));
diffmix_25px_0 mix0         (.a_fluid(connect9), .b_fluid(in_fluid1), .out_fluid(out_fluid));

endmodule