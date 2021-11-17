<h4 align="center">
  <img alt="VirtualBox" src="https://assets-a1.kompasiana.com/statics/crawl/552b378e6ea834e71c8b4567.jpeg">
</h4>
<h2 align="center"> Working with VirtualBox </h2>

***Work with VirtualBox*** <br>
<a href="https://www.virtualbox.org/manual/ch01.html"> Instruction "How to use VirtualBox" </a> <br>

***Result of task2.1*** <br>
<details><summary>1.Download the latest stable version of VirtualBox and install to you PC</summary><br>
  <a href="https://www.virtualbox.org/wiki/Downloads"> Link for download VB </a> <br>

**2. Create VM1 and install Ubuntu using the instructions [<a href="https://www.virtualbox.org/manual/"> 1, chapter 1.8 </a>]. Set machine name as "host machine name"_"student last name"** <br>

<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_1.png"> <br>

**3. Get acquainted with the possibilities of VM1 control -start, stop, reboot, save state, use Host key and keyboard shortcuts, mouse capture, etc. [<a href="https://www.virtualbox.org/manual/"> 1, chapter 1.9 </a>]** <br>

**4. Clone an existing VM1 by creating a VM2 [<a href="https://www.virtualbox.org/manual/"> 1, chapter 1.14 </a>].** <br>

<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_2.png"> <br>

**5. Create a group of two VM: VM1, VM2 and learn the functions related to groups [<a href="https://www.virtualbox.org/manual/"> 1, chapter 1.10 </a>].** <br>

<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_3.png"> <br>

**6. For VM1, changing its state, take several different snapshots, forming a branched tree of snapshots [<a href="https://www.virtualbox.org/manual/"> 1, chapter 1.11 </a>].** <br>

<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_5.png"> <br>

**7. Export VM1. Save the *.ova file to disk. Import VM from *.ova file [<a href="https://www.virtualbox.org/manual/"> 1, chapter 1.15 </a>].** <br>

<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_6.png"> <br>

**8. Configure the USB to connect the USB ports of the host machine to the VM [<a href="https://www.virtualbox.org/manual/"> 1, chapter 3.11 </a>].** <br>

**9. Configure a shared folder to exchange data between the virtual machine and the host [<a href="https://www.virtualbox.org/manual/"> 1, chapter 4.3 </a>].** <br>

<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_8.png"> <br>

**10. Configure different network modes for VM1, VM2. Check the connection between VM1, VM2, Host, Internet for different network modes. You can use the ping command to do this. Make a table of possible connection** <br>

<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_9.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/ping.png"> <br>

**11. Examine the purpose and execute the basic commands of VBoxManage list, showvminfo, createvm, startvm, modifyvm, clonevm, snapshot, controlvm [<a href="https://www.virtualbox.org/manual/"> 1, ch 8 </a>].** <br>

<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_10.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_11.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_12.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_13.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_14.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_15.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_16.png"> <br>


**12. WORK WITH VAGRANT.** <br>
<a href="http://czerasz.com/2015/01/06/vagrant-workflows/"> Vagrant Workflows </a> <br>
<a href="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/Vagrantfile"> Vagrantfile </a>

**13. Run the powershell. Create a folder "student name" (in English). Next, go to the folder. Initialize the environment with the default Vagrant box:**
 ```
 init hashicorp/precise64 
 ```
**Run vagrant up and watch for messages during VM boot and startup.** <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_17.png"> <br>

**14. Connect to the VM using the program PuTTY (can be downloaded from [<a href="https://www.virtualbox.org/manual/"> Link </a>]), using SSH, IP address and port listed above (127.0.0.1:2222). By default, login - vagrant and password are also vagrant. Stop and delete the created VM.** <br>

<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_18.png"> <br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_19.png"> <br>

**15. Create your own Vagrant box [<a href="https://www.oreilly.com/library/view/vagrant-up-and/9781449336103/index.html"> Link to book </a>] ** <br>

<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m2/task2.1/IMG/Screenshot_20.png"> <br>
 
</details>













