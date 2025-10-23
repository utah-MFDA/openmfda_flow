module thing(
             (* type="flow" *) input [3*SIZE-1:0] pad_flow_in,
             (* type="flow" *) output [4*SIZE-1:0] pad_flow_out,
             (* type="ctrl" *) input [12:0] pad_ctrl_a,
             (* type="ctrl" *) input [3:0] pad_ctrl_s,
             (* type="ctrl" *) input [2:0] pad_pump_a,
             (* type="ctrl" *) input [1:0] pad_pump_b,
             (* type="flush" *) output [12:0] pad_flush_ctrl_a,
             (* type="flush" *) output [3:0] pad_flush_ctrl_s,
             (* type="flush" *) output [2:0] pad_flush_pump_a,
             (* type="flush" *) output [1:0] pad_flush_pump_b);
localparam SIZE = 7;
  kinase_activity_pads #(SIZE) one (
                                 pad_flow_in,
                                 pad_flow_out,
                                 pad_ctrl_a,
                                 pad_ctrl_s,
                                 pad_pump_a,
                                 pad_pump_b,
                                 pad_flush_ctrl_a,
                                 pad_flush_ctrl_s,
                                 pad_flush_pump_a,
                                 pad_flush_pump_b);
endmodule
