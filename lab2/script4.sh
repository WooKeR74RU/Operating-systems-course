#!/bin/bash

for fl in $(ls '/bin')
do
	if [[ -r "/bin/$fl" && -x "/bin/$fl" ]]
	then
		grep -o -E '^#!.+' "/bin/$fl"
	fi
done |
sort | uniq -c | sort -n -k1 | tail -n 1 | awk '{ print $2 }' | tr -d '#!'

