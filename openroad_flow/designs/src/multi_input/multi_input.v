// Device E
module multi_input (
inout pb1_1, pb1_2, pb2_1, pb2_2, pb3_1, pb3_2, p1, cp1, cp2, cp3, cp4
);
wire c1;
wire c2;
wire c3;
wire c4;
wire c5;
wire c6;
wire c7_out
wire c7;
wire c8;
wire c9;
wire c10;
wire c11_out
wire c11;
wire c12;
wire cc1;
wire cc2;
wire cc3;
wire cc4;
assign c1 = pb1_1;
assign c2 = pb1_2;
assign c4 = pb2_1;
assign c5 = pb2_2;
assign c8 = pb3_1;
assign c9 = pb3_2;

MUX m1(.port1(c3),.port2(c1),.port3(c2),.port4(cc1),.port5(cc2));
TREE t1(.port1(c6),.port2(c4),.port3(c5));
TREE t2(.port1(c10),.port2(c8),.port3(c9));
MIXER x1(.port2(c7),.port1(c6));
MIXER x2(.port1(c11),.port2(c10));
assign c12 = p1;
SQUARE_CELL_TRAP ct1(.port3(c12),.port1(c3),.port4(c7_out),.port2(c11_out));
assign cc1 = cp1;
assign cc2 = cp2;
assign cc3 = cp3;
assign cc4 = cp4;
VALVE v1(.port0(cc3),.out(c7_out),.in(c7));
VALVE v2(.port0(cc4),.out(c11_out),.in(c11));
endmodule

module VALVE(inout port0, in, out);
  valve v1(..fluid_in(in), .fluid_out(out), .air_in(port0));
endmodule

module MUX(inout port1, port2, port3, port4, port5);
  valve v1 (.fluid_in(port2), .fluid_out(port1), .air_in(port4));
  valve v1 (.fluid_in(port3), .fluid_out(port1), .air_in(port5));
endmodule

module TREE(inout port1, port2, port3);
  mixer m1(.a(port2), .b(port3), .y(port3));
endmodule

module MIXER(inout port1, port2);
  serpentine s1(.in(port1), .out(port2));
endmodule
