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
  
3. 
