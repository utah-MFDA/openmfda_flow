module kinase_activity((* type="flow" *) input flow_in_a, flow_in_b, flow_in_c,
                      (* type="flow" *) output flow_out_a, flow_out_b, flow_out_c, flow_out_d,
                       (* type="ctrl" *) input [12:0] ctrl_a,
                       (* type="ctrl" *) input [3:0] ctrl_s,
                       (* type="ctrl" *) input [2:0] pump_a,
                       (* type="ctrl" *) input [1:0] pump_b,
                       (* type="flush" *) output [12:0] flush_ctrl_a,
                       (* type="flush" *) output [3:0] flush_ctrl_s,
                       (* type="flush" *) output [2:0] flush_pump_a,
                       (* type="flush" *) output [1:0] flush_pump_b);

  (* type="flow" *) wire j1, j2, j3, j4, j5;
  (* type="flow" *) wire v5o, v6o, v10o;
  (* type="flow" *) wire vs1o, vs3o, vs4o;
  (* type="flow" *) wire vp1o, vp2o, vp3o, vp4o, vp5o;
  (* type="flow" *) wire circ2o;
  (* type="flow" *) wire cuo, clo;
  valve v0(.fluid_in(vs4o), .fluid_out(flow_out_d), .air_in(ctrl_a[0]), .air_out(flush_ctrl_a[0]));
  valve v1(.fluid_in(flow_in_a), .fluid_out(j4), .air_in(ctrl_a[1]), .air_out(flush_ctrl_a[1]));
  valve v2(.fluid_in(flow_in_b), .fluid_out(j4), .air_in(ctrl_a[2]), .air_out(flush_ctrl_a[2]));
  valve v3(.fluid_in(flow_in_c), .fluid_out(j4), .air_in(ctrl_a[3]), .air_out(flush_ctrl_a[3]));
  valve v4(.fluid_in(j4), .fluid_out(j1), .air_in(ctrl_a[4]), .air_out(flush_ctrl_a[4]));
  valve v5(.fluid_in(j1), .fluid_out(v5o), .air_in(ctrl_a[5]), .air_out(flush_ctrl_a[5]));
  valve v6(.fluid_in(j1), .fluid_out(v6o), .air_in(ctrl_a[6]), .air_out(flush_ctrl_a[6]));
  valve v7(.fluid_in(j5), .fluid_out(j2), .air_in(ctrl_a[7]), .air_out(flush_ctrl_a[7]));
  valve v8(.fluid_in(j5), .fluid_out(flow_out_b), .air_in(ctrl_a[8]), .air_out(flush_ctrl_a[8]));
  valve v9(.fluid_in(j2), .fluid_out(j3), .air_in(ctrl_a[9]), .air_out(flush_ctrl_a[9]));
  valve v10(.fluid_in(j3), .fluid_out(v10o), .air_in(ctrl_a[10]), .air_out(flush_ctrl_a[10]));
  valve v11(.fluid_in(j3), .fluid_out(flow_out_c), .air_in(ctrl_a[11]), .air_out(flush_ctrl_a[11]));
  valve v12(.fluid_in(vs4o), .fluid_out(flow_out_a), .air_in(ctrl_a[12]), .air_out(flush_ctrl_a[12]));

  chamber circulate1(.in(vp3o), .out(j5));
  chamber circulate2(.in(v5o), .out(circ2o));
  chamber column_upper(.in(vp4o), .out(cuo));
  chamber column_lower(.in(vs3o), .out(clo));
  sieve_valve vs0(.fluid_in(clo), .fluid_out(vs4o), .air_in(ctrl_s[0]), .air_out(flush_ctrl_s[0]));
  sieve_valve vs1(.fluid_in(v6o), .fluid_out(vs1o), .air_in(ctrl_s[1]), .air_out(flush_ctrl_s[1]));
  sieve_valve vs2(.fluid_in(vp5o), .fluid_out(j2), .air_in(ctrl_s[2]), .air_out(flush_ctrl_s[2]));
  sieve_valve vs3(.fluid_in(v10o), .fluid_out(vs3o), .air_in(ctrl_s[3]), .air_out(flush_ctrl_s[3]));
  pump_valve vp0(.fluid_in(circ2o), .fluid_out(vp1o), .air_in(pump_a[0]), .air_out(flush_pump_a[0]));
  pump_valve vp1(.fluid_in(vp1o), .fluid_out(vp2o), .air_in(pump_a[1]), .air_out(flush_pump_a[1]));
  pump_valve vp2(.fluid_in(vp2o), .fluid_out(vp3o), .air_in(pump_a[2]), .air_out(flush_pump_a[2]));
  pump_valve vp3(.fluid_in(vs1o), .fluid_out(vp4o), .air_in(pump_b[0]), .air_out(flush_pump_b[0]));
  pump_valve vp4(.fluid_in(cuo), .fluid_out(vp5o), .air_in(pump_b[1]), .air_out(flush_pump_b[1]));
endmodule


module kinase_activity_bank #(  parameter SIZE = 7)(
  (* type="flow" *) input [SIZE-1:0] flow_in_a,
  (* type="flow" *) input [SIZE-1:0] flow_in_b,
  (* type="flow" *) input [SIZE-1:0] flow_in_c,
  (* type="flow" *) output [SIZE-1:0] flow_out_a,
  (* type="flow" *) output [SIZE-1:0] flow_out_b,
  (* type="flow" *) output [SIZE-1:0] flow_out_c,
  (* type="flow" *) output [SIZE-1:0] flow_out_d,
  (* type="ctrl" *) input [12:0] ctrl_a,
  (* type="ctrl" *) input [3:0] ctrl_s,
  (* type="ctrl" *) input [2:0] pump_a,
  (* type="ctrl" *) input [1:0] pump_b,
  (* type="flush" *) output [12:0] flush_ctrl_a,
  (* type="flush" *) output [3:0] flush_ctrl_s,
  (* type="flush" *) output [2:0] flush_pump_a,
  (* type="flush" *) output [1:0] flush_pump_b);

  (* type="ctrl" *)wire [12:0] serial_ctrl_a [SIZE:0];
  (* type="ctrl" *)wire [3:0] serial_ctrl_s [SIZE:0];
  (* type="ctrl" *)wire [2:0] serial_pump_a [SIZE:0];
  (* type="ctrl" *)wire [1:0] serial_pump_b[SIZE:0];
  assign serial_ctrl_a [0] = ctrl_a;
  assign serial_ctrl_s [0] = ctrl_s;
  assign serial_pump_a [0] = pump_a;
  assign serial_pump_b [0] = pump_b;
  assign flush_ctrl_a = serial_ctrl_a [SIZE];
  assign flush_ctrl_s = serial_ctrl_s [SIZE];
  assign flush_pump_a = serial_pump_a [SIZE];
  assign flush_pump_b = serial_pump_b [SIZE];

  generate
    genvar i;
    for (i = 0; i < SIZE; i = i + 1) begin: devices
      kinase_activity thingy(
            .flow_in_a(flow_in_a[i]), .flow_in_b(flow_in_b[i]), .flow_in_c(flow_in_c[i]),
            .flow_out_a(flow_out_a[i]), .flow_out_b(flow_out_b[i]),
            .flow_out_c(flow_out_c[i]), .flow_out_d(flow_out_d[i]),
            .ctrl_a(serial_ctrl_a[i]), .ctrl_s(serial_ctrl_s[i]),
            .pump_a(serial_pump_a[i]), .pump_b(serial_pump_b[i]),
            .flush_ctrl_a(serial_ctrl_a[i+1]), .flush_ctrl_s(serial_ctrl_s[i+1]),
            .flush_pump_a(serial_pump_a[i+1]), .flush_pump_b(serial_pump_b[i+1]));

    end
  endgenerate
endmodule
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
      pinhole_320px_0 hole_in_a (.connection(flow_in_a[i]), .pad(pad_flow_in_a[i]));
      pinhole_320px_0 hole_in_b (.connection(flow_in_b[i]), .pad(pad_flow_in_b[i]));
      pinhole_320px_0 hole_in_c (.connection(flow_in_c[i]), .pad(pad_flow_in_c[i]));
      pinhole_320px_0 hole_out_a (.connection(flow_out_a[i]), .pad(pad_flow_out_a[i]));
      pinhole_320px_0 hole_out_b (.connection(flow_out_b[i]), .pad(pad_flow_out_b[i]));
      pinhole_320px_0 hole_out_c (.connection(flow_out_c[i]), .pad(pad_flow_out_c[i]));
      pinhole_320px_0 hole_out_d (.connection(flow_out_d[i]), .pad(pad_flow_out_d[i]));
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
      kinase_activity_bank  #(SIZE) thingy(
                              .flow_in_a(flow_in_a),
                              .flow_in_b(flow_in_b),
                              .flow_in_c(flow_in_c),
                              .flow_out_a(flow_out_a),
                              .flow_out_b(flow_out_b),
                              .flow_out_c(flow_out_c),
                              .flow_out_d(flow_out_d),
                              .ctrl_a(ctrl_a),
                              .ctrl_s(ctrl_s),
                              .pump_a(pump_a), .pump_b(pump_b),
                              .flush_ctrl_a(flush_ctrl_a), .flush_ctrl_s(flush_ctrl_s),
                              .flush_pump_a(flush_pump_a), .flush_pump_b(flush_pump_b));
endmodule
module mnacidpro_reactor_direct(
  (* type="ctrl" *) input vertical_ctrl, horiz_ctrl, waste_ctrl, bead_ctrl,
  loop_exit_ctrl, bead_trap_ctrl, collect_ctrl,
  (* type="ctrl" *) input [2:0] pump,
  (* type="flush" *) output vertical_flush, horiz_flush, waste_flush, bead_flush,
  loop_exit_flush, bead_trap_flush, collect_flush,
  (* type="flush" *) output [2:0] pump_flush,
  (* type="flow" *) input drive, bead_in, buffer_in, cell_in,
  (* type="flow" *) output collect, waste, bead_out, buffer_out, cell_out);

  (* type="flow" *) wire r1,r2,r3,r4,r5, j1, j2;

  (* type="flow" *) wire r1o,r2o,r3o,r4o;

  (* type="ctrl" *) wire c1, c2, c3;
  valve v1(.fluid_in(drive), .fluid_out(r3), .air_in(vertical_ctrl), .air_out(vertical_flush));
  valve v2(.fluid_in(r3o), .fluid_out(r2), .air_in(vertical_ctrl), .air_out(vertical_flush));
  valve v3(.fluid_in(r2), .fluid_out(r1), .air_in(vertical_ctrl), .air_out(vertical_flush));

  chamber r1c(.fluid_in(r1), .fluid_out(r1o));
  chamber r2c(.fluid_in(r2), .fluid_out(r2o));
  chamber r3c(.fluid_in(r3), .fluid_out(r3o));
  chamber r4c(.fluid_in(r4), .fluid_out(r4o));
  (* type="ctrl" *) wire d1,d2,d3,d5;
  valve v4(.fluid_in(buffer_in), .fluid_out(r3), .air_in(horiz_ctrl), .air_out(horiz_flush));
  valve v5(.fluid_in(r30), .fluid_out(buffer_out), .air_in(horiz_ctrl), .air_out(horiz_ctrl));
  valve v6(.fluid_in(cell_in), .fluid_out(r2), .air_in(horiz_ctrl), .air_out(horiz_flush));
  valve v7(.fluid_in(r2o), .fluid_out(cell_out), .air_in(horiz_ctrl), .air_out(horiz_flush));
  valve v8(.fluid_in(bead_in), .fluid_out(r4), .air_in(bead_ctrl), .air_out(bead_flush));
  valve v9(.fluid_in(r4o), .fluid_out(bead_out), .air_in(bead_ctrl), .air_out(bead_flush));
  pump_valve p0(.fluid_in(r1), .fluid_out(j1), .air_in(pump[0]), .air_out(pump_flush[0]));
  pump_valve p1(.fluid_in(j1), .fluid_out(j2), .air_in(pump[1]), .air_out(pump_flush[1]));
  pump_valve p2(.fluid_in(j2), .fluid_out(r1o), .air_in(pump[2]), .air_out(pump_flush[2]));
  (* type="ctrl" *) wire e1;
  valve v10(.fluid_in(r1o), .fluid_out(r4), .air_in(loop_exit_ctrl), .air_out(loop_exit_flush));
  valve v11(.fluid_in(r4o), .fluid_out(r5), .air_in(bead_trap_ctrl), .air_out(bead_trap_flush));
  valve v12(.fluid_in(r5), .fluid_out(waste), .air_in(waste_ctrl), .air_out(waste_flush));
  valve v13(.fluid_in(r5), .fluid_out(collect), .air_in(collect_ctrl), .air_out(collect_flush));

endmodule

module mnacidpro_reactor(
  (* type="ctrl" *) input vertical_ctrl, horiz_ctrl, waste_ctrl, bead_ctrl,
  loop_exit_ctrl, bead_trap_ctrl, collect_ctrl,
  (* type="ctrl" *) input [2:0] pump,
  (* type="flush" *) output vertical_flush, horiz_flush, waste_flush, bead_flush,
  loop_exit_flush, bead_trap_flush, collect_flush,
  (* type="flush" *) output [2:0] pump_flush,
  (* type="flow" *) input drive, bead_in, buffer_in, cell_in,
  (* type="flow" *) output collect, waste, bead_out, buffer_out, cell_out);

  (* type="flow" *) wire r1,r2,r3,r4,r5, j1, j2;

  (* type="flow" *) wire r1o,r2o,r3o,r4o;

  (* type="ctrl" *) wire c1, c2, c3;
  valve v1(.fluid_in(drive), .fluid_out(r3), .air_in(vertical_ctrl), .air_out(c1));
  valve v2(.fluid_in(r3o), .fluid_out(r2), .air_in(c1), .air_out(c2));
  valve v3(.fluid_in(r2), .fluid_out(r1), .air_in(c2), .air_out(vertical_flush));

  chamber r1c(.fluid_in(r1), .fluid_out(r1o));
  chamber r2c(.fluid_in(r2), .fluid_out(r2o));
  chamber r3c(.fluid_in(r3), .fluid_out(r3o));
  chamber r4c(.fluid_in(r4), .fluid_out(r4o));
  (* type="ctrl" *) wire d1,d2,d3,d5;
  valve v4(.fluid_in(buffer_in), .fluid_out(r3), .air_in(horiz_ctrl), .air_out(d1));
  valve v5(.fluid_in(r30), .fluid_out(buffer_out), .air_in(d1), .air_out(d2));
  valve v6(.fluid_in(cell_in), .fluid_out(r2), .air_in(d2), .air_out(d3));
  valve v7(.fluid_in(r2o), .fluid_out(cell_out), .air_in(d3), .air_out(horiz_flush));
  valve v8(.fluid_in(bead_in), .fluid_out(r4), .air_in(bead_ctrl), .air_out(d5));
  valve v9(.fluid_in(r4o), .fluid_out(bead_out), .air_in(d5), .air_out(bead_flush));
  pump_valve p0(.fluid_in(r1), .fluid_out(j1), .air_in(pump[0]), .air_out(pump_flush[0]));
  pump_valve p1(.fluid_in(j1), .fluid_out(j2), .air_in(pump[1]), .air_out(pump_flush[1]));
  pump_valve p2(.fluid_in(j2), .fluid_out(r1o), .air_in(pump[2]), .air_out(pump_flush[2]));
  (* type="ctrl" *) wire e1;
  valve v10(.fluid_in(r1o), .fluid_out(r4), .air_in(loop_exit_ctrl), .air_out(loop_exit_flush));
  valve v11(.fluid_in(r4o), .fluid_out(r5), .air_in(bead_trap_ctrl), .air_out(bead_trap_flush));
  valve v12(.fluid_in(r5), .fluid_out(waste), .air_in(waste_ctrl), .air_out(waste_flush));
  valve v13(.fluid_in(r5), .fluid_out(collect), .air_in(collect_ctrl), .air_out(collect_flush));

endmodule

module mnacidpro((* type="ctrl" *) input lysis_ctrl, wash_ctrl, elute_ctrl, dead_end_ctrl,
                 vertical_ctrl, horiz_ctrl, waste_ctrl, bead_ctrl, loop_exit_ctrl, bead_trap_ctrl, collect_ctrl,
                 (* type="ctrl" *) input [2:0] pump,
                  (* type="flush" *) output lysis_flush, wash_flush, elute_flush, dead_end_flush,
                 vertical_flush, horiz_flush, waste_flush, bead_flush, loop_exit_flush, bead_trap_flush, collect_flush,
                 (* type="flush" *) output [2:0] pump_flush,
                 (* type="flow" *) input bead_in, buffer_in, cell_in,
                 (* type="flow" *) input lysis_in, wash_in, elute_in,
                 (* type="flow" *) output [SIZE-1:0] collect,
                 (* type="flow" *) output waste, bead_out, buffer_out, cell_out);

  parameter SIZE = 3;
  (* type="flow" *) wire drive;

  (* type="flow" *) wire [SIZE:0] bead_between, cell_between, buffer_between;
  (* type="ctrl" *) wire [SIZE:0]
                 vertical_inter,
                 horiz_inter,
                 waste_inter,
                 bead_inter,
                 loop_exit_inter,
                 bead_trap_inter,
                 collect_inter;
  (* type="ctrl" *) wire [2:0] pump_inter [SIZE:0];

  assign bead_between[0] = bead_in;
  assign cell_between[0] = cell_in;
  assign buffer_between[0] = buffer_in;


  assign vertical_inter[0] = vertical_ctrl;
  assign horiz_inter[0] = horiz_ctrl;
  assign waste_inter[0] = waste_ctrl;
  assign bead_inter[0] = bead_ctrl;
  assign loop_exit_inter[0] = loop_exit_ctrl;
  assign bead_trap_inter[0] = bead_trap_ctrl;
  assign collect_inter[0] = collect_ctrl;
  assign pump_inter[0] = pump;


  assign vertical_flush = vertical_inter[SIZE];
  assign horiz_flush = horiz_inter[SIZE];
  assign waste_flush = waste_inter[SIZE];
  assign bead_flush = bead_inter[SIZE];
  assign loop_exit_flush = loop_exit_inter[SIZE];
  assign bead_trap_flush = bead_trap_inter[SIZE];
  assign collect_flush = collect_inter[SIZE];
  assign pump_flush = pump_inter[SIZE];

  valve lysis(.fluid_in(lysis_in), .fluid_out(drive), .air_in(lysis_ctrl), .air_out(lysis_flush));
  valve wash(.fluid_in(wash_in), .fluid_out(drive), .air_in(wash_ctrl), .air_out(wash_flush));
  valve elute(.fluid_in(elute_in), .fluid_out(drive), .air_in(elute_ctrl), .air_out(elute_flush));

  generate
    genvar i;
    for (i = 0; i < SIZE; i = i + 1) begin: chamber
      mnacidpro_reactor_direct thingy(
        .vertical_ctrl(vertical_inter[i]),
         .horiz_ctrl(horiz_inter[i]),
         .waste_ctrl(waste_inter[i]),
         .bead_ctrl(bead_inter[i]),
         .loop_exit_ctrl(loop_exit_inter[i]),
         .bead_trap_ctrl(bead_trap_inter[i]),
         .collect_ctrl(collect_inter[i]),
         .pump(pump_inter[i]),
         .vertical_flush(vertical_inter[i+1]),
         .horiz_flush(horiz_inter[i+1]),
         .waste_flush(waste_inter[i+1]),
         .bead_flush(bead_inter[i+1]),
         .loop_exit_flush(loop_exit_inter[i+1]),
         .bead_trap_flush(bead_trap_inter[i+1]),
         .collect_flush(collect_inter[i+1]),
         .pump_flush(pump_inter[i+1]),
         .drive(drive),
         .bead_in(bead_between[i]),
         .buffer_in(buffer_between[i]),
         .cell_in(cell_between[i]),
         .collect(collect[i]),
         .waste(waste),
         .bead_out(bead_between[i+1]),
         .buffer_out(buffer_between[i+1]),
         .cell_out(cell_between[i+1]));
    end
  endgenerate


  (* type="ctrl" *) wire e1, e2;
  valve dead_buffer(.fluid_in(buffer_between[SIZE]), .fluid_out(buffer_out), .air_in(dead_end_ctrl), .air_out(e1));
  valve dead_cell(.fluid_in(cell_between[SIZE]), .fluid_out(cell_out), .air_in(e1), .air_out(e2));
  valve dead_bead(.fluid_in(bead_between[SIZE]), .fluid_out(bead_out), .air_in(e2), .air_out(dead_end_flush));
endmodule

module mRNAiso((* type="flow" *)input beads_in,
               (* type="flow" *) output beads_out,
               (* type="flow" *)input cells_in,
               (* type="flow" *) output cells_out,
               (* type="flow" *) output collect,
               (* type="flow" *) input lysis_buffer_in,
               (* type="flow" *) output lysis_buffer_out,
               (* type="flow" *) input push_line,
               (* type="flow" *) output waste_out,
               (* type="ctrl" *) input collect_ctrl,
               lysis_in_ctrl, lysis_out_ctrl,
               push_ctrl,
               pump1, pump2, pump3,
               sep_ctrl,
               sieve_ctrl,
               waste_ctrl,
               beads_ctrl, cells_in_ctrl, cells_out_ctrl,
               (* type="flush" *) output collect_flush,
               lysis_in_flush, lysis_out_flush,
               push_flush,
               pump1_flush, pump2_flush, pump3_flush,
               sep_flush,
               sieve_flush,
               waste_flush,
               beads_flush, cells_in_flush, cells_out_flush);
  wire j1,j2,j3,j4,j5;

  valve vcollect(.fluid_in(j5), .fluid_out(collect), .air_in(collect_ctrl), .air_out(collect_flush));
  valve vwaste(.fluid_in(j5), .fluid_out(waste_out), .air_in(waste_ctrl), .air_out(waste_flush));
  valve vcell_in(.fluid_in(cells_in), .fluid_out(j1), .air_in(cells_in_ctrl), .air_out(cells_in_flush));
  valve vpush(.fluid_in(push_line), .fluid_out(j1), .air_in(push_ctrl), .air_out(push_flush));
  valve vpump1(.fluid_in(j3), .fluid_out(j1), .air_in(pump1), .air_out(pump1_flush));
  valve vpump2(.fluid_in(j1), .fluid_out(j2), .air_in(pump2), .air_out(pump2_flush));
  valve vpump3(.fluid_in(j2), .fluid_out(j3), .air_in(pump3), .air_out(pump3_flush));
  valve vcell_out(.fluid_in(j1), .fluid_out(cells_out), .air_in(cells_out_ctrl), .air_out(cells_out_flush));
  valve vlysis_in(.fluid_in(lysis_buffer_in), .fluid_out(j3), .air_in(lysis_in_ctrl), .air_out(lysis_in_flush));
  valve vlysis_out(.fluid_in(j2), .fluid_out(lysis_buffer_out), .air_in(lysis_out_ctrl), .air_out(lysis_out_flush));
  valve vsep(.fluid_in(j3), .fluid_out(j4), .air_in(sep_ctrl), .air_out(sep_flush));
  valve vbead_in(.fluid_in(beads_in), .fluid_out(j4), .air_in(beads_ctrl), .air_out(beads_flush));
  valve vbead_out(.fluid_in(j4), .fluid_out(beads_out), .air_in(beads_ctrl), .air_out(beads_flush));
  valve vsieve(.fluid_in(j4), .fluid_out(j5), .air_in(sieve_ctrl), .air_out(sieve_flush));
endmodule


module mRNAiso_bank((* type="flow" *)input [SIZE-1:0] beads_in,
               (* type="flow" *) output [SIZE-1:0]beads_out,
               (* type="flow" *)input [SIZE-1:0]cells_in,
               (* type="flow" *) output[SIZE-1:0] cells_out,
               (* type="flow" *) output [SIZE-1:0]collect,
               (* type="flow" *) input [SIZE-1:0]lysis_buffer_in,
               (* type="flow" *) output [SIZE-1:0]lysis_buffer_out,
               (* type="flow" *) input [SIZE-1:0]push_line,
               (* type="flow" *) output [SIZE-1:0]waste_out,
               (* type="ctrl" *) input collect_ctrl,
               lysis_in_ctrl, lysis_out_ctrl,
               push_ctrl,
               pump1, pump2, pump3,
               sep_ctrl,
               sieve_ctrl,
               waste_ctrl,
               beads_ctrl, cells_in_ctrl, cells_out_ctrl,
               (* type="flush" *) output collect_flush,
               lysis_in_flush, lysis_out_flush,
               push_flush,
               pump1_flush, pump2_flush, pump3_flush,
               sep_flush,
               sieve_flush,
               waste_flush,
               beads_flush, cells_in_flush, cells_out_flush);
parameter SIZE = 4;
   (* type="ctrl" *) wire [SIZE:0]
      inter_collect,
      inter_lysis_in,
      inter_lysis_out,
      inter_push,
      inter_pump1,
      inter_pump2,
      inter_pump3,
      inter_sep,
      inter_sieve,
      inter_waste,
      inter_beads,
      inter_cells_in,
      inter_cells_out;

assign inter_collect[0] = collect_ctrl;
assign inter_lysis_in[0] = lysis_in_ctrl;
assign inter_lysis_out[0] = lysis_out_ctrl;
assign inter_push[0] = push_ctrl;
assign inter_pump1[0] = pump1;
assign inter_pump2[0] = pump2;
assign inter_pump3[0] = pump3;
assign inter_sep[0] = sep_ctrl;
assign inter_sieve[0] = sieve_ctrl;
assign inter_waste[0] = waste_ctrl;
assign inter_beads[0] = beads_ctrl;
assign inter_cells_in[0] = cells_in_ctrl;
assign inter_cells_out[0] = cells_out_ctrl;
assign collect_flush = inter_collect[SIZE];
assign lysis_in_flush = inter_lysis_in[SIZE];
assign lysis_out_flush = inter_lysis_out[SIZE];
assign push_flush = inter_push[SIZE];
assign pump1_flush = inter_pump1[SIZE];
assign pump2_flush = inter_pump2[SIZE];
assign pump3_flush = inter_pump3[SIZE];
assign sep_flush = inter_sep[SIZE];
assign sieve_flush = inter_sieve[SIZE];
assign waste_flush = inter_waste[SIZE];
assign beads_flush = inter_beads[SIZE];
assign cells_in_flush = inter_cells_in[SIZE];
assign cells_out_flush = inter_cells_out[SIZE];
  generate
    genvar i;
    for (i = 0; i < SIZE; i = i + 1) begin: devices
        mRNAiso thingy (
        .beads_in(beads_in[i]),
          .beads_out(beads_out[i]),
          .cells_in(cells_in[i]),
          .cells_out(cells_out[i]),
          .collect(collect[i]),
          .lysis_buffer_in(lysis_buffer_in[i]),
          .lysis_buffer_out(lysis_buffer_out[i]),
          .push_line(push_line[i]),
          .waste_out(waste_out[i]),
          .collect_ctrl(inter_collect[i]),
          .lysis_in_ctrl(inter_lysis_in[i]),
          .lysis_out_ctrl(inter_lysis_out[i]),
          .push_ctrl(inter_push[i]),
          .pump1(inter_pump1[i]),
          .pump2(inter_pump2[i]),
          .pump3(inter_pump3[i]),
          .sep_ctrl(inter_sep[i]),
          .sieve_ctrl(inter_sieve[i]),
          .waste_ctrl(inter_waste[i]),
          .beads_ctrl(inter_beads[i]),
          .cells_in_ctrl(inter_cells_in[i]),
          .cells_out_ctrl(inter_cells_out[i]),
          .collect_flush(inter_collect[i+1]),
          .lysis_in_flush(inter_lysis_in[i+1]),
          .lysis_out_flush(inter_lysis_out[i+1]),
          .push_flush(inter_push[i+1]),
          .pump1_flush(inter_pump1[i+1]),
          .pump2_flush(inter_pump2[i+1]),
          .pump3_flush(inter_pump3[i+1]),
          .sep_flush(inter_sep[i+1]),
          .sieve_flush(inter_sieve[i+1]),
          .waste_flush(inter_waste[i+1]),
          .beads_flush(inter_beads[i+1]),
          .cells_in_flush(inter_cells_in[i+1]),
          .cells_out_flush(inter_cells_out[i+1] ));
    end
  endgenerate
endmodule
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
 module mux((* type="flow" *) input [SIZE-1:0] inlet,
            (* type="flow" *) output outlet,
            (* type="ctrl" *) input [SIZE-1:0] ctrl,
            (* type="flush" *) output [SIZE-1:0] flush);
  parameter SIZE = 2;
  generate
    genvar i;
    for (i = 0; i < SIZE; i = i + 1) begin: valves
      valve vinlet(.fluid_in(inlet[i]), .fluid_out(outlet), .air_in(ctrl[i]), .air_out(flush[i]));
    end
  endgenerate
endmodule

module pump((* type="flow" *) input inlet,
            (* type="flow" *) output outlet,
            (* type="ctrl" *) input [SIZE-1:0] drive,
            (* type="flush" *) output [SIZE-1:0] flush);

  parameter SIZE = 3;
  (* type="flow" *) wire [SIZE:0] j;

  assign j[0] = inlet;
  assign outlet = j[SIZE];
  generate
    genvar i;
    for (i = 0; i < SIZE; i = i + 1) begin: valves
      pump_valve vinlet(.fluid_in(j[i]), .fluid_out(j[i+1]), .air_in(drive[i]), .air_out(flush[i]));
    end
  endgenerate
endmodule

module reaction_chamber((* type="ctrl" *) input ctrl_ring_in,
                        ctrl_ring_out, ctrl_sieve,
                        ctrl_collect,
                        ctrl_inlet, ctrl_outlet, ctrl_bead,
                        (* type="ctrl" *) input [2:0] pump,
                        (* type="flush" *) output flush_ring_in,
                        flush_ring_out, flush_sieve,
                        flush_collect,
                        flush_inlet, flush_outlet, flush_bead,
                        (* type="flush" *) output [2:0] flush_pump,
                        (* type="flow" *) input flow_ring_in, flow_inlet, bead_in,
                        (* type="flow" *) output flow_outlet, collect);
  (* type="flow" *) wire j1,j1o, j2, j3, j4, j5;
  chamber ring(.fluid_in(j1), .fluid_out(j1o));
  valve vring_in(.fluid_in(flow_ring_in), .fluid_out(j1), .air_in(ctrl_ring_in), .air_out(flush_ring_in));
  pump #(1) vpump1 (.inlet(j1o), .outlet(j2), .drive(pump[0]), .flush(flush_pump[0]));
  pump #(1) vpump2 (.inlet(j2), .outlet(j3), .drive(pump[1]), .flush(flush_pump[1]));
  pump #(1) vpump3 (.inlet(j3), .outlet(j1), .drive(pump[2]), .flush(flush_pump[2]));
  valve vinlet(.fluid_in(flow_inlet), .fluid_out(j2), .air_in(ctrl_inlet), .air_out(flush_inlet));
  valve voutlet(.fluid_in(flow_outlet), .fluid_out(j3), .air_in(ctrl_outlet), .air_out(flush_outlet));
  valve vbead(.fluid_in(bead_in), .fluid_out(j2), .air_in(ctrl_bead), .air_out(flush_bead));
  valve vring_out(.fluid_in(j1o), .fluid_out(j4), .air_in(ctrl_ring_out), .air_out(flush_ring_out));
  sieve_valve vsieve(.fluid_in(j4), .fluid_out(j5), .air_in(ctrl_sieve), .air_out(flush_sieve));
  valve vcollect(.fluid_in(j5), .fluid_out(collect), .air_in(ctrl_collect), .air_out(flush_collect));
endmodule

module prep_chamber((* type="flow" *) input flow_inlet,
                    (* type="ctrl" *) input ctrl_v1, ctrl_v2, ctrl_sv1, ctrl_inlet, ctrl_outlet1, ctrl_outlet2, ctrl_ringout,
                    (* type="flush" *) output flush_v1, flush_v2, flush_sv1, flush_inlet, flush_outlet1, flush_outlet2, flush_ringout,
                    (* type="flow" *) output  flow_outlet1, flow_outlet2, flow_ringout);
  (* type="flow" *) wire j1, j2, j3, j4;
  chamber ring(.fluid_in(j3), .fluid_out(j4));
  valve vin(.fluid_in(flow_inlet), .fluid_out(j1), .air_in(ctrl_inlet), .air_out(flush_inlet));
  valve vout1(.fluid_in(j1), .fluid_out(flow_outlet1), .air_in(ctrl_outlet1), .air_out(flush_outlet1));
  valve vout2(.fluid_in(j2), .fluid_out(flow_outlet2), .air_in(ctrl_outlet2), .air_out(flush_outlet2));
  valve v1(.fluid_in(j1), .fluid_out(j3), .air_in(ctrl_v1), .air_out(flush_v1));
  valve v2(.fluid_in(j2), .fluid_out(j1), .air_in(ctrl_v2), .air_out(flush_v2));
  valve sv1(.fluid_in(j4), .fluid_out(j2), .air_in(ctrl_sv1), .air_out(flush_sv1));
  valve vout3(.fluid_in(j4), .fluid_out(flow_ringout), .air_in(ctrl_ringout), .air_out(flush_ringout));

endmodule

module ChIP((* type="flow" *) input [4:0] prep_inlet,
             (* type="flow" *) input [SIZE-1:0] ring_inlet,
             (* type="flow" *) output [1:0] prep_outlet,
             (* type="flow" *) output [SIZE-1:0] ring_outlet,
             (* type="flow" *) output [SIZE-1:0] collect,
            (* type="flow" *) input bead_in,
             (* type="ctrl" *) input [4:0] ctrl_inlet,
             (* type="ctrl" *) input ctrl_prep_inlet,
             ctrl_v1, ctrl_v2, ctrl_sv1,
             ctrl_stage_in,
             ctrl_stage_out, ctrl_sieve,
             ctrl_collect,
             ctrl_stage_inlet, ctrl_stage_outlet, ctrl_bead,
            ctrl_prep_ringout,
             (* type="ctrl" *) input  [1:0] ctrl_prep_outlet,
             (* type="ctrl" *) input [2:0] pump,
             (* type="flush" *) output [4:0] flush_inlet,
             (* type="flush" *) output flush_prep_inlet,
             flush_v1, flush_v2, flush_sv1,
             flush_stage_in,
             flush_stage_out, flush_sieve,
             flush_collect,
             flush_stage_inlet, flush_stage_outlet, flush_bead,
            flush_prep_ringout,
             (* type="flush" *) output [1:0] flush_prep_outlet,
             (* type="flush" *) output [2:0] flush_pump);
  parameter SIZE = 1;

  (* type="ctrl" *) wire inter_stage_in [SIZE:0];
  assign inter_stage_in[0] = ctrl_stage_in;
  assign flush_stage_in = inter_stage_in[SIZE];
  (* type="ctrl" *) wire inter_stage_out [SIZE:0];
  assign inter_stage_out[0] = ctrl_stage_out;
  assign flush_stage_out = inter_stage_out[SIZE];
  (* type="ctrl" *) wire inter_sieve [SIZE:0];
  assign inter_sieve[0] = ctrl_sieve;
  assign flush_sieve = inter_sieve[SIZE];
  (* type="ctrl" *) wire inter_collect [SIZE:0];
  assign inter_collect[0] = ctrl_collect;
  assign flush_collect = inter_collect[SIZE];
  (* type="ctrl" *) wire inter_stage_inlet [SIZE:0];
  assign inter_stage_inlet[0] = ctrl_stage_inlet;
  assign flush_stage_inlet = inter_stage_inlet[SIZE];
  (* type="ctrl" *) wire inter_stage_outlet [SIZE:0];
  assign inter_stage_outlet[0] = ctrl_stage_outlet;
  assign flush_stage_outlet = inter_stage_outlet[SIZE];
  (* type="ctrl" *) wire inter_bead [SIZE:0];
  assign inter_bead[0] = ctrl_bead;
  assign flush_bead = inter_bead[SIZE];
  (* type="ctrl" *) wire [2:0] inter_pump [SIZE:0];
  assign inter_pump[0] = pump;
  assign flush_pump = inter_pump[SIZE];



  (* type="flow" *) wire mux_out, prep_to_ring;
  mux #(5) vinlet (.inlet(prep_inlet), .outlet(mux_out), .ctrl(ctrl_inlet), .flush(flush_inlet));

  prep_chamber prep(.flow_inlet(mux_out),
                          .ctrl_v1(ctrl_v1),
                          .ctrl_v2(ctrl_v2),
                          .ctrl_sv1(ctrl_sv1),
                          .ctrl_inlet(ctrl_prep_inlet),
                          .ctrl_outlet1(ctrl_prep_outlet[0]),
                          .ctrl_outlet2(ctrl_prep_outlet[1]),
                          .ctrl_ringout(ctrl_prep_ringout),
                          .flush_v1(flush_v1),
                          .flush_v2(flush_v2),
                          .flush_sv1(flush_sv1),
                          .flush_inlet(flush_prep_inlet),
                          .flush_outlet1(flush_prep_outlet[0]),
                          .flush_outlet2(flush_prep_outlet[1]),
                          .flush_ringout(flush_prep_ringout),
                          .flow_outlet1(prep_outlet[0]),
                          .flow_outlet2(prep_outlet[1]),
                          .flow_ringout(prep_to_ring));


  generate
    genvar i;
    for (i = 0; i < SIZE; i = i + 1) begin: chamber
      reaction_chamber first(.ctrl_ring_in(inter_stage_in[i]),
                                       .ctrl_ring_out(inter_stage_out[i]),

                                       .ctrl_sieve(inter_sieve[i]),
                                       .ctrl_collect(inter_collect[i]),
                                       .ctrl_inlet(inter_stage_inlet[i]),
                                       .ctrl_outlet(inter_stage_outlet[i]),
                                       .ctrl_bead(inter_bead[i]),
                                       .pump(inter_pump[i]),
                                       .flush_ring_in(inter_stage_in[i+1]),
                                       .flush_ring_out(inter_stage_out[i+1]),
                                       .flush_sieve(inter_sieve[i+1]),
                                       .flush_collect(inter_collect[i+1]),
                                       .flush_inlet(inter_stage_inlet[i+1]),
                                       .flush_outlet(inter_stage_outlet[i+1]),
                                       .flush_bead(inter_bead[i+1]),
                                       .flush_pump(inter_pump[i+1]),
                                       .flow_ring_in(prep_to_ring),
                                       .flow_inlet(ring_inlet[i]),
                                       .flow_outlet(ring_outlet[i]),
                                      .bead_in(bead_in),
                                       .collect(collect[i]));
    end
  endgenerate
endmodule
module ChIP_pads((* type="flow" *) input [4:0] pad_prep_inlet,
             (* type="flow" *) input [SIZE-1:0] pad_ring_inlet,
             (* type="flow" *) output [1:0] pad_prep_outlet,
             (* type="flow" *) output [SIZE-1:0] pad_ring_outlet,
             (* type="flow" *) output [SIZE-1:0] pad_collect,
            (* type="flow" *) input pad_bead_in,
             (* type="ctrl" *) input [4:0] pad_ctrl_inlet,
             (* type="ctrl" *) input pad_ctrl_prep_inlet,
             pad_ctrl_v1, pad_ctrl_v2, pad_ctrl_sv1,
             pad_ctrl_stage_in,
             pad_ctrl_stage_out, pad_ctrl_sieve,
             pad_ctrl_collect,
             pad_ctrl_stage_inlet, pad_ctrl_stage_outlet, pad_ctrl_bead,
            pad_ctrl_prep_ringout,
             (* type="ctrl" *) input  [1:0] pad_ctrl_prep_outlet,
             (* type="ctrl" *) input [2:0] pad_pump,
             (* type="flush" *) output [4:0] pad_flush_inlet,
             (* type="flush" *) output pad_flush_prep_inlet,
             pad_flush_v1, pad_flush_v2, pad_flush_sv1,
             pad_flush_stage_in,
             pad_flush_stage_out, pad_flush_sieve,
             pad_flush_collect,
             pad_flush_stage_inlet, pad_flush_stage_outlet, pad_flush_bead,
            pad_flush_prep_ringout,
             (* type="flush" *) output [1:0] pad_flush_prep_outlet,
             (* type="flush" *) output [2:0] pad_flush_pump);
  parameter SIZE = 1;

(* type="flow" *) wire [4:0] prep_inlet;
             (* type="flow" *) wire [SIZE-1:0] ring_inlet;
             (* type="flow" *) wire [1:0] prep_outlet;
             (* type="flow" *) wire [SIZE-1:0] ring_outlet;
             (* type="flow" *) wire [SIZE-1:0] collect;
            (* type="flow" *) wire bead_in;
             (* type="ctrl" *) wire [4:0] ctrl_inlet;
             (* type="ctrl" *) wire ctrl_prep_inlet,
             ctrl_v1, ctrl_v2, ctrl_sv1,
             ctrl_stage_in,
             ctrl_stage_out, ctrl_sieve,
             ctrl_collect,
             ctrl_stage_inlet, ctrl_stage_outlet, ctrl_bead,
            ctrl_prep_ringout;
             (* type="ctrl" *) wire  [1:0] ctrl_prep_outlet;
             (* type="ctrl" *) wire [2:0] pump;
             (* type="flush" *) wire [4:0] flush_inlet;
             (* type="flush" *) wire flush_prep_inlet,
             flush_v1, flush_v2, flush_sv1,
             flush_stage_in,
             flush_stage_out, flush_sieve,
             flush_collect,
             flush_stage_inlet, flush_stage_outlet, flush_bead,
            flush_prep_ringout;
             (* type="flush" *) wire [1:0] flush_prep_outlet;
             (* type="flush" *) wire [2:0] flush_pump;
generate
    genvar i, j;
    for (i = 0; i < 5; i = i + 1) begin: prep_inlet_pinholes
     pinhole_320px_0 hole(.connection(prep_inlet[i]), .pad(pad_prep_inlet[i]));
    end
    for (i = 0; i < SIZE; i = i + 1) begin: ring_inlet_pinholes
     pinhole_320px_0 hole(.connection(ring_inlet[i]), .pad(pad_ring_inlet[i]));
    end
    for (i = 0; i < 2; i = i + 1) begin: prep_outlet_pinholes
     pinhole_320px_0 hole(.connection(prep_outlet[i]), .pad(pad_prep_outlet[i]));
    end
    for (i = 0; i < SIZE; i = i + 1) begin: ring_outlet_pinholes
     pinhole_320px_0 hole(.connection(ring_outlet[i]), .pad(pad_ring_outlet[i]));
    end
    for (i = 0; i < SIZE; i = i + 1) begin: collect_pinholes
     pinhole_320px_0 hole(.connection(collect[i]), .pad(pad_collect[i]));
    end
    pinhole_320px_0 hole(.connection(bead_in), .pad(pad_bead_in));
    for (i = 0; i < 3; i = i + 1) begin: pump_pinholes
     ctrl_hole_0 hole(.connection(pump[i]), .pad(pad_pump[i]));
    end
    for (i = 0; i < 3; i = i + 1) begin: flush_pump_pinholes
     flush_hole_0 hole(.connection(flush_pump[i]), .pad(pad_flush_pump[i]));
    end
    for (i = 0; i < 5; i = i + 1) begin: ctrl_inlet_pinholes
     ctrl_hole_0 hole(.connection(ctrl_inlet[i]), .pad(pad_ctrl_inlet[i]));
    end
    for (i = 0; i < 2; i = i + 1) begin: ctrl_prep_outlet_pinholes
     ctrl_hole_0 hole(.connection(ctrl_prep_outlet[i]), .pad(pad_ctrl_prep_outlet[i]));
    end
    ctrl_hole_0 ctrl_prep_inlet_hole(.connection(ctrl_prep_inlet), .pad(pad_ctrl_prep_inlet));
    ctrl_hole_0 ctrl_v1_hole(.connection(ctrl_v1), .pad(pad_ctrl_v1));
    ctrl_hole_0 ctrl_v2_hole(.connection(ctrl_v2), .pad(pad_ctrl_v2));
    ctrl_hole_0 ctrl_sv1_hole(.connection(ctrl_sv1), .pad(pad_ctrl_sv1));
    ctrl_hole_0 ctrl_stage_in_hole(.connection(ctrl_stage_in), .pad(pad_ctrl_stage_in));
    ctrl_hole_0 ctrl_stage_out_hole(.connection(ctrl_stage_out), .pad(pad_ctrl_stage_out));
    ctrl_hole_0 ctrl_sieve_hole(.connection(ctrl_sieve), .pad(pad_ctrl_sieve));
    ctrl_hole_0 ctrl_collect_hole(.connection(ctrl_collect), .pad(pad_ctrl_collect));
    ctrl_hole_0 ctrl_stage_inlet_hole(.connection(ctrl_stage_inlet), .pad(pad_ctrl_stage_inlet));
    ctrl_hole_0 ctrl_stage_outlet_hole(.connection(ctrl_stage_outlet), .pad(pad_ctrl_stage_outlet));
    ctrl_hole_0 ctrl_bead_hole(.connection(ctrl_bead), .pad(pad_ctrl_bead));
    for (i = 0; i < 5; i = i + 1) begin: flush_inlet_pinholes
     flush_hole_0 hole(.connection(flush_inlet[i]), .pad(pad_flush_inlet[i]));
    end
    for (i = 0; i < 2; i = i + 1) begin: flush_prep_outlet_pinholes
     flush_hole_0 hole(.connection(flush_prep_outlet[i]), .pad(pad_flush_prep_outlet[i]));
    end
    flush_hole_0 flush_prep_inlet_hole(.connection(flush_prep_inlet), .pad(pad_flush_prep_inlet));
    flush_hole_0 flush_v1_hole(.connection(flush_v1), .pad(pad_flush_v1));
    flush_hole_0 flush_v2_hole(.connection(flush_v2), .pad(pad_flush_v2));
    flush_hole_0 flush_sv1_hole(.connection(flush_sv1), .pad(pad_flush_sv1));
    flush_hole_0 flush_stage_in_hole(.connection(flush_stage_in), .pad(pad_flush_stage_in));
    flush_hole_0 flush_stage_out_hole(.connection(flush_stage_out), .pad(pad_flush_stage_out));
    flush_hole_0 flush_sieve_hole(.connection(flush_sieve), .pad(pad_flush_sieve));
    flush_hole_0 flush_collect_hole(.connection(flush_collect), .pad(pad_flush_collect));
    flush_hole_0 flush_stage_inlet_hole(.connection(flush_stage_inlet), .pad(pad_flush_stage_inlet));
    flush_hole_0 flush_stage_outlet_hole(.connection(flush_stage_outlet), .pad(pad_flush_stage_outlet));
    flush_hole_0 flush_bead_hole(.connection(flush_bead), .pad(pad_flush_bead));
  endgenerate
      ChIP #(SIZE) thingy(
      .prep_inlet(prep_inlet),
       .ring_inlet(ring_inlet),
       .prep_outlet(prep_outlet),
       .ring_outlet(ring_outlet),
       .collect(collect),
       .bead_in(bead_in),
       .ctrl_inlet(ctrl_inlet),
       .ctrl_prep_inlet(ctrl_prep_inlet),
       .ctrl_v1(ctrl_v1),
       .ctrl_v2(ctrl_v2),
       .ctrl_sv1(ctrl_sv1),
       .ctrl_stage_in(ctrl_stage_in),
       .ctrl_stage_out(ctrl_stage_out),
       .ctrl_sieve(ctrl_sieve),
       .ctrl_collect(ctrl_collect),
       .ctrl_stage_inlet(ctrl_stage_inlet),
       .ctrl_stage_outlet(ctrl_stage_outlet),
       .ctrl_bead(ctrl_bead),
       .ctrl_prep_ringout(ctrl_prep_ringout),
       .ctrl_prep_outlet(ctrl_prep_outlet),
       .pump(pump),
       .flush_inlet(flush_inlet),
       .flush_prep_inlet(flush_prep_inlet),
       .flush_v1(flush_v1),
       .flush_v2(flush_v2),
       .flush_sv1(flush_sv1),
       .flush_stage_in(flush_stage_in),
             .flush_stage_out(flush_stage_out),
       .flush_sieve(flush_sieve),
       .flush_collect(flush_collect),
       .flush_stage_inlet(flush_stage_inlet),
       .flush_stage_outlet(flush_stage_outlet),
       .flush_bead(flush_bead),
       .flush_prep_ringout(flush_prep_ringout),
       .flush_prep_outlet(flush_prep_outlet),
       .flush_pump(flush_pump));
endmodule
