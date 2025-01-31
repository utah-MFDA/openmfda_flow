import opendbpy as odb
import pcbnew
from .opendb_helpers import wire_iter, segment_iter

class DefToPcbnew:
    def __init__(self, db, board):
        self.db = db
        self.board = board
        self.layer_map = {}
        self.net_map = {}
        self._extract_layers()

    def scale(self, i):
        # Kicad stores sizes in nanometers, just fixed scale for integer math.
        # scaling to 0.1mm per pixel
        return i * 100

    # 32mm page offset.
    def convert_x(self, x):
        return x + 32000000

    def convert_y(self, y):
        return y + 32000000

    def _extract_layers(self):
        layers = self.db.getTech().getLayers()
        num_layers = self.db.getTech().getRoutingLayerCount()
        i = -1
        for layer in self.db.getTech().getLayers():
            if layer.getType() == "ROUTING":
                i += 1
                if i == 0:
                    name = (i, "B.Cu")
                elif i == (num_layers - 1):
                    name = (i, "F.Cu")
                else:
                    name = (i, f"In{num_layers - i - 1}.Cu")
                self.layer_map[layer.getName()] = name
        # self.board.SetCopperLayerCount(i+1)
        # GetLayerName(aLayer)
        # GetLayerID(self, aLayerName):
        # SetLayerName(self, aLayer, aLayerName)
        # GetStandardLayerName(aLayerId):
        # SetLayerDescr(self, aIndex, aLayer)
        # GetLayerType(self, aLayer)
        # SetLayerType(self, aLayer, aLayerType):
        # Stackup is optional, may need to set

    def convert_location(self, comp, master):
        # DEF standard:
        # "Components are always placed such that the lower left
        # corner of the cell is the origin (0,0) after any orientation.
        # When a component flips about the y axis, it flips about
        # the component center.
        # When a component rotates, the lower left corner of the
        # bounding box of the component’s sites remains at the
        # same placement location."
        # Rotation is counterclockwise positive (regular cartesian)
        # Flip happens before rotation happens


        # KiCad behavior:
        # the origin of the component is always the same corner.
        # The position of the component is always the origin.
        # Flipped flag is vertical flip across the x-axis at origin.
        # Flip happens after rotation.

        ori = comp.getOrient()
        x, y = map(self.scale, comp.getLocation())
        x = self.convert_x(x)
        y = self.convert_y(y)
        h = self.scale(master.getHeight())
        w = self.scale(master.getWidth())
        mx, my = map(self.scale, master.getOrigin())
        # need to figure out what this does to the offsets, for now assume macro origin always 0,0
        assert mx == 0 and my == 0

        if ori == "R0" or ori == "N":
            return (x, y, 0.0, False)
        elif ori == "R90" or ori == "W":
            return (x + w, y, 90.0, False)
        elif ori == "R180" or ori == "S":
            return (x + w, y + h, 180.0, False)
        elif ori == "R270" or ori == "E":
            return (x, y + w, 180.0, False)
        elif ori == "MY" or ori == "FN":
            return (x + w, y, 180.0, True)
        elif ori == "MX" or ori == "FS":
            return (x, y + h, 0.0, True)
        elif ori == "MX90" or ori == "FW" or ori == "MXR90":
            return (x, y, 90.0, True)
        elif ori == "MY90" or ori == "FE" or ori == "MYR90":
            return (x + h, y + w, 90.0, True)
        else:
            raise ValueError(f"Unexpected orientation '{ori}', should be one of R0, R180, R90, R270, MY, MX, MX90, MXR90, MY90, or MYR90. Or N,S,E,W,FN,FS,FE, or FW")

    def place(self):
        block = self.db.getChip().getBlock()
        for comp in block.getInsts():
            master = comp.getMaster()
            x, y, angle, flip = self.convert_location(comp, master)
            name = comp.getConstName()
            module = master.getConstName()
            print("placing", name, module, x/1000000, y/1000000, comp.getOrient(), angle, flip)
            for foot in self.board.GetFootprints():
                # O(n**2), fix later
                if foot.GetReference() == name:
                    # reset everything, flipping is stateful.
                    if foot.IsFlipped():
                        foot.Flip(foot.GetPosition(), False)
                    foot.SetOrientationDegrees(0)

                    if flip:
                        foot.Flip(foot.GetPosition(), False)
                    foot.SetOrientationDegrees(angle)
                    foot.SetX(x)
                    foot.SetY(y)
                    foot.SetIsPlaced(True)
                    foot.SetNeedsPlaced(False)
            pcbnew.Refresh()

    def route(self):
        block = self.db.getChip().getBlock()
        nets = block.getNets()
        for net in nets:
            if net.getWire() is None:
                continue
            for (layer, start, end) in segment_iter(net.getWire()):
                width = self.scale(layer.getWidth())
                sx, sy, sext = map(self.scale, start)
                knet = self.board.FindNet(net.getName())
                if type(end) == odb.dbTechVia or type(end) == odb.dbVia:
                    start_id, start_name = self.layer_map[end.getBottomLayer().getName()]
                    end_id, end_name = self.layer_map[end.getTopLayer().getName()]
                    layers = [start_id, end_id]
                    print("routing net", net.getName(),
                          "via at ", sx/1000000, sy/1000000,
                          "width", width/1000000,
                          "layers", start_name, end_name)
                    via = pcbnew.PCB_VIA(self.board)
                    via.SetX(int(self.convert_x(sx)))
                    via.SetY(int(self.convert_y(sy)))
                    via.SetWidth(width)
                    # todo layers
                    # Todo need to set as blind via
                    via.SetNetCode(knet.GetNetCode())
                    self.board.Add(via)
                else:
                    # If the track has an extension beyond the end point
                    ex, ey, eext = map(self.scale, end)
                    # Kicad does add the extension, point specified is center of trace.
                    # if ey == sy:
                    #     sy -= sext
                    #     ey += eext
                    # elif ex == sx:
                    #     sy -= sext
                    #     ey += eext
                    track = pcbnew.PCB_TRACK(self.board)
                    layer_id, layer_name = self.layer_map[layer.getName()]
                    print("routing net", net.getName(),
                          "trace from", sx/1000000, sy/1000000,
                          "to", ex/1000000, ey/1000000,
                          "width", width/1000000)
                    track.SetEndX(int(self.convert_x(ex)))
                    track.SetEndY(int(self.convert_y(ey)))
                    track.SetX(int(self.convert_x(sx)))
                    track.SetY(int(self.convert_y(sy)))
                    track.SetWidth(width)
                    track.SetLayer(layer_id)
                    track.SetNetCode(knet.GetNetCode())

                    self.board.Add(track)
