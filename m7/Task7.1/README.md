<h2 align="center"> 
  <img alt="Linux administration" src="https://d3mxt5v3yxgcsr.cloudfront.net/courses/2352/course_2352_image.png?v=1639360962" width="350"> 
</h2>
<h2 align="center"> Linux administration with bash </h2>

***Result of task 7.1*** <br>

<details><summary>Part A</summary><br>
1. Create a script that uses the following keys: <br> 
  - When starting without parameters, it will display a list of possible keys and their description. <br>
  - The --all key displays the IP addresses and symbolic names of all hosts in the current subnet. <br>
  - The --target key displays a list of open system TCP ports. <br>
The code that performs the functionality of each of the subtasks must be placed in a separate function. <br>
	
```
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
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m7/Task7.1/IMG/result_A.png"><br>
	
</details>

<details><summary>Part B</summary><br>
1. Using Apache log example create a script to answer the following questions: <br>
  - From which ip were the most requests? <br>
  - What is the most requested page? <br>
  - How many requests were there from each ip? <br>
  - What non-existent pages were clients referred to? <br>
  - What time did site get the most requests? <br>
  - What search bots have accessed the site? (UA + IP) <br>
	
```
#!/bin/bash

#Show from which ip were the most requests
echo "1. This ip-address completed the most request:"
	less /home/devops/Task7.1/apache_logs.txt | cut -d' ' -f1 | sort | uniq -c | sort -n | tail -n 1

#Show what is the most requested page?
echo "2. This TOP 5 pages is the most requested:"
	tail -5000 /home/devops/Task7.1/apache_logs.txt | awk '{print $7}' | sort | uniq -c | sort -rn | head -5

#How many requests were there from each ip?
echo "3. The following number of requests were made from each ip address:"
	less /home/devops/Task7.1/apache_logs.txt | cut -d' ' -f1 | sort | uniq -c

#What non-existent pages were clients referred to?
echo "4. The number of non-existent pages that clients referred to:"
	grep "error404 " /home/devops/Task7.1/apache_logs.txt | awk '{print $7}' | cut -d ' ' -f 7 | sort | uniq -c | sort -nr

# What time did site get the most requests? 
echo "5. The site received the most requests at this time:"
	less /home/devops/Task7.1/apache_logs.txt | awk '{print $4}' |tr -d '[' | sort | uniq -c | sort -gr | head -n 10

# What search bots have accessed the site? (UA + IP)?
echo "6. Such search bots visited the site"
	grep "bot" /home/devops/Task7.1/apache_logs.txt | awk -F\" '{ print $6 }' | sort | uniq -c | head -n 10
```
	
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m7/Task7.1/IMG/result_B.png"><br>
</details>

