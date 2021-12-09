<h4 align="center"> 
  <img alt="DATABASES" src="https://commons.bmstu.wiki/images/b/be/Linux-3_6.png" width="500"> 
</h4>
<h2 align="center"> Linux Essentials </h2>

***Result of task 5.3*** <br>

<details><summary>PART 1</summary><br>
1. How many states could has a process in Linux? <br> 
In Linux, a process is an instance of executing a program or command. While these processes exist, they’ll be in one of the five possible states:
  ```  
Running or Runnable (R)
Uninterruptible Sleep (D)
Interruptable Sleep (S)
Stopped (T)
Zombie (Z)
  ```
  1) When a new process is started, it’ll be placed into the running or runnable state. In the running state, the process takes up a CPU core to execute its code and logic.
  2) There are two different sleeping states: the uninterruptible sleeping state (D) and the interruptible sleeping state (S). 
The uninterruptible sleeping state will only wait for the resources to be available before it transit into a runnable state, and it doesn’t react to any signals. 
On the other hand, the interruptible sleeping state (s) will react to signals and the availability of resources.
  3) From a running or runnable state, we could put a process into the stopped state (T) using the SIGSTOP or SIGTSTP signals. 
  4) When a process has completed its execution or is terminated, it’ll send the SIGCHLD signal to the parent process and go into the zombie state. 
Here are the different values that the s, stat and state output specifiers (header "STAT" or "S") will display to describe the state of a process:
```
               D    uninterruptible sleep (usually IO)
               I    Idle kernel thread
               R    running or runnable (on run queue)
               S    interruptible sleep (waiting for an event to
                    complete)
               T    stopped by job control signal
               t    stopped by debugger during the tracing
               W    paging (not valid since the 2.6.xx kernel)
               X    dead (should never be seen)
               Z    defunct ("zombie") process, terminated but not
                    reaped by its parent
```
For BSD formats and when the stat keyword is used, additional characters may be displayed:
```
               <    high-priority (not nice to other users)
               N    low-priority (nice to other users)
               L    has pages locked into memory (for real-time and
                    custom IO)
               s    is a session leader
               l    is multi-threaded (using CLONE_THREAD, like NPTL
                    pthreads do)
               +    is in the foreground process group
  ```
  
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/passwd_cat_devops.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.2/IMG/cat_etc_passwd.png"><br>
