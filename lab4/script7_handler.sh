#!/bin/bash

mode='+'
val=1

termination()
{
	echo "SIGTERM received -> Termination"
	exit
}
chmod1()
{
	mode='+'
}
chmod2()
{
	mode='*'
}
trap 'termination' SIGTERM
trap 'chmod1' USR1
trap 'chmod2' USR2

while true
do
	if [[ $mode = '+' ]]
	then
		let val+=2
	else
		let val*=2
	fi
	echo $val
	sleep 1
done

