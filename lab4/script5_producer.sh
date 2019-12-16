#!/bin/bash

cp /dev/null .tmp5

while true
do
	read str
	echo "$str" >> .tmp5
	if [[ $str = 'QUIT' ]]
	then
		break
	fi
done

