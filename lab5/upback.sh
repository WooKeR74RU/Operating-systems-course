#!/bin/bash

backupName=$(ls ~ | grep "^Backup-" | tail -n1)
for file in $(ls ~/$backupName | grep -Evh ".[0-9]{4}-[0-9]{2}-[0-9]{2}$")
do
	cp ~/$backupName/$file ~/restore/$file
done

