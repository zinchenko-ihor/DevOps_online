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
2. Password change is performed using the passwd utility. This is a very powerful utility, it allows you not only to change your password, but also to manage its lifetime and see the status of passwords.<br>
More information can be found <a href="https://losst.ru/kak-smenit-parol-v-linux">here.</a> <br>
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
 
