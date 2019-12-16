#!/bin/bash

while true
do
	read str
	if [[ $str == 'TERM' ]]
	then
		kill $(pidof -x script6_handler.sh)
		break
	fi
done

