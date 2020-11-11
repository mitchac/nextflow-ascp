#!/usr/bin/env python3
import sys
f = open("out.txt", "x")
f.write(sys.argv[1])
f.close()
