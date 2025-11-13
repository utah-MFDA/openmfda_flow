module mRNAiso_pads((* type="flow" *)input pad_beads_in,
               (* type="flow" *) output pad_beads_out,
               (* type="flow" *)input pad_cells_in,
               (* type="flow" *) output pad_cells_out,
               (* type="flow" *) output pad_collect,
               (* type="flow" *) input pad_lysis_buffer_in,
               (* type="flow" *) output pad_lysis_buffer_out,
               (* type="flow" *) input pad_push_line,
               (* type="flow" *) output pad_waste_out,
               (* type="ctrl" *) input pad_collect_ctrl,
               pad_lysis_in_ctrl, pad_lysis_out_ctrl,
               pad_push_ctrl,
               pad_pump1, pad_pump2, pad_pump3,
               pad_sep_ctrl,
               pad_sieve_ctrl,
               pad_waste_ctrl,
               pad_beads_ctrl, pad_cells_in_ctrl, pad_cells_out_ctrl,
               (* type="flush" *) output pad_collect_flush,
               pad_lysis_in_flush, pad_lysis_out_flush,
               pad_push_flush,
               pad_pump1_flush, pad_pump2_flush, pad_pump3_flush,
               pad_sep_flush,
               pad_sieve_flush,
               pad_waste_flush,
               pad_beads_flush, pad_cells_in_flush, pad_cells_out_flush);
parameter SIZE = 1;

(* type="flow" *)wire beads_in;
               (* type="flow" *) wire beads_out;
               (* type="flow" *)wire cells_in;
               (* type="flow" *) wire cells_out;
               (* type="flow" *) wire collect;
               (* type="flow" *) wire lysis_buffer_in;
               (* type="flow" *) wire lysis_buffer_out;
               (* type="flow" *) wire push_line;
               (* type="flow" *) wire waste_out;
               (* type="ctrl" *) wire collect_ctrl,
               lysis_in_ctrl, lysis_out_ctrl,
               push_ctrl,
               pump1, pump2, pump3,
               sep_ctrl,
               sieve_ctrl,
               waste_ctrl,
               beads_ctrl, cells_in_ctrl, cells_out_ctrl;
               (* type="flush" *) wire collect_flush,
               lysis_in_flush, lysis_out_flush,
               push_flush,
               pump1_flush, pump2_flush, pump3_flush,
               sep_flush,
               sieve_flush,
               waste_flush,
               beads_flush, cells_in_flush, cells_out_flush;

pinhole_325px_0 beads_in_hole(.connection(beads_in), .pad(pad_beads_in));
pinhole_325px_0 beads_out_hole(.connection(beads_out), .pad(pad_beads_out));
pinhole_325px_0 cells_in_hole(.connection(cells_in), .pad(pad_cells_in));
pinhole_325px_0 cells_out_hole(.connection(cells_out), .pad(pad_cells_out));
pinhole_325px_0 collect_hole(.connection(collect), .pad(pad_collect));
pinhole_325px_0 lysis_buffer_in_hole(.connection(lysis_buffer_in), .pad(pad_lysis_buffer_in));
pinhole_325px_0 lysis_buffer_out_hole(.connection(lysis_buffer_out), .pad(pad_lysis_buffer_out));
pinhole_325px_0 push_line_hole(.connection(push_line), .pad(pad_push_line));
pinhole_325px_0 waste_out_hole(.connection(waste_out), .pad(pad_waste_out));
ctrl_hole_0 collect_ctrl_hole(.connection(collect_ctrl), .pad(pad_collect_ctrl));
ctrl_hole_0 lysis_in_ctrl_hole(.connection(lysis_in_ctrl), .pad(pad_lysis_in_ctrl));
ctrl_hole_0 lysis_out_ctrl_hole(.connection(lysis_out_ctrl), .pad(pad_lysis_out_ctrl));
ctrl_hole_0 push_ctrl_hole(.connection(push_ctrl), .pad(pad_push_ctrl));
ctrl_hole_0 pump1_hole(.connection(pump1), .pad(pad_pump1));
ctrl_hole_0 pump2_hole(.connection(pump2), .pad(pad_pump2));
ctrl_hole_0 pump3_hole(.connection(pump3), .pad(pad_pump3));
ctrl_hole_0 sep_ctrl_hole(.connection(sep_ctrl), .pad(pad_sep_ctrl));
ctrl_hole_0 sieve_ctrl_hole(.connection(sieve_ctrl), .pad(pad_sieve_ctrl));
ctrl_hole_0 waste_ctrl_hole(.connection(waste_ctrl), .pad(pad_waste_ctrl));
ctrl_hole_0 beads_ctrl_hole(.connection(beads_ctrl), .pad(pad_beads_ctrl));
ctrl_hole_0 cells_in_ctrl_hole(.connection(cells_in_ctrl), .pad(pad_cells_in_ctrl));
ctrl_hole_0 cells_out_ctrl_hole(.connection(cells_out_ctrl), .pad(pad_cells_out_ctrl));
flush_hole_0 collect_flush_hole(.connection(collect_flush), .pad(pad_collect_flush));
flush_hole_0 lysis_in_flush_hole(.connection(lysis_in_flush), .pad(pad_lysis_in_flush));
flush_hole_0 lysis_out_flush_hole(.connection(lysis_out_flush), .pad(pad_lysis_out_flush));
flush_hole_0 push_flush_hole(.connection(push_flush), .pad(pad_push_flush));
flush_hole_0 pump1_flush_hole(.connection(pump1_flush), .pad(pad_pump1_flush));
flush_hole_0 pump2_flush_hole(.connection(pump2_flush), .pad(pad_pump2_flush));
flush_hole_0 pump3_flush_hole(.connection(pump3_flush), .pad(pad_pump3_flush));
flush_hole_0 sep_flush_hole(.connection(sep_flush), .pad(pad_sep_flush));
flush_hole_0 sieve_flush_hole(.connection(sieve_flush), .pad(pad_sieve_flush));
flush_hole_0 waste_flush_hole(.connection(waste_flush), .pad(pad_waste_flush));
flush_hole_0 beads_flush_hole(.connection(beads_flush), .pad(pad_beads_flush));
flush_hole_0 cells_in_flush_hole(.connection(cells_in_flush), .pad(pad_cells_in_flush));
flush_hole_0 cells_out_flush_hole(.connection(cells_out_flush), .pad(pad_cells_out_flush));
  mRNAiso_bank #(SIZE) thing(
.beads_in(beads_in),
.beads_out(beads_out),
.cells_in(cells_in),
.cells_out(cells_out),
.collect(collect),
.lysis_buffer_in(lysis_buffer_in),
.lysis_buffer_out(lysis_buffer_out),
.push_line(push_line),
.waste_out(waste_out),
.collect_ctrl(collect_ctrl),
.lysis_in_ctrl(lysis_in_ctrl),
.lysis_out_ctrl(lysis_out_ctrl),
.push_ctrl(push_ctrl),
.pump1(pump1),
.pump2(pump2),
.pump3(pump3),
.sep_ctrl(sep_ctrl),
.sieve_ctrl(sieve_ctrl),
.waste_ctrl(waste_ctrl),
.beads_ctrl(beads_ctrl),
.cells_in_ctrl(cells_in_ctrl),
.cells_out_ctrl(cells_out_ctrl),
.collect_flush(collect_flush),
.lysis_in_flush(lysis_in_flush),
.lysis_out_flush(lysis_out_flush),
.push_flush(push_flush),
.pump1_flush(pump1_flush),
.pump2_flush(pump2_flush),
.pump3_flush(pump3_flush),
.sep_flush(sep_flush),
.sieve_flush(sieve_flush),
.waste_flush(waste_flush),
.beads_flush(beads_flush),
.cells_in_flush(cells_in_flush),
.cells_out_flush(cells_out_flush));
endmodule
