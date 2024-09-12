import opendbpy as odb
from kiutils.items.brditems import LayerToken, Via, Segment
from kiutils.footprint import Footprint
from kiutils.board import Board
from kiutils.items.common import Position, Net
from kiutils.items.zones import Zone, Hatch, KeepoutSettings
from kiutils.footprint import Pad
from uuid import uuid4
from opendb_helpers import wire_iter, segment_iter

class Translator:
    def __init__(self, db):
        self.db = db
        self.board = Board(generator="openmfda", version=20221018)
        self.layer_map = {}
        self.net_map = {}

    def scale(self, i):
        return i / 10000

    def _extract_layers(self):
        layers = self.db.getTech().getLayers()
        num_layers = self.db.getTech().getRoutingLayerCount()
        i = -1
        for layer in self.db.getTech().getLayers():
            if layer.getType() == "ROUTING":
                i += 1
                if i == 0:
                    name = "B.Cu"
                elif i == (num_layers - 1):
                    name = "F.Cu"
                else:
                    name = f"In{num_layers - i - 1}.Cu"
                self.layer_map[layer.getName()] = name
                pcb_layer = LayerToken(ordinal=i, name =name)
                self.board.layers.append(pcb_layer)
        print(self.layer_map)
        # Stackup is optional, may need to set
    def _extract_footprints(self):
        block = self.db.getChip().getBlock()
        for comp in block.getInsts():
            # orient = self.mapOrient[comp.getOrient()] # TODO
            master = comp.getMaster()
            x, y = map(self.scale, comp.getLocation())
            angle = 0 # TODO
            mx, my = map(self.scale, master.getOrigin())
            # need to figure out what this does to the offsets, for now assume macro origin always 0,0
            assert mx == 0 and my == 0
            w, h = map(self.scale, [master.getWidth(), master.getHeight()])
            pads = []
            for term in comp.getITerms():
                mterm = term.getMTerm()
                net = term.getNet().getName()
                for port in mterm.getMPins(): # Not sure if to iterate through the mterm geometry or the iterm
                    for geom in port.getGeometry():
                        bounds = [geom.xMin(), geom.xMax(), geom.yMin(), geom.yMax()]
                        xmin, xmax, ymin, ymax = map(self.scale, bounds)
                        metal = geom.getTechLayer().getName()

                        pad = Pad(position=Position(X=xmin,Y=ymin),
                                  net=self.net_map[net],
                                  number=mterm.getIndex(),
                                  shape='rect',
                                  size=Position(X=xmax-xmin,Y=ymax-ymin),
                                  layers=[self.layer_map[metal]],
                                  pinFunction=mterm.getName())
                        pads.append(pad)
            zones = []
            for obs in master.getObstructions():
                bounds = [obs.xMin(), obs.xMax(), obs.yMin(), obs.yMax()]
                xmin, xmax, ymin, ymax = map(self.scale, bounds)
                metal = obs.getTechLayer().getName()
                layer = self.layer_map[metal]
                keepout = KeepoutSettings(tracks="not_allowed",
                                          vias="not_allowed",
                                          pads="not_allowed",
                                          copperpour="not_allowed",
                                          footprints="not_allowed")
                polygon = ZonePolygon([Position(xmin, ymin),
                                       Position(xmin, ymax),
                                       Position(xmax, ymax),
                                       Position(xmax, ymin)])
                zone = Zone(layers=[layer],
                            hatch=Hatch(style="edge"),
                            keepoutSettings=keepOut,
                            polygons=[polygon])
                zones.append(zone)

            footprint = Footprint(libraryNickname="mfda",
                                  entryName=master.getConstName(),
                                  generator="openmfda",
                                  position = Position(X=x, Y=y, angle=angle),
                                  pads=pads,
                                  zones=zones)
            # TODO add silkscreen labels
            self.board.footprints.append(footprint)

    def _extract_nets(self):
        block = db.getChip().getBlock()
        nets = block.getNets()
        self.board.nets = [Net(i, net.getName()) for i, net in enumerate(nets)]
        self.net_map = {net.name: net for net in self.board.nets}

    def _extract_traces(self):
        block = db.getChip().getBlock()
        for net in block.getNets():
            net_number = self.net_map[net.getName()].number
            width = 0 # TODO
            if net.getWire() is None:
                continue
            for (layer, start, end) in segment_iter(net.getWire(), width):
                sx, sy, sext = map(self.scale, start)
                if type(end) == odb.dbTechVia or type(end) == odb.dbVia:
                    layers = [self.layer_map[end.getBottomLayer().getName()],
                              self.layer_map[end.getTopLayer().getName()]]
                    via = Via(net=net_number,
                              layers=layers,
                              type="blind",
                              position=Position(X=sx,Y=sy),
                              size=0.1 #TODO
                    )
                    self.board.traceItems.append(via)
                else:
                    ex, ey, eext = map(self.scale, end)
                    if ex == sx:
                        sy -= sext
                        ey += eext
                    elif ey == sy:
                        sy -= sext
                        ey += eext
                    # TODO handle width
                    trace = Segment(start=Position(X=sx,Y=sy),
                                    end=Position(X=ex,Y=ey),
                                    layer=self.layer_map[layer.getName()],
                                    net=net_number,
                                    tstamp=str(uuid4()))
                    self.board.traceItems.append(trace)

    def extract(self):
        print("Extracting nets")
        self._extract_nets()
        print("Extracting layers")
        self._extract_layers()
        print("Extracting footprints")
        self._extract_footprints()
        print("Extracting traces")
        self._extract_traces()
        print("Extraction done")

    def dump(self, path):
        self.board.to_file(path)

# if __name__ == "__main__":
    # import argparse

    # ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    # ap.add_argument('--tlef_file', metavar='<path>', dest='tlef_file', type=str,
    #                 help="Path to the .tlef file from OpenROAD flow.")
    # ap.add_argument('--def_file', metavar='<path>', dest='def_file', type=str,
    #                 help="Path to the .def file from OpenROAD flow.")
    # ap.add_argument('--lef_file', metavar='<path>', dest='lef_file', type=str,
    #                 help="Path to the .lef file from OpenROAD flow.")
    # args = ap.parse_args()
    # db = odb.dbDatabase.create()
    # odb.read_lef(db, args.tlef_file)
    # odb.read_lef(db, args.lef_file)
    # odb.read_def(db, args.def_file)

    # Translator(db).dump("test.kicad_pcb")
db = odb.dbDatabase.create()
design = "/home/snelgrov/nas/mfda/openmfda/flow/results/ChIP4/base/4_final.def"
tlef = "/home/snelgrov/nas/mfda/openmfda/flow/platforms/h.r.3.3/lef/h.r.3.3.tlef"
lef = "/home/snelgrov/nas/mfda/openmfda/flow/platforms/h.r.3.3/lef/h.r.3.3_merged.lef"
odb.read_lef(db, tlef)
odb.read_lef(db, lef)
odb.read_def(db, design)

t = Translator(db)
t.extract()
t.dump("test.kicad_pcb")
