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

  2.1 Configure interface enp0s8 on VM1:
```
  sudo ip addr add 192.168.1.1/255.255.255.0 broadcast 192.168.1.255 dev enp0s8
  sudo ip link set enp0s8 up
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/interface_8_VM1.png"><br>
  
  2.2 Configure interface enp0s3 on VM2:
```
  sudo ip addr add 192.168.1.5/255.255.255.0 broadcast 192.168.1.255 dev enp0s3
  sudo ip link set enp0s8 up
  sudo ip route add default 192.168.1.1 via enp0s3
  sudo nano /etc/resolv.conf
    nameserver 8.8.8.8
    nameserver 4.4.4.4
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/add_dns_VM2.png"><br>
  
  2.3 Enable forwarding on VM1:
  We have to change value 0 on 1 in the file ip_forward
```
  sudo nano /proc/sys/net/ipv4/ip_forward
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/ip_forward_set1_VM1.png"><br>
  
  2.4 We have to add IPTABLES rules for forward SSH traffic to host VM2 and MASQUERADE traffic from VM2:
In the iptables filter, all packets are divided into three similar chains:<br>
- input - processes incoming packets and connections (-i);
- forward - this chain is used for forward connections;
- output - This chain is used for outgoing packets and connections (-o).<br>
  
Rules form a chain, so input, output and forward are called chains, or rule chains. There can be several actions: <br>
  - ACCEPT - allow the packet to pass further along the chain of rules;
  - DROP - remove a package;
  - REJECT - reject the packet, a message will be sent to the sender that the packet was rejected;
  - LOG - write a record about the package to the log file;
  - QUEUE - send a package to a custom application. <br>
  
In addition to those listed above, there are two additional chains of rules:
  - prerouting - the packet enters this chain before being processed by iptables, the system does not yet know where it will be sent to, to input, output or forward;
  - postrouting - all passing packets that have already passed the forward chain go here.
  
```
  sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
  sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 223 -j DNAT --to-destination 192.168.1.5:22
  sudo iptables -A FORWARD -i enp0s3 -o enp0s8 -m state --state RELATED,ESTABLISHED -j ACCEPT
  sudo iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT
 ```
  
  It remains to consider the main actions that iptables allows you to perform:<br>
```
  -A - add a rule to the chain;
  -C - check all the rules;
  -D - remove the rule;
  -I - insert a rule with the required number;
  -L - display all rules in the current chain;
  -S - display all rules;
  -F - clear all rules;
  -N - create a chain;
  -X - delete the chain;
  -P - set the default action.
```
  
  Additional options for rules:<br>
```
  -p - specify the protocol, one of tcp, udp, udplite, icmp, icmpv6, esp, ah, sctp, mh;
  -s - specify the ip address of the device sending the packet;
  -d - specify the recipient's ip address;
  -i - input network interface;
  -o - outgoing network interface;
  -j - select an action if the rule matches.
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/iptables_VM2.png"><br>
  
3. Check the route from VM2 to Host.<br>
To check the route to host, use the "traceroute" utility. The traceroute linux command uses UDP packets. She sends a packet with TTL = 1 and looks at the address of the responding node, then TTL = 2, TTL = 3 and so on until it reaches the goal. Three packets are sent each time and the transit time is measured for each of them. The packet is sent to a random port, which is most likely not busy. When the traceroute utility receives a message from the target host that the port is not available, the trace is complete. <br>
```
  traceroute 4.4.4.4
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/traceroute_VM2.png"><br>
  
4. Check the access to the Internet. <br>
You can quickly find out if your computer has the Internet using the ping utility.The ping utility is a very simple network diagnostic tool. It allows you to check whether the remote host is available or not and that's it. To do this, the utility checks if the host can respond to network requests using the ICMP protocol. <br>
```
  ping 8.8.8.8
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/ping_8.8.8.8_VM2.png"><br>
  
5. Determine, which resource has an IP address 8.8.8.8. <br>
To determine which resource has an IP address of 8.8.8.8, you can use the "whois" utility. <br>
  A Whois search will tell you a lot of information about who owns an Internet domain. On Linux, you can run whois lookup from the command line.A whois system is a list of records that contain information about both domain owners and the owners themselves.<br>
```
  sudo apt install whois
  whois 8.8.8.8
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/whois_VM2.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/whois_google.png"><br>
  
6. Determine, which IP address belongs to resource epam.com. <br>
To determine which IP address belongs to the epam.com resource. you can use dig or nslookup utility. <br>
  The dig (domain information groper) command is a multifunctional tool for polling DNS servers. It allows you to get more information about a specific domain, in order, for example, to find out the IP addresses it uses. Network administrators can find this tool useful for troubleshooting DNS problems.<br>
  Sometimes it may be necessary to check the DNS functionality, see how fast the server is working, see the IP address and the speed at which it is obtained for a specific domain. The nslookup utility is used for this. With it, you can not only get the IP address by domain, but also perform the reverse conversion, as well as check all the necessary DNS records are installed. <br>
```
  dig epam.com
  nslookup epam.com
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.1/nslookup_dig_epam.png"><br>
  
7. Determine the default gateway for your HOST and display routing table.<br>
