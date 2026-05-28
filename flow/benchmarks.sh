MIN=$1
MAX=$2
for DESIGN in {ChIP4,ChIP10,mRNAiso_4,mnacidpro_3,kinase_activity_2,simple,grad_cells,multi_input,hasty,rotary_cells,logic04,rotary16,net_mux,grid_8};
do
  for LAYER in $(seq ${MIN} ${MAX});
  do
      # echo $DESIGN $LAYER
      nice -n 0 make -EPLATFORM=h.r.3.3_met${LAYER} -EDESIGN=${DESIGN} slice 2>&1 > /dev/null &
      # date +"%T"
  done
done
