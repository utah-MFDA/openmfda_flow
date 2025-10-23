module mnacidpro_group();
  parameter SIZE = 1;

  localparam FLUSH_SIZE = 16;
  localparam IN_SIZE = 7;
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
  generate
    genvar i;
    for (i = 0; i < SIZE; i = i + 1) begin: devices
      // I think there is a bug with place_inst with -name not allowing the braces generated here.
      mnacidpro device(.in(flow_in[i]),
                       .out(flow_out[i]),
                       .c(ctrl), .p(pump),
                       .flush(flush));
    end
  endgenerate
endmodule
