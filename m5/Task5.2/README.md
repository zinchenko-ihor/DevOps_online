<h4 align="center"> 
  <img alt="DATABASES" src="https://commons.bmstu.wiki/images/b/be/Linux-3_6.png" width="500"> 
</h4>
<h2 align="center"> Linux Essentials </h2>

***Result of task 5.2*** <br>

<details><summary>TASK 2</summary><br>
1. Analyze the structure of the /etc/passwd and /etc/group file, what fields are present in it, what users exist on the system? Specify several pseudo-users, how to define them. <br>
  /etc/passwd - a file containing a list of user accounts (accounts) in text format. It is the first and main source of information about operating system user rights.<br> 
  
  ```  
  login : password : UID : GID : GECOS : home : shell 
  ```
Each line of the file describes one user and contains seven fields, separated by colons:
- registration name or login - The string you enter when you log in. Each username must be a unique string on the computer;
- password hash - On older Linux systems, the user's encrypted password was stored in the /etc/passwd file. 
On most modern systems, this field is set to x, and the user's password is stored in the /etc/shadow file;
- user ID - a user ID is a number assigned to each user. It is used by the operating system to communicate with the user;
- default group ID - The user's group ID number that belongs to the user's primary group. When the user creates a file, the group of the file is set to that group;
- information field GECOS - This field contains a comma-separated list of values with the following information (User's full name or application name.Room number.
Work phone number. Home phone. Other contact information;
- the initial (aka home) directory - The absolute path to the user's home directory. It contains user and config files;
- login shell, or shell - The absolute path to the user's login shell. It is a shell that starts when the user logs in.<br>
  
The main purpose of /etc/passwd is to match a username and a user identifier (UID). Initially, the password field contained a password hash and was used for authentication. However, due to the increase in the computing power of processors, 
there is a serious threat of using a simple brute-force attack to crack a password. Therefore, all passwords have been moved to special files such as /etc/shadow on GNU / Linux or /etc/master.passwd on FreeBSD. 
These files are not readable by ordinary users. This approach is called a hidden password mechanism.
The /etc/passwd file is a text file with one entry per line representing the user account. To view the contents of a file, use a text editor or, for example, the cat command:
  
```
 cat /etc/passwd
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/passwd_cat_devops.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/cat_etc_passwd.png"><br>
/etc/group contains entries for all groups on the system. Each of its lines contains:
- the symbolic name of the group - by default, when a new user is created, his group is also created with the same name as the user's login name;
- the group password is an obsolete field and is currently not used. It usually contains an "x";
- group ID, or GID;
- list of member names, separated by commas.
Recording example:
```
  bin:x:1:root,bin,daemon
```
To view the contents of a file, use a text editor or, for example, the cat command:
```
cat /etc/group
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/etc_cat_group.png"><br>
Pseudo user accounts are designed to run certain applications or own certain files. For example: syslog, tcpdump, proxy, daemond, etc.
  
2. What are the uid ranges? What is UID? How to define it?<br>
UID stands for User ID. The UID is the number assigned to every Linux user. This is the user view in the Linux kernel.
The UID is used to identify the user on the system and to determine which system resources the user can access. This is why the user ID must be unique.<br>
You can find the UID in the / etc / passwd file. This is the same file that you can use to list all users on a Linux system.
Use Linux command "cat"to view the text file and you will see various information about the users present on your system.
The third field here represents the user ID or UID.<br>  
  
  ```
  cat /etc/passwd
  ```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/UID.png"><br>
  
3. What is GID? How to define it?<br>
A group identifier, often abbreviated to GID, is a numeric value used to represent a specific group.The range of values for a GID varies amongst different systems; at the very least, a GID can be between 0 and 32,767, with one restriction: the login group for the superuser must have GID 0. This numeric value is used to refer to groups in the /etc/passwd and /etc/group files or their equivalents. Shadow password files and Network Information Service also refer to numeric GIDs. The group identifier is a necessary component of Unix file systems and processes.<br>
A group identifier, often abbreviated to GID, is a numeric value used to represent a specific group.[1] The range of values for a GID varies amongst different systems; at the very least, a GID can be between 0 and 32,767, with one restriction: the login group for the superuser must have GID 0. This numeric value is used to refer to groups in the /etc/passwd and /etc/group files or their equivalents. Shadow password files and Network Information Service also refer to numeric GIDs. The group identifier is a necessary component of Unix file systems and processes.<br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/GID.png"><br>

4. How to determine belonging of user to the specific group?<br>
Belonging user to specific group can be defined in file etc/passwd where described users name, uid, gid, gecos and etc. 
Also we can determine usergroup with command "groups" and determine a members of groups by command "members":
  ```
  groups devops
  members --all sudo
  ```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/Determinate_group4.png"><br>
  
5. What are the commands for adding a user to the system? What are the basic parameters required to create a user?<br>
To add/create a new user, you’ve to follow the command "useradd" or "adduser" with "username". The ‘username‘ is a user login name, that is used by a user to login into the system.Only one user can be added and that username must be unique (different from other usernames already exists on the system).<br>
  ```
  sudo adduser test
  
  Enter data in this fields
  New password:
  Retype password:
  
  Full name: 
  Room number:
  Work phone:
  Home phone:
  Other:
  ```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/Create_new_user.png"><br>
  
When we run the "useradd" command in the Linux terminal, it does the following basic things:
- it edits the files /etc/passwd, /etc/shadow, /etc/group and /etc/gshadow for the newly created user account;
- creates and populates the home directory for the new user;
- sets permissions and ownership of the home directory. <br>
  
Useradd command options:<br>
```  
  -c, --comment (Any text string. Typically, this is a short description of the account, and is currently used as a field for the user's first and last name); <br>
  -b, --base-dir (The default base directory for the system if -d HOME_DIR is not specified. BASE_DIR is concatenated with the account name to define the home directory. If the -m option is not used, BASE_DIR must exist); <br>
  -D, --defaults (See below, the subsection "Changing the default values"); <br>
  -d, --home (For the user being created, the BASE_DIRECTORY directory will be used as the home directory. By default, this value is obtained by concatenating the username with BASE_DIR, and is used as the name of the home directory); <br>
  -e, --expiredate (The date when the user account will be blocked); <br>
  -f, --inactive (The number of days that must elapse after the password has expired for the account to be permanently locked); <br>
  -g, --gid (The name or numeric identifier of the new initial user group); <br>
  -G, --groups (List of additional groups in which the user is listed); <br>
  -h, --help (Show quick help and exit); <br>
  -m, --create-home (If the user's home directory does not exist, it will be created); <br>
  -K, --key (Used to change the default values stored in the /etc/login.defs file); <br>
  -l --list (Do not add the user to the lastlog and faillog databases); <br>
  -N, --no-user-group (Do not create a group with the same name as the user, but add the user to the group specified by the -g option or by the GROUP variable in /etc/default/useradd); <br>
  -o, --non-unique (Allows you to create an account with an existing (not unique) UID); <br>
  -p, --password (The encrypted password value returned by crypt (3). By default, the account is locked); <br>
  -s, --shell (The name of the user's login shell. If set to empty, the default login shell will be used); <br>
  -u, --uid (The numeric value of the user identifier (ID). It must be unique unless the -o option is used. The value must be non-negative); <br>
  -U, --user-group (reate a group with the same name as the user, and add the user to this group).<br> 
```  
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/Create_new_user1.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/New_users.png"><br>
  
6. How do I change the name (account name) of an existing user? <br>
"Usermod" is a command-line utility that allows you to modify a user’s login information. <br>
  
  ```
  sudo usermod -l [username]
  ```
  Usermod command options:<br>
  ```
  -a, --append (Add user to additional group (s). Use only in conjunction with the -G parameter); <br>
  -c, --comment (The new value for the comment field in the user password file. Usually it is changed with the "chfn" program); <br>
  -d, --home (The home directory of the new user); <br>
  -e, --expiredate (The date when the user account will be blocked); <br>
  -f, --inactive (The number of days that must elapse after the password has expired for an account blocked forever); <br>
  -g, --gid (The name or numeric identifier of the new primary group for the user. Group with such name must exist); <br>
  -G, --groups (List of additional groups in which the user is listed); <br>
  -l, --login (The username will be changed from NAME to NEW_NAME); <br>
  -L, --lock (Block user password); <br>
  -m, --move-home (Move the contents of the home directory to a new location); <br>
  -o, --non-unique (When used with the -u option, this option allows you to specify a non-unique numeric user ID); <br>
  -p, --password (The encrypted password value returned by crypt (3)); <br>
  -R, --root (Make changes in the CAT_CHROOT directory and use the configuration files from the directory CAT_CHROOT); <br>
  -s, --shell (The name of the user's new login shell); <br>
  -u, --uid (new numeric user id);<br>
  -U, --unlock (Unlock user password); <br>
  -v, --add-sub-uids (Add a range of subordinate uids to the user's account); <br>
  -V, --del-sub-uids (Remove a range of subordinate uids from the user's account); <br>
  -w, --add-sub-gids (Add a range of subordinate gids to the user's account); <br>
  -W, --del-sub-gids (Remove a range of subordinate gids from the user's account); <br>
  -Z, --selinux-user (New SELinux user for user login). <br>
  ```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/usermod.png"><br>
  
7. What is skell_dir? What is its structure? <br>
Directory /etc/skel/ (skel is derived from the “skeleton”) is used to initiate home directory when a user is first created. A sample layout of “skeleton” user files is as shown below: <br>
  
  ```
   ls -lart /etc/skel
  ```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/Skel.png"><br>
  
Below is a sample /etc/defualt/useradd file which defines the skel directory. You can change the default location /etc/skel to any other location.
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/Scel_tree.png"><br>
  
Default permission of /etc/skel is drwxr-xr-x. It is not recommended to change the permission of skel directory or its contents.
  
8. How to remove a user from the system (including his mailbox)? <br>
The command "userdel" removes user entries from the /etc/passwd and /etc/shadow files.
In most Linux distributions, when removing a user account with userdel, the user home and mail spool directories are not removed.
Use the -r (--remove) option to force userdel to remove the user’s home directory and mail spool:
  ```
  userdel -r username
  ```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/userdel.png"><br>
  
If the user you want to remove is still logged in, or if there are running processes that belong to this user, the userdel command does not allow to remove the user.
In this situation, it is recommended to log out the user and kill all user’s running processes with the killall command:
  ```
  sudo killall -u username
  ```  
9. What commands and keys should be used to lock and unlock a user account? <br>
The passwd command on Linux works with a user account. You can also use this command for a user account.
The command mainly works with the / etc / passwd file. You can manually modify this file, but we advise against doing this.
To lock a user using the passwd command or usermod command, you can use the -l (-L for usermod) or –lock option as follows:
  ```
  sudo passwd -l user_name
  sudo usermod -L user_name
  ```
You can find out if a user is locked or unlocked using the -S or –status option of the passwd command.
  ```
  sudo passwd -S user_name
  ```
Look at the second field in the output. Here's what it means:
  - P or PS: password set (user unlocked);
  - L or LK: user locked;
  - N or NP: no password required by the user.<br>
To unlock a user with the passwd command or usermod command, you can use the -u (-U for usermod) or –unlock option:
  ```
  sudo passwd -u user_name
  sudo usermod -U user_name
  ```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/Lock_unlock.png"><br>
  
10. How to remove a user's password and provide him with a password-free login for subsequent password change? <br>
To force user for password change is to use the command passwd with -e option and -d option. The -e option expires the current user password forcing user to set a new one on next login. And -d option remove user password (make it blank). This is a quick way to block your account password. This makes the specified account passwordless.
From the man page of passwd command :
  ```
  sudo passwd -de user_name
  ```
 <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/passwd_del.png"><br> 
  
11. Display the extended format of information about the directory, tell about the information columns displayed on the terminal.<br>
  To display the extended directory information format, execute the command:
  ```
  ls -lahi
  -l - --format=long - output (in one-column format) file type, file permissions, number of links to file, owner name, group name, file size (in bytes), timestamp and file name;
  -a --all - include files with names starting with a dot in the list (show hidden files);
  -h --human-readable - add size letter to each file size;
  -i --inode - print the inode number (also called file serial number and index number) of each file to the left of its name.
  ```
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/ls_lahi.png"><br> 
  1 - total size of listed directory;
  2 - inodex index (This number uniquely identifies each file on each file system);
  3 - rights of the files (r-read, w-write, x-execute);
  4 - the number of links to a file/folder;
  5 - unique identifier of the owner (UID);
  6 - group owner id (GID);
  7 - size of object;
  8 - latest creation/modification date;
  9 - file or folder name.
  
12. What access rights exist and for whom (i. e., describe the main roles)? Briefly describe the acronym for access rights.<br>
  Initially, each file had three access parameters. Here they are:
  - Read - allows you to receive the contents of the file, but not for writing. For a directory, allows you to get a list of files and directories located in it;
  - Write - allows you to write new data to a file or modify existing ones, and also allows you to create and modify files and directories;
  - Execution - You cannot execute a program if it does not have an execution flag. This attribute is set for all programs and scripts, it is with the help of it that the system can understand that this file needs to be run as a program.
  
  But all these rights would be meaningless if applied to all users at once. Therefore, each file has three categories of users, for which you can set different combinations of access rights:
  - Owner - a set of rights for the owner of the file, the user who created it or is now set by its owner. Usually the owner has all the rights, read, write and execute.
  - Group - any user group that exists in the system and is associated with a file. However, this can only be one group, and it is usually the owner's group, although a different group can be assigned to a file.
  - Others - all users, except for the owner and users included in the file group.
  
  It is with the help of these sets of permissions that the permissions of files in linux are established. Each user can only get full access to files that he owns or those that he is allowed to access. Only the Root user can work with all files, regardless of their set of permissions.
  What the conditional values of the rights flags mean:<br>
  ```
  --- -no right;
  --x - only execution of the file is allowed as a program, but not modification or reading;
  -w- - only writing and modifying the file is allowed;
  -wx - change and execution are allowed, but in the case of a directory, you cannot see its contents;
  r-- - read-only rights;
  r-x - read only and execute, no write access;
  rw- - read and write permissions, but no execution;
  rwx - all rights;
  --s - the SUID or SGID bit is set, the first is displayed in the field for the owner, the second for the group;
  --t - sticky-bit is installed, which means users cannot delete this file.
  ```
  
13. What is the sequence of defining the relationship between the file and the user? <br>
  The hierarchy of user-level access is broken down as follows: the rights of the owner user, the rights of members of the owner group, and the rights of everyone else.
  Accordingly, for each category, it is indicated what operations with the file are available: read (r), write (w), or execute (x) - for executable files. For directories, the parameters are the same, but they mean a little different: directory browsing (r), creating folders/files (w) inside the directory, switching to the directory (x).
  
14. What commands are used to change the owner of a file (directory), as well as the mode of access to the file? Give examples, demonstrate on the terminal.<br>
  To change file permissions on linux you can use chmod utility. It allows you to change all flags, including special ones. 
  Let's consider its syntax:
```
  chmod <options> <category> <action> <flag> <file>
```
With the -R option, you can force the program to apply changes to all files and directories recursively.
The category indicates for which user group the rights should be applied, as you remember, only three categories are available:
  u - file owner;
  g - file group;
  o - other users.  
The action can be one of two things, either add - sign "+", or remove - sign - "-". As for the permissions themselves, they are similar to the output of the ls utility: r - read, w - write, x - execute, s - suid / sgid, depending on the category for which you set it, t - sets sticky-bit. For example:
```
  chmod ugo+rwx 1.txt - all users full access to the file 1.txt
  chmod go-rw 1.txt - take read and write permissions from the group and other users to the file 1.txt
  chmod u+s 1.txt - For the 1.txt file, set SUID
  chmod g+s 1.txt - For the 1.txt file, set SGID
```
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/chmod.png"><br> 
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/chmod1.png"><br>
  
15. What is an example of octal representation of access rights? Describe the umask command.
  Each of the access levels can be expressed in octal using a numeric value: 4 (r), 2 (w), 1 (x). 
  This is how we get the general scheme of rights:
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/table.png"><br>
  
  Permissions can be expressed not only in the form of a sequence of letters, but also in octal, for example, for -rw-rw-r--, the entry will look like this: 0664. Permissions for a file by default in Linux in octal format are written as 0666, and for the directory 0777. In this case, 0 does not mean anything, and each digit means a set of rights for a specific group. First the owner, then the group, and then everyone else. But thanks to the mask in Linux, by default, the file permissions are set to 0664, and for the directory 0775. It is the setting of these values that the "umask" command affects.
  The "umask" command sets the mask of rights for new files and directories. When creating any file, the operating system asks for a rights mask and calculates the mask based on it. The default mask is 0002. The first digit does not affect anything and is a relic of the C language syntax. Further, the numbers are similar to the access rights in Linux: the first is the owner, the second is the group, and the third is all the rest. This mask is used to calculate file permissions.
In fact, it turns out that the mask contains permissions that will not be set for the file. Therefore, the default permissions for the file will be 666 - 002 = 664, and for the directory - 777 - 002 = 775.<br>
  
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/umask.png"><br> 
  
Utility options:
```
umask -p
umask -S
-p - display the umask command, which, when executed, will set the current mask in octal form;
-S - display the default permissions for the folder in the format u = rwx, g = rwx, o = rwx calculated by the current mask.
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/tree/master/m5/Task5.2/IMG"><br>
  
16. Give definitions of sticky bits and mechanism of identifier substitution. Give an example of files and directories with these attributes.
  The sticky bit was initially introduced to ‘stick’ an executable program’s text segment in the swap space even after the program has completed execution, to speed up the subsequent runs of the same program. However, these days the sticky bit means something entirely different.
  When a directory has the sticky bit set, its files can be deleted or renamed only by the file owner, directory owner and the root user. The command below shows how the sticky bit can be set.
```
  cmod +t [file_name]
```
  To remove the sticky bit, simply use the following command.
```
  cmod -t [file_name]
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/sticky_bit.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/sticky_bit1.png"><br>
  
In order for ordinary users to execute programs on behalf of the superuser, a thing like SUID and SGID bits was invented without knowing his password.
  SUID - if this bit is set, then when the program is running, the id of the user from which it was launched is replaced with the id of the file owner. In fact, it allows regular users to run programs as the superuser;
  GID - This flag works in a similar way, only the difference is that the user is considered a member of the group that the file is associated with, and not the groups to which he actually belongs. If the SGID flag is set to a directory, all files created in it will be associated with the directory group, not the user. This behavior is used to organize public folders.
  Substitution of an identifier in the event that a process starts instead of itself using the exec () system call a program from a file in the access rights of which the user identifier substitution bit is set (SUID-bit, denoted by s in the symbolic notation of access rights). A process launched from this file will receive the executable owner identifier (EUID) of the file instead of the parent process's owner, so the process UID retains information about who actually started the program.
  In modern UNIX systems, there is one more additional attribute - SetGID, a bit of substitution of the group identifier. This mechanism works in exactly the same way as substituting a user ID, with the difference that a process launched from a file with the SetGID attribute receives the group ID of the owner of the file, but its UID remains unchanged. Using SetGID allows you to very flexibly control the escalation situation of a process.
  Of particular importance are the identifier substitution attributes (SetUID and SetGID) installed on directories - for directories, execution rights are also used, although they have a different meaning than for executable files. The SetGID attribute on a directory indicates that files and subdirectories created within that subdirectory by any process will receive the same group ID as the directory itself. Moreover, subdirectories will also inherit the SetGID attribute. This mechanism is used to organize shared directories, files in which should be available on an equal basis to a group of users. The SetUID attribute set on the directory is simply ignored.
  
17. What file attributes should be present in the command script?
Some filesystems support additional attributes. In particular, some Linux-native filesystems support several attributes that you can adjust with the "chattr" command. 
  The files and directories can have following attributes:
```
  a - append only: this attribute allows a file to be added to, but not to be removed. It prevents accidental or malicious changes to files that record data, such as log files.
  c - compressed: it causes the kernel to compress data written to the file automatically and uncompress it when it’s read back.
  d - no dump: it makes sure the file is not backed up in backups where the dump utility is used
  e - extent format: it indicates that the file is using extents for mapping the blocks on disk.
  i - immutable: it makes a file immutable, which goes a step beyond simply disabling write access to the file. 
  The file can’t be deleted, links to it can’t be created, and the file can’t be renamed.
  j - data journaling: it ensures that on an Ext3 file system the file is first written to the journal and only after that to the data blocks on the hard disk.
  s - secure deletion: it makes sure that recovery of a file is not possible after it has been deleted.
  t - no tail-merging: Tail-merging is a process in which small data pieces at a file’s end that don’t fill a complete block are merged with similar pieces of data from other files.
  u - undeletable: When a file is deleted, its contents are saved which allows a utility to be developed that works with that information to salvage deleted files.
  A - no atime updates: Linux won’t update the access time stamp when you access a file.
  D - synchronous directory updates: it makes sure that changes to files are written to disk immediately, and not to cache first.
  S - synchronous updates: the changes on a file are written synchronously on the disk.
  T - and top of directory hierarchy: A directory will be deemed to be the top of directory hierarchies for the purposes of the Orlov block allocator.
```
  To list attribute of files and sub-directory of the current directory, do "lsattr" command:
```
  lsattr -a
  or
  lsattr -al
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/Attribute.png"><br>
  

  


