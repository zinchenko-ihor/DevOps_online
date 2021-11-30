<h4 align="center"> 
  <img alt="DATABASES" src="https://commons.bmstu.wiki/images/b/be/Linux-3_6.png" width="500"> 
</h4>
<h2 align="center"> Linux Essentials </h2>

***Result of task 5.1*** <br>

<details><summary>PART 1</summary><br>
1. Log in to the system as root user. <br>
  
```  
sudo su
```
2. Password change is performed using the passwd utility. This is a very powerful utility, it allows you not only to change your password, but also to manage its lifetime and see the status of passwords. More information can be found <a href="https://losst.ru/kak-smenit-parol-v-linux">here.</a> <br>
The command 'passwd' makes changes to such files after executing:<br>
```
/etc/passwd - user accaunts information; 
/etc/shadow - passwords are stored here encrypted;
/etc/pam.d/passwd - Pluggable  Authentication Modules(PAM) for passwd.
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Root_chng_psswd.png"> <br>
  
3. The Linux user list is stored in the /etc/passwd file, you can easily open it and view it using the following commands: <br>
```
cat /etc/passwd
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Determine_users.png"> <br>
  
  There is too much extra data in the / etc / passwd file, if you only want usernames, you can filter the output:<br>
```
sed 's/:.*//' /etc/passwd
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Filter_user.png"> <br>
  
  To see what users are currently active in the system, and what commands they execute. There is a utility "w" for this.You can also use the commands "finger" and "who".
  In addition, you can view the history of user logins. For this, there is the "last" command, it displays information based on the /var/wtmp log and you can see the last login date for each user using the "lastlog" command:
```
w - what users are currently active in the system;
last -a - history of user logins;
lastlog - last login date for each user.
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Active_user.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/last_a.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/lastlog.png"> <br>
  
4. Change personal information about yourself. You can also use the commands "chfn".<br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Change_info_chfn.png"> <br>
  
5. If we need command information, we refer to the Linux help system and the "man" and "info" commands.
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/MAN_passwd.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/MAN_finger.png"> <br>
  For example:
```
man passwd
  
OPTIONS:
       -a, --all
           This option can be used only with -S and causes show status for all
           users.
       -d, --delete
           Delete a user's password (make it empty). This is a quick way to
           disable a password for an account. It will set the named account
           passwordless.
       -e, --expire
           Immediately expire an account's password. This in effect can force
           a user to change their password at the user's next login.
       -h, --help
  
man finger
  
Options:
     -s    Finger displays the user's login name, real name, terminal name and
           write status (as a ``*'' after the terminal name if write permis‐
           sion is denied), idle time, login time, office location and office
           phone number.
     -l    Produces a multi-line format displaying all of the information de‐
           scribed for the -s option as well as the user's home directory,
           home phone number, login shell, mail status, and the contents of
           the files “.plan”, “.project”, “.pgpkey” and “.forward” from the
           user's home directory.
     -p    Prevents the -l option of finger from displaying the contents of
           the “.plan”, “.project” and “.pgpkey” files.

     -m    Prevent matching of user names.  User is usually a login name; how‐
           ever, matching will also be done on the users' real names, unless
           the -m option is supplied.  All name matching performed by finger
           is case insensitive.
```

6. Explore the more and less commands using the help system. View the contents of files .bash* using commands. <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/MAN_less.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/MAN_more.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Less_s_bashrc.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/More_s_bashrc.png"> <br>
  
7. To read the documentation for the finger command, you must run the command:
```
man finger
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/MAN_finger.png"> <br>

8. List the contents of the home directory using the "ls" command, define its files and directories. <br>
```
ls -la
ls -lsh --group-directories-first

-l - use a long listing format
-a - --all (do not ignore entries starting with)
-s - --size (print the allocated size of each file, in blocks)
-h - --human-readable (with -l and -s, print sizes like 1K 234M 2G etc)
     --group-directories-first (group directories before files)
```
</details>

<details><summary>PART 2</summary><br>
1. Examine the tree command. Master the technique of applying a template, for example, display all files that contain a character c, or files that contain a
specific sequence of characters. List subdirectories of the root directory up to and including the second nesting level. <br>
  
```
  sudo apt install tree
  sudo tree -d  
  sudo tree -L 2 -P '*c*'
  -d - List directories only
  -L - level (Max display depth of the directory tree, argument 2 - second level)
  -P - pattern (List  only  those files that match the wild-card pattern. In this example argument '*c*' - display all files that contain a character c)
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/tree.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/tree_L.png"> <br>
  
2. What command can be used to determine the type of file (for example, text or binary)? Give an example.
  The "find" command is used to determine the type of files:<br>
```
  file dump_from_RDS.sql
  file .gitconfig
  file mysql-apt-config_0.8.15-1_all.deb
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/File_command.png"> <br>
  
3. Master the skills of navigating the file system using relative and absolute paths. How can you go back to your home directory from anywhere in the filesystem?<br>
  To return to your home directory from anywhere in the file system, you need to run the commands:<br>
```
Relative path:
  cd ~  
  cd $home
  
Absolute path:
  cd /home/devops
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/cd.png"> <br>
  
4. Become familiar with the various options for the ls command. Give examples of listing directories using different keys. Explain the information displayed on
the terminal using the -l and -a switches.<br>
  I answered this question in paragraph 8 of part 1. <br>
  
5. Perform the following sequence of operations:
- create a subdirectory in the home directory;
  ```
  mkdir Task5.1
  ```
- in this subdirectory create a file containing information about directories located in the root directory (using I/O redirection operations);
  ```
  tree -dL 1 > Task5.1/dirinfo.txt
  ```
- view the created file;
  ```
  cat Task5.1/dirinfo.txt
  ```
- copy the created file to your home directory using relative and absolute addressing.
  ```
  cp Task5.1/dirinfo.txt /home/devops/dirinfo_abs_path.txt
  cp Task5.1/dirinfo.txt ~/dirinfo_rel_path.txt
  ```
- delete the previously created subdirectory with the file requesting removal;
  ```
  rm -RI Task5.1
  ```
- delete the file copied to the home directory.
  ```
  rm dirinfo_abs_path.txt dirinfo_rel_path.txt
  ```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/MkDir.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/RM.png"> <br>
  
6. Perform the following sequence of operations:
- create a subdirectory test in the home directory;
  ```
  mkdir test
  ```
- copy the .bash_history file to this directory while changing its name to labwork2;
  ```
  cp .bash_history test/labwork2
  ```
- create a hard and soft link to the labwork2 file in the test subdirectory;
  ```
  ln labwork2 hardlink
  ln -s labwork2 softlink
  ```
- how to define soft and hard link, what do these concepts;
  ```
  In fact, a "hard" link is the same file to which such a "link" goes.
  A symlink or "soft" link is a special type of file that contains a link to another file or directory as an absolute or relative path.
  Hardlink cannot point to a file in another file system (since an inode can only belong to one file system), but a symbolic link can.
  ```
- change the data by opening a symbolic link. What changes will happen and why?
  ```
  When editing a link file, in the case of a hardlink, both files will change, since this is the same object, and in the case of a symlink, 
  you can change its name, attributes, direct it to another file and at the same time the original file will not be affected 
  (but if you open the symlink file for editing, then change the original file, because in fact, you will open it for editing).
  ```
- rename the hard link file to hard_lnk_labwork2;
  ```
  mv hardlink hard_lnk_labwork2
  ```
- rename the soft link file to symb_lnk_labwork2 file;
   ```
  mv softlink soft_lnk_labwork2
  ```
- then delete the labwork2. What changes have occurred and why?
  ```
  rm labwork2
  
  When removing a hard link - the file will exist as long as there is at least 1 hard link to it, but it can "change the location directory" 
  if the "original" file was deleted, but the hard link file remained in a different location. 
  If you delete the file pointed to by the symbolic link, the file-link will simply become inoperative.
  ```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/LNK.png"> <br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/LNK.png"> <br>
  
7. Using the locate utility, find all files that contain the squid and traceroute sequence.<br>
```
  sudo apt install locate -y
  sudo updatedb
  find -A squid
  find -A traceroute
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Locate_squid.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Locate_tracerote.png"> <br>
  
8. Determine which partitions are mounted in the system, as well as the types of these partitions. <br>
  The df linux command allows you to display not only the list of connected devices, but also the occupied space, as well as the mount point.<br>
  ```
  df
  df -h
  ```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/df_8.2.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/df_h.png"> <br> 
  
9. Count the number of lines containing a given sequence of characters in a given file. <br>
```
  less -N test/hatd_lnk_labwork2
  less test/hatd_lnk_labwork2 | wc -l
  
  -N - --LINE-NUMBERS (display line numbers);
  wc - utility for counting the number of lines and words in the text;
  -l - --lines (Print the number of lines in the object).
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/less-N9.2.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/less_wc_9.2.png"> <br>
 
10. Using the find command, find all files in the /etc directory containing the host character sequence. <br>
```
  cd /etc
  sudo find -type f -name '*host*'
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/find.png"> <br>
  
11. List all objects in /etc that contain the ss character sequence. <br>
```
  ls -la | grep "ss"
  -l - output in long format;
  -a - list all files;
  grep - command line utility that finds lines on input that match a given regular expression;
  "ss" - file search key.
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/grep.png"> <br> 
  
12. Organize step by step printing of directory contents /etc. <br>
```
  ls -lah /etc | less
``` 
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/ls_etc_step.png"> <br> 
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/ls_etc_step_by_step.png"> <br> 
  
13. What are the types of devices and how to determine the type of device? Give examples. <br>
The Linux kernel provides support for two types of devices - character and block. Their main difference is that for block devices, input/output operations are carried out in separate bytes (characters), and in blocks of a fixed size.
In Linux, all work with devices is done through special files, which are usually located in the / dev directory. Special files do not contain data, but simply serve as points through which you can access the driver of the corresponding device. Each special file has three characteristics — the device type (character or block), the major number, and the minor number. For example, let's look at the contents of the /dev directory:
```
  ls -lah /dev
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Device.png"> <br>
  
To support device manipulation, the kernel maintains two tables, one for the character device list and the other for the block device list. Each row of the table is mapped to some kind of device of the corresponding type - for example, for the “character devices” type, the following varieties can be distinguished: COM ports, LPT ports, PS / 2 mice, USB mice, etc., for the type “Block devices” can be SCSI-disks, IDE-disks, SCSI-CD-drives, virtual disks of which are RAID controllers, etc.<br>
  
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Charactesr_devices.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Block_devices.png"> <br>
  
14. How to determine the type of file in the system, what types of files are there? <br>
Files in the Linux operating system can be divided into three main types:
- Regular files for storing information - These are files that we are used to working with every day, they can contain text, 
  executable instructions for programs, images or other information;
- Special files - for devices and tunnels - these are files that allow you to configure communication between two processes 
  by redirecting the output of one process to the input of another;
- Directories
  - these are special files that allow others and directories to be grouped together for easier navigation and searching. <br>
Utility "ls" can detect file type in list mode with symbol ^:
```
  ls -la | grep ^- - for Regular files
  ls -la | grep ^d - for Directories
  ls -la | grep ^l - for Link files
  ls -la | grep ^c - for Characters devices
  ls -la | grep ^b - for Block devices
  ls -la | grep ^s - for Local Socket Files
  ls -la | grep ^p - for Named Pipe Files
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/grep_%5Eb_%5Ed.png"> <br>
  
To determine the file type, we can use the "file" command:
```
  cd /dev
  file loop0
  file vcsa
  file vfio
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/file_14.png"> <br>
  
15. List the first 5 directory files that were recently accessed in the /etc directory. <br>
  ```
  ls -ltr /etc | tail -n5
  -l - output in long format;
  -t - file names are sorted by time (most recent files come first);
  -r - if the -t flag is present, output older files first;
  tail - linux command used to print the N-th number of last lines or files.;
  -n - number of the last files.
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/15.png"> <br>
