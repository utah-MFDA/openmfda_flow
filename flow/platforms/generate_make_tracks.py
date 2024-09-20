import sys
maxmet = int(sys.argv[1])
for i in range(1, maxmet+1):
    print(f"make_tracks met{i} -x_offset 0 -x_pitch 30 -y_offset 0 -y_pitch 30")
