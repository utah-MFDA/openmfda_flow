module pcl_serpentine (
  soln1,
  out
);

input soln1;
output out;
wire cn1, cn2;

p_serpentine_0_150_30_8 serp1 (.in_fluid(soln1), .out_fluid(cn1));
p_serpentine_0_150_30_5 serp2 (.in_fluid(cn1), .out_fluid(cn2));
p_serpentine_0_120_30_8 serp3 (.in_fluid(cn2), .out_fluid(out));

endmodule
