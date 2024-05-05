// This module recreates a truncated version used in several papers as
// "ProteinSplit-1", specified as 30 nodes, (e.g. Wang et al. 2016).
// There are 39 nodes here, including inputs/outputs, which appears to be their convention.
// Exact structure was not specified in the papers, so best effort
// was made to replicate something sensible.
// This corresponds to layers C, C/2, C/4, and C/128.
module protein_assay_39(input DsS,
                     DsR1, DsR2, DsR3, DsR4, DsR5, DsR6, DsR7, DsR8,
                     DsB1, DsB2, DsB3, DsB4, DsB5, DsB6, DsB7,
                     output Opt1, Opt2, Opt3, Opt4, Opt5, Opt6, Opt7, Opt8);

  wire Dlt1_out,
       Dlt2_out,
       Dlt3_out,
       Dlt4_out,
       Dlt5_out,
       Dlt6_out,
       Dlt7_out;

  dilutor Dlt1(.a(DsS), .b(DsB1), .y(Dlt1_out));
  dilutor Dlt2(.a(DsB2), .b(Dlt1_out), .y(Dlt2_out));
  dilutor Dlt3(.a(DsB3), .b(Dlt1_out), .y(Dlt3_out));
  dilutor Dlt4(.a(DsB4), .b(Dlt2_out), .y(Dlt4_out));
  dilutor Dlt5(.a(DsB5), .b(Dlt2_out), .y(Dlt5_out));
  dilutor Dlt6(.a(DsB6), .b(Dlt3_out), .y(Dlt6_out));
  dilutor Dlt7(.a(DsB7), .b(Dlt3_out), .y(Dlt7_out));
  mixer Mix1(.a(Dlt4_out), .b(DsR1), .y(Opt1));
  mixer Mix2(.a(Dlt4_out), .b(DsR2), .y(Opt2));
  mixer Mix3(.a(Dlt5_out), .b(DsR3), .y(Opt3));
  mixer Mix4(.a(Dlt5_out), .b(DsR4), .y(Opt4));
  mixer Mix5(.a(Dlt6_out), .b(DsR5), .y(Opt5));
  mixer Mix6(.a(Dlt6_out), .b(DsR6), .y(Opt6));
  mixer Mix7(.a(Dlt7_out), .b(DsR7), .y(Opt7));
  mixer Mix8(.a(Dlt7_out), .b(DsR8), .y(Opt8));
endmodule
