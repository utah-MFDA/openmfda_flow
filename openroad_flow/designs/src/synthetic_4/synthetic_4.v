module synthetic_4(
input Source,
output Out
);

wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,w33,w34,w35,w36,w37,w38,w39;
//first row and a half
chamber o1(.in(Source), .out(w1));
chamber o2(.in(Source), .out(w28));
chamber o3(.in(Source), .out(w2));
chamber o4(.in(Source), .out(w3));
chamber o5(.in(Source), .out(w29));
chamber o6(.in(Source), .out(w4));
chamber o7(.in(Source), .out(w5));
chamber o8(.in(Source), .out(w30));
chamber o9(.in(Source), .out(w6));
chamber o10(.in(Source), .out(w7));
chamber o11(.in(Source), .out(w8));
chamber o12(.in(Source), .out(w9));
chamber o13(.in(Source), .out(w10));
chamber o14(.in(Source), .out(w11));

//Second row
mixer m15(.a(w1), .b(w28), .out(w12));
chamber o16(.in(w2), .out(w31));
mixer m17(.a(w3), .b(w29), .out(w13));
chamber o18(.in(w4), .out(w14));
mixer m19(.a(w5), .b(w30), .out(w32));
chamber o20(.in(w6), .out(w15));
chamber o21(.in(w7), .out(w16));
chamber o22(.in(w8), .out(w17));
chamber o23(.in(w9), .out(w33));
mixer m24(.a(w10), .b(w11), .out(w18));

//Third row
mixer m25(.a(w12), .b(w31), .out(w19));
chamber o26(.in(w13), .out(w34));
mixer m27(.a(w14), .b(w32), .out(w20));
chamber o28(.in(w15), .out(w35));
mixer m29(.a(Source), .b(w16), .out(w21));
mixer m30(.a(w17), .b(w33), .out(w22));
chamber o31(.in(w18), .out(w36));



//Fourth row
mixer m32(.a(w19), .b(w34), .out(w23));
mixer m33(.a(w20), .b(w35), .out(w37));
chamber o34(.in(w21), .out(w24));
mixer m35(.a(w22), .b(w36), .out(w38));


//Fifth row
mixer m36(.a(w23), .b(w37), .out(w25));
mixer m37(.a(w24), .b(w38), .out(w26));

//Sixth row
chamber o38(.in(w25), .out(w27));
chamber o39(.in(w26), .out(w39));

//Seventh row
mixer m40(.a(w27), .b(w39), .out(Out));

endmodule
