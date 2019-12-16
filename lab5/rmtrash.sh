#!/bin/bash

if [[ $# -ne 1 ]]
then
	"One argument expected"
	exit 1
fi

filename=$1
if [[ ! -e $filename ]]
then
	echo "File does not exist"
	exit 1
fi
if [[ -d $filename ]]
then
	echo "It is directory"
	exit 1
fi

trash=~/.trash
if [[ ! -d $trash ]]
then
	mkdir $trash
fi

cloneName=$(date +%s)
ln $filename $trash/$cloneName
rm $filename

log=~/.trash.log
touch $log
echo "$PWD/$filename:$cloneName" >> $log

