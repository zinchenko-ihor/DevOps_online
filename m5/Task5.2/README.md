<h4 align="center"> 
  <img alt="DATABASES" src="https://commons.bmstu.wiki/images/b/be/Linux-3_6.png" width="500"> 
</h4>
<h2 align="center"> Linux Essentials </h2>

***Result of task 5.2*** <br>

<details><summary>TASK 2</summary><br>
1. Analyze the structure of the /etc/passwd and /etc/group file, what fields are present in it, what users exist on the system? Specify several pseudo-users, how to define them? <br>
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
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Root_chng_psswd.png"> <br>
  
2. Password change is performed using the passwd utility. This is a very powerful utility, it allows you not only to change your password, but also to manage its lifetime and see the status of passwords. More information can be found <a href="https://losst.ru/kak-smenit-parol-v-linux">here.</a> <br>
The command 'passwd' makes changes to such files after executing:<br>
```
/etc/passwd - user accaunts information
/etc/shadow - passwords are stored here encrypted
/etc/pam.d/passwd - Pluggable  Authentication Modules(PAM) for passwd
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Root_chng_psswd.png"> <br>
