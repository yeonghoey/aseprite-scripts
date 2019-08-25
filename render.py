import re
import sys


def main():
    src = sys.argv[1]
    for line in render(src):
        sys.stdout.write(line)


def render(src):
    stack = [src]

    def dump():
        path = stack[-1]
        with open(path) as f:
            for line in f:
                path1 = parse_include(line)
                if path1 is None:
                    yield line
                    continue
                if path1 in stack:
                    continue
                stack.append(path1)
                for line1 in dump():
                    yield line1

    for line in dump():
        yield line


def parse_include(line):
    m = re.match(r'^--#include "([^"]+)"', line)
    if m is not None:
        return m.group(1)
    else:
        return None


if __name__ == '__main__':
    main()
