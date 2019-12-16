#!/bin/bash

mkdir ~/test && echo "catalog test was created successfully" > ~/report.txt && touch ~/test/$(date '+%d.%m.%y_%H:%M:%S')
ping -c 1 www.net_nikogo.ru || echo "error: unknown host" >> ~/report.txt

