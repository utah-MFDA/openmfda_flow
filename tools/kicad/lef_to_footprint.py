from kiutils.items.brditems import LayerToken
from kiutils.footprint import Footprint, Pad
from kiutils.items.common import Position, Net, Font, Effects
from kiutils.items.zones import Zone, Hatch, KeepoutSettings, ZonePolygon
from kiutils.items.fpitems import FpText, FpRect
import os
import opendbpy as odb
import re
from uuid import uuid4


class LefToFootprint:
    def __init__(self, db, masters):
        self.db = db
        self.masters = masters
        self.footprints =[]
        self.layers = []
        self.layer_map = {}
        self.default_font = Effects(font=Font(height=10.0, width=10.0))

    def scale(self, i):
        return i / 1000

    def extract_layers(self):
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
                self.layers.append(pcb_layer)
        # print("Layers:", self.layer_map)
        # Stackup is optional, may need to set

    def extract_footprints(self):
        for master_name in self.masters:
            # print(master_name)
            master = self.db.findMaster(master_name)
            footprint = self.extract_footprint(master)
            self.footprints.append(footprint)

    def extract_footprint(self, master):
        mx, my = map(self.scale, master.getOrigin())
        angle = 0 # TODO check
        w, h = map(self.scale, [master.getWidth(), master.getHeight()])
        pads, labels = zip(*self.extract_pads(master))
        zones = [
            self.extract_obstruction(obs)
            for obs in master.getObstructions()
        ]
        name_label = FpText(type="value",
                            text=master.getConstName(),
                            effects=self.default_font,
                            position = Position(X=(mx+w)/2, Y=my+h+self.default_font.font.height),
                            layer="F.SilkS")
        reference =  FpText(type="reference",
                            effects=self.default_font,
                            position = Position(X=(mx+w)/2, Y=my-self.default_font.font.height),
                            layer="F.SilkS")
        outline = FpRect(start=Position(X=mx, Y=my), end=Position(X=(mx+w), Y=(my+h)), layer="F.SilkS")
        footprint = Footprint(libraryNickname="mfda",
                              entryName=master.getConstName(),
                              generator="openmfda",
                              position = Position(X=mx, Y=my, angle=angle),
                              pads=list(pads),
                              graphicItems=list(labels) + [name_label, reference, outline],
                              zones=zones)
        return footprint


    def extract_pads(self, master):
        for mterm in master.getMTerms(): # PIN in lef
            for pin in mterm.getMPins(): # PORT in lef
                for geom in pin.getGeometry():
                    if type(geom) != odb.odb_py.dbBox:
                        print(f"Non-rectangles not handled {type(geom)}")
                        continue

                    bounds = [geom.xMin(), geom.xMax(), geom.yMin(), geom.yMax()]
                    xmin, xmax, ymin, ymax = map(self.scale, bounds)
                    metal = geom.getTechLayer().getName()

                    pad = Pad(position=Position(X=xmin,Y=ymin),
                              number=mterm.getIndex(),
                              shape='rect',
                              size=Position(X=xmax-xmin,Y=ymax-ymin),
                              layers=[self.layer_map[metal]],
                              pinFunction=mterm.getName())
                    label = FpText(type="user",
                                   text=mterm.getName(),
                                   layer="F.SilkS",
                                   effects=self.default_font,
                                   position=Position(X=xmax+0.1,Y=(ymax+ymin)/2))
                    yield pad, label

    def extract_obstruction(self, obs):
        bounds = [obs.xMin(), obs.xMax(), obs.yMin(), obs.yMax()]
        xmin, xmax, ymin, ymax = map(self.scale, bounds)
        metal = obs.getTechLayer().getName()
        layer = self.layer_map[metal]
        keepOut = KeepoutSettings(tracks="not_allowed",
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
        return zone

    def extract(self):
        print("Extracting layers")
        self.extract_layers()
        print("Extracting footprints")
        self.extract_footprints()
        print("Extraction done")

    def dump(self, path, name):
        lib = f"{path}/{name}.pretty"
        os.makedirs(lib, exist_ok=True)
        for footprint in self.footprints:

            ffile = f"{lib}/{footprint.entryName}.kicad_mod"
            footprint.to_file(ffile)

def extract_macro_names(files):
    pattern = r"MACRO (\S+)"
    for fn in files:
        with open(fn) as f:
            for line in f.readlines():
                for match in re.finditer(pattern, line):
                    yield match[1]

if __name__ == "__main__":
    import argparse

    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--tlef', '-t', metavar='<path>', action='append', dest='tlef_files', type=str,
                    help="Path to .tlef file.")
    ap.add_argument('--lef', '-l', metavar='<path>', action='append', dest='lef_files', type=str,
                    help="Path to .lef file.")
    ap.add_argument('--output', '-o', metavar='<path>', type=str, help="Path to output footprint files.", dest="output")
    ap.add_argument('--name', '-n', type=str, help="Library name.", dest="name")
    args = ap.parse_args()
    db = odb.dbDatabase.create()
    masters = extract_macro_names(args.lef_files)
    for tlef_file in args.tlef_files:
        odb.read_lef(db, tlef_file)
    for lef_file in args.lef_files:
        odb.read_lef(db, lef_file)
    t = LefToFootprint(db, masters)
    t.extract()
    t.dump(args.output, args.name)
