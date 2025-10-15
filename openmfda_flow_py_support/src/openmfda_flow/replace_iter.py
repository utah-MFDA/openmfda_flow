import os
import sys
import copy
import csv

from openmfda_flow import get_placement_data
from openmfda_flow import openmfda_class

from openmfda_flow import def_obj_load

import subprocess


def replace_iter(
    flow_home,
    design,
    platform,
    replace_args_dict,
    verilog_file=None,
    lef_files=None,
    design_var='base',
    place_step='global',
    cv=7.6e-3,
    use_docker=False,
    overwrite_replace_output=False,
    include_center_loc=False,
    estimate_para=False,
    concentration_pass_thresh=None
):

    if flow_home is not None:
        omfda_base = os.path.abspath(flow_home+'/..')
    elif 'OPENMFDA_ROOT' in os.environ:
        omfda_base = os.environ['OPENMFDA_ROOT']
    else:
        raise Exception(
            'OPENMFDA_ROOT enviroment variable not defined or flow_home is None')

    # fmt: off
    if omfda_base not in sys.path and use_docker:
        sys.path.append(omfda_base)
        import run_mfda_docker
    # fmt: on

    result_base = f'{flow_home}/results/'
    result_dir = f'{result_base}/{design}/{design_var}'

    repl_test_dir = f'{result_dir}/replace_iter'
    para_len_file = f'{repl_test_dir}/lengths.csv'

    # include simulation is para
    # fmt: off
    if estimate_para:
        sim_home = f'{flow_home}/../tools/simulation'
        print("SIM HOME:", sim_home)
        # sys.path.append(sim_home)
        # import runMFDASim

    def run_sim():
        run_mfda_docker.run_mfdaflow_docker(
            design=design,
            mfda_platform=platform,
            make_args='simulate_place',
            docker_env_vars=docker_env_vars,
            run_deps=True,
            no_check=False
        )
        # runMFDASim.runSimulation(
        #         design=design,
        #         verilogFile=f'{result_dir}/2_place.v',
        #         sim_config=os.environ['SIMULATION_CONFIG'],
        #         workDir=f'{repl_test_dir}/simulation',
        #         libraryFile=f'{flow_home}/../tools/simulation/stdCellLib/StandardCellLibrary.csv',
        #         isLocalXyce=True,
        #         cirConfigFile=f'{flow_home}/../tools/simulation/V2Va_Parser/VMF_template.mfsp',
        #         length_file=para_len_file,
        #         pcell_file=None,
        #     extra_args={'xyce_run_config': f'{result_dir}/xyce_run.config'}
        # )

    def get_simulation_data():
        print('Extracting simulation data')
        error_dict = {}
        with open(f'{result_dir}/Chem_Eval.csv', 'r') as sim_read:
            sim_csv = csv.reader(sim_read, delimiter=',')
            for ind, line in enumerate(sim_csv):
                if ind == 0:
                    continue
                else:
                    error_dict[line[1]] = line[4]
        return error_dict


    # fmt: on

    re_args_list = [
        'init_wirelength_coef',
        'init_density_coef',
        'placement_density',
        'overflow',
        'bin',
        'max_phi',
        'min_phi',
        'fanout',
        'run_fail'
    ]

    start_time = ''

    if lef_files is None:
        lef_files = [os.environ['SC_LEF']]

        if 'ADDITIONAL_LEFS' in os.environ:
            lef_files += str(os.environ['ADDITIONAL_LEFS']).split(' ')
    elif isinstance(lef_files, str):
        lef_files = [lef_files]

    def set_vars(
        omfda_class,
        iwl, idn, den, ovf, bin, maxp, minp, fan
    ):
        print('iwl:', iwl)
        omfda_class.set_replace_arg(
            'init_wire_coef', iwl
        )
        omfda_class.set_replace_arg(
            'init_density_coef', idn
        )
        omfda_class.set_replace_arg(
            'placement_density', den
        )
        omfda_class.set_replace_arg(
            'overflow', ovf
        )
        omfda_class.set_replace_arg(
            'bin', bin
        )
        omfda_class.set_replace_arg(
            'max_phi', maxp
        )
        omfda_class.set_replace_arg(
            'min_phi', minp
        )
        omfda_class.set_replace_arg(
            'fan', fan
        )

    def extract_data():
        gp_file = f'{result_dir}/2_1_place_gp.def'
        dp_file = f'{result_dir}/2_3_place_dp.def'

        return get_placement_data.get_placement_distances(
            results_root=result_base,
            design=design,
            lef_file=lef_files[0],
            conversion_factor=cv,
            def_file=gp_file if place_step == 'global' else dp_file,
            design_varient=design_var,
            placement_step=place_step
        )

    def create_dist_header_row(data, sim_data=None):
        if sim_data is None:
            sim_data = {}

        # fmt: off

        if place_step == 'global':
            centers_data = [f'{cpt}'
                    for cpt in data['centers']['global_place'].keys()
                ] if include_center_loc else []
            return ','.join(re_args_list + \
                [f'"{hpt}"'
                    for hpt in data['distances']['global_place'].keys()
                ] + \
                centers_data + \
                list(sim_data.keys())
                            ) # end join
        elif place_step == 'detail':
            centers_data = [f'{cpt}'
                    for cpt in data['centers']['detail_place'].keys()
                ] if include_center_loc else []
            return ','.join(re_args_list + \
                [f'"{hpt}"'
                    for hpt in data['distances']['detail_place'].keys()
                ] + \
                centers_data + \
                list(sim_data.keys())
                            ) # end join
        # fmt: on

    def create_dist_row(re_arg_val, data, sim_data=None):
        if sim_data is None:
            sim_data = {}
        # fmt: off
        if place_step == 'global':
            centers_data = [f'"{cpt}"'
                    for cpt in data['centers']['global_place'].values()
                ] if include_center_loc else []
            return ','.join([str(r) for r in re_arg_val] + \
                [f'{dpt}'
                    for dpt in data['distances']['global_place'].values()
                ] + \
                centers_data + \
                list(sim_data.values())
                            ) # end join
        elif place_step == 'detail':
            centers_data = [f'"{cpt}"'
                    for cpt in data['centers']['detail_place'].values()
                ] if include_center_loc else []
            return ','.join([str(r) for r in re_arg_val] + \
                [f'{dpt}'
                    for dpt in data['distances']['detail_place'].values()
                ] + \
                centers_data + \
                list(sim_data.values())
                            ) # end join
        # fmt: on

    def append_row(out_file, re_args, data, init, sim_data=None):
        if init:
            if not overwrite_replace_output and os.path.exists(out_file):
                raise Exception(
                    f"Replace write out file exists, will not overwrite")
            out_f_open = open(out_file, 'w+')
            header = create_dist_header_row(data, sim_data)
            out_f_open.write(header)
        else:
            out_f_open = open(out_file, 'a+')
        data_row = create_dist_row(re_args, data, sim_data)
        out_f_open.write('\n'+data_row)

    def load_net_comps(def_file):
        design_obj = def_obj_load.Design().import_def(
            def_file
        )

        design_names = list(design_obj['design'].keys())
        main_dgn = design_names[0]

        dgn_dict = design_obj['design'][main_dgn]
        net_comps = {}
        for nt, nt_i in dgn_dict.nets.items():
            comps = list(nt_i.net_components.items())
            print(comps)
            if comps[0][0] == "PIN":
                c1 = comps[0][1]
            else:
                c1 = comps[0][0]
            if comps[1][0] == "PIN":
                c2 = comps[1][1]
            else:
                c2 = comps[1][0]
            net_comps[(c1, c2)] = nt
        return net_comps

    def convert_comp_pair_to_net(comp_list, comp_nets):
        if 'detail_place' in comp_list['distances']:
            dist_list = copy.deepcopy(comp_list['distances']['detail_place'])
        else:
            dist_list = copy.deepcopy(comp_list['distances']['global_place'])
        new_list = {}
        for comps, dist in dist_list.items():
            for cnets, net in comp_nets.items():
                if cnets == comps or (cnets[1], cnets[0]) == comps:
                    new_list[net] = dist

        return new_list

    gp_file = f'{result_dir}/2_1_place_gp.def'
    dp_file = f'{result_dir}/2_3_place_dp.def'

    def estimate_parasiticts(wire_mh_len, def_in, out_file=para_len_file):
        # convect from comps to nets
        dist_dict = convert_comp_pair_to_net(
            wire_mh_len, load_net_comps(def_in))

        # write length for each net
        with open(out_file, 'w+') as len_out_f:
            len_out_f.write(',wire,length (mm)')
            ind = 0
            br_r = '}'
            br_l = '{'
            nl = '\n'
            for net, len in dist_dict.items():
                len_out_f.write(f"{nl}{int(ind)},{net},{br_l}'': {len}{br_r}")
                ind += 1

    iwl_list = replace_args_dict['init_wirelength_coef']
    idn_list = replace_args_dict['init_density_coef']
    den_list = replace_args_dict['placement_density']
    ovf_list = replace_args_dict['overflow']
    bin_list = replace_args_dict['bin']
    maxp_list = replace_args_dict['max_phi']
    minp_list = replace_args_dict['min_phi']
    fan_list = replace_args_dict['fanout']

    repl_test_dir_rel = f'./results/{design}/{design_var}/replace_iter/'

    write_repl_out = f'{repl_test_dir}/replace_vars.tcl'
    write_repl_out_rel = f'{repl_test_dir_rel}/replace_vars.tcl'

    repl_ot_file = f'{repl_test_dir}/repl_data_{start_time}.csv'

    omfda_cl = openmfda_class.OpenMFDA(
        design_name=design,
        verilog_file=verilog_file if verilog_file is not None else f'{flow_home}/designs/src/{design}/{design}.v',
        platform=platform
    )

    run_init = True

    docker_env_vars = f'GLOBAL_PLACEMENT_ARGS_FILE={write_repl_out_rel}'

    for iwl in iwl_list:
        for idn in idn_list:
            for den in den_list:
                for ovf in ovf_list:
                    for bin in bin_list:
                        for maxp in maxp_list:
                            for minp in minp_list:
                                for fan in fan_list:
                                    set_vars(
                                        omfda_cl,
                                        iwl, idn, den, ovf, bin, maxp, minp, fan
                                    )

                                    if use_docker:
                                        if place_step == 'global':
                                            make_targ = 'replace'
                                        else:
                                            make_targ = 'place'

                                        if estimate_para:
                                            make_targ += f' xyce_run_config'

                                        fail = False
                                        try:
                                            run_mfda_docker.run_mfdaflow_docker(
                                                design=design,
                                                mfda_platform=platform,
                                                make_args=make_targ,
                                                docker_env_vars=docker_env_vars,
                                                run_deps=True,
                                                no_check=False
                                            )
                                        except:
                                            fail = True
                                    else:
                                        omfda_cl.run_flow(
                                            mk_targets='replace'
                                        )

                                    omfda_cl.write_replace_config(
                                        write_repl_out
                                    )

                                    # extract results
                                    repl_vars = [
                                        iwl, idn, den, ovf, bin, maxp, minp, fan, fail
                                    ]

                                    data_out = extract_data()

                                    # run_sim is defined only if estimate_para==True
                                    if estimate_para:
                                        if place_step == 'global':
                                            estimate_parasiticts(
                                                data_out, gp_file)
                                            run_sim()
                                        else:
                                            estimate_parasiticts(
                                                data_out, dp_file)
                                            run_sim()
                                        sim_data = get_simulation_data()
                                        append_row(
                                            repl_ot_file,
                                            repl_vars,
                                            data_out,
                                            run_init,
                                            sim_data=sim_data
                                        )
                                    else:
                                        append_row(
                                            repl_ot_file,
                                            repl_vars,
                                            data_out,
                                            run_init
                                        )

                                    run_init = False
