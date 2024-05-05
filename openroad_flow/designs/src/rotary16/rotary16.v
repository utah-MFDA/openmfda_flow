// Device I
module rotary16(inout i1, i2, i3, i4, i5, i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,
                 c1, c2, c3, c4, c5, c6, c7, c8,
                 k1, k2, k3, k4, k5, k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,
                 d1, d2, d3, d4, d5, d6, d7, d8,
                 e1, e2, e3, e4, e5);
  MUX16 m1(i1, i2, i3, i4, i5, i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16, c1, c2, c3, c4, c5, c6, c7, c8, j1);
  MUX16 m2(k1, k2, k3, k4, k5, k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16, d1, d2, d3, d4, d5, d6, d7, d8, j2);
  ROTARY_MIXER r1(j1, j2, e1, e2, e3, e4, e5);
endmodule

module MUX16(inout i1, i2, i3, i4, i5, i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16, c1, c2, c3, c4, c5, c6, c7, c8, o1);
  wire j1, j2, j3, j4, j5,j6, j7,j8;
  valve v1(.fluid_in(i1), .fluid_out(j1), .air_in(c1));
  valve v2(.fluid_in(i2), .fluid_out(j1), .air_in(c2));
  valve v3(.fluid_in(i3), .fluid_out(j2), .air_in(c1));
  valve v4(.fluid_in(i4), .fluid_out(j2), .air_in(c2));
  valve v5(.fluid_in(i5), .fluid_out(j3), .air_in(c1));
  valve v6(.fluid_in(i6), .fluid_out(j3), .air_in(c2));
  valve v7(.fluid_in(i7), .fluid_out(j4), .air_in(c1));
  valve v8(.fluid_in(i8), .fluid_out(j4), .air_in(c2));
  valve v9(.fluid_in(i9), .fluid_out(j5), .air_in(c1));
  valve v10(.fluid_in(i10), .fluid_out(j5), .air_in(c2));
  valve v11(.fluid_in(i11), .fluid_out(j6), .air_in(c1));
  valve v12(.fluid_in(i12), .fluid_out(j6), .air_in(c2));
  valve v13(.fluid_in(i13), .fluid_out(j7), .air_in(c1));
  valve v14(.fluid_in(i14), .fluid_out(j7), .air_in(c2));
  valve v15(.fluid_in(i15), .fluid_out(j8), .air_in(c1));
  valve v16(.fluid_in(i16), .fluid_out(j8), .air_in(c2));


  valve vj1(.fluid_in(j1), .fluid_out(k1), .air_in(c3));
  valve vj2(.fluid_in(j2), .fluid_out(k1), .air_in(c4));
  valve vj3(.fluid_in(j3), .fluid_out(k2), .air_in(c3));
  valve vj4(.fluid_in(j4), .fluid_out(k2), .air_in(c4));
  valve vj5(.fluid_in(j5), .fluid_out(k3), .air_in(c3));
  valve vj6(.fluid_in(j6), .fluid_out(k3), .air_in(c4));
  valve vj7(.fluid_in(j7), .fluid_out(k4), .air_in(c3));
  valve vj8(.fluid_in(j8), .fluid_out(k4), .air_in(c4));

  valve vk1(.fluid_in(k1), .fluid_out(l1), .air_in(c5));
  valve vk2(.fluid_in(k2), .fluid_out(l1), .air_in(c6));
  valve vk3(.fluid_in(k3), .fluid_out(l2), .air_in(c5));
  valve vk4(.fluid_in(k4), .fluid_out(l2), .air_in(c6));

  valve vl1(.fluid_in(l1), .fluid_out(o1), .air_in(c7));
  valve vl2(.fluid_in(l2), .fluid_out(o1), .air_in(c8));
endmodule

module ROTARY_MIXER(inout inlet, outlet, ctrl3, ctrl4, ctrl5, ctrl6, ctrl7);
  valve v1(.fluid_in(inlet), .fluid_out(j1), .air_in(ctrl3));
  valve v2(.fluid_in(j1), .fluid_out(j3), .air_in(ctrl4));
  valve v3(.fluid_in(j1), .fluid_out(j2), .air_in(ctrl5));
  valve v4(.fluid_in(j2), .fluid_out(j3), .air_in(ctrl6));
  valve v5(.fluid_in(j3), .fluid_out(outlet), .air_in(ctrl7));
endmodule
