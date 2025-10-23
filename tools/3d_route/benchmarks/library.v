module mux3_40px_0(input a, b, c, input sa, sb, sc, output y);
  valve_40px_1 thing1(.out_air(fa), .in_air(sa), .in_fluid(a), .out_fluid(y));
  valve_40px_1 thing2(.out_air(fb), .in_air(sb), .in_fluid(b), .out_fluid(y));
  valve_40px_1 thing3(.out_air(fc), .in_air(sc), .in_fluid(c), .out_fluid(y));
endmodule

module pump1_40px_0(input in, input pump1, output air_out, output out);
    valve_40px_1 thing(.in_air(pump1), .out_air(air_out), .in_fluid(in), .out_fluid(out));
endmodule

module pump3_40px_0(inout in, inout out, input pump1, pump2, pump3, output air_out1, air_out2, air_out3);
  wire x, y;
  valve_40px_1 thing1(.in_air(pump1), .out_air(air_out1), .in_fluid(in), .out_fluid(x));
  valve_40px_1 thing2(.in_air(pump2), .out_air(air_out2), .in_fluid(x), .out_fluid(y));
  valve_40px_1 thing3(.in_air(pump3), .out_air(air_out3), .in_fluid(y), .out_fluid(out));
endmodule

module valve((* type="flow" *) inout fluid_in, (* type="flow" *)inout fluid_out, (* type="ctrl" *)input air_in, (* type="ctrl" *)output air_out);
  valve_40px_1 thing(.in_air(air_in), .out_air(air_out), .in_fluid(fluid_in), .out_fluid(fluid_out));
endmodule

module pump_valve((* type="flow" *) inout fluid_in, (* type="flow" *)inout fluid_out, (* type="ctrl" *)input air_in, (* type="ctrl" *)output air_out);
  valve_40px_1 thing(.in_air(air_in), .out_air(air_out), .in_fluid(fluid_in), .out_fluid(fluid_out));
endmodule

module sieve_valve((* type="flow" *) inout fluid_in, (* type="flow" *)inout fluid_out, (* type="ctrl" *)input air_in, (* type="ctrl" *)output air_out);
  valve_40px_1 thing(.in_air(air_in), .out_air(air_out), .in_fluid(fluid_in), .out_fluid(fluid_out));
endmodule

module mixer(inout a, b, inout y);
  diffmix_25px_0 thing(.a_fluid(a), .b_fluid(b), .out_fluid(y));
endmodule

module chamber((* type="flow" *)inout in, (* type="flow" *)inout out);
  serpentine_150px_0 thing(.in_fluid(in), .out_fluid(out));
endmodule

module serpentine(inout in, inout out);
  serpentine_150px_0 thing(.in_fluid(in), .out_fluid(out));
endmodule

module filter(inout in, inout out);
  serpentine_150px_0 thing(.in_fluid(in), .out_fluid(out));
endmodule

module heater(inout in, inout out);
  serpentine_150px_0 thing(.in_fluid(in), .out_fluid(out));
endmodule

module detector(inout in, inout out);
  serpentine_150px_0 thing(.in_fluid(in), .out_fluid(out));
endmodule

module dilutor(inout a, b, inout y);
  diffmix_25px_0 thing(.a_fluid(a), .b_fluid(b), .out_fluid(y));
endmodule

module trap4(inout a, b, c, d);
  assign b = a;
  assign d = c;
  serpentine_50px_0 thing1(.a_fluid(a), .b_fluid(d));
endmodule
module kinase_activity((* type="flow" *) input [2:0] flow_in,
                       (* type="flow" *) output [3:0] flow_out,
                       (* type="ctrl" *) input [12:0] ctrl_a,
                       (* type="ctrl" *) input [3:0] ctrl_s,
                       (* type="ctrl" *) input [2:0] pump_a,
                       (* type="ctrl" *) input [1:0] pump_b,
                       (* type="flush" *) output [12:0] flush_ctrl_a,
                       (* type="flush" *) output [3:0] flush_ctrl_s,
                       (* type="flush" *) output [2:0] flush_pump_a,
                       (* type="flush" *) output [1:0] flush_pump_b);

  (* type="flow" *)wire j1, j2, j3, j4, j5;
  (* type="flow" *)wire v5o, v6o, v10o;
  (* type="flow" *)wire vs1o, vs3o, vs4o;
  (* type="flow" *)wire vp1o, vp2o, vp3o, vp4o, vp5o;
  (* type="flow" *)wire circ2o;
  (* type="flow" *)wire cuo, clo;
  valve v0(.fluid_in(vs4o), .fluid_out(flow_out[3]), .air_out(flush_ctrl_a[0]), .air_in(ctrl_a[0]));
  valve v1(.fluid_in(flow_in[0]), .fluid_out(j4), .air_out(flush_ctrl_a[1]), .air_in(ctrl_a[1]));
  valve v2(.fluid_in(flow_in[1]), .fluid_out(j4), .air_out(flush_ctrl_a[2]), .air_in(ctrl_a[2]));
  valve v3(.fluid_in(flow_in[2]), .fluid_out(j4), .air_out(flush_ctrl_a[3]), .air_in(ctrl_a[3]));
  valve v4(.fluid_in(j4), .fluid_out(j1), .air_out(flush_ctrl_a[4]), .air_in(ctrl_a[4]));
  valve v5(.fluid_in(j1), .fluid_out(v5o), .air_out(flush_ctrl_a[5]), .air_in(ctrl_a[5]));
  valve v6(.fluid_in(j1), .fluid_out(v6o), .air_out(flush_ctrl_a[6]), .air_in(ctrl_a[6]));
  valve v7(.fluid_in(j5), .fluid_out(j2), .air_out(flush_ctrl_a[7]), .air_in(ctrl_a[7]));
  valve v8(.fluid_in(j5), .fluid_out(flow_out[1]), .air_out(flush_ctrl_a[8]), .air_in(ctrl_a[8]));
  valve v9(.fluid_in(j2), .fluid_out(j3), .air_out(flush_ctrl_a[9]), .air_in(ctrl_a[9]));
  valve v10(.fluid_in(j3), .fluid_out(v10o), .air_out(flush_ctrl_a[10]), .air_in(ctrl_a[10]));
  valve v11(.fluid_in(j3), .fluid_out(flow_out[2]), .air_out(flush_ctrl_a[11]), .air_in(ctrl_a[11]));
  valve v12(.fluid_in(vs4o), .fluid_out(flow_out[0]), .air_out(flush_ctrl_a[12]), .air_in(ctrl_a[12]));

  chamber circulate1(.in(vp3o), .out(j5));
  chamber circulate2(.in(v5o), .out(circ2o));
  chamber column_upper(.in(vp4o), .out(cuo));
  chamber column_lower(.in(vs3o), .out(clo));
  sieve_valve vs0(.fluid_in(clo), .fluid_out(vs4o), .air_out(flush_ctrl_s[0]), .air_in(ctrl_s[0]));
  sieve_valve vs1(.fluid_in(v6o), .fluid_out(vs1o), .air_out(flush_ctrl_s[1]), .air_in(ctrl_s[1]));
  sieve_valve vs2(.fluid_in(vp5o), .fluid_out(j2), .air_out(flush_ctrl_s[2]), .air_in(ctrl_s[2]));
  sieve_valve vs3(.fluid_in(v10o), .fluid_out(vs3o), .air_out(flush_ctrl_s[3]), .air_in(ctrl_s[3]));
  pump_valve vp0(.fluid_in(circ2o), .fluid_out(vp1o), .air_out(flush_pump_a[0]), .air_in(pump_a[0]));
  pump_valve vp1(.fluid_in(vp1o), .fluid_out(vp2o), .air_out(flush_pump_a[1]), .air_in(pump_a[1]));
  pump_valve vp2(.fluid_in(vp2o), .fluid_out(vp3o), .air_out(flush_pump_a[2]), .air_in(pump_a[2]));
  pump_valve vp3(.fluid_in(vs1o), .fluid_out(vp4o), .air_out(flush_pump_b[0]), .air_in(pump_b[0]));
  pump_valve vp4(.fluid_in(cuo), .fluid_out(vp5o), .air_out(flush_pump_b[1]), .air_in(pump_b[1]));
endmodule
module kinase_activity_pads #(  parameter SIZE = 7)(
  (* type="flow" *) input [SIZE*IN_SIZE-1:0] pad_flow_in,
  (* type="flow" *) output [SIZE*OUT_SIZE-1:0] pad_flow_out,
  (* type="ctrl" *) input [12:0] pad_ctrl_a,
  (* type="ctrl" *) input [3:0] pad_ctrl_s,
  (* type="ctrl" *) input [2:0] pad_pump_a,
  (* type="ctrl" *) input [1:0] pad_pump_b,
  (* type="flush" *) output [12:0] pad_flush_ctrl_a,
  (* type="flush" *) output [3:0] pad_flush_ctrl_s,
  (* type="flush" *) output [2:0] pad_flush_pump_a,
  (* type="flush" *) output [1:0] pad_flush_pump_b);
  localparam IN_SIZE = 3;
  localparam OUT_SIZE = 4;


  (* type="flow" *)wire [IN_SIZE-1:0] flow_in [SIZE-1:0];
  (* type="flow" *)wire [OUT_SIZE-1:0] flow_out [SIZE-1:0];
  (* type="ctrl" *)wire [12:0] ctrl_a;
  (* type="ctrl" *)wire [3:0] ctrl_s;
  (* type="ctrl" *)wire [2:0] pump_a;
  (* type="ctrl" *)wire [1:0] pump_b;
  (* type="flush" *)wire [12:0] flush_ctrl_a;
  (* type="flush" *)wire [3:0] flush_ctrl_s;
  (* type="flush" *)wire [2:0] flush_pump_a;
  (* type="flush" *)wire [1:0] flush_pump_b;
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
    genvar i, j;
    for (i = 0; i < SIZE; i = i + 1) begin: pinholes
      for (j = 0; j < IN_SIZE; j = j + 1) begin: in
        pinhole_320px_0 hole (.connection(flow_in[i][j]), .pad(pad_flow_in[i*IN_SIZE + j]));
      end
      for (j = 0; j < OUT_SIZE; j = j + 1) begin: out
        pinhole_320px_0 hole (.connection(flow_out[i][j]), .pad(pad_flow_out[i*OUT_SIZE + j]));
      end
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
    for (i = 0; i < SIZE; i = i + 1) begin: devices
// I think there is a bug with place_inst with -name not allowing the braces generated here.
      kinase_activity thingy(.flow_in(flow_in[i]), .flow_out(flow_out[i]),
                              .ctrl_a(serial_ctrl_a[i]), .ctrl_s(serial_ctrl_s[i]),
                              .pump_a(serial_pump_a[i]), .pump_b(serial_pump_b[i]),
                              .flush_ctrl_a(serial_ctrl_a[i+1]), .flush_ctrl_s(serial_ctrl_s[i+1]),
                              .flush_pump_a(serial_pump_a[i+1]), .flush_pump_b(serial_pump_b[i+1]));

    end
  endgenerate
endmodule
