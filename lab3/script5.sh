#!/bin/bash

for pid in $(ps -A -o pid --no-headers)
do
	ppid=$(grep -E -h -s -i "ppid:" "/proc/$pid/status" | grep -o "[0-9]\+")
	avgSleeping=$(grep -E -h -s -i "avg_atom" "/proc/$pid/sched" | grep -o "[0-9.]\+")	
	if [ -z $ppid -o -z $avgSleeping ]
	then
		continue
	fi
	echo $pid $ppid $avgSleeping
done |
sort -n -k2 | awk '{ print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Sleeping_Time="$3 }' > res5.txt

