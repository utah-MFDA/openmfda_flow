
# Using this tool

The route fix tool implements a simple A* algorithm to fix routing mistakes.

To use this in the OpenMFDA flow add the lines
```
export FIX_DEF = ./path/to/def_file.def
```
and add `fix_route` as a make target to your script. Additionally to
render the fixed def file as a scad script include `fix_render` as
a make target.

You should expect the files $(FIX_DEF)_fix.def and $(FIX_DEF)_fixbase.scad
as new files in the results directory if the process executed successfully.
