
import os
import subprocess
import platform as osplt
from pathlib import PureWindowsPath, PurePosixPath

import openmfda_flow as of


class OpenMFDA:
    
    class Platform:
        def __init__(self):
            self.core_site = [0,0]
            self.die_area  = [0,0]
            self.layer_per_via = 20
            self.bulk_total_layers = 280

        def set_core_area(self, new_core_area):
            if len(new_core_area)==2:
                self.core_site=new_core_area
            elif len(new_core_area)==4:
                self.core_site=new_core_area
            else:
                raise ValueError(f"Expecting list of len 2 or 4 {len(new_core_area)} passed")
        
        def get_core_site_mk(self):
            if len(self.core_site)==2:
                return f"0 0 {self.core_site[0]} {self.core_site[1]}"
            if len(self.core_site)==4:
                return ' '.join(self.core_site)

        def set_die_area(self, new_core_area):
            if len(new_core_area)==2:
                self.core_site=new_core_area
            elif len(new_core_area)==4:
                self.core_site=new_core_area
            else:
                raise ValueError(f"Expecting list of len 2 or 4 {len(new_core_area)} passed")
        
        def get_die_area_mk(self):
            if len(self.core_site)==2:
                return f"0 0 {self.core_site[0]} {self.core_site[1]}"
            if len(self.core_site)==4:
                return ' '.join(self.core_site)

        def set_xbulk(self, xbulk):
            self.die_area[2]=self.die_area[0]+xbulk
            self.core_site[2]=self.core_site[0]+xbulk
        
        def set_ybulk(self, ybulk):
            self.die_area[3]=self.die_area[1]+ybulk
            self.core_site[3]=self.core_site[1]+ybulk

        def set_zbulk(self, zbulk):
            self.zbulk = zbulk
    
        def set_layers_per_via(self, lpv):
            self.layer_per_via = lpv

        def get_xbulk(self):
            return self.die_area[0]-self.die_area[2]
        def get_ybulk(self):
            return self.die_area[1]-self.die_area[3]
        def get_zbulk(self):
            return self.zbulk

        def get_xchip(self):
            return ' '.join(self.die_area[0],self.die_area[2])
        def get_ychip(self):
            return ' '.join(self.die_area[1],self.die_area[3]) 


    def __init__(self, design_name=None, verilog_file=None, platform=None):
        self.pins = [[None for i in range(0,8)] for j in range(0,4)]
        self.cells = None
        self.design_name = design_name
        self.verilog_file = verilog_file
        self.platform = platform
        self.replace_arg = {}

    def import_verilog_file(self, verilog_file):
        self.verilog_file = verilog_file

    def set_verilog_file(self, verilog_file):
        self.verilog_file = verilog_file

    def set_platform(self, platform):
        self.platform = platform

    def set_design_name(self, design_name):
        self.design_name = design_name
    
    def set_pin(self, pin, name):
        self.pins[pin[0]][pin[1]] = name

    def add_cell(self, cell, ports):
        pass

    def set_replace_arg(self, arg, value):
        if arg == 'placement_density' or arg == 'density':
            self.replace_arg['density'] = value
        elif arg == 'bin':
            self.replace_arg['bin'] = value
        elif arg == 'init_density_coef':
            self.replace_arg['init_density_coef'] = value
        elif arg == 'init_wire_coef' or arg == 'init_wirelength_coef':
            self.replace_arg['init_wire_coef'] = value
        elif arg == 'max_phi':
            self.replace['max_phi'] = value
        elif arg == 'min_phi':
            self.replace['min_phi'] = value
        elif arg == 'overflow':
            self.replace['overflow'] = value
        elif arg == 'fanout':
            self.replace['fanout'] = value
        
    
    def build(self):
        of.generate_config(self.verilog_file, self.design_name, pin_names=self.pins, platform=self.platform)
        replace_file = f"openroad_flow/designs/{self.platform}/{self.design_name}/global_place_args.tcl"
        of.write_replace_args(replace_file, self.replace_arg)
    
    def run_flow(self):
        of.run_flow(self.design_name, platform=self.platform)
        

    def run_flow_render(self):
        of.run_flow_ow_slice(self.design_name, platform=self.platform)
    
    def sync_remote(self, remote_dir, wsl_root_dir='/mnt/c', win_root_drive='C:'):
        # sync files with server
        local_paths = ["designs","openroad_flow","scad_flow","xyce_flow","Makefile","requirements.txt","openmfda_flow.py","main.py"]

        dir_path = os.path.dirname(os.path.realpath(__file__)).replace('\\', '/')

        cmd_paths = ' '.join([f"{dir_path}/{x}" for x in local_paths])

        rs_cmd = f"rsync -av -e ssh {cmd_paths} mfda_remote:~/MFDA_flow"

        if osplt.system() == "Windows":
            wsl_cmd = 'wsl ~ -e bash -c'
            win_cmd  = f'{wsl_cmd} "{rs_cmd.replace(win_root_drive, wsl_root_dir)}"'
            print(win_cmd)
            os.system(win_cmd)
        elif osplt.system() == "Linux":
            print(rs_cmd)
            subprocess.run(rs_cmd.split())
        else: # assumes a linux system
            print(platform.system())
            print(rs_cmd)
            subprocess.run(rs_cmd.split())

    def sync_w_remote_outputs(self, 
        remote_dir, 
        local_path='', 
        relative_path=True, 
        or_logs=True, 
        or_reports=True, 
        wsl_root_dir='/mnt/c', 
        win_root_drive='C:'):

        dir_path = os.path.dirname(os.path.realpath(__file__)).replace('\\', '/')

        if osplt.system() == "Windows":
            dir_path = dir_path.replace(win_root_drive, wsl_root_dir)

        result_out = [ 
            "openroad_flow/results/",  
            "scad_flow/results/"
            ]

        if or_logs:
            result_out.append("openroad_flow/logs/")

        if or_reports:
            result_out.append("openroad_flow/reports/")

        if relative_path:
            local_path = f"{dir_path}/{local_path}"

        wsl_cmd = lambda rs : f'wsl ~ -e bash -c "{rs}"'

        for x in result_out:
            rs_cmd = f"rsync -av -e ssh mfda_remote:{remote_dir}/{x} {local_path}/{x}".split()

            if osplt.system() == "Windows":
                print("WSL cmd: "+wsl_cmd(' '.join(rs_cmd)))
                os.system(wsl_cmd(' '.join(rs_cmd)))
            elif osplt.system() == "Linux":
                subprocess.run(rs_cmd)
            else:
                subprocess.run(rs_cmd)

    def run_remote(self, design, platform, remote_env_home, remote_dir, win_drive="C:", wsl_root=None):
        # Assuming convention
        if wsl_root==None:
            print("Assuming root for WSL system, you can be explicit by setting wsl_root argument")
            wsl_root=f"/mnt/{win_drive[0]}"

        self.sync_remote(remote_dir=remote_dir, win_root_drive=win_drive, wsl_root_dir=wsl_root)

        # send run command remotely
        main_args = f'--design {design} --platform {platform}'
        
        if osplt.system() == "Windows":
            remote_env_home.replace('\~', '~')

        mainpy = f"{remote_dir}/main.py"
        srccmd = f"source {remote_env_home}/bin/activate"

        pycmd = f'python3 {mainpy} {main_args}'

        sshcmd= [f'ssh mfda_remote "{srccmd} ; {pycmd}"']

        if osplt.system() == "Windows":
            sshcmd[0] =sshcmd[0].replace('"', "'")
            print("ssh cmd: "+sshcmd[0])
            wsl_cmd = f'wsl ~ -e bash -c "{sshcmd[0]}"'
            print("WSL cmd: "+wsl_cmd)
            os.system(wsl_cmd)
        elif osplt.system() == "Linux":
            subprocess.run(sshcmd, 
                shell=True,
                check=True)
        else:
            subprocess.run(sshcmd, 
                shell=True,
                check=True)

        self.sync_w_remote_outputs(remote_dir, win_root_drive=win_drive, wsl_root_dir=wsl_root)

    def run_flow_render(self):
        pass


if __name__ == "__main__":

    design    = 'demo'
    plat      = 'mfda_30px'
    py_remote = '~/mfda_env'
    remote_dir= "MFDA_flow"

    test = OpenMFDA().run_remote(design, plat, py_remote, remote_dir)