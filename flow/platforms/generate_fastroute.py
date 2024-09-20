import sys
maxmet = int(sys.argv[1])
for i in range(maxmet, 0, -1):
    print(f"set_global_routing_layer_adjustment met{i} 0")

print("set_routing_layers -signal $::env(MIN_ROUTING_LAYER)-$::env(MAX_ROUTING_LAYER)")
