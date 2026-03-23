import opendbpy as odb
db = odb.dbDatabase.create()
odb.read_lef(db, "../../flow/platforms/h.r.3.3/lef/h.r.3.3.tlef")
odb.read_lef(db, "../../flow/platforms/h.r.3.3/lef/h.r.3.3_merged.lef")
odb.read_def(db, "/home/snelgrov/nas/mfda/openmfda/flow/results/ChIP4/met4/4_1_fill.def")
chip = db.getChip()
block = db.getChip().getBlock()
