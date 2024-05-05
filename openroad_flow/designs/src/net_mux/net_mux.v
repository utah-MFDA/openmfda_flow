// Device J
module net_mux(i1, i2, i3, i4, i5, i6, i7, i8, k1, k2, o1, c1,c2,c3,c4,c5,c6);
  valve vi1(.fluid_in(i1), .fluid_out(l1), .air_in(c1));
  valve vi2(.fluid_in(i2), .fluid_out(l2), .air_in(c1));
  valve vi3(.fluid_in(i3), .fluid_out(l3), .air_in(c1));
  valve vi4(.fluid_in(i4), .fluid_out(l4), .air_in(c1));
  valve vi5(.fluid_in(i5), .fluid_out(l5), .air_in(c1));
  valve vi6(.fluid_in(i6), .fluid_out(l6), .air_in(c1));
  valve vi7(.fluid_in(i7), .fluid_out(l7), .air_in(c1));
  valve vi8(.fluid_in(i8), .fluid_out(l8), .air_in(c1));

  valve vl1(.fluid_in(l1), .fluid_out(l0), .air_in(c2));
  valve vl2(.fluid_in(l2), .fluid_out(l1), .air_in(c2));
  valve vl3(.fluid_in(l3), .fluid_out(l2), .air_in(c2));
  valve vl4(.fluid_in(l4), .fluid_out(l3), .air_in(c2));
  valve vl5(.fluid_in(l5), .fluid_out(l4), .air_in(c2));
  valve vl6(.fluid_in(l6), .fluid_out(l5), .air_in(c2));
  valve vl7(.fluid_in(l7), .fluid_out(l6), .air_in(c2));
  valve vl8(.fluid_in(l8), .fluid_out(l7), .air_in(c2));

  valve vl1(.fluid_in(l1), .fluid_out(l0), .air_in(c2));
  valve vl2(.fluid_in(l2), .fluid_out(l1), .air_in(c2));
  valve vl3(.fluid_in(l3), .fluid_out(l2), .air_in(c2));
  valve vl4(.fluid_in(l4), .fluid_out(l3), .air_in(c2));
  valve vl5(.fluid_in(l5), .fluid_out(l4), .air_in(c2));
  valve vl6(.fluid_in(l6), .fluid_out(l5), .air_in(c2));
  valve vl7(.fluid_in(l7), .fluid_out(l6), .air_in(c2));
  valve vl8(.fluid_in(l8), .fluid_out(l7), .air_in(c2));

  valve vk1(.fluid_in(k1), .fluid_out(l0), .air_in(c3));
  valve vk2(.fluid_in(k2), .fluid_out(l0), .air_in(c4));

  valve vm1(.fluid_in(m1), .fluid_out(m2), .air_in(c5));
  valve vm2(.fluid_in(m2), .fluid_out(m3), .air_in(c5));
  valve vm3(.fluid_in(m3), .fluid_out(m4), .air_in(c5));
  valve vm4(.fluid_in(m4), .fluid_out(m5), .air_in(c5));
  valve vm5(.fluid_in(m5), .fluid_out(m6), .air_in(c5));
  valve vm6(.fluid_in(m6), .fluid_out(m7), .air_in(c5));
  valve vm7(.fluid_in(m7), .fluid_out(m8), .air_in(c5));
  valve vm8(.fluid_in(m8), .fluid_out(m9), .air_in(c5));

  valve vj1(.fluid_in(m1), .fluid_out(j1), .air_in(c6));
  valve vj2(.fluid_in(m2), .fluid_out(j2), .air_in(c6));
  valve vj3(.fluid_in(m3), .fluid_out(j3), .air_in(c6));
  valve vj4(.fluid_in(m4), .fluid_out(j4), .air_in(c6));
  valve vj5(.fluid_in(m5), .fluid_out(j5), .air_in(c6));
  valve vj6(.fluid_in(m6), .fluid_out(j6), .air_in(c6));
  valve vj7(.fluid_in(m7), .fluid_out(j7), .air_in(c6));
  valve vj8(.fluid_in(m8), .fluid_out(j8), .air_in(c6));

  CELL_TRAP ct1(l1,m1);
  CELL_TRAP ct2(l2,m2);
  CELL_TRAP ct3(l3,m3);
  CELL_TRAP ct4(l4,m4);
  CELL_TRAP ct5(l5,m5);
  CELL_TRAP ct6(l6,m6);
  CELL_TRAP ct7(l7,m7);
  CELL_TRAP ct8(l8,m8);

  TREE t(o1, j1, j2, j3, j4, j5, j6, j7, j8);
endmodule

module TREE8(inout out, in1, in2, in3, in4, in5, in6, in7, in8);
  wire j1_1, j1_2, j2_1, j2_2, j2_3, j2_4;
  mixer m1(.a(j1_1), .b(j1_2), .y(out));
  mixer m2(.a(j2_1), .b(j2_2), .y(j1_1));
  mixer m3(.a(j2_3), .b(j2_4), .y(j1_2));
  mixer m4(.a(port2), .b(port1), .y(j2_1));
  mixer m5(.a(port4), .b(port3), .y(j2_2));
  mixer m6(.a(port6), .b(port5), .y(j2_3));
  mixer m7(.a(port8), .b(port7), .y(j2_4));
endmodule
