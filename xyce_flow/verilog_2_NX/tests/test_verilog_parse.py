

def test_build_lists():
    
    from Verilog2NX import get_modules

    in_file = "tests/test_verilog.v"

    net_dict, net_graph = get_modules(in_v=in_file, visual=False)

    print("nodes:")
    print(net_graph["demo"]["netlist"].nodes)
    
    print("edges:")
    print(net_graph["demo"]["netlist"].edges)

    for n in net_graph["demo"]["netlist"].nodes:
        print("node: "+n)
        print(net_graph["demo"]["netlist"].nodes[n])

def test_build_lists_subs():
    
    from Verilog2NX import get_modules

    in_file = "tests/test_verilog2.v"

    get_modules(in_v=in_file, visual=False, no_submodules=False)

def test_build_lists_nosubs():
    
    from Verilog2NX import get_modules

    in_file = "tests/test_verilog2.v"

    get_modules(in_v=in_file, visual=True, no_submodules=True)