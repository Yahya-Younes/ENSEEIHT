#!/bin/bash
docker exec Routeur_SiteP //Routeur_SiteP.sh

#!/bin/bash
touch /var/lib/dhcp/dhcpd.leases
dhcpd


docker exec BOX echo 1 > /proc/sys/net/ipv4/ip_forward
docker exec BOX iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
docker exec BOX iptables -P INPUT DROP
docker exec BOX iptables -P OUTPUT DROP
docker exec BOX iptables -P FORWARD DROP
# Accepter Ping
docker exec BOX iptables -t filter -A OUTPUT -p icmp -j ACCEPT
docker exec BOX iptables -t filter -A INPUT -p icmp -j ACCEPT
docker exec BOX iptables -t filter -A FORWARD -p icmp -j ACCEPT
# Accepter DHCP
docker exec BOX iptables  -A INPUT -i eth0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT
# Accpeter DNS
docker exec BOX iptables -t filter -A FORWARD -d 120.0.54.3/23 -p udp --dport 53 -j ACCEPT
docker exec BOX iptables -t filter -A FORWARD -s 120.0.54.3/23 -p udp --sport 53 -j ACCEPT
# Accpeter HTTP
docker exec BOX iptables -t filter -A FORWARD -d 120.0.54.5/23 -p tcp --dport 80 -j ACCEPT
docker exec BOX iptables -t filter -A FORWARD -s 120.0.54.5/23 -p tcp --sport 80 -j ACCEPT
# Accepter FTP
docker exec BOX iptables -A FORWARD -d 120.0.54.6/23 -p tcp --dport 21 -j ACCEPT
docker exec BOX iptables -A FORWARD -s 120.0.54.6/23 -p tcp --sport 21 -j ACCEPT
docker exec BOX iptables -A FORWARD -p tcp --sport 1024: --dport 1024: -j ACCEPT
