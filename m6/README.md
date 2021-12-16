<h2 align="center"> 
  <img alt="Linux Network" src="https://habrastorage.org/r/w780/getpro/habr/post_images/99e/aec/618/99eaec6188909b7d374462942df1baa7.jpg" width="500"> 
</h2>
<h2 align="center"> Networking with Linux </h2>

***Result of task 6.1*** <br>

<details><summary>TASK 6.1</summary><br>
1. Create virtual machines connection according to figure 1:<br> 

 <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/figure_1.png"><br>
 
2. VM2 has one interface (internal), VM1 has 2 interfaces (NAT and internal). Configure all network interfaces in order to make VM2 has an access to the Internet 
(iptables, forward, masquerade).<br>

Two network interfaces are created on the VM1 virtual machine. One is connected via NAT, the second is for the internal network (intnet).<br>
The second virtual machine has one network interface only inside the network (intnet). VM1 acts as a default gateway for VM2.<br>

<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/net_1_VM1.png"><br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/net_2_VM2.png"><br>
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/net_1_VM2.png"><br>
