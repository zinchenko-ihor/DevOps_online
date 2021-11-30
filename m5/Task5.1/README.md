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
2. Password change is performed using the passwd utility. This is a very powerful utility, it allows you not only to change your password, but also to manage its lifetime and see the status of passwords.
More information can be found <a href="https://losst.ru/kak-smenit-parol-v-linux">here.</a> <br>
The command 'passwd' makes changes to such files after executing:
```
/etc/passwd - user accaunts information
/etc/shadow - passwords are stored here encrypted
/etc/pam.d/passwd - Pluggable  Authentication Modules(PAM) for passwd.
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.1/IMG/Root_chng_psswd.png"> <br>
