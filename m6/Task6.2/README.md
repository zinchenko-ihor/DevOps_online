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
Dnsmasq has three main subsystems, namely:<br>
  - DNS Subsystem: Provides caching of A, AAAA, CNAME, and PTR records, as well as DNSKEY and DS records.
  - DHCP Subsystem: Provides support for DHCPv4, DHCPv6, BOTP, and PXE. You can use both static and dynamic DHCP leases, built-in read-only TFTP server to support network connectivity.
  - Router Advertisement Subsystem: Provides basic auto-configuration for an IPv6 host.

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
  server=8.8.8.8
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
To get VM2 and VM3 ip addresses from the dhcp server, you need to set the auto-obtaining network address parameter in the network settings file / etc / network / interfaces:
```
  auto enp0s3
  iface enp0s3 inet dhcp
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/chng_dhcp_VM2_VM3.png"><br>
  
Next, you need to reboot the interface so that it receives the updated IP address from the dhcp server.
```
  sudo apt install ifupdown -y
  sudo ifdown enp0s3 && sudo ifup enp0s3
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/get_ip_dhcp_VM2.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/get_ip_dhcp_VM3.png"><br>
  
DHCP server is works. Сheck the status of the dhcp server and see how the status of issuing a free ip-address.
```
  sudo systemctl status dnsmasq
```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/dhcp_work.png"><br>
  
4. Using existed network for three VMs (from p.1) install and configure DNS server on VM1. <br>
To configure the DNS server, you need to add such lines to the /etc/dnsmasq.conf file:
```
  port=53
  listen-address=192.168.1.1
  server=192.168.1.1
  no-hosts
  no-resolv
  server=8.8.8.8
  domain=devops.local
  address=/VM1/192.168.1.1
  address=/VM2/192.168.1.42
  address=/VM3/192.168.1.26
```
  DNS uses port 53. The listen-address the option is used to set the IP address, where dnsmasq will listen on. DNS server is 192.168.1.1. <br>
  By default, dnsmasq uses the / etc / hosts file to map hostnames to IP addresses, but this can also be changed. If you do not want to use / etc / hosts, you can specify this with the option "no-hosts".devops.local - this is the domain name. 8.8.8.8 - alternative DNS-address.Also add "no-resolv" so dnsmasq does not needlessly read /etc/resolv.conf which only contains the localhost addresses of itself. address=/VM1/192.168.1.1 - this is a type A record. <br>
  
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/conf_dns.png"><br>

After the DNS settings, you need to restart the dnsmasq service and check the service status.
```
  sudo systemctl reload dnsmasq
  sudo systemctl status dnsmasq
```
<img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/dnsmasq_status_after_config_dns.png"><br>
  
5. Check VM2 and VM3 for gaining access to DNS server (naming services).
To check the access to the DNS server we use the ping command and the hostname.
```
  ping VM1 -c 4
  ping VM2 -c 4
  ping google.com -c 4
 ```
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/ping_vm1_google_5.png"><br>
  <img alt="" src="https://github.com/zinchenko-ihor/DevOps_online_Kyiv_2021Q4/blob/master/m6/Task6.2/IMG/ping_vm2_google_5.png"><br>
