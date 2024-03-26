#/bin/tcsh

cd .testing/projects/smart_toilet/spiceFiles/

mkdir ./smart_toilet_H2O.
hspice -i ./smart_toilet_H2O..sp -o ./smart_toilet_H2O./smart_toilet_H2O._o

mkdir ./smart_toilet_Sample.
hspice -i ./smart_toilet_Sample..sp -o ./smart_toilet_Sample./smart_toilet_Sample._o

mkdir ./smart_toilet_Tag.
hspice -i ./smart_toilet_Tag..sp -o ./smart_toilet_Tag./smart_toilet_Tag._o

