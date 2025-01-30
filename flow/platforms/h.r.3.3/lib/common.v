module mux3_20px_0(input a, b, c, input sa, sb, sc, output y);
  valve_20px_1 thing1(.in_air(sa), .in_fluid(a), .out_fluid(y));
  valve_20px_1 thing2(.in_air(sb), .in_fluid(b), .out_fluid(y));
  valve_20px_1 thing3(.in_air(sc), .in_fluid(c), .out_fluid(y));
endmodule

module pump1_20px_0(input in, input pump1, output air_out, output out);
    valve_20px_1 thing(.in_air(air_in), .out_air(air_out), .in_fluid(fluid_in), .out_fluid(fluid_out));
endmodule

module pump3_20px_0(inout in, inout out, input pump1, pump2, pump3, output air_out);
  wire x, y;
  valve_20px_1 thing1(.in_air(pump1), .out_air(air_out), .in_fluid(in), .out_fluid(x));
  valve_20px_1 thing2(.in_air(pump2), .out_air(air_out), .in_fluid(x), .out_fluid(y));
  valve_20px_1 thing3(.in_air(pump3), .out_air(air_out), .in_fluid(y), .out_fluid(out));
endmodule

module valve(inout fluid_in, inout fluid_out, input air_in, output air_out);
  valve_20px_1 thing(.in_air(air_in), .out_air(air_out), .in_fluid(fluid_in), .out_fluid(fluid_out));
endmodule

module mixer(inout a, b, inout y);
  diffmix_25px_0 thing(.a_fluid(a), .b_fluid(b), .out_fluid(y));
endmodule

module chamber(inout in, inout out);
  serpentine_100px_0 thing(.in_fluid(in), .out_fluid(out));
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
  serpentine_50px thing1(.a_fluid(a), .b_fluid(d));
endmodule

module interconnect_4x8(inout
                        pin_0_0,
                        pin_0_1,
                        pin_0_2,
                        pin_0_3,
                        pin_1_0,
                        pin_1_1,
                        pin_1_2,
                        pin_1_3,
                        pin_2_0,
                        pin_2_1,
                        pin_2_2,
                        pin_2_3,
                        pin_3_0,
                        pin_3_1,
                        pin_3_2,
                        pin_3_3,
                        pin_4_0,
                        pin_4_1,
                        pin_4_2,
                        pin_4_3,
                        pin_5_0,
                        pin_5_1,
                        pin_5_2,
                        pin_5_3,
                        pin_6_0,
                        pin_6_1,
                        pin_6_2,
                        pin_6_3,
                        pin_7_0,
                        pin_7_1,
                        pin_7_2,
                        pin_7_3,
                        pin_0_0_pad,
                        pin_0_1_pad,
                        pin_0_2_pad,
                        pin_0_3_pad,
                        pin_1_0_pad,
                        pin_1_1_pad,
                        pin_1_2_pad,
                        pin_1_3_pad,
                        pin_2_0_pad,
                        pin_2_1_pad,
                        pin_2_2_pad,
                        pin_2_3_pad,
                        pin_3_0_pad,
                        pin_3_1_pad,
                        pin_3_2_pad,
                        pin_3_3_pad,
                        pin_4_0_pad,
                        pin_4_1_pad,
                        pin_4_2_pad,
                        pin_4_3_pad,
                        pin_5_0_pad,
                        pin_5_1_pad,
                        pin_5_2_pad,
                        pin_5_3_pad,
                        pin_6_0_pad,
                        pin_6_1_pad,
                        pin_6_2_pad,
                        pin_6_3_pad,
                        pin_7_0_pad,
                        pin_7_1_pad,
                        pin_7_2_pad,
                        pin_7_3_pad);

interconnect interconnect_0_0(.pin(pin_0_0), .pad(pin_0_0_pad));
interconnect interconnect_1_0(.pin(pin_1_0), .pad(pin_1_0_pad));
interconnect interconnect_2_0(.pin(pin_2_0), .pad(pin_2_0_pad));
interconnect interconnect_3_0(.pin(pin_3_0), .pad(pin_3_0_pad));
interconnect interconnect_4_0(.pin(pin_4_0), .pad(pin_4_0_pad));
interconnect interconnect_5_0(.pin(pin_5_0), .pad(pin_5_0_pad));
interconnect interconnect_6_0(.pin(pin_6_0), .pad(pin_6_0_pad));
interconnect interconnect_7_0(.pin(pin_7_0), .pad(pin_7_0_pad));
interconnect interconnect_0_1(.pin(pin_0_1), .pad(pin_0_1_pad));
interconnect interconnect_1_1(.pin(pin_1_1), .pad(pin_1_1_pad));
interconnect interconnect_2_1(.pin(pin_2_1), .pad(pin_2_1_pad));
interconnect interconnect_3_1(.pin(pin_3_1), .pad(pin_3_1_pad));
interconnect interconnect_4_1(.pin(pin_4_1), .pad(pin_4_1_pad));
interconnect interconnect_5_1(.pin(pin_5_1), .pad(pin_5_1_pad));
interconnect interconnect_6_1(.pin(pin_6_1), .pad(pin_6_1_pad));
interconnect interconnect_7_1(.pin(pin_7_1), .pad(pin_7_1_pad));
interconnect interconnect_0_2(.pin(pin_0_2), .pad(pin_0_2_pad));
interconnect interconnect_1_2(.pin(pin_1_2), .pad(pin_1_2_pad));
interconnect interconnect_2_2(.pin(pin_2_2), .pad(pin_2_2_pad));
interconnect interconnect_3_2(.pin(pin_3_2), .pad(pin_3_2_pad));
interconnect interconnect_4_2(.pin(pin_4_2), .pad(pin_4_2_pad));
interconnect interconnect_5_2(.pin(pin_5_2), .pad(pin_5_2_pad));
interconnect interconnect_6_2(.pin(pin_6_2), .pad(pin_6_2_pad));
interconnect interconnect_7_2(.pin(pin_7_2), .pad(pin_7_2_pad));
interconnect interconnect_0_3(.pin(pin_0_3), .pad(pin_0_3_pad));
interconnect interconnect_1_3(.pin(pin_1_3), .pad(pin_1_3_pad));
interconnect interconnect_2_3(.pin(pin_2_3), .pad(pin_2_3_pad));
interconnect interconnect_3_3(.pin(pin_3_3), .pad(pin_3_3_pad));
interconnect interconnect_4_3(.pin(pin_4_3), .pad(pin_4_3_pad));
interconnect interconnect_5_3(.pin(pin_5_3), .pad(pin_5_3_pad));
interconnect interconnect_6_3(.pin(pin_6_3), .pad(pin_6_3_pad));
interconnect interconnect_7_3(.pin(pin_7_3), .pad(pin_7_3_pad));
endmodule
