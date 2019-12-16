#!/bin/bash

mode='+'
curRes=1

(tail -n 0 -f .tmp5) |
while true
do
	read str
	case $str in
		'+')
			mode='+'
			echo "Addition mode"
		;;
		'*')
			mode='*'
			echo "Multiplication mode"
		;;
		'QUIT')
			exit
		;;
		*[!0-9]* | '')
			echo 'Invalid input'
			exit
		;;
		*)
			prevRes=$curRes
			if [[ $mode = '+' ]]
			then
				let curRes=$prevRes+$str
			else
				let curRes=$prevRes*$str
			fi
			echo "$prevRes $mode $str = $curRes"
		;;
	esac
done

