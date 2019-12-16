#!/bin/bash

backupName=Backup-$(date +%Y-%m-%d)
isUpdate=false
for ((i = 0; i < 7; i++))
do
	lastBackupName=Backup-$(date --date="$i days ago" +%Y-%m-%d)
	if [[ -d ~/$lastBackupName ]]
	then
		isUpdate=true
		break
	fi
done

if [[ $isUpdate == false ]]
then
	mkdir ~/$backupName
	cp ~/source/* ~/$backupName
	echo "Backup created. Date: $(date). Files:" >> ~/backup.report
	ls ~/$backupName >> ~/backup.report
else
	addedList=''
	updatedList=''
	echo "Backup updated. Date: $(date). Files:" >> ~/backup.report
	for file in $(ls ~/source)
	do
		if [[ ! -e ~/$lastBackupName/$file ]]
		then
			cp ~/source/$file ~/$lastBackupName/$file
			addedList="$addedList\n$file"
		else
			prevSize=$(ls -o ~/$lastBackupName/$file | cut -f4 -d ' ')
			curSize=$(ls -o ~/source/$file | cut -f4 -d ' ')
			if [[ $prevSize -eq $curSize ]]
			then
				continue
			fi
			mv ~/$lastBackupName/$file ~/$lastBackupName/$file.$(date +%Y-%m-%d)
			cp ~/source/$file ~/$lastBackupName/$file
			updatedList="$updatedList\n$file $file.$(date +%Y-%m-%d)"
		fi
	done
	echo -e $addedList >> ~/backup.report
	echo -e $updatedList >> ~/backup.report
fi

