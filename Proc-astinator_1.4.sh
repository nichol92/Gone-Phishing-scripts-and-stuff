#! /bin/bash
function proc # this function takes not of the current directory and then switches to proc
{
directory="$(pwd)" # finds out where the script is being run from
cd ../../../.. #changes the directory to proc
cd /proc/
options
}
function options
{
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
echo "*----Current-Proccesses-info---------*"
IFS=$'\n'	
arr=($(ls))	# reads all the results from ls into an area and ignore's any spaces
for i in "${arr[@]}" # cycles through all the elements in the array
do
 if [[ $i =~ [0-9] ]] #checks if the current element is an integer
	then
		if [ -d "$i" ]; then
		cd $i
		name=$(head -n 1 status)
		state=$(sed '2q;d' status)
		echo 'PID:' $i $name $state #prints the string if its an integer, if its not the sting is ignored.
		cd ..
				fi
	fi
done
echo ""

echo "======================================"
echo "------Thats-everything-here--:)-------"
echo "======================================"
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
cat cpuinfo
echo '------average load of the cpu---------'
echo ""
cat loadavg
echo "======================================"
echo "---------Connected-Devices------------"
echo "======================================"
echo ""
cat devices
echo "======================================"
echo "---------i/o-ports--------------------"
echo "======================================"
echo ""
cat ioports
echo "======================================"
echo "---------memory-information-----------"
echo "======================================"
echo ""
cat meminfo
echo "======================================"
echo "--------i/o-memory-ranges-------------"
echo "======================================"
echo ""
cat iomem
echo "======================================"
echo "------Thats-everything-here--:)-------"
echo "======================================"
options

}
function sys
{
echo "*------system-information------------*"
echo ""
echo "======================================"
echo "------OS-version----------------------"
echo "======================================"
echo ""
cat version
echo "------system-uptime-------------------"
echo ""
cat uptime
echo "======================================"
echo "---------File-systems-----------------"
echo "======================================"
echo ""
cat filesystems
echo "======================================"
echo "-----------Partitions-----------------"
echo "======================================"
echo ""
cat partitions
echo "======================================"
echo "------Thats everything here--:)-------"
echo "======================================"
options

}
echo "======================================"
echo "-----------proc-astinator-------------"
echo "======================================"
echo '[*] Type "help" for a list of commands'

proc # runs this function


