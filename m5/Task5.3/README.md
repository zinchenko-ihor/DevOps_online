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
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/states_ps_aux.png"><br>
  
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
  
4. Print information about the processor (its type, supported technologies, etc.).<br>
The cpu information includes details about the processor, like the architecture, vendor name, model, number of cores, speed of each core etc.
There are quite a few commands on linux to get those details about the cpu.<br>
  The /proc/cpuinfo file contains details about individual cpu cores. Every processor or core is listed separately the various details about speed, cache size and model name are included in the description. Output its contents with command "cat".

```
  cat /proc/cpuinfo
```
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/cpuinfo.png"><br>\
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/cpuinfo1.png"><br>
  
lscpu is a small and quick command that does not need any options. It would simply print the cpu hardware details in a user-friendly format.

```
  lscpu
```
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/lscpu.png"><br>
  
The lshw command can display limited information about the cpu. lshw by default shows information about various hardware parts, and the '-class' option can be used to pickup information about a specific hardware part.

```
  lshw -class processor
``` 
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/lshw_class.png"><br>
  
The cpuid command fetches CPUID information about Intel and AMD x86 processors.
The program can be installed with apt on ubuntu:
  
```
  sudo apt install cpuid
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/cpuid.png"><br>
  
5. Use the ps command to get information about the process. The information should be as follows: the owner of the process, the arguments with which the process was launched for execution, the group owner of this process, etc. <br>
PS displays information about a selection of the active processes.  If you want a repetitive update of the selection and the displayed information, use top instead.<br>
  This version of ps accepts several kinds of options:
  1) UNIX options, which may be grouped and must be preceded by a dash.
  2) BSD options, which may be grouped and must not be used with a dash.
  3) GNU long options, which are preceded by two dashes.
  
```
  ps -au
  ps -aux
  
 -a - also shows processes started by other users;
 -x - also shows processes that do not have a controlled terminal or are started from another terminal;
 -u - Prints the username, started the process, and start time for each of the processes.
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/ps_au_5.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/ps_aux.png"><br>
  
6.  How to define kernel processes and user processes? <br>
In modern linux, unlike many other Unixes, there are so-called "kernel processes". Judging by these, these are just parts of the kernel itself, functions of the general kernel code, working in the same address space and with the same privileges as the rest of the kernel code. Their only difference from other parts of the kernel is that separate entries are created for them in the process table. They are made by processes so that their execution occurs independently of the rest of the kernel, with a lower priority. Their execution takes place under the control of the scheduler, like all other processes in the system.<br>
  The linux kernel processes are started by the kernel itself, and the kthread process with PID = 2 is assigned to the parent process that allegedly spawned them. Thus, the processes of the kernel should be considered the process itself with PID = 2, as well as processes for which the PPID (i.e. the pid of the parent) is 2.<br>

```
  sudo ps --ppid=2 --pid=2
```

User processes - all others:
  
```
  sudo ps -N --ppid=2 --pid=2
```
  Also, by default, pstree without parameters shows only the tree of processes spawned by init, i.e. user processes. Kernel processes will show sudo pstree 2.<br>
  
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/kernel_process.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/kernel_process1.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/user_process1.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/user_process.png"><br>
  
7. Print the list of processes to the terminal. Briefly describe the statuses of the processes. What condition are they in, or can they be arriving in? <br>
  Print a list of processes in the terminal using the command:
```
  ps -aux
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/ps_aux_7.png"><br>
  
8.  Display only the processes of a specific user. <br>
  To see only the processes owned by a specific user on Linux run:
  
```
  ps -u {username}
```
  You can get a list of every process running as {username} (real [RUID] & effective ID [EUID]) in user format:

```
  ps -U {username} -u {username}
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/ps_u_devops.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/ps_U.png"><br>
  
9. What utilities can be used to analyze existing running tasks (by analyzing the help for the ps command)? <br>
  Using the man ps command, we can find information on additional utilities to view the status of processes:
```
  pgrep - looks through the currently running processes and lists the process IDs which match the selection criteria to stdout.
  pstree - shows running processes as a tree.
  top - provides a dynamic real-time view of a running system.
  proc - process information pseudo-filesystem.
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/see_also_9.png"><br>
  
10. What information does top command display? <br>
top command is used to show the Linux processes. It provides a dynamic real-time view of the running system. Usually, this command shows the summary information of the system and the list of processes or threads which are currently managed by the Linux Kernel.<br>
As soon as you will run this command it will open an interactive command mode where the top half portion will contain the statistics of processes and resource usage. And Lower half contains a list of the currently running processes. Pressing q will simply exit the command mode.<br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/top_10.png"><br>
 
  Here:
```
  PID: Shows task’s unique process id.
  USER: User name of owner of task.
  PR: Stands for priority of the task.
  NI: Represents a Nice Value of task. A Negative nice value implies higher priority, and positive Nice value means lower priority.
  VIRT: Virtual memory that the process is using.
  RES: Resident Memory Size.
  SHR: The total amount of memory this process shares with othersю
  S: The current status of the process: R - running; S - sleeping, Z - zombie.
  %CPU: Percentage of used CPU time.
  %MEM: Percentage of RAM used by the process.
  TIME+: CPU Time, the duration of the process since the start.
  COMMAND: The name of the command (program) that initiated the process.
```
  
11. Display the processes of the specific user using the top command. <br>
To show all processes for a specific user using top command:
  
```
  top -u {username}
```
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/top_U.png"><br>
  
12. What interactive commands can be used to control the top command? Give a couple of examples. <br>
Listed below is a brief index of interactive commands within categories.<br>
Some commands appear more than once -- their meaning or scope may vary depending on the context in which they are issued.<br>

```
GLOBAL_Commands <Ret/Sp> ?, =, A, B, d, G, h, I, k, q, r, s, W, Z 
SUMMARY_Area_Commands l, m, t, 1 
TASK_Area_Commands 
  Appearance: b, x, y, z 
  Content: c, f, H, o, S, u 
  Size: #, i, n 
  Sorting: <, >, F, O, R
COLOR_Mapping <Ret>, a, B, b, H, M, q, S, T, w, z, 0 - 7 
COMMANDS_for_Windows -, _, =, +, A, a, G, g, w
```
Interactive commands that you can execute while the program is running:
  
```
  h - displays help for the utility;
  q or Esc - exit top;
  A - choice of color scheme;
  d or s - change the information update interval;
  H - display process streams;
  k - send a termination signal to the process;
  W - write the current program settings to the configuration file;
  Y - view additional information about the process, open files, ports, logs, etc.
  Z - change the color scheme;
  l - hide or display information about the average load on the system;
  m - turn off or switch the display mode of information about memory;
  x - highlight in bold the column by which sorting is performed;
  y - highlight in bold the processes that are running at the moment;
  z - switch between color and monochrome modes;
  c - switching the command output mode, the full path and only the command are available;
  F - setting fields with information about processes;
  o - filtering processes by an arbitrary condition;
  u - filtering processes by username;
  V - displaying processes in the form of a tree;
  i - switching the display mode of processes that are not currently using processor resources;
  n - the maximum number of processes to display in the program;
  L - search by word;
  <> - move the sorting field to the right and left;
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/top_i_12.png"><br>
  
13. Sort the contents of the processes window using various parameters (for example, the amount of processor time taken up, etc.) <br>
Basic sorting of data is carried out by the level of CPU time utilization, also known as% CPU. To start sorting by memory (% MEM), just execute "Shift + M" while the command is up. If you are interested in which of the processes takes the longest, press "Shift + T", and display the information of interest in the TIME+ column. You can sort by their number (PID) by typing "Shift + N" on the keyboard. Use "Shift + P" to return to sorting by CPU usage.

  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/top_sort_pid.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/top_sort_cpu.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/top_sort_mem.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/top_sort_time.png"><br>
  
Not all sorting methods can be set using hot keys. For example, to identify processes that consume more SWAP, use the field selection menu, which is invoked by the "Shift + F" combination. Using the navigation keys, we find SWAP (or any other required parameter), with the “d” key we fix its addition to the general table of the top command (as confirmation of your choice, the “*” symbol will appear next to it). To set sorting by SWAP, here we press "s" and exit the menu (ESC). Ready!<br>
  
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/add_swap.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/top_sort_swap.png"><br>
  
14. Concept of priority, what commands are used to set priority? <br>
  
  When you run a program in Linux, such as the vim editor, the system creates an instance of the program. The process is the running instance, or concrete occurrence of an object, in a program. Every process requires a certain amount of system resources, like central processing unit (CPU) time and random access memory (RAM), to be able to perform its tasks. Each process is assigned a process priority, which determines how much CPU or processor time is allocated to it for execution.<br>
  Note that there are hundreds of processes running in a Linux system at any point in time. Sometimes they all get sufficient CPU time for execution and sometimes they don't, which is when the idea of process priority comes in handy. The process priority determines which process gets more CPU time and which processes can wait for execution at a later, less-demanding time.<br>
  Linux allows us to set a nice value on a per-user basis, which may differ from the process priority. The nice value is how much priority the Linux kernel will grant to each named user; by comparison, the process priority is the actual priority of a running process. Note that the nice value only controls how much CPU time each process is allocated and not how much memory can be used or which input/output (I/O) devices can be used. <br>
  - There are 140 possible and two types of priorities: the nice value and real-time priority, which goes from 1 to 99, with 100 to 139 dedicated to user-space.
  - The nice value of a process can have a range between -20 (highest priority) to +19 (lowest priority); by default, its value is 0.
  - If the nice value of a process is lower, it gets a higher priority, which means the CPU will execute that process more often.
  - But, if the nice value of a process is higher, it will be assigned a lower priority, which means that the CPU will execute that process less often (whenever it gets an opportunity). <br>
  
  Linux uses the "nice" and "renice" programs to set priorities. To get us the data output of interest, use the "ps -alx" command.
  
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/ps_alx.png"><br>
  
We can see that we received slightly different information. A column labeled "NI" and a column "PRI" appeared. We can see that the top processes are executed with nice 0, i.e. this is the default authority that is assigned unless otherwise stated. Let's take a different version of the ps command, with different keys.
  
```
  ps -eo user,pid,pcpu,nice,comm
  -e - switch to show all;
  -o - output, i.e. what information is needed, then the command lists the necessary information (columns).
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/ps_NI_prior.png"><br>
  
By default, nice sets the priority to 10. To start the process with a nice value other than 10, you can use the -n switch.

```
  nice -n 15 ping 8.8.8.8
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/nice_n.png"><br>
  
To change the priority value of a process, we can use the renice command with the nice value and the PID of the process.
  
```
  sudo renice -n 5 -p 1650
  sudop renice -n -1 -p 1650
 
  -n - priority;
  -p - PID process;
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/renice_n_5.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/top_PR_NI.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/top_PR_20.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/top_PR_19_NI_1.png"><br>
15.  Can I change the priority of a process using the top command? If so, how? <br>
  Alternatively, you can use top or htop utilities to view Linux processes nice values. We can change priority in TOP with "r" key.
  
```
  sudo top 
  Press "R";
  Enter the PID of the process whose priority you want to change, press ENTER.
  Enter the new priority value, press ENTER.
  To close up, press Q.
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/renice_top_7.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/renice_top_7_1.png"><br>

16. Examine the kill command. How to send with the kill command process control signal? Give an example of commonly used signals. <br>
Each process has a unique identifier. To kill running Linux processes, we can use the "kill" command.Besides stopping the process, the kill command can perform several other functions. For example, send a signal to a process. By default, this is interpreted as a TERM signal, which terminates the process. <br>
There are several signals available in Linux that can be used to interrupt, terminate, or suspend processes. Here's an example of using the command:
```
  kill -l
```
  This command will display a man page with various kill signals with their names and corresponding numbers.
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/kill_l.png"><br>
  
To kill a process with a specific PID, use the following command:
 
```
  kill [PID]
```
Since no signal is specified, it will be a SIGTERM signal. Sometimes this may not work; in this case, you may have to forcefully kill the process.
In such cases, you can use the command format as shown below:

```
  kill [Signal_option] PID
```
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/kill_proc.png"><br>
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/kill_proc1.png"><br>
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/kill_s_SigKill.png"><br>
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/kill_stop_ping.png"><br>
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/kill_stop_ping2.png"><br>
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/kill_stop_ping1.png"><br>
  
17. Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to demonstrate the process control mechanism with fg, bg. <br>
Commands issued from the console using the ampersand run in the background and are called "jobs". We can say that tasks are processes tied to the shell. In addition to the traditional PID, such tasks also have their own numbering, starting with one. You can view the running tasks of the interpreter using the "jobs" command.
  
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/jobs.png"><br>
  
The "top" does not return control to the shell. You can either exit the program (by pressing q) or stop the process with the key combination ctrl + z (do not confuse the combinations ctrl + c - end the process and ctrl + z - stop the process). In order to resume the work of this process (task) there are two commands: fg and bg, short for the English words foreground (foreground) and background (background). The syntax is simple: fg is the task number. The fg command works not only with stopped tasks, but with tasks in general.<br>
  The fg command without a parameter will resume the work of the last process stopped by the combination ctrl + z, and if there are none, it will bring to the fore the last task (the task with a higher sequence number). The job that will be restored (displayed) by the fg command without a parameter is marked with a + sign in the output of the jobs command. The bg command is designed to restore the operation of stopped processes (tasks) in the background.<br>
  
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/bg.png"><br>
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/fg.png"><br>
  
"Nohup" is a utility that allows you to run a hang-protected command with an output to a non-tty (ignores the loss of SIGHUP communications). Some work or team takes a long time. If you are not sure when the task will end, it is best to leave the work in the background. All processes (except at and batch) are terminated on logout. The "nohup" utility allows you to keep the process running in the background when you log off. <br>
  
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/nohup.png"><br>
   <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m5/Task5.3/IMG/Part1/nohup1.png"><br>

</details>
  
<details><summary>PART 2</summary><br>
1. How many states could has a process in Linux? <br> 
