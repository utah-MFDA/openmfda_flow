module ChIP10(inout inlet1, inlet2, inlet3, inlet4, inlet5, inlet6,
             inlet7, inlet8, inlet9, inlet10, inlet11, inlet12, inlet13, inlet14, inlet15,
             outlet1, outlet2,
             outlet3, outlet4, outlet5, outlet6, outlet7, outlet8, outlet9, outlet10, outlet11, outlet12,
             collect1, collect2, collect3, collect4, collect5, collect6, collect7, collect8, collect9, collect10,
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
  chamber chamber1(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet1), .bead_in(bead_in), .outlet(outlet3), .collect(collect1));
  chamber chamber2(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet2), .bead_in(bead_in), .outlet(outlet4), .collect(collect2));
  chamber chamber3(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet3), .bead_in(bead_in), .outlet(outlet5), .collect(collect3));
  chamber chamber4(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet4), .bead_in(bead_in), .outlet(outlet6), .collect(collect4));
  chamber chamber5(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet5), .bead_in(bead_in), .outlet(outlet7), .collect(collect5));
  chamber chamber6(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet6), .bead_in(bead_in), .outlet(outlet8), .collect(collect6));
  chamber chamber7(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet7), .bead_in(bead_in), .outlet(outlet9), .collect(collect7));
  chamber chamber8(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet8), .bead_in(bead_in), .outlet(outlet10), .collect(collect8));
  chamber chamber9(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet9), .bead_in(bead_in), .outlet(outlet11), .collect(collect9));
  chamber chamber10(.ring_in_ctrl(stage_in_ctrl),
               .ring_out_ctrl(stage_out_ctrl), .sieve_ctrl(sieve_ctrl),
               .collect_ctrl(collect_ctrl),
               .inlet_ctrl(stage_inlet_ctrl), .outlet_ctrl(stage_outlet_ctrl), .bead_ctrl(bead_ctrl),
               .pump1(pump1), .pump2(pump2), .pump3(pump3),
               .ring_in(j2), .inlet(inlet10), .bead_in(bead_in), .outlet(outlet12), .collect(collect10));
endmodule
