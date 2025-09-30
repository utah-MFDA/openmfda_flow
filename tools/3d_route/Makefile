TEE=>
library.v: common.v kinase_activity.v kinase_pads_parallel.v
	cat $^ > $@

force:

%.json: %.v library.v
	yosys -p "read_verilog library.v; read_verilog $<; hierarchy -top thing; proc; flatten; write_json $@" $(TEE) $@.log

%.cylinder.scad: %.json frontier.py force
	python3 frontier.py $< cylinder $@

%.horizontal.scad: %.json frontier.py force
	python3 frontier.py $< horizontal $@

%.cube.scad: %.json frontier.py force
	python3 frontier.py $< cube $@

%.pdf: %.dot
	dot -Tpdf -o $@ $<
