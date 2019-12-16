#!/bin/bash

if [[ $HOME == $PWD ]]
then
	echo $HOME
	exit 0
else
	echo "Paths are different, but you are always welcome home :3"
	exit 1
fi

