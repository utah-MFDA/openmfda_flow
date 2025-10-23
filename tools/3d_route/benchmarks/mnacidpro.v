module mnacidpro(inout [6:0] in,
                 input [12:0] c,
                 input [2:0] p,
                 inout [1:0] out,
                 output [15:0] flush);
  wire j1,j2,j3,j4,j5;
  wire jp1, jp2;
  valve v1(.fluid_in(in[1]), .fluid_out(j1), .air_in(c[1]), .air_out(flush[0]));
  valve v2(.fluid_in(in[2]), .fluid_out(j1), .air_in(c[2]), .air_out(flush[1]));
  valve v3(.fluid_in(in[3]), .fluid_out(j1), .air_in(c[3]), .air_out(flush[2]));
  valve v4(.fluid_in(j1), .fluid_out(j2), .air_in(c[4]), .air_out(flush[3]));
  valve v5(.fluid_in(in[5]), .fluid_out(j2), .air_in(c[5]), .air_out(flush[4]));
  valve v6(.fluid_in(in[6]), .fluid_out(j2), .air_in(c[6]), .air_out(flush[5]));
  valve v7(.fluid_in(in[5]), .fluid_out(j5), .air_in(c[7]), .air_out(flush[6]));
  valve vp1(.fluid_in(j5), .fluid_out(jp1), .air_in(p[0]), .air_out(flush[7]));
  valve vp2(.fluid_in(jp1), .fluid_out(jp2), .air_in(p[1]), .air_out(flush[8]));
  valve vp3(.fluid_in(jp2), .fluid_out(j5), .air_in(p[2]), .air_out(flush[9]));
  valve v8(.fluid_in(in[5]), .fluid_out(j3), .air_in(c[8]), .air_out(flush[10]));
  valve v9(.fluid_in(in[0]), .fluid_out(j3), .air_in(c[9]), .air_out(flush[11]));
  valve v10(.fluid_in(in[6]), .fluid_out(j3), .air_in(c[10]), .air_out(flush[12]));
  valve v11(.fluid_in(j3), .fluid_out(j4), .air_in(c[11]), .air_out(flush[13]));
  valve v12(.fluid_in(j4), .fluid_out(out[0]), .air_in(c[12]), .air_out(flush[14]));
  valve v13(.fluid_in(j4), .fluid_out(out[1]), .air_in(c[0]), .air_out(flush[15]));
endmodule
