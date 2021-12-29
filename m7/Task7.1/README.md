<h2 align="center"> 
  <img alt="Linux administration" src="https://d3mxt5v3yxgcsr.cloudfront.net/courses/2352/course_2352_image.png?v=1639360962" width="400"> 
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

<details><summary>Part C</summary><br>
1. Create a data backup script that takes the following data as parameters: <br> 
   - Path to the syncing directory. <br>
   - The path to the directory where the copies of the files will be stored. <br>
In case of adding new or deleting old files, the script must add a corresponding entry to the log file indicating the time, type of operation and file name. [The command to run the script must be added to crontab with a run frequency of one minute]. <br>
	
```
#!/bin/bash
####################################
#                     Backup script.                        #
####################################

#IFS is needed for bash to recognize spaces
IFS=$'\n'

# What to backup. 
backup="/home/devops/Task7.1"

# Where to backup to.
dest="/home/devops/Backup"

#Temp folder
tmp="/home/devops/TMP"

# Start logging
LOGFILE="/home/devops/Task7.1/backup.log"
echo -e "Cron job started at $(date +"%m/%d/%Y %r")\r" >> $LOGFILE

# Check if $dest folder for backup exitsts
if [ -d "$dest" ]
then
    echo -e "Current directory $dest\r" >> $LOGFILE
else
    echo -e "$dest does not exist!\r" >> $LOGFILE
    echo -e "Trying to create backup directory." >> $LOGFILE
    mkdir /home/devops/Backup
    echo -e "Backup directory created!" >> $LOGFILE

fi

# Check if $tmp folder exitsts
if [ -d "$tmp" ]
then
    echo -e "Current directory $tmp\r" >> $LOGFILE
else
    echo -e "$tmp does not exist!\r" >> $LOGFILE
    echo -e "Trying to create temp folder." >> $LOGFILE
    mkdir /home/devops/TMP
    echo -e "Temp folder created!" >> $LOGFILE

fi

#Check change of backup folder
DIFF=$(diff $backup $tmp)
if [ "$DIFF" != "" ]
then
    echo "$day"
    echo "Change detected in this folder." >> $LOGFILE
    diff -r -q $backup $tmp/

# Find and remove old files.
    find $dest -type f -name "*Backup*" -print0 | xargs -0 rm -rf
   
# Find and print modification file
    find $dest -type f -mmin -1  -print0

    echo "Copy the content to a temporary folder" >> $LOGFILE
    cp -r /home/devops/Task7.1/* /home/devops/TMP
else
    echo "$day"
    echo "Change is absent." >> $LOGFILE
fi

# Create archive filename.
day=$(date +%Y_%m_%d_%H_%M)
backname="Backup"

archive_file="$backname-$day.tgz"

# Print start status message.
echo "Backing up $backup to $dest/$archive_file" >> $LOGFILE
date
echo

# Backup the files using tar.
tar -czf $dest/$archive_file $backup

# Print end status message.
echo
echo "Backup finished" >> $LOGFILE
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest

# Finish logging
echo -e "\r" >> $LOGFILE
echo -e "Cron job exiting at $(date +"%m/%d/%Y %r")\r" >> $LOGFILE
echo -e "----------------------------------------------------------------------\r" >> $LOGFILE
```

   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m7/Task7.1/IMG/backup_log_C.png"><br>
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m7/Task7.1/IMG/cron1.png"><br>
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m7/Task7.1/IMG/cron2.png"><br>
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m7/Task7.1/IMG/cron_work.png"><br>
</details>
