TEE=>
INPUTS = \
benchmarks/mnacidpro_1.v \
benchmarks/mnacidpro_2.v \
benchmarks/mnacidpro_3.v \
benchmarks/mnacidpro_4.v \
benchmarks/mRNAiso_1.v \
benchmarks/mRNAiso_2.v \
benchmarks/mRNAiso_3.v \
benchmarks/mRNAiso_4.v \
benchmarks/kinase_1.v \
benchmarks/kinase_2.v \
benchmarks/kinase_3.v \
benchmarks/kinase_4.v
HORIZ_RESULTS = $(INPUTS:%.v=%.horizontal.scad)
CYL_RESULTS = $(INPUTS:%.v=%.cylinder.scad)
CUBE_RESULTS = $(INPUTS:%.v=%.cube.scad)
EVERYTHING_RESULTS = $(INPUTS:%.v=%.everything.scad)
EVERYTHING_CYLINDER_RESULTS = $(INPUTS:%.v=%.everything_cylinder.scad)

all: $(HORIZ_RESULTS) $(CYL_RESULTS) $(CUBE_RESULTS)

everything: $(EVERYTHING_RESULTS) $(EVERYTHING_CYLINDER_RESULTS)

benchmarks/library.v: benchmarks/kinase_activity.v benchmarks/kinase_pads.v benchmarks/mnacidpro.v benchmarks/mRNAiso.v
	cat $^ > $@
.PRECIOUS: %.cylinder.scad %.horizontal.scad %.json %.cube.scad
force:

LEVEL ?= INFO
LIMIT ?= 24
COMMON_ARGS ?= --log ${LEVEL} --timeout 120 --relax ${LIMIT} --backtrack --add_buffer --minimize

benchmarks/picorv32.json: benchmarks/picorv32.v
	yosys -p "read_verilog $<; synth -top picorv32; write_json $@"

%.json: %.v benchmarks/library.v
	yosys -p "read_verilog benchmarks/library.v; read_verilog $<; hierarchy -top thing; proc; flatten; clean -purge; write_json $@" $(TEE) $*.log

%.cylinder.scad: %.json frontier.py
	date --iso-8601=seconds >> $*.cylinder.timer
	python3 frontier.py $< --orientation cylinder --output $@ --offset 1 ${COMMON_ARGS} --cache $*.cylinder.csv --logfile $*.cylinder.log 2>&1 >> $*.cylinder.err.log
	date --iso-8601=seconds >> $*.cylinder.timer

%.horizontal.scad: %.json frontier.py
	date --iso-8601=seconds >> $*.horizontal.timer
	python3 frontier.py $< --orientation horizontal --output $@ ${COMMON_ARGS} --logfile $*.horizontal.log --cache $*.horizontal.csv  2>&1 >> $*.horizontal.err.log
	date --iso-8601=seconds >> $*.horizontal.timer

%.everything.scad: %.json frontier.py
	date --iso-8601=seconds >> $*.everything.timer
	python3 frontier.py $< --orientation horizontal --output $@ --log ${LEVEL} --timeout 3600 --add_buffer --everything --cache $*.everything.csv --logfile $*.everything.log 2>&1 >> $*.everything.err.log
	date --iso-8601=seconds >> $*.everything.timer

%.everything_cylinder.scad: %.json frontier.py
	date --iso-8601=seconds >> $*.everything_cylinder.timer
	python3 frontier.py $< --orientation cylinder --output $@ --log ${LEVEL} --timeout 3600 --add_buffer --everything --logfile $*.everything_cylinder.log --cache $*.everything_cylinder.csv 2>&1 >> $*.everything_cylinder.err.log
	date --iso-8601=seconds >> $*.everything_cylinder.timer

%.cube.scad: %.json frontier.py
	date --iso-8601=seconds >> $*.cube.timer
	python3 frontier.py $< --orientation cube --output $@ --offset 1 ${COMMON_ARGS} --cache $*.cube.csv --logfile $*.cube.log 2>&1 >> $*.cube.err.log
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
