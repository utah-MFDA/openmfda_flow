// Device D
module grad_cells (inout pb1, pb2, p1, cpb1_1, cpb1_2, cpb2_1, cpb2_2);
  wire c1;
  wire c2;
  wire c3;
  wire c4;
  wire c9;
  wire c10;
  wire c11;
  wire c12;
  GRADIENT_GENERATOR g(.a(pb1), .b(pb2), .y(c3));
  MUX m1(.inlet(c3), .ctrl1(cpb1_1), .ctrl2(cpb1_2), .ctrl3(cpb2_1), .ctrl4(cpb2_2), .outlet1(c1), .outlet2(c2), .outlet3(c3), .outlet4(c4));
  TREE t1(.out(p1),.in1(c9),.in4(c10),.in3(c11),.in2(c12));
  LONG_CELL_TRAP ctb_1(.in(c9),.out(c1));
  LONG_CELL_TRAP ctb_2(.in(c10),.out(c2));
  LONG_CELL_TRAP ctb_3(.in(c11),.out(c3));
  LONG_CELL_TRAP ctb_4(.in(c12),.out(c4));
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

module TREE(inout in1, in2, in3, in4, out);
  wire j1, j2;
  mixer m1(.a(in1), .b(in2), .y(j1));
  mixer m2(.a(in3), .b(in4), .y(j2));
  mixer m3(.a(j1), .b(j2), .y(out));
endmodule

module GRADIENT_GENERATOR(inout a, b, y);
  wire j0, j1, j2, j3;
  assign a = j0;
  assign b = j0;
  serpentine s1_1(.in(j0), .out(j1));
  serpentine s2_1(.in(j1), .out(j2));
  serpentine s2_2(.in(j1), .out(j2));
  serpentine s3_1(.in(j2), .out(j3));
  serpentine s3_2(.in(j2), .out(j3));
  serpentine s3_3(.in(j2), .out(j3));
  chamber c(.in(j3),.out(y));
endmodule
