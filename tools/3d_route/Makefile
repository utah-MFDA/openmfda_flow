TEE=>
benchmarks/library.v: benchmarks/common.v benchmarks/kinase_activity.v benchmarks/kinase_pads.v
	cat $^ > $@

force:

%.json: %.v benchmarks/library.v
	yosys -p "read_verilog library.v; read_verilog $<; hierarchy -top thing; proc; flatten; write_json $@" $(TEE) $@.log

%.cylinder.scad: %.json frontier.py force
	python3 frontier.py $< --orientation cylinder --output $@ --offset 1

%.horizontal.scad: %.json frontier.py force
	python3 frontier.py $< --orientation horizontal --output $@ --add_buffers

%.cube.scad: %.json frontier.py force
	python3 frontier.py $< --orientation cube --output $@ --offset 1

%.pdf: %.dot
	dot -Tpdf -o $@ $<
