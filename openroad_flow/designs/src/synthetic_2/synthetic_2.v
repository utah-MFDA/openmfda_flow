module synthetic_2(
input Source,
output Out
);

wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19;

//first row
chamber o1(.in(Source), .out(w1));
chamber o2(.in(Source), .out(w2));
chamber o3(.in(Source), .out(w3));
chamber o4(.in(Source), .out(w4));
chamber o5(.in(Source), .out(w13));
chamber o6(.in(Source), .out(w5));
chamber o7(.in(Source), .out(w14));
chamber o8(.in(Source), .out(w6));


//second row
chamber o9(.in(w1), .out(w7));
chamber o10(.in(w2), .out(w15));
chamber o11(.in(w3), .out(w8));
mixer m12(.a(w4), .b(w13), .out(w8));
//chamber o12(.in(w4), .out(w8));
mixer m13(.a(w5), .b(w14), .out(w16));
//chamber o13(.in(w5), .out(w9));
chamber o14(.in(w6), .out(w17));

//third row

mixer m15(.a(w7), .b(w15), .out(w10));
//chamber o15(.in(w7), .out(w10));
mixer m16(.a(w8), .b(w16), .out(w18));
//chamber o16(.in(w8), .out(w10));

mixer m17(.a(w9), .b(w17), .out(w11));
//chamber o17(.in(w9), .out(w11));

//fourth row
mixer m18(.a(w10), .b(w18), .out(w12));
//chamber o18(.in(w10), .out(w12));

chamber o19(.in(w11), .out(w19));

//fifth row

mixer m20(.a(w12), .b(w19), .out(Out));
//chamber o20(.in(w12). .out(Out));


endmodule
