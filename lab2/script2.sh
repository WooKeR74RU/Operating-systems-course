#!/bin/bash

grep -E -h -s '(WW)' '/var/log/Xorg.0.log' | sed -E "s/(WW)/Warning/g" > full.log
grep -E -h -s '(II)' '/var/log/Xorg.0.log' | sed -E "s/(II)/Information/g" >> full.log
cat full.log

