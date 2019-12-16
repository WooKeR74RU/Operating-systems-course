#!/bin/bash

while true
do
	read str
	case $str in
		'+')
			kill -USR1 $(pidof -x script7_handler.sh)
		;;
		'*')
			kill -USR2 $(pidof -x script7_handler.sh)
		;;
		'TERM')
			kill $(pidof -x script7_handler.sh)
			break
		;;
	esac
done

