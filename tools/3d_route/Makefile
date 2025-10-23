TEE=>
benchmarks/library.v: benchmarks/common.v benchmarks/kinase_activity.v benchmarks/kinase_pads.v
	cat $^ > $@
.PRECIOUS: %.cylinder.scad %.horizontal.scad %.cube.scad
force:

LEVEL ?= INFO
LIMIT ?= 24
COMMON_ARGS ?= --log ${LEVEL} --collapse_hyperedge --timeout 240 --add_buffers --relax ${LIMIT} --minimize

%.json: %.v benchmarks/library.v
	yosys -p "read_verilog library.v; read_verilog $<; hierarchy -top thing; proc; flatten; write_json $@" $(TEE) $@.log

%.cylinder.scad: %.json frontier.py force
	python3 frontier.py $< --orientation cylinder --output $@ --offset 1 ${COMMON_ARGS}

%.horizontal.scad: %.json frontier.py force
	python3 frontier.py $< --orientation horizontal --output $@ --add_buffers ${COMMON_ARGS}

%.cube.scad: %.json frontier.py force
	python3 frontier.py $< --orientation cube --output $@ --offset 1  ${COMMON_ARGS}

%.pdf: %.dot
	dot -Tpdf -o $@ $<
