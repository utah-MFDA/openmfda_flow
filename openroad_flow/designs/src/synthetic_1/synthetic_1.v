module synthetic_1(
input Source,
output Out
);
wire w1,w2,w3,w4,w5,w6,w7,w8,w9;
chamber Mix_o1(.in(Source), .out(w1));
chamber Filter_o4(.in(w1), .out(w2));
chamber Heat_o6(.in(w2), .out(w3));

chamber Mix_o2(.in(Source), .out(w4));
chamber Detect_o5(.in(w4), .out(w5));

chamber Heat_o3(.in(Source), .out(w5));

mixer m7(.a(w5), .b(w8), .out(w6));
chamber Filter_o8(.in(w6), .out(w9));

mixer m9(.a(w9), .b(w3), .out(w7));

chamber Detect_o10(.in(w7), .out(Out));

endmodule
