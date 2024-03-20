
import openmfda_flow as of

class OpenMFDA:
    
    
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
        