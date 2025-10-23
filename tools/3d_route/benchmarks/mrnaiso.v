module mRNAiso(input beads_in, beads_ctrl,
               output beads_out,
               input cells_in, cells_in_ctrl, cells_out_ctrl,
               output cells_out,
               input collect_ctrl,
               output collect,
               input lysis_buffer_in, lysis_in_ctrl, lysis_out_ctrl,
               output lysis_buffer_out,
               input push_line, push_ctrl,
               input pump1, pump2, pump3,
               input sep_ctrl,
               input sieve_ctrl,
               input waste_ctrl,
               output waste_out,
               output [13:0] flush
);
  wire j1,j2,j3,j4,j5;

  valve vcollect(.fluid_in(j5), .fluid_out(collect), .air_in(collect_ctrl), .air_out(flush[0]));
  valve vwaste(.fluid_in(j5), .fluid_out(waste_out), .air_in(waste_ctrl), .air_out(flush[1]));
  valve vcell_in(.fluid_in(cells_in), .fluid_out(j1), .air_in(cells_in_ctrl), .air_out(flush[2]));
  valve vpush(.fluid_in(push_line), .fluid_out(j1), .air_in(push_ctrl), .air_out(flush[3]));
  valve vpump1(.fluid_in(j3), .fluid_out(j1), .air_in(pump1), .air_out(flush[4]));
  valve vpump2(.fluid_in(j1), .fluid_out(j2), .air_in(pump2), .air_out(flush[5]));
  valve vpump3(.fluid_in(j2), .fluid_out(j3), .air_in(pump3), .air_out(flush[6]));
  valve vcell_out(.fluid_in(j1), .fluid_out(cells_out), .air_in(cells_out_ctrl), .air_out(flush[7]));
  valve vlysis_in(.fluid_in(lysis_buffer_in), .fluid_out(j3), .air_in(lysis_in_ctrl), .air_out(flush[8]));
  valve vlysis_out(.fluid_in(j2), .fluid_out(lysis_buffer_out), .air_in(lysis_out_ctrl), .air_out(flush[9]));
  valve vsep(.fluid_in(j3), .fluid_out(j4), .air_in(sep_ctrl), .air_out(flush[10]));
  valve vbead_in(.fluid_in(beads_in), .fluid_out(j4), .air_in(beads_ctrl), .air_out(flush[11]));
  valve vbead_out(.fluid_in(j4), .fluid_out(beads_out), .air_in(beads_ctrl), .air_out(flush[12]));
  valve vsieve(.fluid_in(j4), .fluid_out(j5), .air_in(sieve_ctrl), .air_out(flush[13]));
endmodule
