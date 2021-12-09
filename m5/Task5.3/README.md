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
  4) When a process has completed its execution or is terminated, it’ll send the SIGCHLD signal to the parent process and go into the zombie state.<br>

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
  
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/ps.png"><br>
  
2. Examine the pstree command. Make output (highlight) the chain (ancestors) of the current process. <br>
Pstree command in Linux that shows the running processes as a tree which is a more convenient way to display the processes hierarchy and makes the output more visually appealing. The root of the tree is either init or the process with the given pid.<br>
  The top/main item in the tree is the parent process of all system processes. In this example, the systemd is the first process to start at boot.
pstree concatenates identical branches by enclosing them in square brackets and adding an integer to them representing the number of branches. This makes the conclusion more stable and visually appealing.<br>
  
  OPTIONS:
```
       -a     Show command line arguments.  If the command line of a
              process is swapped out, that process is shown in
              parentheses.  -a implicitly disables compaction for
              processes but not threads.
       -A     Use ASCII characters to draw the tree.
       -c     Disable compaction of identical subtrees.  By default,
              subtrees are compacted whenever possible.
       -C     Color the process name by given attribute. Currently
              pstree only accepts the value age which colors by process
              age.  Processes newer than 60 seconds are green, newer
              than an hour yellow and the remaining red.
       -g     Show PGIDs.  Process Group IDs are shown as decimal
              numbers in parentheses after each process name.  If both
              PIDs and PGIDs are displayed then PIDs are shown first.
       -G     Use VT100 line drawing characters.
       -h     Highlight the current process and its ancestors.  This is
              a no-op if the terminal doesn't support highlighting or if
              neither the current process nor any of its ancestors are
              in the subtree being shown.
       -H     Like -h, but highlight the specified process instead.
              Unlike with -h, pstree fails when using -H if highlighting
              is not available.
       -l     Display long lines.  By default, lines are truncated to
              either the COLUMNS environment variable or the display
              width.  If neither of these methods work, the default of
              132 columns is used.
       -n     Sort processes with the same parent by PID instead of by
              name.  (Numeric sort.)
       -N     Show individual trees for each namespace of the type
              specified.  The available types are: ipc, mnt, net, pid,
              time, user, uts.  Regular users don't have access to other
              users' processes information, so the output will be
              limited.
       -p     Show PIDs.  PIDs are shown as decimal numbers in
              parentheses after each process name.  -p implicitly
              disables compaction.
       -s     Show parent processes of the specified process.
       -S     Show namespaces transitions.  Like -N, the output is
              limited when running as a regular user.
       -t     Show full names for threads when available.
       -T     Hide threads and only show processes.
       -u     Show uid transitions.  Whenever the uid of a process
              differs from the uid of its parent, the new uid is shown
              in parentheses after the process name.
       -U     Use UTF-8 (Unicode) line drawing characters.  Under Linux
              1.1-54 and above, UTF-8 mode is entered on the console
              with echo -e ' 33%8' and left with echo -e ' 33%@'.
       -V     Display version information.
       -Z     Show the current security attributes of the process. For
              SELinux systems this will be the security context.
```
  
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/pstree.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/pstree1.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/pstree2.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/pstree3.png"><br>
  
3. What is a proc file system? <br>
  Procfs is a special filesystem used on UNIX-like operating systems. Allows you to access information from the kernel about system processes. Required to execute commands such as ps, w, top. It is usually mounted on / proc. procfs creates a two-level representation of processspaces. At the top level, processes are directories named according to their pid. Also at the top level is a link to the directory corresponding to the process that is executing the request; it can have a different name on different operating systems (curproc on FreeBSD, self on Linux). <br>
  Proc file system (procfs) is virtual file system created on fly when system boots and is dissolved at time of system shut down.
It contains useful information about the processes that are currently running, it is regarded as control and information center for kernel.
The proc file system also provides communication medium between kernel space and user space.<br>
If you list the directories, you will find that for each PID of a process there is dedicated directory.
You can check directories only on terminal using:
  
```
  ls /proc
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/ls_proc.png"><br>
  
4. 
  

