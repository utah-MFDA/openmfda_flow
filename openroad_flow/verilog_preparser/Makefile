

PCELL_DIR=./pcells/serpentine
PCELL_MERGE_OUT=base_merge_pcell.lef
PCELL_MERGE_CP_LOC=../platforms/$(PLATFORM)/lef/$(PLATFORM)_pcell_pre.lef


PLATFORM=mfda_30px

build_merge_pcell_lef:
	rm -f $(PCELL_MERGE_OUT)
	touch $(PCELL_MERGE_OUT)
	find $(PCELL_DIR) -type f -name '*.lef' -exec cut -b 1- {} + >> $(PCELL_MERGE_OUT)

cp_merge_lef:
	cp $(PCELL_MERGE_OUT) $(PCELL_MERGE_CP_LOC)
