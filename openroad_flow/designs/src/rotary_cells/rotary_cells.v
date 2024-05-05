module rotary_cells (
inout pb1_1, pb1_2, pb1_3, pb1_4, p1, cb1_1, cb1_2, cb2_1, cb2_2, cb3_1, cb3_2, cb3_3, cb4_1, cb4_2, cb5_1, cb5_2, cb6_1, cb6_2
);
wire c1;
wire c2;
wire c3;
wire c4;
wire c5;
wire c6;
wire c7;
wire c8;
wire c9;
wire c10;
wire c11;
wire c12;
wire c13;
wire c14;
wire c15;
wire cc1;
wire cc2;
wire cc3;
wire cc4;
wire cc5;
wire cc6;
wire cc7;
wire cc8;
wire cc9;
wire cc10;
wire cc11;
wire cc12;
wire cc13;
MUX m1(.inlet(c5),.ctrl1(cc1),.ctrl2(cc2),.ctrl3(cc8),.ctrl4(cc9),.outlet1(c1),.outlet2(c2),.outlet3(c3),.outlet4(c4));
MUX m2(.outlet3(c7),.outlet2(c8),.outlet1(c9),.inlet(c10),.ctrl2(cc6),.ctrl3(cc7),.ctrl4(cc12),.ctrl1(cc13),.outlet4(c6));
assign c1 = pb1_1;
assign c2 = pb1_2;
assign c3 = pb1_3;
assign c4 = pb1_4;
ROTARY_MIXER rp(.outlet(c6),.port3(cc3),.port6(cc4),.port7(cc5),.port4(cc10),.port5(cc11),.inlet(c5));
LONG_CELL_TRAP b1_1(.port0(c11),.port0(c7));
LONG_CELL_TRAP b1_2(.port0(c12),.port0(c8));
LONG_CELL_TRAP b1_3(.port0(c13),.port0(c9));
LONG_CELL_TRAP b1_4(.port0(c14),.port0(c10));
TREE t1(.out(c15),.in1(c11),.in2(c12),.in3(c13),.in4(c14));
assign c15 = p1;
assign cc1 = cb1_1;
assign cc2 = cb1_2;
assign cc8 = cb2_1;
assign cc9 = cb2_2;
assign cc3 = cb3_1;
assign cc4 = cb3_2;
assign cc5 = cb3_3;
assign cc10 = cb4_1;
assign cc11 = cb4_2;
assign cc6 = cb5_1;
assign cc7 = cb5_2;
assign cc12 = cb6_1;
assign cc13 = cb6_2;
endmodule

module MUX(input ctrl1, ctrl2, ctrl3, ctrl4, inout inlet, outlet1, outlet2, outlet3, outlet4);
  wire j1, j2;
  valve v1(.fluid_in(inlet), .fluid_out(j1), .air_in(ctrl1));
  valve v2(.fluid_in(inlet), .fluid_out(j2), .air_in(ctrl2));
  valve v3(.fluid_in(j1), .fluid_out(outlet1), .air_in(ctrl3));
  valve v4(.fluid_in(j1), .fluid_out(outlet2), .air_in(ctrl3));
  valve v5(.fluid_in(j2), .fluid_out(outlet3), .air_in(ctrl4));
  valve v6(.fluid_in(j2), .fluid_out(outlet4), .air_in(ctrl4));
endmodule

module ROTARY_MIXER(inout inlet, outlet, port3, port4, port5, port6, port7);
  valve v1(.fluid_in(inlet), .fluid_out(j1), .air_in(port3));
  valve v2(.fluid_in(j1), .fluid_out(j3), .air_in(port4));
  valve v3(.fluid_in(j1), .fluid_out(j2), .air_in(port5));
  valve v4(.fluid_in(j2), .fluid_out(j3), .air_in(port6));
  valve v5(.fluid_in(j3), .fluid_out(outlet), .air_in(port7));
endmodule

module TREE(inout in1, in2, in3, in4, out);
  wire j1, j2;
  mixer m1(.a(in1), .b(in2), .y(j1));
  mixer m2(.a(in3), .b(in4), .y(j2));
  mixer m3(.a(j1), .b(j2), .y(out));
endmodule
