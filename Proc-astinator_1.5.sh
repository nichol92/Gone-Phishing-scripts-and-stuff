#! /bin/bash
function proc # this function takes not of the current directory and then switches to proc
{
#directory="$(pwd)" # finds out where the script is being run from : code may be useful in the future
cd ../../../.. #changes the directory to proc
cd /proc/
options 
}
function options
{
echo "======================================"
echo "-----------proc-astinator-------------"
echo "======================================"
echo '[*] Type "help" for a list of commands'
# lets the user type a command and then selects and runs the corresponding function
read com
case $com in
help)
	echo "sys [returns infotmation on the OS version, filesystems, partitions]" 
	echo "hardw [returns information on the Cpu,  ioports, primary memory and pci devices]" 
	echo "pm [returns a list of all the currently running process with there PID, name and state] "
	echo "close [ends the script]"
	options
	;;
sys)
	sys
	;;
hardw)
	hardw_info
	;;
pm)
	primary_mem
	;;
close)
	exit
	;;

esac
echo "sys [returns infotmation on the OS version, filesystems, partitions]" 
echo "hardw [returns information on the Cpu,  ioports, primary memory and pci devices]" 
echo "pm [returns a list of all the currently running process with there PID, name and state] "
echo "close [ends the script]"
options
}


function primary_mem 
{
echo "*-----Proccesses----------*"
IFS=$'\n'	
arr=($(ls))	# reads all the results from ls into an area and ignore's any spaces
for i in "${arr[@]}" # cycles through all the elements in the array
do
#prints all of the process PID's name and there current state from the proc directory
 if [[ $i =~ [0-9] ]] 
	then
		if [ -d "$i" ]; then
		cd $i
		name=$(head -n 1 status)
		state=$(sed '2q;d' status)
		echo 'PID:' $i $name  $state #prints the string if its an integer, if its not the sting is ignored.
		cd ..
				fi
	fi
done
echo ""
echo "======================================"
echo "-------Processes-usage----------------"
echo "======================================"
echo "press ctrl + c to return to the script"
echo ""
top #runs the top command


echo "======================================"
echo "------Thats-everything-here--:)-------"
echo "======================================"
echo ""

options

}
function hardw_info
{
echo "*-------Hardware-information---------*"
echo ""
echo "======================================"
echo "-------CPU-information----------------"
echo "======================================"
echo ""
cat cpuinfo # retrieves all the information from the cpuinfo file in proc
echo '------average load of the cpu---------'
echo ""
cat loadavg # retrieves all the information from the loadavg file in proc

echo "======================================"
echo "---------Connected-Devices------------"
echo "======================================"
echo ""
cat devices # retrieves all the information from the devices file in proc

echo "======================================"
echo "---------i/o-ports--------------------"
echo "======================================"
echo ""
cat ioports # retrieves all the information from the ioports file in proc
echo "======================================"
echo "---------memory-information-----------"
echo "======================================"
echo ""
cat meminfo # retrieves all the information from the meminfo file in proc

echo "======================================"
echo "--------i/o-memory-ranges-------------"
echo "======================================"
echo ""
cat iomem # retrieves all the information from the iomem file in proc

echo "======================================"
echo "------Thats-everything-here--:)-------"
echo "======================================"
echo ""

options #returns to start of program

}
function sys
{
echo "*------system-information------------*"
echo ""
echo "======================================"
echo "------OS-version----------------------"
echo "======================================"
echo ""
cat version # retrieves all the information from the version file in proc

echo "------system-uptime-------------------"
echo ""
cat uptime # retrieves all the information from the uptime file in proc

echo "======================================"
echo "---------File-systems-----------------"
echo "======================================"
echo ""
cat filesystems # retrieves all the information from the filesystems file in proc

echo "======================================"
echo "-----------Partitions-----------------"
echo "======================================"
echo ""
cat partitions # retrieves all the information from the partitions file in proc

echo "======================================"
echo "------Thats everything here--:)-------"
echo "======================================"
echo ""

options #returns to the start of the program

}
proc # starts the proc function
function dev #this is will contain nishan's code
{
	echo "Under construction"
}


