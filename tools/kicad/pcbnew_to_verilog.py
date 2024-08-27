import itertools
import math
from kiutils.schematic import Schematic
import networkx as nx
import pcbnew

class Extractor:
    def __init__(self, board, design):
        self.design = design
        self.board = board
        self.graph = nx.Graph()


    def print_verilog(self):
        print(f"module {design} ();")
        for net, item in self.board.GetNetsByName().items():
            if len(str(net)):
                print(f"\twire \\{net} ;") # Space after the name is important here!
        for foot in self.board.GetFootprints():
            module = foot.GetValue()
            name = foot.GetReference()
            # Space after the name is important here!
            print(f"\t\\{module} \\{name} (")
            # Space after the name is important here!
            print(*[f"\t\t.\\{pad.GetName()} (\\{pad.GetNetname()} )" for pad in foot.Pads() if len(str(pad.GetNetname()))], sep=",\n")
            print("\t);")
        print("endmodule")

if __name__ == "__main__":
    import sys
    brd = pcbnew.LoadBoard(sys.argv[1])
    design = sys.argv[2]
    ext = Extractor(brd, design)
    ext.print_verilog()
