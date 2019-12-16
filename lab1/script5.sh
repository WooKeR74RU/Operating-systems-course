#!/bin/bash

echo "1. Nano"
echo "2. Vi"
echo "3. Links"
echo "4. Quit"
read key
case $key in
	1) exec nano ;;
	2) exec vi ;;
	3) exec links ;;
	4) echo "Bye!" ;;
esac

