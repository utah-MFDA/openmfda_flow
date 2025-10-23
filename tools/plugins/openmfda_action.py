import pcbnew
import os


# class OpenMFDAAction(pcbnew.ActionPlugin):
#     def defaults(self):
#         self.name = "OpenMFDA"
#         self.category = "Utility"
#         self.description = "Run OpenMFDA flow to generate placement and routing."
#         self.show_toolbar_button = True
#         self.icon_file_name = os.path.join(os.path.dirname(__file__), 'icon.png')

#     def Run(self):
#         # The entry function of the plugin that is executed on user action
#         from . import routegui
#         routegui.launch()
