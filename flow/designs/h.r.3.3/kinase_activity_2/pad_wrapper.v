module kinase_activity_2(
// input `FLATTENED(IN_SIZE, flow_in_flat, SIZE),
//                          input `FLATTENED(OUT_SIZE, flow_out_flat, SIZE),
//                          input [12:0] ctrl_a,
//                          input [3:0] ctrl_s,
//                          input [2:0] pump_a,
//                          input [1:0] pump_b,
//                          output [FLUSH_SIZE-1:0] flush
);
  parameter FLUSH_SIZE = 22;
  parameter IN_SIZE = 3;
  parameter OUT_SIZE = 4;
  parameter SIZE = 2;
  wire [IN_SIZE-1:0] flow_in [SIZE];
  wire [OUT_SIZE-1:0] flow_out [SIZE];
  wire [FLUSH_SIZE-1:0] flush;
//   `UNFLATTEN(IN_SIZE, flow_in, SIZE) `FROM_FLATTENED(flow_in_flat)
//   `UNFLATTEN(OUT_SIZE, flow_out, SIZE) `FROM_FLATTENED(flow_out_flat)
  wire [12:0] ctrl_a;
  wire [3:0] ctrl_s;
  wire [2:0] pump_a;
  wire [1:0] pump_b;


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
        pinhole_320px_0 hole (.pad(flow_in[i][j]), .connection(flow_in_X[i][j]));
      end
      for (j = 0; j < 4; j = j + 1) begin: out
        pinhole_320px_0 hole (.pad(flow_out[i][j]), .connection(flow_out_X[i][j]));
      end
    end
    for (j = 0; j < FLUSH_SIZE; j = j + 1) begin: flush
      flush_hole_0 hole(.pad(flush[j]), .connection(flush_X[j]));
    end
  endgenerate

  interconnect_8x4 interconnect(.connection_0_0(ctrl_a_X[1]), .pad_0_0(ctrl_a[1]),
                      .connection_0_1(ctrl_a_X[9]), .pad_0_1(ctrl_a[9]),
                      .connection_0_2(ctrl_s_X[1]), .pad_0_2(ctrl_s[1]),
                      .connection_0_3(), .pad_0_3(),
                      .connection_1_0(ctrl_a_X[2]), .pad_1_0(ctrl_a[2]),
                      .connection_1_1(ctrl_a_X[10]), .pad_1_1(ctrl_a[10]),
                      .connection_1_2(ctrl_s_X[2]), .pad_1_2(ctrl_s[2]),
                      .connection_1_3(), .pad_1_3(),
                      .connection_2_0(ctrl_a_X[3]), .pad_2_0(ctrl_a[3]),
                      .connection_2_1(ctrl_a_X[11]), .pad_2_1(ctrl_a[11]),
                      .connection_2_2(ctrl_s_X[3]), .pad_2_2(ctrl_s[3]),
                      .connection_2_3(), .pad_2_3(),
                      .connection_3_0(ctrl_a_X[4]), .pad_3_0(ctrl_a[4]),
                      .connection_3_1(), .pad_3_1(),
                      .connection_3_2(), .pad_3_2(),
                      .connection_3_3(), .pad_3_3(),
                      .connection_4_0(ctrl_a_X[5]), .pad_4_0(ctrl_a[5]),
                      .connection_4_1(), .pad_4_1(),
                      .connection_4_2(pump_b_X[0]), .pad_4_2(pump_b[0]),
                      .connection_4_3(), .pad_4_3(),
                      .connection_5_0(ctrl_a_X[6]), .pad_5_0(ctrl_a[6]),
                      .connection_5_1(pump_a_X[1]), .pad_5_1(pump_a[1]),
                      .connection_5_2(pump_b_X[1]), .pad_5_2(pump_b[1]),
                      .connection_5_3(), .pad_5_3(),
                      .connection_6_0(ctrl_a_X[7]), .pad_6_0(ctrl_a[7]),
                      .connection_6_1(pump_a_X[2]), .pad_6_1(pump_a[2]),
                      .connection_6_2(), .pad_6_2(),
                      .connection_6_3(), .pad_6_3(),
                      .connection_7_0(ctrl_a_X[8]), .pad_7_0(ctrl_a[8]),
                      .connection_7_1(pump_a_X[0]), .pad_7_1(pump_a[0]));
  // generate
  //   genvar i;
  //   for (i = 0; i < SIZE; i = i + 1) begin: devices
// I think there is a bug with place_inst with -name not allowing the braces generated here.
      kinase_activity device1(flow_in_X[1], flow_out_X[1],
                             ctrl_a_X, ctrl_s_X, pump_a_X, pump_b_X,
                             flush_X);

      kinase_activity device0(flow_in_X[0], flow_out_X[0],
                             ctrl_a_X, ctrl_s_X, pump_a_X, pump_b_X,
                             flush_X);
  //   end
  // endgenerate
endmodule
