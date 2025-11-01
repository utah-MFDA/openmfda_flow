import opendbpy as odb

def load_db(def_file, tlef_files, lef_files):
    db = odb.dbDatabase.create()
    for tlef_file in tlef_files:
        odb.read_lef(db, tlef_file)
    for lef_file in lef_files:
        odb.read_lef(db, lef_file)
    odb.read_def(db, def_file)
    return db

def wire_iter(wire):
    dec = odb.dbWireDecoder()
    dec.begin(wire)
    opcode = dec.next()
    while opcode != odb.dbWireDecoder.END_DECODE:
        layer = dec.getLayer()
        if opcode == odb.dbWireDecoder.BTERM:
            term = dec.getBTerm()
            yield (opcode, layer, term)
        elif opcode == odb.dbWireDecoder.ITERM:
            term = dec.getITerm()
            yield (opcode, layer, term)
        elif opcode == odb.dbWireDecoder.JUNCTION:
            wire_type = dec.getWireType()
            jid = dec.getJunctionId()
            jval = dec.getJunctionValue()
            yield (opcode, layer, (wire_type, jid, jval))
        elif opcode == odb.dbWireDecoder.PATH or opcode == odb.dbWireDecoder.VWIRE or opcode == odb.dbWireDecoder.SHORT:
            wire_type = dec.getWireType()
            yield (opcode, layer, wire_type)
        elif opcode == odb.dbWireDecoder.POINT_EXT:
            point = dec.getPoint_ext()
            yield (opcode, layer, point)
        elif opcode == odb.dbWireDecoder.POINT:
            point = dec.getPoint()
            yield (opcode, layer, point)
        elif opcode == odb.dbWireDecoder.RECT:
            rect = dec.getRect()
            yield (opcode, layer, rect)
        elif opcode == odb.dbWireDecoder.RULE:
            rule = dec.getRule()
            yield (opcode, layer, rule)
        elif opcode == odb.dbWireDecoder.TECH_VIA:
            via = dec.getTechVia()
            yield (opcode, layer, via)
        elif opcode == odb.dbWireDecoder.VIA:
            via = dec.getVia()
            yield (opcode, layer, via)
        else:
            raise ValueError()
        opcode = dec.next()

def segment_iter(wire):
    last = None
    for (opcode, layer, vals) in wire_iter(wire):
        if opcode == odb.dbWireDecoder.PATH or opcode == odb.dbWireDecoder.VWIRE or opcode == odb.dbWireDecoder.SHORT:
            last = None
        elif opcode == odb.dbWireDecoder.POINT_EXT:
            point = vals
            if last is not None:
                yield (layer, last, point)
            last = point
        elif opcode == odb.dbWireDecoder.POINT:
            (x,y) = vals
            width = layer.getWidth()
            # By default, no extension means half the width.
            ext = int(width / 2)
            point = (x, y, ext)
            if last is not None:
                yield (layer, last, point)
            last = point
        elif opcode == odb.dbWireDecoder.TECH_VIA:
            via = vals
            if last is not None:
                yield (layer, last, via)
            last = via
        elif opcode == odb.dbWireDecoder.VIA:
            via = vals
            if last is not None:
                yield (layer, last, via)
            last = via # TODO squash multilayer vias
        else:
            raise NotImplemented
