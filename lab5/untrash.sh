#!/bin/bash

if [[ $# -ne 1 ]]
then
	echo "One argument expected"
	exit 1
fi
if [[ ! -d ~/.trash ]]
then
	echo ".trash does not exist"
	exit 1
fi
if [[ (! -e ~/.trash.log) ]]
then
	echo ".trash.log does not exist"
	exit 1
fi

cd ~/.trash
isFound=false
for str in $(grep -h $1 ~/.trash.log)
do
	origName=$(echo $str | cut -f1 -d ':')
	cloneName=$(echo $str | cut -f2 -d ':')
	if [[ -e ./$cloneName ]]
	then
		echo "Date of remove: $(date --date=@$cloneName)"
		echo "Restore this file? (y/n)"
		read answer
		case $answer in
			[Yy])
				isFound=true
				break
				;;
			[Nn])
				;;
		esac
	fi
done

if [[ $isFound == false ]]
then
	echo "This file does not exist in trash can or you didn't select anything"
	exit 1
fi

if [[ -d $(dirname $origName) ]]
then
	ln $cloneName $origName
	echo "File restored"
else
	ln $cloneName ~/$1
	echo "$(dirname $origName) has been removed"
	echo "File restored to home directory"
fi

sed -i "/$1/d" ~/.trash.log
rm $cloneName

