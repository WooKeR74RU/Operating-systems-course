#!/bin/bash

# -i - ignore case
# -o - only matching
# -w - word regular expression

grep -r -h -s -E -i -I -o -w '[a-z0-9_\.\-]+@[a-z0-9_\.\-]+\.[a-z]+' '/etc/' | sed -E "s/$/,/g" | tr '\n' ' ' > emails.lst

paste -d' ' <(cut -d' ' -f1 full.log) <(cat emails.lst | sed 's/, /\n/g') <(cut -d' ' --complement -f1 full.log) > res.log

