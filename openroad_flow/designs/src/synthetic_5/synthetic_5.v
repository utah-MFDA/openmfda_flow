module synthetic_5(
input Source,
output Out
);

wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43,w44,w45,w46,w47,w48;

//first row and a half
chamber o1(.in(Source), .out(w1));
chamber o2(.in(Source), .out(w2));
chamber o3(.in(Source), .out(w35));
chamber o4(.in(Source), .out(w3));
chamber o5(.in(Source), .out(w4));
chamber o6(.in(Source), .out(w36));
chamber o7(.in(Source), .out(w5));
chamber o8(.in(Source), .out(w6));
chamber o9(.in(Source), .out(w37));
chamber o10(.in(Source), .out(w7));
chamber o11(.in(Source), .out(w38));
chamber o12(.in(Source), .out(w8));
chamber o13(.in(Source), .out(w39));
chamber o14(.in(Source), .out(w9));
chamber o15(.in(Source), .out(w10));
chamber o16(.in(Source), .out(w11));
chamber o17(.in(Source), .out(w40));


//Second row
chamber o18(.in(w1), .out(w12));
mixer m19(.a(w2), .b(w35), .out(w41));
chamber o20(.in(w3), .out(w13));
mixer m21(.a(w4), .b(w36), .out(w42));
chamber o22(.in(w5), .out(w14));
mixer m23(.a(w6), .b(w37), .out(w15));
mixer m24(.a(w7), .b(w38), .out(w16));
mixer m25(.a(w8), .b(w39), .out(w17));
chamber o26(.in(w9), .out(w18));
chamber o27(.in(w10), .out(w19));
mixer m28(.a(w11), .b(w40), .out(w20));


//Third row
mixer m29(.a(w12), .b(w41), .out(w21));
mixer m30(.a(w13), .b(w42), .out(w43));
chamber o31(.in(w14), .out(w22));
chamber o32(.in(w15), .out(w44));
chamber o33(.in(w16), .out(w23));
chamber o34(.in(w17), .out(w45));
chamber o35(.in(w18), .out(w24));
chamber o36(.in(w19), .out(w25));
chamber o37(.in(w20), .out(w46));


//Fourth row
mixer m38(.a(w21), .b(w43), .out(w26));
mixer m39(.a(w22), .b(w44), .out(w27));
mixer m40(.a(w23), .b(w45), .out(w28));
chamber o41(.in(w24), .out(w29));
mixer m42(.a(w25), .b(w46), .out(w29));



//Fifth row
chamber o43(.in(w26), .out(w47));
chamber o44(.in(w27), .out(w30));
mixer m45(.a(w29), .b(w29), .out(w31));

//Sixth row
mixer m46(.a(w30), .b(w47), .out(w32));
mixer m47(.a(w28), .b(w31), .out(w33));

//Seventh row
chamber o48(.in(w33), .out(w48));

//Eighth row
mixer m49(.a(w48), .b(w32), .out(w34));

//Ninth row
chamber o50(.in(w34), .out(Out));


endmodule
