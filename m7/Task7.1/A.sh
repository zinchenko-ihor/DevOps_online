#!/bin/bash

#When starting without parameters, it will display a list of possible keys and their description. 
if [[ "$#" == "0" ]]
then
	echo "Actial arguments for this script:"
	echo -e "\033[33m To displays the IP addresses and symbolic names of all hosts in the current subnet use --all key."
	echo -e "\033[35m To displays a list of open system TCP ports use --target key."
	echo -e "\033[0m"
	exit 0
fi

#Function of listenong TCP ports on host

function list_ports
{
	echo "This TCP-ports are open:"
	ss -at | sort -h
}

#Function of displaying ip-addresses and names in network
function scannet 
{
	#function for check if NMAP is installed
	test -e /usr/bin/nmap
	if [[ "$?" == "0" ]]
	then
		echo "NMAP is installed. Scan network now..."
	else
		echo "NMAP is not installed. Install NMAP now..."
		sudo apt install nmap -y
	fi

 
#Scan network with NMAP
	echo "Next hosts are located on this network"
	nmap -sP 192.168.83.*/24 
}

#Check input parametrs
if [[ "$1" == "--target" ]]
then 
	list_ports
elif [[ "$1" == "--all" ]]
then
	scannet
fi
