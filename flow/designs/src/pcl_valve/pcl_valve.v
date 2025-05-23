module pcl_valve (
  soln1,
  soln2,
  out,
  pn_i1,
  pn_i2,
  pn_o1,
  pn_o2
);

input soln1, soln2, pn_i1, pn_i2 ;
output out, pn_o1, pn_o2;
wire cn1, cn2 ;

p_valve_0_50 v1     (.in_fluid(soln1), .out_fluid(cn1), .in_air(pn_i1), .out_air(pn_o1)) ;
p_valve_0_110 v2    (.in_fluid(soln2), .out_fluid(cn2), .in_air(pn_i2), .out_air(pn_o2)) ;
diffmix_25px_0 mix1 (.a_fluid(cn1), .b_fluid(cn2), .out_fluid(out)) ;

endmodule
