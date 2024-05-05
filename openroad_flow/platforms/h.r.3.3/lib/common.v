module valve(inout fluid_in, inout fluid_out, input air_in, output air_out);
  valve_20px_1 thing(.in_air(air_in), .out_air(air_out), .in_fluid(fluid_in), .out_fluid(fluid_out));
endmodule

module mixer(inout a, b, inout c);
  diffmix_25px_0 thing(.a_fluid(a), .b_fluid(b), .out_fluid(c));
endmodule

module chamber(inout in, inout out);
  serpentine_50px_0 thing(.in_fluid(in), .out_fluid(out));
endmodule
