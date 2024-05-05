module simple (
inout p1, p2, p3, cp1, cp2
);
  wire c3;
LONG_CELL_TRAP ct1(.port2(p3),.port1(c3));
valve v1(.air_in(cp1),.fluid_out(c3),.fluid_in(p1));
valve v2(.air_in(cp2),.fluid_out(c3),.fluid_in(p2));
endmodule
