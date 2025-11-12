module kinase_activity_pads #(  parameter SIZE = 7)(
  (* type="flow" *) input [SIZE-1:0] pad_flow_in_a, pad_flow_in_b,pad_flow_in_c,
  (* type="flow" *) output [SIZE-1:0] pad_flow_out_a,pad_flow_out_b, pad_flow_out_c, pad_flow_out_d,
  (* type="ctrl" *) input [12:0] pad_ctrl_a,
  (* type="ctrl" *) input [3:0] pad_ctrl_s,
  (* type="ctrl" *) input [2:0] pad_pump_a,
  (* type="ctrl" *) input [1:0] pad_pump_b,
  (* type="flush" *) output [12:0] pad_flush_ctrl_a,
  (* type="flush" *) output [3:0] pad_flush_ctrl_s,
  (* type="flush" *) output [2:0] pad_flush_pump_a,
  (* type="flush" *) output [1:0] pad_flush_pump_b);

  (* type="flow" *) wire [SIZE-1:0] flow_in_a, flow_in_b,flow_in_c;
  (* type="flow" *) wire [SIZE-1:0] flow_out_a,flow_out_b, flow_out_c, flow_out_d;
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
      pinhole_320px_0 hole_in_a (.connection(flow_in_a), .pad(pad_flow_in_a[i]));
      pinhole_320px_0 hole_in_b (.connection(flow_in_b), .pad(pad_flow_in_b[i]));
      pinhole_320px_0 hole_in_c (.connection(flow_in_c), .pad(pad_flow_in_c[i]));
      pinhole_320px_0 hole_out_a (.connection(flow_out_a), .pad(pad_flow_out_a[i]));
      pinhole_320px_0 hole_out_b (.connection(flow_out_b), .pad(pad_flow_out_b[i]));
      pinhole_320px_0 hole_out_c (.connection(flow_out_c), .pad(pad_flow_out_c[i]));
      pinhole_320px_0 hole_out_d (.connection(flow_out_d), .pad(pad_flow_out_d[i]));
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
  endgenerate
      kinase_activity_bank thingy(.flow_in(flow_in), .flow_out(flow_out),
                              .ctrl_a(ctrl_a), .ctrl_s(ctrl_s),
                              .pump_a(pump_a), .pump_b(pump_b),
                              .flush_ctrl_a(flush_ctrl_a), .flush_ctrl_s(flush_ctrl_s),
                              .flush_pump_a(flush_pump_a), .flush_pump_b(flush_pump_b));
endmodule
