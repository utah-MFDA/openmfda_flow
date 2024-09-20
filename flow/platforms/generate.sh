met=$1
metr=$(($met-1))
mkdir -p h.r.3.3_met${met}/lib
mkdir -p h.r.3.3_met${met}/scad
mkdir -p h.r.3.3_met${met}/lef
mkdir -p h.r.3.3_met${met}/gds
cp h.r.3.3/lib/common.v h.r.3.3_met${met}/lib/
cp h.r.3.3/lef/h.r.3.3_merged.lef h.r.3.3_met${met}/lef/
cp h.r.3.3/lib/h.r.3.3.lib h.r.3.3_met${met}/lib/
cp h.r.3.3/gds/h.r.3.3.gds h.r.3.3_met${met}/gds/
sed "s/MAX_ROUTING_LAYER = met8/MAX_ROUTING_LAYER = met${metr}/" h.r.3.3/config.mk > h.r.3.3_met${met}/config.mk
python3 generate_tlef.py $met > h.r.3.3_met${met}/lef/h.r.3.3.tlef
python3 generate_fastroute.py $met > h.r.3.3_met${met}/fastroute.tcl
python3 generate_make_tracks.py $met > h.r.3.3_met${met}/make_tracks.tcl

cp h.r.3.3/scad/*.scad h.r.3.3_met${met}/scad/
