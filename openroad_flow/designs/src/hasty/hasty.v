// Device F
module hasty (
inout p1, p2, p3, p4, p5
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
wire c16;
wire c17;
wire c18;
wire c19;
wire c20;
wire c21;
wire c22;
wire c23;
assign c1 = p1;
assign c2 = p2;
assign c3 = p3;
assign c22 = p4;
assign c23 = p5;
NODE n1(.port0(c4),.port1(c1),.port2(c2),.port3(c3));
NODE n2(.port0(c22),.port1(c23),.port2(c21));
TREE t1(.port2(c5),.port3(c6),.port4(c7),.port5(c8),.port6(c9),.port7(c10),.port8(c11),.port9(c12),.port1(c4));
TREE t2(.port9(c13),.port8(c14),.port7(c15),.port6(c16),.port5(c17),.port4(c18),.port3(c19),.port2(c20),.port1(c21));
LONG_CELL_TRAP b1_1(.port0(c5),.port0(c13));
LONG_CELL_TRAP b1_2(.port0(c6),.port0(c14));
LONG_CELL_TRAP b1_3(.port0(c7),.port0(c15));
LONG_CELL_TRAP b1_4(.port0(c8),.port0(c16));
LONG_CELL_TRAP b1_5(.port0(c9),.port0(c17));
LONG_CELL_TRAP b1_6(.port0(c10),.port0(c18));
LONG_CELL_TRAP b1_7(.port0(c11),.port0(c19));
LONG_CELL_TRAP b1_8(.port0(c12),.port0(c20));
endmodule


module NODE(inout port0, port1, port2, port3)
  assign port0 = port3;
  assign port1 = port3;
  assign port2 = port3;
endmodule

module TREE(inout port1, port2, port3, port4, port5, port6, port7, port8, port9);
  wire j1, j2;

  mixer m1(.a(j1_1), .b(j1_2), .y(port1));
  mixer m2(.a(j2_1), .b(j2_2), .y(j1_1));
  mixer m3(.a(j2_3), .b(j2_4), .y(j1_2));
  mixer m4(.a(port2), .b(port9), .y(j2_1));
  mixer m5(.a(port4), .b(port3), .y(j2_2));
  mixer m6(.a(port6), .b(port5), .y(j2_3));
  mixer m7(.a(port8), .b(port7), .y(j2_4));
endmodule
