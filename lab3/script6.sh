#!/bin/bash

prevPpid='0'
ascopi='0'
count='0'

cp /dev/null res6.txt
./script5.sh
IFS=$'\n'
for str in $(cat res5.txt)
do
	curPpid=$(echo $str | grep -E -o 'Parent_ProcessID=[0-9]+' | grep -E -o '[0-9]+')
	if [[ $prevPpid -ne $curPpid ]]
	then
		ascopi=$(echo $ascopi $count | awk '{ print $1/$2 }')
		echo "Average_Sleeping_Children_of_ParentID=$prevPpid is $ascopi" >> res6.txt
		prevPpid=$curPpid
		ascopi='0'
		count='0'
	fi
	avgSleeping=$(echo $str | grep -E -o 'Average_Sleeping_Time=[0-9.]+' | grep -E -o '[0-9.]+')
	ascopi=$(echo $ascopi $avgSleeping | awk '{ print $1+$2 }')
	let count+=1
	echo $str >> res6.txt
done

