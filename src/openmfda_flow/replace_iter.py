import os
import sys

from openmfda_flow import get_placement_data
from openmfda_flow import openmfda_class

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
    include_center_loc=False
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

    def create_dist_header_row(data):
        # fmt: off
        return ','.join(re_args_list + \
            [f'"{hpt}"'
                for hpt in data['distances']['global_place'].keys()
            ] + \
            [f'{cpt}'
                for cpt in data['centers']['global_place'].keys()
            ] if include_center_loc else []
                        )
        # fmt: on

    def create_dist_row(re_arg_val, data):
        # fmt: off
        return ','.join([str(r) for r in re_arg_val] + \
            [f'{dpt}'
                for dpt in data['distances']['global_place'].values()
            ] + \
            [f'"{cpt}"'
                for cpt in data['centers']['global_place'].values()
            ] if include_center_loc else []
                        )
        # fmt: on

    def append_row(out_file, re_args, data, init):
        if init:
            if not overwrite_replace_output and os.path.exists(out_file):
                raise Exception(
                    f"Replace write out file exists, will not overwrite")
            out_f_open = open(out_file, 'w+')
            header = create_dist_header_row(data)
            out_f_open.write(header)
        else:
            out_f_open = open(out_file, 'a+')
        data_row = create_dist_row(re_args, data)
        out_f_open.write('\n'+data_row)

    iwl_list = replace_args_dict['init_wirelength_coef']
    idn_list = replace_args_dict['init_density_coef']
    den_list = replace_args_dict['placement_density']
    ovf_list = replace_args_dict['overflow']
    bin_list = replace_args_dict['bin']
    maxp_list = replace_args_dict['max_phi']
    minp_list = replace_args_dict['min_phi']
    fan_list = replace_args_dict['fanout']

    repl_test_dir = f'{result_dir}/replace_iter'
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
                                    omfda_cl.write_replace_config(
                                        write_repl_out
                                    )

                                    if use_docker:
                                        if place_step == 'global':
                                            make_targ = 'replace'
                                        else:
                                            make_targ = 'place'

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

                                    # extract results
                                    repl_vars = [
                                        iwl, idn, den, ovf, bin, maxp, minp, fan, fail
                                    ]

                                    data_out = extract_data()

                                    append_row(
                                        repl_ot_file,
                                        repl_vars,
                                        data_out,
                                        run_init
                                    )

                                    run_init = False
