module mux3_40px_0(input a, b, c, input sa, sb, sc, output y);
  valve_40px_1 thing1(.out_air(fa), .in_air(sa), .in_fluid(a), .out_fluid(y));
  valve_40px_1 thing2(.out_air(fb), .in_air(sb), .in_fluid(b), .out_fluid(y));
  valve_40px_1 thing3(.out_air(fc), .in_air(sc), .in_fluid(c), .out_fluid(y));
endmodule

module pump1_40px_0(input in, input pump1, output air_out, output out);
    valve_40px_1 thing(.in_air(pump1), .out_air(air_out), .in_fluid(in), .out_fluid(out));
endmodule

module pump3_40px_0(inout in, inout out, input pump1, pump2, pump3, output air_out1, air_out2, air_out3);
  wire x, y;
  valve_40px_1 thing1(.in_air(pump1), .out_air(air_out1), .in_fluid(in), .out_fluid(x));
  valve_40px_1 thing2(.in_air(pump2), .out_air(air_out2), .in_fluid(x), .out_fluid(y));
  valve_40px_1 thing3(.in_air(pump3), .out_air(air_out3), .in_fluid(y), .out_fluid(out));
endmodule

module valve((* type="flow" *) inout fluid_in, (* type="flow" *)inout fluid_out, (* type="ctrl" *)input air_in, (* type="ctrl" *)output air_out);
  valve_40px_1 thing(.in_air(air_in), .out_air(air_out), .in_fluid(fluid_in), .out_fluid(fluid_out));
endmodule

module pump_valve((* type="flow" *) inout fluid_in, (* type="flow" *)inout fluid_out, (* type="ctrl" *)input air_in, (* type="ctrl" *)output air_out);
  valve_40px_1 thing(.in_air(air_in), .out_air(air_out), .in_fluid(fluid_in), .out_fluid(fluid_out));
endmodule

module sieve_valve((* type="flow" *) inout fluid_in, (* type="flow" *)inout fluid_out, (* type="ctrl" *)input air_in, (* type="ctrl" *)output air_out);
  valve_40px_1 thing(.in_air(air_in), .out_air(air_out), .in_fluid(fluid_in), .out_fluid(fluid_out));
endmodule

module mixer(inout a, b, inout y);
  diffmix_25px_0 thing(.a_fluid(a), .b_fluid(b), .out_fluid(y));
endmodule

module chamber((* type="flow" *)inout in, (* type="flow" *)inout out);
  serpentine_150px_0 thing(.in_fluid(in), .out_fluid(out));
endmodule

module serpentine(inout in, inout out);
  serpentine_150px_0 thing(.in_fluid(in), .out_fluid(out));
endmodule

module filter(inout in, inout out);
  serpentine_150px_0 thing(.in_fluid(in), .out_fluid(out));
endmodule

module heater(inout in, inout out);
  serpentine_150px_0 thing(.in_fluid(in), .out_fluid(out));
endmodule

module detector(inout in, inout out);
  serpentine_150px_0 thing(.in_fluid(in), .out_fluid(out));
endmodule

module dilutor(inout a, b, inout y);
  diffmix_25px_0 thing(.a_fluid(a), .b_fluid(b), .out_fluid(y));
endmodule

module trap4(inout a, b, c, d);
  assign b = a;
  assign d = c;
  serpentine_50px_0 thing1(.a_fluid(a), .b_fluid(d));
endmodule
