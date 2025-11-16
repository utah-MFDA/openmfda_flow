TEE=>
INPUTS = \
benchmarks/mnacidpro_pads_1.v \
benchmarks/mnacidpro_pads_2.v \
benchmarks/mnacidpro_pads_3.v \
benchmarks/mnacidpro_pads_4.v
# benchmarks/mRNAiso_pads_1.v \
# benchmarks/mRNAiso_pads_2.v \
# benchmarks/mRNAiso_pads_3.v \
# benchmarks/mRNAiso_pads_4.v \
# benchmarks/kinase_1.v \
# benchmarks/kinase_2.v \
# benchmarks/kinase_3.v \
# benchmarks/kinase_4.v
HORIZ_RESULTS = $(INPUTS:%.v=%.horizontal.scad)
CYL_RESULTS = $(INPUTS:%.v=%.cylinder.scad)
CUBE_RESULTS = $(INPUTS:%.v=%.cube.scad)
EVERYTHING_RESULTS = $(INPUTS:%.v=%.everything.scad)
EVERYTHING_CYLINDER_RESULTS = $(INPUTS:%.v=%.everything_cylinder.scad)

all: $(HORIZ_RESULTS) $(CYL_RESULTS) $(EVERYTHING_RESULTS)

benchmarks/library.v: benchmarks/kinase_activity.v benchmarks/kinase_pads.v benchmarks/mnacidpro.v benchmarks/mRNAiso.v benchmarks/mnacidpro_pads.v benchmarks/mRNAiso_pads.v benchmarks/ChIP.v benchmarks/ChIP_pads.v
	cat $^ > $@
.PRECIOUS: %.cylinder.scad %.horizontal.scad %.json %.cube.scad
force:

LEVEL ?= INFO
LIMIT ?= 24
COMMON_ARGS ?= --log ${LEVEL} --timeout 240 --relax ${LIMIT}
PYTHON3 = python3
# PYTHON3 ?= retry -attempts 100 -max-time 600m python3

benchmarks/picorv32.json: benchmarks/picorv32.v
	yosys -p "read_verilog $<; synth -top picorv32; write_json $@"

%.json: %.v benchmarks/library.v
	yosys -p "read_verilog benchmarks/library.v; read_verilog $<; hierarchy -top thing; proc; flatten; clean -purge; write_json $@" $(TEE) $*.log

%.cylinder.scad: %.json frontier.py
	date --iso-8601=seconds >> $*.cylinder.timer
	${PYTHON3} frontier.py $< --orientation cylinder --output $@ --offset 2  ${COMMON_ARGS} --cache $*.cylinder.csv --add_buffers --logfile $*.cylinder.log --backtrack 2>&1 >> $*.cylinder.err.log
	date --iso-8601=seconds >> $*.cylinder.timer

%.horizontal.scad: %.json frontier.py
	date --iso-8601=seconds >> $*.horizontal.timer
	${PYTHON3} frontier.py $< --orientation horizontal --output $@ ${COMMON_ARGS} --logfile $*.horizontal.log --cache $*.horizontal.csv  --add_buffers --backtrack --minimize 2>&1 >> $*.horizontal.err.log
	date --iso-8601=seconds >> $*.horizontal.timer

%.everything.scad: %.json frontier.py
	date --iso-8601=seconds >> $*.everything.timer
	${PYTHON3} frontier.py $< --orientation horizontal --output $@ --log ${LEVEL} --timeout 86400 --add_buffer --everything --cache $*.everything.csv --logfile $*.everything.log 2>&1 >> $*.everything.err.log
	date --iso-8601=seconds >> $*.everything.timer

%.everything_cylinder.scad: %.json frontier.py
	date --iso-8601=seconds >> $*.everything_cylinder.timer
	${PYTHON3} frontier.py $< --orientation cylinder --output $@ --log ${LEVEL} --timeout 3600 --add_buffer --everything --logfile $*.everything_cylinder.log --cache $*.everything_cylinder.csv 2>&1 >> $*.everything_cylinder.err.log
	date --iso-8601=seconds >> $*.everything_cylinder.timer

%.cube.scad: %.json frontier.py
	date --iso-8601=seconds >> $*.cube.timer
	${PYTHON3} frontier.py $< --orientation cube --output $@ --offset 1 ${COMMON_ARGS} --cache $*.cube.csv --logfile $*.cube.log 2>&1 >> $*.cube.err.log
	date --iso-8601=seconds >> $*.cube.timer

%.pdf: %.dot
	dot -Tpdf -o $@ $<
clean:
	rm -f benchmarks/*.timer
	rm -f benchmarks/mnacidpro*.json
	rm -f benchmarks/mnacidpro*.csv
	rm -f benchmarks/mnacidpro*.scad
	rm -f benchmarks/kinase*.json
	rm -f benchmarks/kinase*.csv
	rm -f benchmarks/kinase*.scad
	rm -f benchmarks/mRNAiso*.json
	rm -f benchmarks/mRNAiso*.csv
	rm -f benchmarks/mRNAiso*.scad
