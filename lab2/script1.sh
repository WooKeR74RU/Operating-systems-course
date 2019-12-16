#!/bin/bash

# -r - read all files recursively
# -h - no filename
# -s - no messages
# -E - extended regular expression

grep -r -h -s -E '^ACPI' '/var/log/' > errors.log
grep -r -h -s -E '[A-Za-z0-9: ~@#$%^_(){}]\.[A-Za-z0-9: ~@#$%^_(){}]' errors.log

