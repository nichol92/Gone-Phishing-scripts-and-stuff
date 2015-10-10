#! /bin/bash
function proc # this function takes not of the current directory and then switches to proc
{
directory="$(pwd)" # finds out where the script is being run from
cd ../../../.. #changes the directory to proc
cd /proc/
primary_mem # runs this function
}
function primary_mem 
{

IFS=$'\n'	
arr=($(ls))	# reads all the results from ls into an area and ignore's any spaces
for i in "${arr[@]}" # cycles through all the elements in the array
do
 if [[ $i = [0-9] ]] #checks if the current element is an integer
	then
		echo $i #prints the string if its an integer, if its not the sting is ignored.
	fi
done
}
proc # runs this function


