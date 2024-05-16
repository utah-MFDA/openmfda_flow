from openmfda_flow.openmfda_flow import *
from openmfda_flow.openmfda_class import OpenMFDA

proj = OpenMFDA()


proj.verilog_file= "mix_2_iter.v"
proj.design_name = "mix_2_iter"
proj.platform    = "mfda_30px" 

#verilog_file = "demo.v"
#design_name = "demo"
#platform = "mfda_30px"

proj.set_pin([0, 1], "soln1")
proj.set_pin([0, 2], "soln2")
proj.set_pin([0, 3], "soln3")
proj.set_pin([1, 6], "out")

#pins = [[None for i in range(0,8)] for j in range(0,4)]
#pins[0][1] = "soln1"
#pins[0][2] = "soln2"
#pins[0][3] = "soln3"
#pins[1][7] = "out"

gp_args = {}
gp_args['density'] = 0.88
gp_args['bin'] = 24
gp_args['max_phi'] = 1.06

proj.set_die_area([0, 0, 2550, 1590])
proj.set_core_area([0, 0, 2550, 1590])

proj.add_input('soln1', 'pressurePump', {'pressure': '69k'}, {'H2O':'100m'})
proj.add_input('soln2', 'pressurePump', {'pressure': '69k'}, {'Tag':'400m'})
proj.add_input('soln3', 'pressurePump', {'pressure': '69k'}, {'Sample':'1.75u'})

proj.add_probe('pressure', 'connect2')
proj.add_probe('pressure', 'connect6')

proj.add_eval('H2O', 'out', '89.2m', '0')
proj.add_eval('Tag', 'out', '40m', '0')
proj.add_eval('Tag', 'out', '0.014u', '0')

proj.add_analysis('transient','0.1ms','1ms')

density_var  = [0.80, 0.84, 0.88, 0.92, 0.96]
bin_var      = [20, 24, 28, 32]
max_phi      = [1.04, 1.03, 1.02, 1.01]
min_phi      = [0.95]
i_wire_coef  = [0.01, 0.1, 1, 10, 100, 1000]
i_dens_coef  = [0.01, 0.1, 1, 10, 100, 1000]
fan_out      = [10] 
overflow     = [0.1, 0.08, 0.06, 0.04]

iter_list = [
        density_var, #0
        bin_var,
        max_phi,
        min_phi,
        i_wire_coef,
        i_dens_coef,
        fan_out,
        overflow,
        ]

print(proj.to_string_probes())
proj.build()
proj.run_flow(mk_targets=['pnr','render', 'simulate'])
#proj.run_flow_remote(remote_pyenv_home='~/mfda_env', remote_dir="MFDA_flow", mk_targets=['pnr','render', 'simulate'])
#proj.set_replace_arg('density', 0.88)
#proj.set_replace_arg('bin'    , 24)
#proj.set_replace_arg('max_phi', 1.04)

# default loc for len file
import os, sys

design = proj.design_name
platform=proj.platform

def run_iter_soln(iter_list, len_file, eval_file, out_csv_len, out_csv_chem):
    density_var = iter_list[0]
    bin_var     = iter_list[1]
    max_phi     = iter_list[2]
    min_phi     = iter_list[3]
    i_wire_coef = iter_list[4]
    i_dens_coef = iter_list[5]
    fan_out     = iter_list[6]
    overflow    = iter_list[7]


    init = True
    
    for dv in density_var: #density_var
        for bv in bin_var: #bin_var
            for maxp in max_phi: #max_phi
                for iwire in i_wire_coef:
                    for iden in i_dens_coef:
                        for ov in overflow:
                            proj.set_replace_arg('overflow',          ov)
                            proj.set_replace_arg('init_wire_coef',    iwire)
                            proj.set_replace_arg('init_density_coef', iden)
                            proj.set_replace_arg('max_phi',           maxp)
                            proj.set_replace_arg('bin',               bv)
                            proj.set_replace_arg('density',           dv)

                            mfda_error = False
                            
                            print(proj.to_string_probes())
                            proj.build()
                            try:
                                proj.run_flow(mk_targets=['pnr','render', 'simulate'])
                            except subprocess.CalledProcessError:
                                # TODO report blank or missing entries
                                mfda_error = True

                            w_colns = ['overflow', 
                                       'init_wire_coef', 
                                       'init_density_coef',
                                       'max_phi',
                                       'bin',
                                       'density',
                                       'error']
                            w_vals = [ov, iwire, iden, maxp, bv, dv, str(mfda_error)]
                            if init:
                                write_vals(w_colns, w_vals, init)
                            else:
                                write_vals(w_colns, w_vals, init)


                            #report lengths
                            if init:
                                nl = report_len(len_file, out_csv_len, init)
                                if nl != None:
                                    out_csv_len = nl
                                nc = report_chem(eval_file, out_csv_chem, init)
                                if nc != None:
                                    out_csv_chem = nc
                            else:
                                # report len
                                report_len(len_file, out_csv_len, init)

                                # report eval
                                report_chem(eval_file, out_csv_chem, init)

                            init = False

def write_vals(colns, val_list, init=True, out_file=None):

    out_file_n = None
    if out_file==None:
        out_file='replace_vars.csv'
    else:
        pass
    
    if os.path.isfile(out_file) and init:
        count = 0
        out_file_n = out_file + '_' + str(count)
        while( os.path.isfile(out_file_n)):
            out_file_n = out_file + '_' + str(count)
            count += 1
        out_file = out_file_n
            
    if init:
        of = open(out_file, 'w+')
        of.write(','.join(colns)+'\n')
    else:
        of = open(out_file, 'a')

    of.write(','.join([str(x) for x in val_list])+'\n')
    return out_file_n


def report_len(len_file, o_len, init=True):
    import pandas as pd
    o_len_n = None
    len_df = pd.read_csv(len_file, index_col=1)
    len_df = len_df.T 

    #print(len_df.iloc[1].tolist())

    if os.path.isfile(o_len) and init:
        count = 0
        o_len_n = o_len + '_' + str(count)
        while( os.path.isfile(o_len_n)):
            o_len_n = o_len + '_' + str(count)
            count += 1
        o_len = o_len_n

    if init:
        of = open(o_len, 'w+')
        of.write(','.join(len_df.columns.tolist())+'\n')
    else:
        of = open(o_len, 'a')

    of.write(','.join([str(x) for x in len_df.iloc[1].tolist()])+'\n')
    return o_len_n

def report_chem(chem_file, o_chem, init=True):
    import pandas as pd
    o_chem_n = None
    chem_df = pd.read_csv(chem_file)

    ch_list = chem_df[:]['Chemical'].tolist()
    nd_list = chem_df[:]['Node'].tolist()

    row_list = []
    key_list = []

    for ir in chem_df.iterrows():
        key_base = ir[1]['Chemical']+'.'+ir[1]['Node']

        key_c = key_base+'.concentration'
        val_c = ir[1]['Eval Conc'] 
        key_e = key_base+'.error'
        val_e = ir[1]['Error'] 

        key_list.append(key_c)
        key_list.append(key_e)

        row_list.append(str(val_c))
        row_list.append(str(val_e))

    if os.path.isfile(o_chem) and init:
        count = 0 
        o_chem_n = o_chem + '_' + str(count)
        while( os.path.isfile(o_chem_n)):
            o_chem_n = o_chem + '_' + str(count)
            count += 1
        o_chem = o_chem_n

    if init:
        of = open(o_chem, 'w+')
        of.write(','.join(key_list)+'\n')
    else:
        of = open(o_chem, 'a')
    of.write(','.join(row_list)+'\n')
    #print(, )
    return o_chem_n 

o_mfda_base = os.path.normpath(os.path.realpath(__file__)+'/../../../../')
len_f = o_mfda_base+f"/scad_flow/results/{design}/base/{design}_length.csv"
eval_f= o_mfda_base+f"/xyce_flow/results/{platform}/{design}/Chem_Eval.csv"
o_csv_len  = "length_out.csv"
o_csv_chem = "chem_out.csv"


#report_len(len_f, o_csv_len, init=True)
#report_chem(eval_f, o_csv_chem, init=True)
#report_len(len_f, o_csv_len, init=False)
#report_chem(eval_f, o_csv_chem, init=False)

#def run_iter_soln(iter_list, len_file, eval_file, out_csv_len, out_csv_chem):
run_iter_soln(iter_list, len_f, eval_f, o_csv_len, o_csv_chem)

#generate_config(verilog_file, design_name, pin_names=pins, platform=platform, global_place_args=gp_args, design_dir=True, platform_config=plat)
#run_flow(design_name, platform=platform, make_arg=['pnr', 'render', 'simulate'])

