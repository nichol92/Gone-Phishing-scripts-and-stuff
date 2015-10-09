#! /bin/bash
directory="$(pwd)"
cd ../../../..
cd /proc/
mkdir "${directory}"/procinfo 2>/dev/null
ls >  "${directory}"/procinfo/ls.txt 2>/dev/null
grep -Eo '[0-9]{1,4}' "${directory}"/procinfo/ls.txt >  "${directory}"/procinfo/PID.txt
readarray a <  "${directory}"/procinfo/PID.txt
echo "Printing all the PID's of the currently running process's "
sleep 2
for i in {$a[@]};
do
		printf '%s'  "${a[@]}"
done


