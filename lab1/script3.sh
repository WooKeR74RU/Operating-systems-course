#!/bin/bash

while true
do
	read s
	if [[ $s == 'q' ]]
	then
		break
	fi
	x=$x$s
done
echo $x

