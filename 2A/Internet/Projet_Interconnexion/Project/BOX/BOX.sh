#ip route add 120.0.48.0/23 via 120.0.56.2
#ip route add 192.168.1.0/24 via 120.0.34.3
#ip route add 120.0.50.0/23 via 120.0.56.2
#ip route add 120.0.54.0/23 via 120.0.56.2

echo 1 > /proc/sys/net/ipv4/ip_forward
#ip route add default via .....
#service isc-dhcp-server start 
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
# Bloquer toutes les requêtes sauf celles filtrées
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
# Accepter Ping
iptables -t filter -A OUTPUT -p icmp -j ACCEPT
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A FORWARD -p icmp -j ACCEPT
# Accepter DHCP
#iptables  -A INPUT -i eth0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT
# Accpeter DNS
iptables -t filter -A FORWARD -d 120.0.54.3/23 -p udp --dport 53 -j ACCEPT
iptables -t filter -A FORWARD -s 120.0.54.3/23 -p udp --sport 53 -j ACCEPT
# Accpeter HTTP
iptables -t filter -A FORWARD -d 120.0.54.5/23 -p tcp --dport 80 -j ACCEPT
iptables -t filter -A FORWARD -s 120.0.54.5/23 -p tcp --sport 80 -j ACCEPT
# Accepter FTP
iptables -A FORWARD -d 120.0.54.6/23 -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -s 120.0.54.6/23 -p tcp --sport 21 -j ACCEPT
iptables -A FORWARD -p tcp --sport 1024: --dport 1024: -j ACCEPT