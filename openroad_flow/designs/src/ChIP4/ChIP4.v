module ChIP4(inout inlet1, inlet2, inlet3, inlet4, inlet5, inlet6, inlet7, inlet8, inlet9,
             outlet1, outlet2, outlet3, outlet4, outlet5, outlet6,
             collect1, collect2, collect3, collect4,
             inlet1_ctrl, inlet2_ctrl, inlet3_ctrl, inlet4_ctrl, inlet5_ctrl,
             prep_inlet_ctrl, prep_outlet_ctrl,
             v1_ctrl, v2_ctrl, sv1_ctrl, outlet1_ctrl, outlet2_ctrl,
             bead_in,
             stage_in_ctrl,
             stage_out_ctrl, sieve_ctrl,
             collect_ctrl,
             stage_inlet_ctrl, stage_outlet_ctrl, bead_ctrl,
             pump1, pump2, pump3);
  wire j1, j2;
  valve vinlet1(.fluid_in(inlet1), .fluid_out(j1), .air_in(inlet1_ctrl));
  valve vinlet2(.fluid_in(inlet2), .fluid_out(j1), .air_in(inlet2_ctrl));
  valve vinlet3(.fluid_in(inlet3), .fluid_out(j1), .air_in(inlet3_ctrl));
  valve vinlet4(.fluid_in(inlet4), .fluid_out(j1), .air_in(inlet4_ctrl));
  valve vinlet5(.fluid_in(inlet5), .fluid_out(j1), .air_in(inlet5_ctrl));

  prep_chamber prep(.inlet(j1), .inlet_ctrl(prep_inlet_ctrl),
                    .v1_ctrl(v1_ctrl), .v2_ctrl(v2_ctrl), .sv1_ctrl(sv1_ctrl),
                    .outlet1_ctrl(outlet1_ctrl), .outlet2_ctrl(outlet2_ctrl), .outlet1(outlet1), .outlet2(outlet2),
                    .ringout(prep_outlet_ctrl));
  chamber first(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet1), .bead_in(bead_in), .outlet(outlet3), .collect(collect1));
  chamber second(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet2), .bead_in(bead_in), .outlet(outlet4), .collect(collect2));
  chamber third(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet3), .bead_in(bead_in), .outlet(outlet5), .collect(collect3));
  chamber fourth(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet4), .bead_in(bead_in), .outlet(outlet6), .collect(collect4));
endmodule
