#!/usr/bin/env python

import sys
import struct

out = ""

boot = sys.argv[1]
firm = sys.argv[2]

bootdat = ""
with open(boot, "rb") as b:
    bootdat = b.read()

bootdatlen = len(bootdat)

bootlen = 1024*32
out = bootdat+"\x00"*(bootlen-bootdatlen)
print len(out)

firmdat = ""
with open(firm, "rb") as f:
    firmdat = f.read()

firmlen = struct.pack("I", len(firmdat))

print firmlen

out += "TRZR"+firmlen+"\x00"*3+"\x01"+"\x00"*244
out += firmdat

with open("firmout.dat", "wb") as z:
    z.write(out)

