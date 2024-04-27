module valve(inout fluid_in, inout fluid_out, input air_in, output air_out);
  valve_20px_1 thing(.in_air(air_in), .out_air(air_out), .in_fluid(fluid_in), .out_fluid(fluid_out));
endmodule

module mixer(input a, b, output c);
  diffmix_25px_0 thing(.a_fluid(a), .b_fluid(b), .out_fluid(c));
endmodule

module chamber(input in, output out);
  serpentine_50px_3 thing(.in_fluid(in), .out_fluid(out));
endmodule
