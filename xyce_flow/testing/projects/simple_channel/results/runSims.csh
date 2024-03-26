#/bin/tcsh

cd .testing/projects/simple_channel/spiceFiles/

mkdir ./simple_channel_H2O.
hspice -i ./simple_channel_H2O..sp -o ./simple_channel_H2O./simple_channel_H2O._o

