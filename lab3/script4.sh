#!/bin/bash

result=''
for curId in $(ps -A -o pid --no-headers)
do
diff=$(cat /proc/$curId/statm 2> /dev/null | awk '{ print $2 - $3 }')
if [[ -z $diff ]]
then
	continue
fi
result=$result$curId': '$diff'\n'
done
echo -e $result | sort -n -r -k2 > res4.txt

