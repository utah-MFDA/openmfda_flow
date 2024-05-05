// This module recreates a truncated version used in several papers as
// "InVitro-2", specified as 45 nodes, (e.g. Wang et al. 2016).
// There are 45 nodes here, including inputs/outputs, which appears to be their convention.
// Exact structure was not specified in the papers, so best effort
// was made to replicate something sensible.
module in_vitro_diagnostics45 (input i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18 output fl1, fl2, fl3, fl4, fl5, fl6);

  wire dt1, dt2, dt3, dt4, dt5, dt6, dt7, dt8, dt9;
  mixer mix1(.a(i1), .b(i2), .y(dt1));
  mixer mix2(.a(i3), .b(i4), .y(dt2));
  mixer mix3(.a(i5), .b(i6), .y(dt3));
  mixer mix4(.a(i7), .b(i8), .y(dt4));
  mixer mix5(.a(i9), .b(i10), .y(dt5));
  mixer mix6(.a(i11), .b(i12), .y(dt6));
  mixer mix7(.a(i13), .b(i14), .y(dt7));
  mixer mix8(.a(i15), .b(i16), .y(dt8));
  mixer mix9(.a(i17), .b(i18), .y(dt9));
  detector det1(.in(dt1), .out(fl1));
  detector det2(.in(dt2), .out(fl2));
  detector det3(.in(dt3), .out(fl3));
  detector det4(.in(dt4), .out(fl4));
  detector det5(.in(dt5), .out(fl5));
  detector det6(.in(dt6), .out(fl6));
  detector det7(.in(dt7), .out(fl7));
  detector det8(.in(dt8), .out(fl8));
  detector det9(.in(dt9), .out(fl9));
endmodule
