#!/bin/bash

count=0
while true
do
	read num
	if [[ num%2 -eq 0 ]]
	then
		break
	fi
	let count+=1
done
echo $count

