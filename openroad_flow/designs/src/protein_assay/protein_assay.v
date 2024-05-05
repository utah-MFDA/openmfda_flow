module protein_assay(input DsS,
                     DsR1, DsR2, DsR3, DsR4, DsR5, DsR6, DsR7, DsR8,
                     DsB1, DsB2, DsB3, DsB4, DsB5, DsB6, DsB7, DsB8,
                     DsB9, DsB10, DsB11, DsB12, DsB13, DsB14, DsB15, DsB16,
                     DsB17, DsB18, DsB19, DsB20, DsB21, DsB22, DsB23, DsB24,
                     DsB25, DsB26, DsB27, DsB28, DsB29, DsB30, DsB31, DsB32,
                     DsB33, DsB34, DsB35, DsB36, DsB37, DsB38, DsB39,
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
       Dlt23_out,
       Dlt24_out,
       Dlt25_out,
       Dlt26_out,
       Dlt27_out,
       Dlt28_out,
       Dlt29_out,
       Dlt30_out,
       Dlt31_out,
       Dlt32_out,
       Dlt33_out,
       Dlt34_out,
       Dlt35_out,
       Dlt36_out,
       Dlt37_out,
       Dlt38_out,
       Dlt39_out;

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
  dilutor Dlt24(.a(DsB24), .b(Dlt16_out), .y(Dlt24_out));
  dilutor Dlt25(.a(DsB25), .b(Dlt17_out), .y(Dlt25_out));
  dilutor Dlt26(.a(DsB26), .b(Dlt18_out), .y(Dlt26_out));
  dilutor Dlt27(.a(DsB27), .b(Dlt19_out), .y(Dlt27_out));
  dilutor Dlt28(.a(DsB28), .b(Dlt20_out), .y(Dlt28_out));
  dilutor Dlt29(.a(DsB29), .b(Dlt21_out), .y(Dlt29_out));
  dilutor Dlt30(.a(DsB30), .b(Dlt22_out), .y(Dlt30_out));
  dilutor Dlt31(.a(DsB31), .b(Dlt23_out), .y(Dlt31_out));
  dilutor Dlt32(.a(DsB32), .b(Dlt24_out), .y(Dlt32_out));
  dilutor Dlt33(.a(DsB33), .b(Dlt25_out), .y(Dlt33_out));
  dilutor Dlt34(.a(DsB34), .b(Dlt26_out), .y(Dlt34_out));
  dilutor Dlt35(.a(DsB35), .b(Dlt27_out), .y(Dlt35_out));
  dilutor Dlt36(.a(DsB36), .b(Dlt28_out), .y(Dlt36_out));
  dilutor Dlt37(.a(DsB37), .b(Dlt29_out), .y(Dlt37_out));
  dilutor Dlt38(.a(DsB38), .b(Dlt30_out), .y(Dlt38_out));
  dilutor Dlt39(.a(DsB39), .b(Dlt31_out), .y(Dlt39_out));
  mixer Mix1(.a(Dlt32_out), .b(DsR1), .y(Opt1));
  mixer Mix2(.a(Dlt33_out), .b(DsR2), .y(Opt2));
  mixer Mix3(.a(Dlt34_out), .b(DsR3), .y(Opt3));
  mixer Mix4(.a(Dlt35_out), .b(DsR4), .y(Opt4));
  mixer Mix5(.a(Dlt36_out), .b(DsR5), .y(Opt5));
  mixer Mix6(.a(Dlt37_out), .b(DsR6), .y(Opt6));
  mixer Mix7(.a(Dlt38_out), .b(DsR7), .y(Opt7));
  mixer Mix8(.a(Dlt39_out), .b(DsR8), .y(Opt8));
endmodule
