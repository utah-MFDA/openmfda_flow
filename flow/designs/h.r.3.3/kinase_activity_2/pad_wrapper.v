module kinase_activity_2(input in1_a, in2_a, in3_a,
                                 input in1_b, in2_b, in3_b,
                                 c1, c2, c3, c4, c5, c6,
                                 c7, c8, c9, c10, c11, c12, c13,
                                 s1, s2, s3, s4,
                                 p1, p2, p3, p4, p5,
                                 output out1_a, out2_a, out3_a, out4_a,
                                 out1_b, out2_b, out3_b, out4_b);
  pinhole_325px_0 pinhole1(.pad(in1_a), .connection(in1_a_X));
  pinhole_325px_0 pinhole2(.pad(in2_a), .connection(in2_a_X));
  pinhole_325px_0 pinhole3(.pad(in3_a), .connection(in3_a_X));
  pinhole_325px_0 pinhole4(.pad(in1_b), .connection(in1_b_X));
  pinhole_325px_0 pinhole5(.pad(in2_b), .connection(in2_b_X));
  pinhole_325px_0 pinhole6(.pad(in3_b), .connection(in3_b_X));
  pinhole_325px_0 pinhole7(.connection(out1_a_X), .pad(out1_a));
  pinhole_325px_0 pinhole8(.connection(out2_a_X), .pad(out2_a));
  pinhole_325px_0 pinhole9(.connection(out3_a_X), .pad(out3_a));
  pinhole_325px_0 pinhole10(.connection(out4_a_X), .pad(out4_a));
  pinhole_325px_0 pinhole11(.connection(out1_b_X), .pad(out1_b));
  pinhole_325px_0 pinhole12(.connection(out2_b_X), .pad(out2_b));
  pinhole_325px_0 pinhole13(.connection(out3_b_X), .pad(out3_b));
  pinhole_325px_0 pinhole14(.connection(out4_b_X), .pad(out4_b));

  interconnect_8x4 ic(.pin_0_0(c1_X), .pin_0_0_pad(c1),
                      .pin_0_1(c9_X), .pin_0_1_pad(c9),
                      .pin_0_2(s1_X), .pin_0_2_pad(s1),
                      .pin_0_3(), .pin_0_3_pad(),
                      .pin_1_0(c2_X), .pin_1_0_pad(c2),
                      .pin_1_1(c10_X), .pin_1_1_pad(c10),
                      .pin_1_2(s2_X), .pin_1_2_pad(s2),
                      .pin_1_3(), .pin_1_3_pad(),
                      .pin_2_0(c3_X), .pin_2_0_pad(c3),
                      .pin_2_1(c11_X), .pin_2_1_pad(c11),
                      .pin_2_2(s3_X), .pin_2_2_pad(s3),
                      .pin_2_3(), .pin_2_3_pad(),
                      .pin_3_0(c4_X), .pin_3_0_pad(c4),
                      .pin_3_1(c12_X), .pin_3_1_pad(c12),
                      .pin_3_2(s4_X), .pin_3_2_pad(s4),
                      .pin_3_3(), .pin_3_3_pad(),
                      .pin_4_0(c5_X), .pin_4_0_pad(c5),
                      .pin_4_1(c13_X), .pin_4_1_pad(c13),
                      .pin_4_2(p4_X), .pin_4_2_pad(p4),
                      .pin_4_3(), .pin_4_3_pad(),
                      .pin_5_0(c6_X), .pin_5_0_pad(c6),
                      .pin_5_1(p1_X), .pin_5_1_pad(p1),
                      .pin_5_2(p5_X), .pin_5_2_pad(p5),
                      .pin_5_3(), .pin_5_3_pad(),
                      .pin_6_0(c7_X), .pin_6_0_pad(c7),
                      .pin_6_1(p2_X), .pin_6_1_pad(p2),
                      .pin_6_2(), .pin_6_2_pad(),
                      .pin_6_3(), .pin_6_3_pad(),
                      .pin_7_0(c8_X), .pin_7_0_pad(c8),
                      .pin_7_1(p3_X), .pin_7_1_pad(p3));
  kinase_activity_2_device device(in1_a_X, in2_a_X, in3_a_X,
                           in1_b_X, in2_b_X, in3_b_X,
                           c1_X, c2_X, c3_X, c4_X, c5_X, c6_X,
                           c7_X, c8_X, c9_X, c10_X, c11_X, c12_X, c13_X,
                           s1_X, s2_X, s3_X, s4_X,
                           p1_X, p2_X, p3_X, p4_X, p5_X,
                           out1_a_X, out2_a_X, out3_a_X, out4_a_X,
                           out1_b_X, out2_b_X, out3_b_X, out4_b_X);
endmodule
