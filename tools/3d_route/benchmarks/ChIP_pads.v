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
