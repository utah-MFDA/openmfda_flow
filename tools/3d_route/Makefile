TEE=>
library.v: common.v kinase_activity.v kinase_pads_parallel.v
	cat $^ > $@

%.json: %.v library.v
	yosys -p "read_verilog library.v; read_verilog $<; hierarchy -top thing; proc; flatten; write_json $@" $(TEE) $@.log
