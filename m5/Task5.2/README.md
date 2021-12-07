<h4 align="center"> 
  <img alt="DATABASES" src="https://commons.bmstu.wiki/images/b/be/Linux-3_6.png" width="500"> 
</h4>
<h2 align="center"> Linux Essentials </h2>

***Result of task 5.2*** <br>

<details><summary>TASK 2</summary><br>
**1. Analyze the structure of the /etc/passwd and /etc/group file, what fields are present in it, what users exist on the system? Specify several pseudo-users, how to define them?** <br>
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
  
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/Create_new_user1.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/New_users.png"><br>
  
6. How do I change the name (account name) of an existing user? <br>
"Usermod" is a command-line utility that allows you to modify a user’s login information. <br>
  
  ```
  sudo usermod -l [username]
  ```
  Usermod command options:<br>
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
  
  

  
  
  
  
  
  
  
  

  


