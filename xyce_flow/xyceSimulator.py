
import json
import subprocess

class xyceSimulator:

    def __init__(self):
        pass

    def __init__(self, configFile):
        
        xyce_config = ''
        with open(configFile, 'r') as f:
            xyce_config = json.load(f)

        self.xyce_command = xyce_config["xyce_command"]

        self.loadPlugins(xyce_config["library_files"], fromFile=False)

    def loadPlugins(self, config, fromFile=True):
        xyce_libs = None
        if fromFile:
            with open(config, 'r') as f:
                xyce_libs = json.load(f)["library_files"]

        self.xyce_libraries = xyce_libs

    def set_xyce_command(self, command):
        self.xyce_command = command

    def run(self, files):
        
        # generate library string
        xyce_lib_str = ''
        for l in self.xyce_libraries:
            pass

        xyce_run = self.xyce_command+' --plugin '+xyce_lib_str+' '

        for f in files:
            xyce_run_file = (xyce_run+f).replace('  ', ' ').split(' ')
            subprocess.run(xyce_run_file)