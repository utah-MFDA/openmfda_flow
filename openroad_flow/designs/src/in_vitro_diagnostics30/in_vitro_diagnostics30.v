// This module recreates a version used in several papers as
// "InVitro-1", specified as 30 nodes, (e.g. Wang et al. 2016).
// There are 30 nodes here, including inputs/outputs, which appears to be their convention.
// Exact structure was not specified in the papers, so best effort
// was made to replicate something sensible. The simplest way to get
// 30 was to add a flush port for each detector
module in_vitro_diagnostics30 (input i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, output fl1, fl2, fl3, fl4, fl5, fl6);
  wire dt1, dt2, dt3, dt4, dt5, dt6;
  mixer mix1(.a(i1), .b(i7), .y(dt1));
  mixer mix2(.a(i2), .b(i8), .y(dt2));
  mixer mix3(.a(i3), .b(i9), .y(dt3));
  mixer mix4(.a(i4), .b(i10), .y(dt4));
  mixer mix5(.a(i5), .b(i11), .y(dt5));
  mixer mix6(.a(i6), .b(i12), .y(dt6));
  detector det1(.in(dt1), .out(fl1));
  detector det2(.in(dt2), .out(fl2));
  detector det3(.in(dt3), .out(fl3));
  detector det4(.in(dt4), .out(fl4));
  detector det5(.in(dt5), .out(fl5));
  detector det6(.in(dt6), .out(fl6));
endmodule
