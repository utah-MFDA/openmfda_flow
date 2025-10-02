TEE=>
library.v: common.v kinase_activity.v kinase_pads.v
	cat $^ > $@

force:

%.json: %.v library.v
	yosys -p "read_verilog library.v; read_verilog $<; hierarchy -top thing; proc; flatten; write_json $@" $(TEE) $@.log

%.cylinder.scad: %.json frontier.py force
	python3 frontier.py $< cylinder $@ 3

%.horizontal.scad: %.json frontier.py force
	python3 frontier.py $< horizontal $@ 0

%.cube.scad: %.json frontier.py force
	python3 frontier.py $< cube $@ 0

%.pdf: %.dot
	dot -Tpdf -o $@ $<
