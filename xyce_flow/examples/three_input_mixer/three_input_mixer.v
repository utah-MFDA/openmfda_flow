// module header
module three_input_mixer (
    in_port1,
    in_port2,
    in_port3,
    out_port
);

// module inputs ports
input in_port1, in_port2, in_port3;
// module output ports
output out_port;

// Channels connecting each component
wire connect01, connect11, connect21;

//components
//component_name   identifier  (.port1(connection), .port2(connection), ....);
serpentine_50px_0    serp1  (.in_fluid(in_port1), .out_fluid(connect01));

serpentine_100px_0   serp2  (.in_fluid(in_port1), .out_fluid(connect11));

diffmix_25px_0       mix0   (.a_fluid(connect01), .b_fluid(connect11), .out_fluid(connect31));


serpentine_200px_0   serp3  (.in_fluid(in_port3), .out_fluid(connect21));

diffmix_25px_0       mix1   (.a_fluid(connect21), .b_fluid(connect31), .out_fluid(connect41));

serpentine_300px_0   serp4  (.in_fluid(connect41), .out_fluid(out_port));

endmodule
