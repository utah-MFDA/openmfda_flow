import sys

count = int(sys.argv[1])

print(f"""module kinase_activity_{count}_device (""")
print(f"""            input [12:0] ctrl_a,
            input [3:0] ctrl_s,
            input [2:0] pump_a,
            input [1:0] pump_b,
            output [2:0] flow_in [{count-1}:0],
            output [3:0] flow_out [{count-1}:0],
            output [21:0] flush [{count-1}:0],""")

for i in range(0, count):
    print(f"""
  kinase_activity device_{i}(flow_in[{i}], flow_out[{i}], ctrl_a, ctrl_s, pump_a, pump_b, flush[{i}]);""")
print("endmodule")
