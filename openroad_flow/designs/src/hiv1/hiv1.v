module hiv1(inout in1,in2,in3,in4,in5, m, sample_out, control_out, cin1, cin2, cin3, cin4, cin5, c1,c2,c3);
  wire j1,j2,j3,j4;
  valve vin1(.fluid_in(in1), .fluid_out(j1), .air_in(cin1));
  valve vin2(.fluid_in(in2), .fluid_out(j1), .air_in(cin2));
  valve vin3(.fluid_in(in3), .fluid_out(j1), .air_in(cin3));
  valve vin4(.fluid_in(in4), .fluid_out(j1), .air_in(cin4));
  valve vin5(.fluid_in(in5), .fluid_out(j1), .air_in(cin5));
  chamber ch1(.in(j1),.out(j2));
  chamber ch2(.in(j3), .out(sample_out));
  chamber ch3(.in(j4), .out(control_out));
  valve vc1(.fluid_in(j2), .fluid_out(j3), .air_in(c1));
  valve vc2(.fluid_in(m), .fluid_out(j3), .air_in(c2));
  valve vc3(.fluid_in(j4), .fluid_out(j3), .air_in(c3));
endmodule
