#! /bin/bash
# this code gets the directory that the script is being run from
# and then it enters the proc folder. it also writes any errors that occours to /dev/null
main ()
{
directory="$(pwd)"
cd ../../../..
cd /proc/
mkdir "${directory}"/procinfo 2>/dev/null
}
primary_mem ()
{
# this code writes all of the PID's in the proc folder to a new file and prints them out
ls >  "${directory}"/procinfo/ls.txt 2>/dev/null
# selects and creates a file for all of the PID's
grep -Eo '[0-9]{1,4}' "${directory}"/procinfo/ls.txt >  "${directory}"/procinfo/PID.txt
#Reads all of the PID's into an array called 'a'
readarray a <  "${directory}"/procinfo/PID.txt
#prints the statment hand waits 2 seconds before executing the rest of the code
echo "Printing all the PID's of the currently running process's "
sleep 2
#prints all the PID's
for i in {$a[@]};
do
		printf '%s'  "${a[@]}"		
done

}
#functions that need to be coded 
sys_info ()
{
}
Hardware_viewer ()
{
}
Secondary_mem ()
{
}
IO_device ()
{
}
#code to help me remeber what i need to do next
#cd /proc/1
#cat status


