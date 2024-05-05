// Device K
module grid_8(inout i1, i2, i3, i4, i5, i6,i7,i8, c1, c2, c3, c4, c5, c6,
              d1,d2,d3,d4,d5,d6,d7,d8,
              e1,e2,e3,e4,e5,e6,e7,e8,
              o1);
  wire j1;
  MUX8 mux(i1, i2, i3, i4, i5, i6,i7,i8, c1, c2, c3, c4, c5, c6, j1);
  TREE8 tr1(j1, k1, k2, k3, k4, k5, k6,k7,k8);
  GRID g1(k1,k2,k3,k4,k5,k6,k7,k8,l1,l2,l3,l4,l5,l6,l7,l8,d1,e1);
  GRID g2(l1,l2,l3,l4,l5,l6,l7,l8,m1,m2,m3,m4,m5,m6,m7,m8,d2,e2);
  GRID g3(m1,m2,m3,m4,m5,m6,m7,m8,n1,n2,n3,n4,n5,n6,n7,n8,d3,e3);
  GRID g4(n1,n2,n3,n4,n5,n6,n7,n8,o1,o2,o3,o4,o5,o6,o7,o8,d4,e4);
  GRID g5(o1,o2,o3,o4,o5,o6,o7,o8,p1,p2,p3,p4,p5,p6,p7,p8,d5,e5);
  GRID g6(p1,p2,p3,p4,p5,p6,p7,p8,q1,q2,q3,q4,q5,q6,q7,q8,d6,e6);
  GRID g7(q1,q2,q3,q4,q5,q6,q7,q8,r1,r2,r3,r4,r5,r6,r7,r8,d7,e7);
  GRID g8(r1,r2,r3,r4,r5,r6,r7,r8,s1,s2,s3,s4,s5,s6,s7,s8,d8,e8);
  TREE8 tr1(o1, s1, s2, s3, s4, s5, s6,s7,s8);
endmodule

module GRID(inout i1, i2, i3, i4, i5, i6,i7,i8,  m1, m2, m3, m4, m5, m6,m7,m8, c, d);
  CELL_TRAP ct1(i1, j1, l1);
  valve vj1(.fluidin(j1), .fluid_out(k2), .air_in(c));
  valve vl1(.fluidin(l1), .fluid_out(m1), .air_in(d));
  CELL_TRAP ct1(i2, j2, k2, l2);
  valve vj1(.fluidin(j2), .fluid_out(k3), .air_in(c));
  valve vl1(.fluidin(l2), .fluid_out(m2), .air_in(d));
  CELL_TRAP ct1(i3, j3, k3, l3);
  valve vj1(.fluidin(j3), .fluid_out(k4), .air_in(c));
  valve vl1(.fluidin(l3), .fluid_out(m3), .air_in(d));
  CELL_TRAP ct1(i4, j4, k4, l4);
  valve vj1(.fluidin(j4), .fluid_out(k5), .air_in(c));
  valve vl1(.fluidin(l4), .fluid_out(m4), .air_in(d));
  CELL_TRAP ct1(i5, j5, k5, l5);
  valve vj1(.fluidin(j5), .fluid_out(k6), .air_in(c));
  valve vl1(.fluidin(l5), .fluid_out(m5), .air_in(d));
  CELL_TRAP ct1(i6, j6, k6, l6);
  valve vj1(.fluidin(j6), .fluid_out(k7), .air_in(c));
  valve vl1(.fluidin(l6), .fluid_out(m6), .air_in(d));
  CELL_TRAP ct1(i7, j7, k7, l7);
  valve vj1(.fluidin(j7), .fluid_out(k8), .air_in(c));
  valve vl1(.fluidin(l7), .fluid_out(m7), .air_in(d));
  CELL_TRAP ct1(i8, j8, k8, l8);
  valve vl1(.fluidin(l8), .fluid_out(m8), .air_in(d));
endmodule

module MUX8(inout i1, i2, i3, i4, i5, i6,i7,i8, c1, c2, c3, c4, c5, c6, o1);
  wire j1, j2, j3, j4, j5,j6;
  valve v1(.fluid_in(i1), .fluid_out(j1), .air_in(c1));
  valve v2(.fluid_in(i2), .fluid_out(j1), .air_in(c2));
  valve v3(.fluid_in(i3), .fluid_out(j2), .air_in(c1));
  valve v4(.fluid_in(i4), .fluid_out(j2), .air_in(c2));
  valve v5(.fluid_in(i5), .fluid_out(j3), .air_in(c1));
  valve v6(.fluid_in(i6), .fluid_out(j3), .air_in(c2));
  valve v7(.fluid_in(i7), .fluid_out(j4), .air_in(c1));
  valve v8(.fluid_in(i8), .fluid_out(j4), .air_in(c2));

  valve v9(.fluid_in(j1), .fluid_out(j5), .air_in(c3));
  valve v10(.fluid_in(j2), .fluid_out(j5), .air_in(c4));
  valve v11(.fluid_in(j3), .fluid_out(j6), .air_in(c3));
  valve v12(.fluid_in(j4), .fluid_out(j6), .air_in(c4));

  valve v13(.fluid_in(j5), .fluid_out(o), .air_in(c5));
  valve v14(.fluid_in(j6), .fluid_out(o), .air_in(c6));
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
