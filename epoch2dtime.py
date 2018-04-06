#!/usr/bin/env python

import sys
import datetime

timestamp = sys.stdin.readline()
dtime = datetime.datetime.fromtimestamp(float(timestamp))
print(dtime.strftime('%Y-%m-%d %H:%M:%S'))
