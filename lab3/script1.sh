#!/bin/bash

ps U $USER --no-headers o "%p:%c" | tr -d ' ' > res1.txt
wc -l res1.txt

