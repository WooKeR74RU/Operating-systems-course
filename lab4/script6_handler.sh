#!/bin/bash

termination()
{
	echo "SIGTERM received -> Termination"
	exit
}

trap 'termination' SIGTERM

val=0
while true
do
	echo $val
	let val+=1
	sleep 1
done

