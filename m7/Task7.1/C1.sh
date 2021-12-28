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
