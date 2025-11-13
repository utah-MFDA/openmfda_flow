module thing((* type="ctrl" *) input lysis_ctrl, wash_ctrl, elute_ctrl, dead_end_ctrl,
                 vertical_ctrl, horiz_ctrl, waste_ctrl, bead_ctrl, loop_exit_ctrl, bead_trap_ctrl, collect_ctrl,
                 (* type="ctrl" *) input [2:0] pump,
                  (* type="flush" *) input lysis_flush, wash_flush, elute_flush, dead_end_flush,
                 vertical_flush, horiz_flush, waste_flush, bead_flush, loop_exit_flush, bead_trap_flush, collect_flush,
                 (* type="flush" *) input [2:0] pump_flush,
                 (* type="flow" *) input bead_in, buffer_in, cell_in,
                 (* type="flow" *) input lysis_in, wash_in, elute_in,
                 (* type="flow" *) output [SIZE-1:0] collect,
                 (* type="flow" *) output waste, bead_out, buffer_out, cell_out);

  parameter SIZE = 2;
mnacidpro_pads #(SIZE) thing(
                  lysis_ctrl, wash_ctrl, elute_ctrl, dead_end_ctrl, vertical_ctrl, horiz_ctrl, waste_ctrl, bead_ctrl, loop_exit_ctrl, bead_trap_ctrl, collect_ctrl,
                  pump,
                  lysis_flush, wash_flush, elute_flush, dead_end_flush, vertical_flush, horiz_flush, waste_flush, bead_flush, loop_exit_flush, bead_trap_flush, collect_flush,
                  pump_flush,
                 bead_in, buffer_in, cell_in,
                 lysis_in, wash_in, elute_in,
                  collect,
                 waste, bead_out, buffer_out, cell_out);

endmodule
