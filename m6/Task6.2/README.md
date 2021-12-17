<h2 align="center"> 
  <img alt="Linux Network" src="https://habrastorage.org/r/w780/getpro/habr/post_images/99e/aec/618/99eaec6188909b7d374462942df1baa7.jpg" width="500"> 
</h2>
<h2 align="center"> Networking with Linux </h2>

***Result of task 6.2*** <br>

<details><summary>TASK 6.2</summary><br>
1. Use already created internal-network for three VMs (VM1-VM3). VM1 has NAT and internal, VM2, VM3 – internal only interfaces.<br> 

 <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/net_VM3.png"><br>
 <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/portfwd_for_VM3.png"><br>
 
2. Install and configure DHCP server on VM1. <br>
For configure DHCP on VM1 used DNSMASQ. <br>

2.1 Install DNSMASQ. <br>
```
  sudo apt install dnsmasq -y
```

2.2 Configure DHCP on DNSMASQ. <br>
```
  sudo nano /etc/dnsmasq.conf
  
  #DHCP interface of my server
  interface=enp0s8
  
  #Automaticly added to simple name on hosts-file
  expand-hosts
  
  #ip leasing DHCP pool
  dhcp-range=192.168.1.20,192.168.1.50,24h
  
  #Set DHCP options
  dhcp-option=option:router,192.168.1.1       - default gateway
  dhcp-option=option:dns-server,192.168.1.1   - local dns-server
  dhcp-option=option:dns-server,8.8.8.8       - forward dns-server
  
  #ip leasing file
  dhcp-leasefile=/var/lib/dnsmasq.leases
  
  #set DHCP work in authoritative mode
  dhcp-authoritative
  
  #DNS server setting:
  #forwardinf DNS
  8.8.8.8
  ```
  
  After create directory and leases-file/ Then stop services who may be have conflict with DNSMASQ and reload this service
```
  sudo mkdir /var/lib/dnsmasq
  sudo touch /var/lib/dnsmasq/dnsmasq.leases
  
  sudo systemctl disable systemd-resolved
  sudo systemctl mask systemd-resolved
  sudo systemctl stop system-resolved
  
  sudo systemctl start dnsmasq
  sudo systemctl status dnsmasq
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/dnsmasq_status.png"><br>
  
  Also add iptables rule to forward ssh from host VM3:
  
```
  sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 224 -j DNAT --to-destination 192.168.1.3:22
```
    <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/iptables_fwd_VM3.png"><br>
    
3. Check VM2 and VM3 for obtaining network addresses from DHCP server. <br>

