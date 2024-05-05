// This module recreates a truncated version used in several papers as
// "ProteinSplit-1", specified as 66 nodes, (e.g. Wang et al. 2016).
// There are 62 nodes here, including inputs/outputs, which appears to be their convention.
// Exact structure was not specified in the papers, so best effort
// was made to replicate something sensible.
// This corresponds to layers C, C/2, C/4, C/8, c/16, and C/128.
module protein_assay_62(input DsS,
                     DsR1, DsR2, DsR3, DsR4, DsR5, DsR6, DsR7, DsR8,
                     DsB1, DsB2, DsB3, DsB4, DsB5, DsB6, DsB7, DsB8,
                     DsB9, DsB10, DsB11, DsB12, DsB13, DsB14, DsB15, DsB16,
                     DsB17, DsB18, DsB19, DsB20, DsB21, DsB22, DsB23,
                     output Opt1, Opt2, Opt3, Opt4, Opt5, Opt6, Opt7, Opt8);

  wire Dlt1_out,
       Dlt2_out,
       Dlt3_out,
       Dlt4_out,
       Dlt5_out,
       Dlt6_out,
       Dlt7_out,
       Dlt8_out,
       Dlt9_out,
       Dlt10_out,
       Dlt11_out,
       Dlt12_out,
       Dlt13_out,
       Dlt14_out,
       Dlt15_out,
       Dlt16_out,
       Dlt17_out,
       Dlt18_out,
       Dlt19_out,
       Dlt20_out,
       Dlt21_out,
       Dlt22_out,
       Dlt23_out;

  dilutor Dlt1(.a(DsS), .b(DsB1), .y(Dlt1_out));
  dilutor Dlt2(.a(DsB2), .b(Dlt1_out), .y(Dlt2_out));
  dilutor Dlt3(.a(DsB3), .b(Dlt1_out), .y(Dlt3_out));
  dilutor Dlt4(.a(DsB4), .b(Dlt2_out), .y(Dlt4_out));
  dilutor Dlt5(.a(DsB5), .b(Dlt2_out), .y(Dlt5_out));
  dilutor Dlt6(.a(DsB6), .b(Dlt3_out), .y(Dlt6_out));
  dilutor Dlt7(.a(DsB7), .b(Dlt3_out), .y(Dlt7_out));
  dilutor Dlt8(.a(DsB8), .b(Dlt4_out), .y(Dlt8_out));
  dilutor Dlt9(.a(DsB9), .b(Dlt4_out), .y(Dlt9_out));
  dilutor Dlt10(.a(DsB10), .b(Dlt5_out), .y(Dlt10_out));
  dilutor Dlt11(.a(DsB11), .b(Dlt5_out), .y(Dlt11_out));
  dilutor Dlt12(.a(DsB12), .b(Dlt6_out), .y(Dlt12_out));
  dilutor Dlt13(.a(DsB13), .b(Dlt6_out), .y(Dlt13_out));
  dilutor Dlt14(.a(DsB14), .b(Dlt7_out), .y(Dlt14_out));
  dilutor Dlt15(.a(DsB15), .b(Dlt7_out), .y(Dlt15_out));
  dilutor Dlt16(.a(DsB16), .b(Dlt8_out), .y(Dlt16_out));
  dilutor Dlt17(.a(DsB17), .b(Dlt9_out), .y(Dlt17_out));
  dilutor Dlt18(.a(DsB18), .b(Dlt10_out), .y(Dlt18_out));
  dilutor Dlt19(.a(DsB19), .b(Dlt11_out), .y(Dlt19_out));
  dilutor Dlt20(.a(DsB20), .b(Dlt12_out), .y(Dlt20_out));
  dilutor Dlt21(.a(DsB21), .b(Dlt13_out), .y(Dlt21_out));
  dilutor Dlt22(.a(DsB22), .b(Dlt14_out), .y(Dlt22_out));
  dilutor Dlt23(.a(DsB23), .b(Dlt15_out), .y(Dlt23_out));
  mixer Mix1(.a(Dlt16_out), .b(DsR1), .y(Opt1));
  mixer Mix2(.a(Dlt17_out), .b(DsR2), .y(Opt2));
  mixer Mix3(.a(Dlt18_out), .b(DsR3), .y(Opt3));
  mixer Mix4(.a(Dlt19_out), .b(DsR4), .y(Opt4));
  mixer Mix5(.a(Dlt20_out), .b(DsR5), .y(Opt5));
  mixer Mix6(.a(Dlt21_out), .b(DsR6), .y(Opt6));
  mixer Mix7(.a(Dlt22_out), .b(DsR7), .y(Opt7));
  mixer Mix8(.a(Dlt23_out), .b(DsR8), .y(Opt8));
endmodule
