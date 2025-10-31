module reservoir_demo (
  soln1,
  out
);

input soln1 ;
output out ;

directional_res_400nl res1 (.in_fluid(soln1), .out_fluid(out)) ;

endmodule
