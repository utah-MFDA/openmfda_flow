// This module recreates a truncated version used in several papers as
// "InVitro-3", specified as 60 nodes, (e.g. Wang et al. 2016).
// There are 60 nodes here, including inputs/outputs, which appears to be their convention.
// Exact structure was not specified in the papers, so best effort
// was made to replicate something sensible.
module in_vitro_diagnostics65 (input i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, output fl1, fl2, fl3, fl4, fl5, fl6, fl7, fl8, fl9, fl10, fl11, fl12);

  wire dt1, dt2, dt3, dt4, dt5, dt6, dt7, dt8, dt9, dt10, dt11, dt12;
  mixer mix1(.a(i1), .b(i2), .y(dt1));
  mixer mix2(.a(i3), .b(i4), .y(dt2));
  mixer mix3(.a(i5), .b(i6), .y(dt3));
  mixer mix4(.a(i7), .b(i8), .y(dt4));
  mixer mix5(.a(i9), .b(i10), .y(dt5));
  mixer mix6(.a(i11), .b(i12), .y(dt6));
  mixer mix7(.a(i13), .b(i14), .y(dt7));
  mixer mix8(.a(i15), .b(i16), .y(dt8));
  mixer mix9(.a(i17), .b(i18), .y(dt9));
  mixer mix9(.a(i19), .b(i20), .y(dt10));
  mixer mix9(.a(i21), .b(i22), .y(dt11));
  mixer mix9(.a(i23), .b(i24), .y(dt12));
  detector det1(.in(dt1), .out(fl1));
  detector det2(.in(dt2), .out(fl2));
  detector det3(.in(dt3), .out(fl3));
  detector det4(.in(dt4), .out(fl4));
  detector det5(.in(dt5), .out(fl5));
  detector det6(.in(dt6), .out(fl6));
  detector det7(.in(dt7), .out(fl7));
  detector det8(.in(dt8), .out(fl8));
  detector det9(.in(dt9), .out(fl9));
  detector det10(.in(dt10), .out(fl10));
  detector det11(.in(dt11), .out(fl11));
  detector det12(.in(dt12), .out(fl12));
endmodule
