#!/bin/bash

cut -d ':' -f 1,3 --output-delimiter=' ' '/etc/passwd' | sort -n -k2

