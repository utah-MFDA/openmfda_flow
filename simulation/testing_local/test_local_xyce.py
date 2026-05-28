
import subprocess
import os, sys
import shutil

def test_run_local_simple_channel():

    python_cmd = 'python3 ./runMFDASim.py'

    arg_netlsit    = '--netlist simple_channel.v'
    arg_design     = '--design simple_channel'
    arg_sim_file   = '--sim_config ./testing_local/simpleChannelTest_full_config/simulation.config'
    arg_sim_dir    = '--sim_dir ./testing_local/simpleChannelTest_full_config'
    arg_lib        = '--lib ./testing/StandardCellLibrary.csv'
    arg_cir_config = '--cir_config ./V2Va_Parser/VMF_xyce.mfsp'
    arg_length_file= '--length_file ./testing_local/simpleChannelTest_full_config/simple_channel_lengths.xlsx'

    #arg_eval_file  = '--eval_file ./testing_local/simpleChannelTest_full_config/eval.config'
    arg_local_xyce = '--local_xyce True'

    spice_output_dir_simpleChan = "testing_local/simpleChannelTest_full_config/spiceFiles"
    shutil.rmtree(spice_output_dir_simpleChan, ignore_errors=True)

    cmd_w_args = ' '.join([
        python_cmd,
        arg_design,
        arg_netlsit,
        arg_sim_file, 
        arg_sim_dir,
        arg_lib,
        arg_cir_config,
        arg_length_file,
        #arg_eval_file,
        arg_local_xyce]).split()

    print("Running: "+str(cmd_w_args))

    subprocess.run(cmd_w_args)

def test_run_local_smart_toilet():

    python_cmd = 'python3 ./runMFDASim.py'

    arg_netlsit    = '--netlist smart_toilet.v'
    arg_design     = '--design smart_toilet'
    arg_sim_file   = '--sim_config ./testing_local/smart_toilet_test_config/simulation.config'
    arg_sim_dir    = '--sim_dir ./testing_local/smart_toilet_test_config'
    arg_lib        = '--lib ./testing/StandardCellLibrary.csv'
    arg_cir_config = '--cir_config ./V2Va_Parser/VMF_xyce.mfsp'
    arg_length_file= '--length_file ./testing_local/smart_toilet_test_config/smart_toilet_lengths.xlsx'

    #arg_eval_file  = '--eval_file ./testing_local/smart_toilet_test_config/eval.config'
    arg_local_xyce = '--local_xyce True'

    # Clean output directory
    spice_output_dir = "testing_local/smart_toilet_test_config/spiceFiles"
    shutil.rmtree(spice_output_dir, ignore_errors=True)

    cmd_w_args = ' '.join([
        python_cmd,
        arg_netlsit,
        arg_design,
        arg_sim_file, 
        arg_sim_dir,
        arg_lib,
        arg_cir_config,
        arg_length_file,
        #arg_eval_file,
        arg_local_xyce]).split()

    print("Running: "+str(cmd_w_args))

    subprocess.run(cmd_w_args)


def test_run_local_demo():

    python_cmd = 'python3 ./runMFDASim.py'

    design = 'demo'
    platform = 'mfda_30px'

    arg_netlsit    = f'--netlist {design}.v'
    arg_design     = f'--design {design}'
    arg_sim_file   = '--sim_config ./testing_local/smart_toilet_test_config/simulation.config'
    arg_sim_dir    = f'--sim_dir ./designs/{platform}/{design}'
    arg_lib        = '--lib ./testing/StandardCellLibrary.csv'
    arg_cir_config = '--cir_config ./V2Va_Parser/VMF_xyce.mfsp'
    arg_length_file= '--length_file ./testing_local/smart_toilet_test_config/smart_toilet_lengths.xlsx'

    #arg_eval_file  = '--eval_file ./testing_local/smart_toilet_test_config/eval.config'
    arg_local_xyce = '--local_xyce True'

    arg_output_dir = f'--output_dir ./results/{platform}/{design}'

    # Clean output directory
    #spice_output_dir = "testing_local/smart_toilet_test_config/spiceFiles"
    #shutil.rmtree(spice_output_dir)

    cmd_w_args = ' '.join([
        python_cmd,
        arg_netlsit,
        arg_design,
        arg_sim_file, 
        arg_sim_dir,
        arg_lib,
        arg_cir_config,
        arg_length_file,
        #arg_eval_file,
        arg_local_xyce,
        arg_output_dir ]).split()

    print("Running: "+str(cmd_w_args))

    subprocess.run(cmd_w_args)

def test_run_local_demo():

    python_cmd = 'python3 ./runMFDASim.py'

    design = 'demo_cnode'
    platform = 'mfda_30px'

    arg_netlsit    = f'--netlist {design}.v'
    #arg_sim_file   = '--sim_file ./testing_local/smart_toilet_test_config/simulation.config'
    arg_sim_dir    = f'--sim_dir ./designs/{platform}/{design}'
    arg_lib        = '--lib ./testing/StandardCellLibrary.csv'
    arg_cir_config = '--cir_config ./V2Va_Parser/VMF_xyce.mfsp'
    arg_length_file= '--length_file ./testing_local/smart_toilet_test_config/smart_toilet_lengths.xlsx'

    #arg_eval_file  = '--eval_file ./testing_local/smart_toilet_test_config/eval.config'
    arg_local_xyce = '--local_xyce True'

    arg_output_dir = f'--output_dir ./results/{platform}/{design}'

    # Clean output directory
    #spice_output_dir = "testing_local/smart_toilet_test_config/spiceFiles"
    #shutil.rmtree(spice_output_dir)

    cmd_w_args = ' '.join([
        python_cmd,
        arg_netlsit,
        #arg_sim_file, 
        arg_sim_dir,
        arg_lib,
        arg_cir_config,
        arg_length_file,
        #arg_eval_file,
        arg_local_xyce,
        arg_output_dir ]).split()

    print("Running: "+str(cmd_w_args))

    subprocess.run(cmd_w_args)