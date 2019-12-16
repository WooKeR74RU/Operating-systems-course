#!/bin/bash

ps -A -o pid,stime --no-headers | sort -k2 | head -n 1 | awk '{ print $1 }'

