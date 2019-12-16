#!/bin/bash

man bash | tr "[A-Z]" "[a-z]" | grep -o -i -w "[a-z]\{4,\}" | sort | uniq -c | sort -r -n | head -3

