#!/usr/bin/env python3
import sys
import csv
file_path = sys.argv[1]
file_size = int(sys.argv[2])
chunk_size = int(sys.argv[3])
rng = range(0, file_size, chunk_size)
file_chunks = [[file_path,x,min(file_size, x+chunk_size),len(rng)] for x in rng] 
with open("out.txt", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(file_chunks)
f.close()
