import itertools
import math
from kiutils.schematic import Schematic
import pcbnew

class PcbnewToVerilog:
    def __init__(self, board, design):
        self.design = design
        self.board = board

    def print_verilog(self, outfile):
        print(f"module {self.design} ();", file=outfile)
        for net, item in self.board.GetNetsByName().items():
            if len(str(net)):
                print(f"\twire \\{net} ;", file=outfile) # Space after the name is important here!
        for foot in self.board.GetFootprints():
            module = foot.GetFieldText("Footprint").replace("h.r.3.3:", "")
            name = foot.GetReference()
            # Space after the name is important here!
            print(f"\t\\{module} \\{name} (", file=outfile)
            # Space after the name is important here!
            print(*[f"\t\t.\\{pad.GetName()} (\\{pad.GetNetname()} )" for pad in foot.Pads() if len(str(pad.GetNetname()))], sep=",\n", file=outfile)
            print("\t);", file=outfile)
        print("endmodule", file=outfile)

if __name__ == "__main__":
    import sys
    brd = pcbnew.LoadBoard(sys.argv[1])
    design = sys.argv[2]
    ext = PcbnewToVerilog(brd, design)
    ext.print_verilog(sys.stdout)
