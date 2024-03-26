#/bin/tcsh

cd .testing/projects/simple_junction/spiceFiles/

mkdir ./simple_junction_H2O.
hspice -i ./simple_junction_H2O..sp -o ./simple_junction_H2O./simple_junction_H2O._o

mkdir ./simple_junction_Tag.
hspice -i ./simple_junction_Tag..sp -o ./simple_junction_Tag./simple_junction_Tag._o

