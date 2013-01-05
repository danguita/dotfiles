#!/usr/bin/env python

"""
Basic CPU & Memory Usage for Tmux

Author: Zaiste! <oh@zaiste.net>

Dash-meter inspired by tmux-mem-cpu
and code from psutil top.py.
"""

import os
import sys
if os.name != 'posix':
        sys.exit('platform not supported')
import psutil


def get_dashes(perc):
    dashes = "|" * int((float(perc) / 10))
    empty_dashes = " " * (10 - len(dashes))
    return dashes, empty_dashes


def info():
    phymem = psutil.phymem_usage()

    line = "RAM %s%% CPU %s%%" % (
        str((phymem.used * 100) / phymem.total),
        psutil.cpu_percent(interval=0.1),
    )

    return line


def main():
    try:
        print info()
    except (KeyboardInterrupt, SystemExit):
        pass

if __name__ == '__main__':
    main()
