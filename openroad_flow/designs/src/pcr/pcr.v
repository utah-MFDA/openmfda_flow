module pcr (
    f_primer,
    r_primer,
    evagr,
    h20,
    taq,
    dna,
    in_air0,
    in_air1,
    out_air0,
    out_air1,
    o
);

input   f_primer, r_primer, evagr, h20, taq, dna, in_air0, in_air1;
output  out_air0, out_air1, o;

wire    connect0,  connect1,  connect2,  connect3,  connect4,  connect5,  connect6,  connect7,  connect8,  connect9,
        connect10, connect11, connect12, connect13, connect14, connect15, connect16, connect17, connect18, connect19,
        connect20, connect21, connect22, connect23, connect24;

serpentine_150px_0  serp0   (.in_fluid(f_primer), .out_fluid(connect0));
serpentine_150px_0  serp1   (.in_fluid(r_primer), .out_fluid(connect1));

diffmix_25px_0      mix0    (.a_fluid(connect0), .b_fluid(connect1), .out_fluid(connect2));

serpentine_25px_0   serp2   (.in_fluid(evagr), .out_fluid(connect3));
serpentine_50px_0   serp3   (.in_fluid(connect3), .out_fluid(connect4));
serpentine_150px_0  serp4   (.in_fluid(connect4), .out_fluid(connect5));

diffmix_25px_0      mix1    (.a_fluid(connect2), .b_fluid(connect5), .out_fluid(connect6));

serpentine_50px_0   serp5   (.in_fluid(h20), .out_fluid(connect7));
serpentine_150px_0  serp6   (.in_fluid(connect7), .out_fluid(connect8));

diffmix_25px_0      mix2    (.a_fluid(connect6), .b_fluid(connect8), .out_fluid(connect9));

serpentine_75px_0   serp7   (.in_fluid(taq), .out_fluid(connect10));
serpentine_200px_0  serp8   (.in_fluid(connect10), .out_fluid(connect11));

diffmix_25px_0      mix3    (.a_fluid(connect9), .b_fluid(connect11), .out_fluid(connect12));

serpentine_200px_0  serp12  (.in_fluid(connect12), .out_fluid(connect21));

junction_25px_0     junc0   (.in_fluid(connect21), .out_fluid1(connect13), .out_fluid2(connect14));

valve_20px_1        valve0  (.in_air(in_air0), .in_fluid(connect13), .out_air(out_air0), .out_fluid(connect15));

diffmix_25px_0      mix4    (.a_fluid(connect15), .b_fluid(dna), .out_fluid(connect16));

serpentine_50px_0   serp9   (.in_fluid(connect16), .out_fluid(connect17));
serpentine_150px_0  serp10  (.in_fluid(connect17), .out_fluid(connect18));
serpentine_200px_0  serp11  (.in_fluid(connect18), .out_fluid(connect19));
serpentine_300px_0  serp13  (.in_fluid(connect19), .out_fluid(connect22));
serpentine_300px_0  serp14  (.in_fluid(connect22), .out_fluid(connect23));

valve_20px_1        valve1  (.in_air(in_air1), .in_fluid(connect14), .out_air(out_air1), .out_fluid(connect20));

diffmix_25px_0      mix5    (.a_fluid(connect23), .b_fluid(connect20), .out_fluid(connect24));

serpentine_200px_0  serp11  (.in_fluid(connect24), .out_fluid(o));

endmodule