module mRNAiso_group();
  parameter SIZE = 1;

  localparam FLUSH_SIZE = 14;
  localparam IN_SIZE = 1;
  localparam OUT_SIZE = 2;
  localparam PUMP_SIZE = 3;
  localparam CTRL_SIZE = 13;
  wire [IN_SIZE-1:0] flow_in [SIZE-1:0];
  wire [OUT_SIZE-1:0] flow_out [SIZE-1:0];
  wire [FLUSH_SIZE-1:0] flush;
  wire [CTRL_SIZE-1:0] ctrl;
  wire [PUMP_SIZE-1:0] pump;

  generate
    genvar i, j;
    for (i = 0; i < SIZE; i = i + 1) begin: pinholes
      for (j = 0; j < IN_SIZE; j = j + 1) begin: in
        pinhole_320px_0 hole (.connection(flow_in[i][j]));
      end
      for (j = 0; j < OUT_SIZE; j = j + 1) begin: out
        pinhole_320px_0 hole (.connection(flow_out[i][j]));
      end
    end
    for (j = 0; j < FLUSH_SIZE; j = j + 1) begin: flush
      flush_hole_0 hole(.connection(flush[j]));
    end
    for (j=0; j < CTRL_SIZE; j = j+1) begin: ctrl
      flush_hole_0 hole(.connection(ctrl[j]));
    end
    for (j=0; j < PUMP_SIZE; j = j+1) begin: pump
      flush_hole_0 hole(.connection(pump[j]));
    end
 endgenerate

  wire [SIZE+1:0] beads;
  wire [SIZE+1:0] lysis;
  wire beads_in, beads_out, waste_out, lysis_in, lysis_out, push_line;
  pinhole_320px_0 port_beads_in (.connection(beads_in));
  pinhole_320px_0 port_beads_out (.connection(beads_out));
  pinhole_320px_0 port_waste (.connection(waste_out));
  pinhole_320px_0 port_lysis_in (.connection(lysis_in));
  pinhole_320px_0 port_lysis_out (.connection(lysis[SIZE+1]));
  pinhole_320px_0 port_push (.connection(push_line));
  valve vlysis_in(.fluid_in(lysis_in), .fluid_out(lysis[0]), .air_in(ctrl[4]));
  valve vbead_in(.fluid_in(beads_in), .fluid_out(beads[0]), .air_in(ctrl[11]));
  valve vbead_out(.fluid_in(beads[SIZE]), .fluid_out(beads_out), .air_in(ctrl[10]));
  valve vlysis_out(.fluid_in(lysis[SIZE]), .fluid_out(lysis_out), .air_in(ctrl[12]));

  generate
    genvar i;
    for (i = 0; i < SIZE; i = i + 1) begin: devices
      // I think there is a bug with place_inst with -name not allowing the braces generated here.
      mRNAiso device(.beads_in(beads[i]),
                     .beads_ctrl(ctrl[0]),
                     .beads_out(beads[i+1]),
                     .cells_in(flow_in[i][0]),
                     .cells_in_ctrl(ctrl[1]),
                     .cells_out_ctrl(ctrl[2]),
                     .cells_out(flow_out[i][0]),
                     .collect_ctrl(ctrl[3]),
                     .collect(flow_out[i][1]),
                     .lysis_buffer_in(lysis[i]),
                     .lysis_in_ctrl(ctrl[4]),
                     .lysis_buffer_out(lysis[i+1]),
                     .push_line(push_line),
                     .push_ctrl(ctrl[5]),
                     .pump1(pump[0]),
                     .pump2(pump[1]),
                     .pump3(pump[2]),
                     .sep_ctrl(ctrl[6]),
                     .sieve_ctrl(ctrl[7]),
                     .waste_ctrl(ctrl[8]),
                     .waste_out(ctrl[9]),
                     .flush(flush));
    end
  endgenerate
endmodule
