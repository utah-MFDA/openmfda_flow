module kinase_activity_2(input `FLATTENED(IN_SIZE, flow_in_flat, SIZE),
                         input `FLATTENED(OUT_SIZE, flow_out_flat, SIZE),
                         input [12:0] ctrl_a,
                         input [3:0] ctrl_s,
                         input [2:0] pump_a,
                         input [1:0] pump_b,
                         output [FLUSH_SIZE-1:0] flush);
  parameter FLUSH_SIZE = 21;
  parameter IN_SIZE = 3;
  parameter OUT_SIZE = 4;
  parameter SIZE = 2;
  `UNFLATTEN(IN_SIZE, flow_in, SIZE) `FROM_FLATTENED(flow_in_flat)
  `UNFLATTEN(OUT_SIZE, flow_out, SIZE) `FROM_FLATTENED(flow_out_flat)


  wire [IN_SIZE-1:0] flow_in_X [SIZE-1:0];
  wire [OUT_SIZE-1:0] flow_out_X [SIZE-1:0];
  wire [FLUSH_SIZE-1:0] flush_X;
  wire [12:0] ctrl_a_X;
  wire [3:0] ctrl_s_X;
  wire [2:0] pump_a_X;
  wire [1:0] pump_b_X;

  generate
    genvar i, j;
    for (i = 0; i < SIZE; i = i + 1) begin: pinholes
      for (j = 0; j < 3; j = j + 1) begin: in
        pinhole_325px_42 hole (.pad(flow_in[i][j]), .connection(flow_in_X[i][j]));
      end
      for (j = 0; j < 4; j = j + 1) begin: out
        pinhole_325px_42 hole (.pad(flow_out[i][j]), .connection(flow_out_X[i][j]));
      end
    end
    for (j = 0; j < FLUSH_SIZE; j = j + 1) begin: flush
      flush_hole_0 hole(.pad(flush[j]), .connection(flush_X[j]));
    end
  endgenerate

  // interconnect_8x4 ic(.pin_0_0(ctrl_a_X[1]), .pin_0_0_pad(ctrl_a[1]),
  //                     .pin_0_1(ctrl_a_X[9]), .pin_0_1_pad(ctrl_a[9]),
  //                     .pin_0_2(ctrl_s_X[1]), .pin_0_2_pad(ctrl_s[1]),
  //                     .pin_0_3(), .pin_0_3_pad(),
  //                     .pin_1_0(ctrl_a_X[2]), .pin_1_0_pad(ctrl_a[2]),
  //                     .pin_1_1(ctrl_a_X[10]), .pin_1_1_pad(ctrl_a[10]),
  //                     .pin_1_2(ctrl_s_X[2]), .pin_1_2_pad(ctrl_s[2]),
  //                     .pin_1_3(), .pin_1_3_pad(),
  //                     .pin_2_0(ctrl_a_X[3]), .pin_2_0_pad(ctrl_a[3]),
  //                     .pin_2_1(ctrl_a_X[11]), .pin_2_1_pad(ctrl_a[11]),
  //                     .pin_2_2(ctrl_s_X[3]), .pin_2_2_pad(ctrl_s[3]),
  //                     .pin_2_3(), .pin_2_3_pad(),
  //                     .pin_3_0(ctrl_a_X[4]), .pin_3_0_pad(ctrl_a[4]),
  //                     .pin_3_1(), .pin_3_1_pad(),
  //                     .pin_3_2(), .pin_3_2_pad(),
  //                     .pin_3_3(), .pin_3_3_pad(),
  //                     .pin_4_0(ctrl_a_X[5]), .pin_4_0_pad(ctrl_a[5]),
  //                     .pin_4_1(), .pin_4_1_pad(),
  //                     .pin_4_2(pump_b_X[0]), .pin_4_2_pad(pump_b[0]),
  //                     .pin_4_3(), .pin_4_3_pad(),
  //                     .pin_5_0(ctrl_a_X[6]), .pin_5_0_pad(ctrl_a[6]),
  //                     .pin_5_1(pump_a_X[1]), .pin_5_1_pad(pump_a[1]),
  //                     .pin_5_2(pump_b_X[1]), .pin_5_2_pad(pump_b[1]),
  //                     .pin_5_3(), .pin_5_3_pad(),
  //                     .pin_6_0(ctrl_a_X[7]), .pin_6_0_pad(ctrl_a[7]),
  //                     .pin_6_1(pump_a_X[2]), .pin_6_1_pad(pump_a[2]),
  //                     .pin_6_2(), .pin_6_2_pad(),
  //                     .pin_6_3(), .pin_6_3_pad(),
  //                     .pin_7_0(ctrl_a_X[8]), .pin_7_0_pad(ctrl_a[8]),
  //                     .pin_7_1(pump_a_X[0]), .pin_7_1_pad(pump_a[0]));
  // generate
  //   genvar i;
  //   for (i = 0; i < SIZE; i = i + 1) begin: devices
// I think there is a bug with place_inst with -name not allowing the braces generated here.
      kinase_activity device1(flow_in_X[1], flow_out_X[1],
                             ctrl_a, ctrl_s, pump_a, pump_b,
                             flush_X);

      kinase_activity device0(flow_in_X[0], flow_out_X[0],
                             ctrl_a, ctrl_s, pump_a, pump_b,
                             flush_X);
  //   end
  // endgenerate
endmodule
