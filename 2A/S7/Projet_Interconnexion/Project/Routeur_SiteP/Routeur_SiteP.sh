#ip route add 120.0.48.0/23 via 120.0.50.2
#ip route add 120.0.52.0/23 via 120.0.50.3
#ip route add 120.0.56.0/23 via 120.0.50.2
#touch /var/lib/dhcp/dhcpd.leases
#dhcpd
#service isc-dhcp-server start