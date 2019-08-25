import re
import sys


src = sys.argv[1]

with open(src) as f:
    for line in f:
        m = re.match(r'^-- include "([^"]+)"', line)
        if m is not None:
            libname = m.group(1)
            with open(libname) as ff:
                content = ff.read()
            sys.stdout.write(content)
        else:
            sys.stdout.write(line)
