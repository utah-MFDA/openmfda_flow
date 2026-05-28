


def test_add_probes():
    import sys, os
    from writeSpice import add_probes_to_device

    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/../verilog_2_NX/')
    from Verilog2NX import get_modules, visual_graph

    probes = {}
    probes['pressure'] = [{'node':'connect1'}]
    probes['pressureNode'] = [{'node':'connect1', 'device':'serp1'}]
    probes['pressureNode'] = [{'node':'connect1', 'device':'serp2'}]
    probes['flow'] = [{'node':'connect1', 'device':'serp1'}]
    probes['concentration'] = [{'node':'connect1'}]

    verilog_file = 'testing_local/smart_toilet_test_config/smart_toilet.v'

    netlist_dict, netlist_graph = get_modules(in_v=verilog_file, visual=False)

    out_probes, netlist_graph_out = add_probes_to_device(probes, netlist_graph['smart_toilet']['netlist'])

    print(out_probes)

    #visual_graph(netlist_graph['smart_toilet']['netlist'])

def test_source_list_gen():
    import sys, os
    from writeSpice import add_probes_to_device, generate_source_list
    from SimulationXyce import SimulationXyce

    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/../verilog_2_NX/')
    from Verilog2NX import get_modules, visual_graph

    verilog_file = 'testing_local/smart_toilet_test_config/smart_toilet.v'
    netlist_dict, netlist_graph = get_modules(in_v=verilog_file, visual=False)

    config_file = "testing_local/smart_toilet_test_config/simulation.config"

    Xcl = SimulationXyce()
    Xcl.parse_config_file(config_file)

    dev_lines, chem_args = generate_source_list(Xcl)

    print('device lines:')
    print(dev_lines)

def test_source_list_gen():
    import sys, os
    from writeSpice import add_probes_to_device, generate_source_list
    from SimulationXyce import SimulationXyce

    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/../verilog_2_NX/')
    from Verilog2NX import get_modules, visual_graph

    verilog_file = 'testing_local/smart_toilet_test_config/smart_toilet.v'
    netlist_dict, netlist_graph = get_modules(in_v=verilog_file, visual=False)

    config_file = "testing_local/smart_toilet_test_config/simulation.config"

    Xcl = SimulationXyce()
    Xcl.parse_config_file(config_file)

    dev_lines, chem_args = generate_source_list(Xcl, has_chem=True)

    print('device lines:')
    print(dev_lines)

    print('chem lines:')
    print(chem_args)

def test_convert_netlist():

    pass

def test_write_spice_str_0():
    import sys, os
    from writeSpice import add_probes_to_device, generate_source_list, write_spice_file, convert_nodes_2_numbers_xyce, generate_time_lines
    from SimulationXyce import SimulationXyce

    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/../verilog_2_NX/')
    from Verilog2NX import get_modules, visual_graph

    verilog_file = 'testing_local/smart_toilet_test_config/smart_toilet.v'
    config_file = "testing_local/smart_toilet_test_config/simulation.config"
    length_file = "testing_local/smart_toilet_test_config/smart_toilet_lengths.xlsx"

    probes = {}
    probes['pressure'] = [{'node':'connect1'}]
    #probes['pressureNode'] = [{'node':'connect1', 'device':'serp1'}]
    #probes['pressureNode'] = [{'node':'connect1', 'device':'serp2'}]
    #probes['flow'] = [{'node':'connect1', 'device':'serp1'}]
    probes['concentration'] = [{'node':'connect1'}]

    netlist_dict, netlist_graph = get_modules(in_v=verilog_file, visual=False)

    out_probes, netlist_graph_out = add_probes_to_device(probes, netlist_graph['smart_toilet']['netlist'])

    Xcl = SimulationXyce()
    Xcl.parse_config_file(config_file)

    dev_lines, chem_args = generate_source_list(Xcl, has_chem=True)

    sim_lines = generate_time_lines(Xcl)

    write_spice_file(netlist_graph['smart_toilet']['netlist'],
        probes_list=out_probes,
        source_lines=dev_lines,
        length_list=length_file,
        sims_time_lines=sim_lines,
        sim_type="transient",
        out_file="out_spice_0.cir")

    out_spice = "out_spice_0_.cir.str"

    convert_nodes_2_numbers_xyce(out_spice)

def test_write_spice_str_1():
    import sys, os
    from writeSpice import add_probes_to_device, generate_source_list, write_spice_file, convert_nodes_2_numbers_xyce, generate_time_lines
    from SimulationXyce import SimulationXyce

    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/../verilog_2_NX/')
    from Verilog2NX import get_modules, visual_graph

    verilog_file = 'testing_local/smart_toilet_test_config/smart_toilet.v'
    config_file = "testing_local/smart_toilet_test_config/simulation.config"
    length_file = "testing_local/smart_toilet_test_config/smart_toilet_lengths.xlsx"

    probes = {}
    probes['pressure'] = [{'node':'connect1'}]
    probes['pressureNode'] = [{'node':'connect1', 'device':'serp1'}]
    probes['pressureNode'] = [{'node':'connect1', 'device':'serp2'}]
    probes['flow'] = [{'node':'connect1', 'device':'serp1'}]
    probes['concentration'] = [{'node':'connect1'}]

    netlist_dict, netlist_graph = get_modules(in_v=verilog_file, visual=False)

    out_probes, netlist_graph_out = add_probes_to_device(probes, netlist_graph['smart_toilet']['netlist'])

    Xcl = SimulationXyce()
    Xcl.parse_config_file(config_file)

    dev_lines, chem_args = generate_source_list(Xcl, has_chem=True)

    sim_lines = generate_time_lines(Xcl)

    write_spice_file(netlist_graph['smart_toilet']['netlist'],
        probes_list=out_probes,
        source_lines=dev_lines,
        length_list=length_file,
        sims_time_lines=sim_lines,
        sim_type="transient",
        out_file="out_spice_1.cir")

    out_spice = "out_spice_1_.cir.str"

    convert_nodes_2_numbers_xyce(out_spice)

def test_write_spice_str_2():
    import sys, os
    from writeSpice import add_probes_to_device, generate_source_list, write_spice_file, convert_nodes_2_numbers_xyce, generate_time_lines
    from SimulationXyce import SimulationXyce

    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/../verilog_2_NX/')
    from Verilog2NX import get_modules, visual_graph

    verilog_file = 'testing_local/smart_toilet_test_config/smart_toilet.v'
    config_file = "testing_local/smart_toilet_test_config/simulation.config"
    length_file = "testing_local/smart_toilet_test_config/smart_toilet_lengths.xlsx"

    probes = {}
    probes['pressure'] = [{'node':'connect1'}]
    probes['flow'] = [{'node':'connect1', 'device':'serp1'}]
    probes['concentration'] = [{'node':'connect1'}]

    netlist_dict, netlist_graph = get_modules(in_v=verilog_file, visual=False)

    out_probes, netlist_graph_out = add_probes_to_device(probes, netlist_graph['smart_toilet']['netlist'])

    Xcl = SimulationXyce()
    Xcl.parse_config_file(config_file)

    dev_lines, chem_args = generate_source_list(Xcl, has_chem=True)

    sim_lines = generate_time_lines(Xcl)

    write_spice_file(netlist_graph['smart_toilet']['netlist'],
        probes_list=out_probes,
        source_lines=dev_lines,
        length_list=length_file,
        sims_time_lines=sim_lines,
        sim_type="transient",
        out_file="out_spice_2.cir")

    out_spice = "out_spice_2_.cir.str"

    convert_nodes_2_numbers_xyce(out_spice)

def test_write_spice_str_3():
    import sys, os
    from writeSpice import add_probes_to_device, generate_source_list, write_spice_file, convert_nodes_2_numbers_xyce, generate_time_lines
    from SimulationXyce import SimulationXyce

    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/../verilog_2_NX/')
    from Verilog2NX import get_modules, visual_graph

    verilog_file = 'testing_local/smart_toilet_test_config/smart_toilet.v'
    config_file = "testing_local/smart_toilet_test_config/simulation.config"
    length_file = "testing_local/smart_toilet_test_config/smart_toilet_lengths.xlsx"

    probes = {}
    probes['pressure'] = [{'node':'connect1'}]
    probes['flow'] = [{'node':'connect1', 'device':'serp1'}]
    probes['concentration'] = [{'node':'connect1'}]

    netlist_dict, netlist_graph = get_modules(in_v=verilog_file, visual=False)

    out_probes, netlist_graph_out = add_probes_to_device(probes, netlist_graph['smart_toilet']['netlist'])

    Xcl = SimulationXyce()
    Xcl.parse_config_file(config_file)

    dev_lines, chem_args = generate_source_list(Xcl, has_chem=True)

    print("chem lines:")
    print(chem_args)
    print(dev_lines)

    sim_lines = generate_time_lines(Xcl)

    write_spice_file(netlist_graph['smart_toilet']['netlist'],
        probes_list=out_probes,
        source_lines=dev_lines,
        length_list=length_file,
        chem_list=chem_args,
        sims_time_lines=sim_lines,
        sim_type="transient",
        out_file="out_spice_3.cir")

    out_spice = "out_spice_3_H2O.cir.str"

    convert_nodes_2_numbers_xyce(out_spice)


def test_write_spice_str_4():
    import sys, os
    from writeSpice import add_probes_to_device, generate_source_list, write_spice_file, convert_nodes_2_numbers_xyce, generate_time_lines
    from SimulationXyce import SimulationXyce

    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/../verilog_2_NX/')
    from Verilog2NX import get_modules, visual_graph

    verilog_file = 'testing_local/smart_toilet_test_config/smart_toilet.v'
    config_file = "testing_local/smart_toilet_test_config/simulation.config"
    length_file = "testing_local/smart_toilet_test_config/smart_toilet_lengths.xlsx"

    probes = {}
    #probes['pressure'] = [{'node':'connect1'}]
    #probes['flow'] = [{'node':'connect1', 'device':'serp1'}]
    probes['concentrationNode'] = [{'node':'connect1', 'device':'serp1'}]

    netlist_dict, netlist_graph = get_modules(in_v=verilog_file, visual=False)

    out_probes, netlist_graph_out = add_probes_to_device(probes, netlist_graph['smart_toilet']['netlist'])

    Xcl = SimulationXyce()
    Xcl.parse_config_file(config_file)

    dev_lines, chem_args = generate_source_list(Xcl, has_chem=True)

    print("chem lines:")
    print(chem_args)
    print(dev_lines)

    sim_lines = generate_time_lines(Xcl)

    write_spice_file(netlist_graph['smart_toilet']['netlist'],
        probes_list=out_probes,
        source_lines=dev_lines,
        length_list=length_file,
        chem_list=chem_args,
        sims_time_lines=sim_lines,
        sim_type="transient",
        out_file="out_spice_4.cir")
    
    out_spice = "out_spice_4_H2O.cir.str"

    convert_nodes_2_numbers_xyce(out_spice)

def test_write_spice_str_5():
    import sys, os
    from writeSpice import add_probes_to_device, generate_source_list, write_spice_file, convert_nodes_2_numbers_xyce, generate_time_lines
    from SimulationXyce import SimulationXyce

    sys.path.insert(0, os.path.dirname(os.path.realpath(__file__))+'/../verilog_2_NX/')
    from Verilog2NX import get_modules, visual_graph

    verilog_file = 'testing_local/two_out_cnode/smart_toilet.v'
    config_file = "testing_local/two_out_cnode/simulation.config"
    length_file = "testing_local/two_out_cnode/smart_toilet_lengths.xlsx"

    probes = {}
    #probes['pressure'] = [{'node':'connect1'}]
    #probes['flow'] = [{'node':'connect1', 'device':'serp1'}]
    probes['concentrationNode'] = [{'node':'out', 'device':'serp11'}]
    probes['concentrationNode'] = [{'node':'out', 'device':'serp5'}]

    netlist_dict, netlist_graph = get_modules(in_v=verilog_file, visual=False)

    out_probes, netlist_graph_out = add_probes_to_device(probes, netlist_graph['smart_toilet']['netlist'])

    Xcl = SimulationXyce()
    Xcl.parse_config_file(config_file)

    dev_lines, chem_args = generate_source_list(Xcl, has_chem=True)

    print("chem lines:")
    print(chem_args)
    print(dev_lines)

    sim_lines = generate_time_lines(Xcl)

    write_spice_file(netlist_graph['smart_toilet']['netlist'],
        probes_list=out_probes,
        source_lines=dev_lines,
        length_list=length_file,
        chem_list=chem_args,
        sims_time_lines=sim_lines,
        sim_type="transient",
        out_file="out_spice_5.cir")
    
    out_spice = "out_spice_5_H2O.cir.str"

    convert_nodes_2_numbers_xyce(out_spice)

def test_write_spice_main():
    
    from writeSpice import generate_cir_main
    
    verilog_file = 'testing_local/smart_toilet_test_config/smart_toilet.v'
    config_file = "testing_local/smart_toilet_test_config/simulation.config"
    length_file = "testing_local/smart_toilet_test_config/smart_toilet_lengths.xlsx"

    generate_cir_main(
        design="smart_toilet",
        verilog_file=verilog_file,
        config_file=config_file,
        length_file=length_file,
        out_file='results/testing/out_spice_main_1')

def test_write_spice_main_pcell():
    
    from writeSpice import generate_cir_main
    
    verilog_file ='testing_local/smart_toilet_test_config_pcell/smart_toilet.v'
    config_file = "testing_local/smart_toilet_test_config_pcell/simulation.config"
    length_file = "testing_local/smart_toilet_test_config_pcell/smart_toilet_lengths.xlsx"
    pcell_file  = "testing_local/smart_toilet_test_config_pcell/pcell_out_xyce"

    generate_cir_main(
        design="smart_toilet",
        verilog_file=verilog_file,
        config_file=config_file,
        length_file=length_file,
        out_file='results/testing/out_spice_main_1p',
        pcell_file=pcell_file)