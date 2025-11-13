module mnacidpro_pads((* type="ctrl" *) input pad_lysis_ctrl, pad_wash_ctrl, pad_elute_ctrl, pad_dead_end_ctrl,
                 pad_vertical_ctrl, pad_horiz_ctrl, pad_waste_ctrl, pad_bead_ctrl, pad_loop_exit_ctrl, pad_bead_trap_ctrl, pad_collect_ctrl,
                 (* type="ctrl" *) input [2:0] pad_pump,
                  (* type="flush" *) output pad_lysis_flush, pad_wash_flush, pad_elute_flush, pad_dead_end_flush,
                 pad_vertical_flush, pad_horiz_flush, pad_waste_flush, pad_bead_flush, pad_loop_exit_flush, pad_bead_trap_flush, pad_collect_flush,
                 (* type="flush" *) output [2:0] pad_pump_flush,
                 (* type="flow" *) input pad_bead_in, pad_buffer_in, pad_cell_in,
                 (* type="flow" *) input pad_lysis_in, pad_wash_in, pad_elute_in,
                 (* type="flow" *) output [SIZE-1:0] pad_collect,
                 (* type="flow" *) output pad_waste, pad_bead_out, pad_buffer_out, pad_cell_out);
  parameter SIZE = 1;

(* type="ctrl" *) wire lysis_ctrl, wash_ctrl, elute_ctrl, dead_end_ctrl,
                 vertical_ctrl, horiz_ctrl, waste_ctrl, bead_ctrl, loop_exit_ctrl, bead_trap_ctrl, collect_ctrl;
                 (* type="ctrl" *) wire [2:0] pump;
                  (* type="flush" *) wire lysis_flush, wash_flush, elute_flush, dead_end_flush,
                 vertical_flush, horiz_flush, waste_flush, bead_flush, loop_exit_flush, bead_trap_flush, collect_flush;
                 (* type="flush" *) wire [2:0] pump_flush;
                 (* type="flow" *) wire bead_in, buffer_in, cell_in;
                 (* type="flow" *) wire lysis_in, wash_in, elute_in;
                 (* type="flow" *) wire [SIZE-1:0] collect;
                 (* type="flow" *) wire waste, bead_out, buffer_out, cell_out;
  mnacidpro #(SIZE) thing(lysis_ctrl, wash_ctrl, elute_ctrl, dead_end_ctrl,
                   vertical_ctrl, horiz_ctrl, waste_ctrl, bead_ctrl, loop_exit_ctrl, bead_trap_ctrl, collect_ctrl,
                      pump,
                      lysis_flush, wash_flush, elute_flush, dead_end_flush,
                   vertical_flush, horiz_flush, waste_flush, bead_flush, loop_exit_flush, bead_trap_flush, collect_flush,
                      pump_flush,
                     bead_in, buffer_in, cell_in,
                     lysis_in, wash_in, elute_in,
                      collect,
                     waste, bead_out, buffer_out, cell_out);
  ctrl_hole_0 lysis_ctrl_hole(.connection(lysis_ctrl), .pad(pad_lysis_ctrl));
  ctrl_hole_0 wash_ctrl_hole(.connection(wash_ctrl), .pad(pad_wash_ctrl));
  ctrl_hole_0 elute_ctrl_hole(.connection(elute_ctrl), .pad(pad_elute_ctrl));
  ctrl_hole_0 dead_end_ctrl_hole(.connection(dead_end_ctrl), .pad(pad_dead_end_ctrl));
  ctrl_hole_0 vertical_ctrl_hole(.connection(vertical_ctrl), .pad(pad_vertical_ctrl));
  ctrl_hole_0 horiz_ctrl_hole(.connection(horiz_ctrl), .pad(pad_horiz_ctrl));
  ctrl_hole_0 waste_ctrl_hole(.connection(waste_ctrl), .pad(pad_waste_ctrl));
  ctrl_hole_0 bead_ctrl_hole(.connection(bead_ctrl), .pad(pad_bead_ctrl));
  ctrl_hole_0 loop_exit_ctrl_hole(.connection(loop_exit_ctrl), .pad(pad_loop_exit_ctrl));
  ctrl_hole_0 bead_trap_ctrl_hole(.connection(bead_trap_ctrl), .pad(pad_bead_trap_ctrl));
  ctrl_hole_0 collect_ctrl_hole(.connection(collect_ctrl), .pad(pad_collect_ctrl));
  ctrl_hole_0 pump0_hole(.connection(pump[0]), .pad(pad_pump[0]));
  ctrl_hole_0 pump1_hole(.connection(pump[1]), .pad(pad_pump[1]));
  ctrl_hole_0 pump2_hole(.connection(pump[2]), .pad(pad_pump[2]));

  flush_hole_0 lysis_flush_hole(.connection(lysis_flush), .pad(pad_lysis_flush));
  flush_hole_0 wash_flush_hole(.connection(wash_flush), .pad(pad_wash_flush));
  flush_hole_0 elute_flush_hole(.connection(elute_flush), .pad(pad_elute_flush));
  flush_hole_0 dead_end_flush_hole(.connection(dead_end_flush), .pad(pad_dead_end_flush));
  flush_hole_0 vertical_flush_hole(.connection(vertical_flush), .pad(pad_vertical_flush));
  flush_hole_0 horiz_flush_hole(.connection(horiz_flush), .pad(pad_horiz_flush));
  flush_hole_0 waste_flush_hole(.connection(waste_flush), .pad(pad_waste_flush));
  flush_hole_0 bead_flush_hole(.connection(bead_flush), .pad(pad_bead_flush));
  flush_hole_0 loop_exit_flush_hole(.connection(loop_exit_flush), .pad(pad_loop_exit_flush));
  flush_hole_0 bead_trap_flush_hole(.connection(bead_trap_flush), .pad(pad_bead_trap_flush));
  flush_hole_0 collect_flush_hole(.connection(collect_flush), .pad(pad_collect_flush));
  flush_hole_0 pump_flush0_hole(.connection(pump_flush[0]), .pad(pad_pump_flush[0]));
  flush_hole_0 pump_flush1_hole(.connection(pump_flush[1]), .pad(pad_pump_flush[1]));
  flush_hole_0 pump_flush2_hole(.connection(pump_flush[2]), .pad(pad_pump_flush[2]));
  pinhole_320px_0 bead_in_hole(.connection(bead_in), .pad(pad_bead_in));
  pinhole_320px_0 buffer_in_hole(.connection(buffer_in), .pad(pad_buffer_in));
  pinhole_320px_0 cell_in_hole(.connection(cell_in), .pad(pad_cell_in));
  pinhole_320px_0 lysis_in_hole(.connection(lysis_in), .pad(pad_lysis_in));
  pinhole_320px_0 wash_in_hole(.connection(wash_in), .pad(pad_wash_in));
  pinhole_320px_0 elute_in_hole(.connection(elute_in), .pad(pad_elute_in));
  pinhole_320px_0 collect_hole(.connection(collect), .pad(pad_collect));
  pinhole_320px_0 waste_hole(.connection(waste), .pad(pad_waste));
  pinhole_320px_0 bead_out_hole(.connection(bead_out), .pad(pad_bead_out));
  pinhole_320px_0 buffer_out_hole(.connection(buffer_out), .pad(pad_buffer_out));
  pinhole_320px_0 cell_out_hole(.connection(cell_out), .pad(pad_cell_out));
endmodule
