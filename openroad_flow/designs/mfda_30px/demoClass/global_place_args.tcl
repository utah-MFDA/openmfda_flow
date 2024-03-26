
# does not work
set skip_initial_placement 0

# does not work
set incremental 0

# Set bin grid's counts. Default: Defined by internal algorithm. [64,128,256,512,..., int]
set bin_grid_count 24

# density is set differently
set density 0.88

# Set initial density penalty. Default: 8e-5 [1e-6 - 1e6, float]
set init_density_penalty 8e-5

# Set initial wirelength coefficient. Default: 0.25 [unlimited, float]
set init_wirelength_coef 0.25

# Set pcof_min(µ_k Lower Bound). Default: 0.95 [0.95-1.05, float]
set min_phi_coef 0.95

# Set pcof_max(µ_k Upper Bound). Default: 1.05 [1.00-1.20, float]
set max_phi_coef 1.04

# Set target overflow for termination condition. Default: 0.1 [0-1, float]
set overflow 0.1

# Set maximum iterations in initial place. Default: 20 [0-, int]
set initial_place_max_iter 20

# Set net escape condition in initial place when 'fanout >= initial_place_max_fanout'. Default: 200 [1-, int]
set initial_place_max_fanout 20

set global_place_args {}

if {$skip_initial_placement} {
	set global_place_args "$global_place_args -skip_initial_place"
}

if {$incremental} {
	set global_place_args "$global_place_args -incremental"
}




set global_place_args "$global_place_args /
    -bin_grid_count $bin_grid_count /
    -init_density_penalty $init_density_penalty /
    -init_wirelength_coef $init_wirelength_coef /
    -min_phi_coef $min_phi_coef /
    -max_phi_coef $max_phi_coef /
    -overflow $overflow /
    -initial_place_max_iter $initial_place_max_iter /
    -initial_place_max_fanout $initial_place_max_fanout"

puts $global_place_args
 
#set ::env(GLOBAL_PLACEMENT_ARGS)

