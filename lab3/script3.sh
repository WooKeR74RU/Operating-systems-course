#!/bin/bash

ps -A -o pid,command --no-headers | grep -E "[[:space:]]/sbin/" | awk '{ print $1 }' > res3.txt

