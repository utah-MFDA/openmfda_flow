import opendbpy as odb
import pcbnew
from opendb_helpers import wire_iter, segment_iter

class Translator:
    def __init__(self, db, board):
        self.db = db
        self.board = board
        self.layer_map = {}
        self.net_map = {}
        self._extract_layers()

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

    def place(self):
        block = self.db.getChip().getBlock()
        for comp in block.getInsts():
            master = comp.getMaster()
            x, y = map(self.scale, comp.getLocation())
            angle = 0 # TODO
            mx, my = map(self.scale, master.getOrigin())
            # need to figure out what this does to the offsets, for now assume macro origin always 0,0
            assert mx == 0 and my == 0
            name = comp.getConstName()
            module = master.getConstName()
            for foot in self.board.GetFootprints():
                # O(n**2), fix later
                if foot.GetReference() == name and foot.GetValue() == module:
                    f.SetX(x)
                    f.SetY(y)
                    f.Rotate(angle)
    def route(self):
        block = db.getChip().getBlock()
        for net in block.getNets():
            if net.getWire() is None:
                continue
            for (layer, start, end) in segment_iter(net.getWire(), width):
                width = layer.getWidth()
                sx, sy, sext = map(self.scale, start)
                net = self.board.FindNet(net.getName())
                if type(end) == odb.dbTechVia or type(end) == odb.dbVia:
                    layers = [self.layer_map[end.getBottomLayer().getName()],
                              self.layer_map[end.getTopLayer().getName()]]
                    via = pcbnew.PCB_VIA(self.board)
                    via.SetX(sx)
                    via.SetY(sy)
                    via.SetWidth(width)
                    # todo layers
                    via.SetNetCode(net.GetNetCode())
                    self.board.Add(via)
                else:
                    # If the track has an extension beyond the end point
                    ex, ey, eext = map(self.scale, end)
                    if ex == sx:
                        sy -= sext
                        ey += eext
                    elif ey == sy:
                        sy -= sext
                        ey += eext
                    width =
                    track = pcbnew.PCB_TRACK(self.board)
                    track.SetEndX(eext)
                    track.SetEndY(eeyt)
                    track.SetStartX(sext)
                    track.SetStartY(seyt)
                    track.SetWidth(width)
                    track.SetLayer(layer)
                    track.SetNetCode(net.GetNetCode())

                    self.board.Add(track)

db = odb.dbDatabase.create()
design = "/home/snelgrov/nas/mfda/openmfda/flow/results/ChIP4/base/4_final.def"
tlef = "/home/snelgrov/nas/mfda/openmfda/flow/platforms/h.r.3.3/lef/h.r.3.3.tlef"
lef = "/home/snelgrov/nas/mfda/openmfda/flow/platforms/h.r.3.3/lef/h.r.3.3_merged.lef"
odb.read_lef(db, tlef)
odb.read_lef(db, lef)
odb.read_def(db, design)

t = Translator(db, pcbnew.GetBoard())
# Todo clear all traces
t.place()
t.route()
pcbnew.Refresh()
