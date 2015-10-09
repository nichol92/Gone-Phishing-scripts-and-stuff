#! /bin/bash
directory="$(pwd)"
cd ../../../..
cd /proc/
mkdir "${directory}"/procinfo
ls >  "${directory}"/procinfo/ls.txt
readarray a < "${directory}"/procinfo/ls.txt
echo 'printing all the items inside proc.....'
sleep 2
for i in {$a[@]};
do

	printf '%s'  "${a[@]}"
done

