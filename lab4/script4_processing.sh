#!/bin/bash

while true
do
	a=$RANDOM
	b=$RANDOM
	let p=$a*$b
	echo $a x $b = $p
#	sleep 1
done

