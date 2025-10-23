module kinase_activity_pads #(  parameter SIZE = 7)(
  (* type="flow" *) input [SIZE*IN_SIZE-1:0] pad_flow_in,
  (* type="flow" *) output [SIZE*OUT_SIZE-1:0] pad_flow_out,
  (* type="ctrl" *) input [12:0] pad_ctrl_a,
  (* type="ctrl" *) input [3:0] pad_ctrl_s,
  (* type="ctrl" *) input [2:0] pad_pump_a,
  (* type="ctrl" *) input [1:0] pad_pump_b,
  (* type="flush" *) output [12:0] pad_flush_ctrl_a,
  (* type="flush" *) output [3:0] pad_flush_ctrl_s,
  (* type="flush" *) output [2:0] pad_flush_pump_a,
  (* type="flush" *) output [1:0] pad_flush_pump_b);
  localparam IN_SIZE = 3;
  localparam OUT_SIZE = 4;


  (* type="flow" *)wire [IN_SIZE-1:0] flow_in [SIZE-1:0];
  (* type="flow" *)wire [OUT_SIZE-1:0] flow_out [SIZE-1:0];
  (* type="ctrl" *)wire [12:0] ctrl_a;
  (* type="ctrl" *)wire [3:0] ctrl_s;
  (* type="ctrl" *)wire [2:0] pump_a;
  (* type="ctrl" *)wire [1:0] pump_b;
  (* type="flush" *)wire [12:0] flush_ctrl_a;
  (* type="flush" *)wire [3:0] flush_ctrl_s;
  (* type="flush" *)wire [2:0] flush_pump_a;
  (* type="flush" *)wire [1:0] flush_pump_b;
  generate
    genvar i, j;
    for (i = 0; i < SIZE; i = i + 1) begin: pinholes
      for (j = 0; j < IN_SIZE; j = j + 1) begin: in
        pinhole_320px_0 hole (.connection(flow_in[i][j]), .pad(pad_flow_in[i*IN_SIZE + j]));
      end
      for (j = 0; j < OUT_SIZE; j = j + 1) begin: out
        pinhole_320px_0 hole (.connection(flow_out[i][j]), .pad(pad_flow_out[i*OUT_SIZE + j]));
      end
    end
    for (j=0; j<13; j = j+1) begin: ctrl_a
      ctrl_hole_0 hole(.connection(ctrl_a[j]), .pad(pad_ctrl_a[j]));
      flush_hole_0 flush(.connection(flush_ctrl_a[j]), .pad(pad_flush_ctrl_a[j]));
    end
    for (j=0; j<2; j = j+1) begin: pump_b
      ctrl_hole_0 hole(.connection(pump_b[j]), .pad(pad_pump_b[j]));
      flush_hole_0 flush(.connection(flush_pump_b[j]), .pad(pad_flush_pump_b[j]));
    end
    for (j=0; j<3; j = j+1) begin: pump_a
      ctrl_hole_0 hole(.connection(pump_a[j]), .pad(pad_pump_a[j]));
      flush_hole_0 flush(.connection(flush_pump_a[j]), .pad(pad_flush_pump_a[j]));
    end
    for (j=0; j<4; j = j+1) begin: ctrl_s
      ctrl_hole_0 hole(.connection(ctrl_s[j]), .pad(pad_ctrl_s[j]));
      flush_hole_0 flush(.connection(flush_ctrl_s[j]), .pad(pad_flush_ctrl_s[j]));
    end
    for (i = 0; i < SIZE; i = i + 1) begin: devices
// I think there is a bug with place_inst with -name not allowing the braces generated here.
      kinase_activity thingy(.flow_in(flow_in[i]), .flow_out(flow_out[i]),
                              .ctrl_a(ctrl_a), .ctrl_s(ctrl_s),
                              .pump_a(pump_a), .pump_b(pump_b),
                              .flush_ctrl_a(flush_ctrl_a), .flush_ctrl_s(flush_ctrl_s),
                              .flush_pump_a(flush_pump_a), .flush_pump_b(flush_pump_b));

    end
  endgenerate
endmodule
