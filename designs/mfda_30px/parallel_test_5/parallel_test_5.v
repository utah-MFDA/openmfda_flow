module parallel_test_5 (
  soln1,
  soln2,
  soln3,
  out
);

input soln1 ;
input soln2 ;
input soln3 ;
output out ;

wire conn_1_0, conn_1_1, conn_1_2, conn_1_3, conn_1_4,
  conn_2_0, conn_2_1, conn_2_2, conn_2_3, conn_2_4,
  conn_3_0, conn_3_1, conn_3_2, conn_3_3, conn_3_4,
  conn_m1 ;

serpentine_100px_0 serp_1_0 (.in_fluid(soln1),    .out_fluid(conn_1_0)) ;
serpentine_100px_0 serp_1_1 (.in_fluid(conn_1_0), .out_fluid(conn_1_1)) ;
serpentine_100px_0 serp_1_2 (.in_fluid(conn_1_1), .out_fluid(conn_1_2)) ;
serpentine_100px_0 serp_1_3 (.in_fluid(conn_1_2), .out_fluid(conn_1_3)) ;
serpentine_100px_0 serp_1_4 (.in_fluid(conn_1_3), .out_fluid(conn_1_4)) ;

serpentine_100px_0 serp_2_0 (.in_fluid(soln2),    .out_fluid(conn_2_0)) ;
serpentine_100px_0 serp_2_1 (.in_fluid(conn_2_0), .out_fluid(conn_2_1)) ;
serpentine_100px_0 serp_2_2 (.in_fluid(conn_2_1), .out_fluid(conn_2_2)) ;
serpentine_100px_0 serp_2_3 (.in_fluid(conn_2_2), .out_fluid(conn_2_3)) ;
serpentine_100px_0 serp_2_4 (.in_fluid(conn_2_3), .out_fluid(conn_2_4)) ;

serpentine_100px_0 serp_3_0 (.in_fluid(soln3),    .out_fluid(conn_3_0)) ;
serpentine_100px_0 serp_3_1 (.in_fluid(conn_3_0), .out_fluid(conn_3_1)) ;
serpentine_100px_0 serp_3_2 (.in_fluid(conn_3_1), .out_fluid(conn_3_2)) ;
serpentine_100px_0 serp_3_3 (.in_fluid(conn_3_2), .out_fluid(conn_3_3)) ;
serpentine_100px_0 serp_3_4 (.in_fluid(conn_3_3), .out_fluid(conn_3_4)) ;

diffmix_25px_0 mix1 (.a_fluid(conn_1_4), .b_fluid(conn_2_4), .out_fluid(conn_m1)) ;
diffmix_25px_0 mix2 (.a_fluid(conn_m1), .b_fluid(conn_3_4), .out_fluid(out)) ;

endmodule
