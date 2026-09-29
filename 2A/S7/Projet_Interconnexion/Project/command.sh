#!/bin/bash
#supprimer tous les images et les cont. et les reseaux
docker rm -vf $(docker ps -a -q)
docker rmi -f $(docker images -a -q)
docker network prune

#Build images

# 
docker build Client -t image_client
docker build BOX -t image_box
docker build ClientSiteP -t image_clientsitep
#docker build Client_Entreprise -t image_client_entreprise
docker build Routeur_Entreprises -t image_routeur_entreprises
docker build Routeur_Interco -t image_routeur_interco
docker build Routeur_Particulier -t image_routeur_particulier
docker build Routeur_SiteP -t image_routeur_sitep
docker build Routeur_SiteS -t image_routeur_sites
docker build Serveur_DHCP -t image_serveur_dhcp
docker build Serveur_DNS -t image_serveur_dns
docker build Serveur_FTP -t image_serveur_ftp
docker build Serveur_VOIP -t image_serveur_voip
docker build Serveur_WEB -t image_serveur_web

## Creation des sous-reseaux de l'AS
# Reseau Client
docker network create --driver=bridge Reseau_Client --subnet=192.168.1.0/24 --ip-range=192.168.1.0/24


# Reseau entreprise
docker network create --driver=bridge Reseau_Entreprise --subnet=120.0.50.0/23 --ip-range=120.0.50.0/23

# Reseau AS3
docker network create --driver=bridge Reseau_AS3 --subnet=120.0.48.0/23 --ip-range=120.0.48.0/23

# Reseau AS1
docker network create --driver=bridge Reseau_AS1 --subnet=120.0.16.0/20 --ip-range=120.0.16.0/23


# Reseau VPN
#docker network create --driver=bridge Reseau_VPN

# Reseau Secondaire d'entreprises
docker network create --driver=bridge Reseau_Site_Principal --subnet=120.0.54.0/23 --ip-range=120.0.54.0/23

# Reseau Secondaire d'entreprises
docker network create --driver=bridge Reseau_Site_Secondaire --subnet=120.0.52.0/23 --ip-range=120.0.52.0/23

# Reseau Particuliers
docker network create --driver=bridge Reseau_Clients --subnet=120.0.56.0/23 --ip-range=120.0.56.0/23


# Lancement des conteneurs et connexion aux differents reseaux
# Entreprises
docker run -tid -p 80 --name Routeur_Entreprises --cap-add=NET_ADMIN image_routeur_entreprises

docker run -tid -p 80 --name Routeur_SiteP --cap-add=NET_ADMIN --cap-add=NET_RAW image_routeur_sitep

docker run -tid -p 80 --name Routeur_SiteS --cap-add=NET_ADMIN image_routeur_sites

# Particuliers
docker run -tid -p 80 --name BOX --cap-add=NET_ADMIN --cap-add=NET_RAW image_box


# Routeur d'interconnexion avec les autres AS
docker run -tid -p 80 --name Routeur_Interco --cap-add=NET_ADMIN image_routeur_interco

# Routeur particuliers
docker run -tid -p 80 --name Routeur_Particulier --cap-add=NET_ADMIN image_routeur_particulier





# Serveurs
#Service Web
#Service $ docker run -dit --name my-running-app -p 8080:80 my-apache2B
docker run -tid -p 8080:80 --name Serveur_WEB --cap-add=NET_ADMIN image_serveur_web
#docker network connect Reseau_Principal Serveur_WEB

# Service FTP
docker run -tid -p 80 --name Serveur_FTP --cap-add=NET_ADMIN --cap-add=SYS_ADMIN image_serveur_ftp
#docker network connect Reseau_Principal Serveur_FTP

# Service VoIP
docker run -tid -p 5060:5060 --name Serveur_VOIP --cap-add=NET_ADMIN image_serveur_voip
#docker network connect Reseau_Principal Serveur_VOIP

# Service DHCP
docker run -tid -p 5061:5061 --name Serveur_DHCP --cap-add=NET_ADMIN image_serveur_dhcp
#docker network connect Reseau_Principal Serveur_DHCP

# Service DNS
docker run -tid -p 80 --name Serveur_DNS --cap-add=NET_ADMIN image_serveur_dns


# Service VPN
#docker run -tid -p 51820:80 --name Serveur_VPN --cap-add=NET_ADMIN --cap-add=SYS_ADMIN image_service_vpn
#docker network connect Reseau_Secondaire Serveur_VPN
#docker network connect Reseau_VPN Serveur_VPN

## Clients
# Client Principal
#docker run -tid -p 80 --name Client_Entreprise --cap-add=NET_ADMIN --cap-add=SYS_ADMIN image_client_entreprise

# Client Box_int
docker run -tid -p 80 --name Client --cap-add=NET_ADMIN image_client
docker run -tid -p 80 --name Client_SiteP --cap-add=NET_ADMIN image_clientsitep


## Connexion aux differents reseaux

docker network connect Reseau_Client BOX
docker network connect Reseau_Client Client

docker network connect Reseau_Clients Routeur_Particulier
docker network connect Reseau_Clients BOX

docker network connect Reseau_AS3 Routeur_Interco
docker network connect Reseau_AS3 Routeur_Particulier
docker network connect Reseau_AS3 Routeur_Entreprises

docker network connect Reseau_Site_Secondaire Routeur_SiteS

docker network connect Reseau_Entreprise Routeur_Entreprises
docker network connect Reseau_Entreprise Routeur_SiteS
docker network connect Reseau_Entreprise Routeur_SiteP

docker network connect Reseau_Site_Principal Routeur_SiteP
docker network connect Reseau_Site_Principal Serveur_DNS
docker network connect Reseau_Site_Principal Serveur_VOIP
docker network connect Reseau_Site_Principal Serveur_WEB
docker network connect Reseau_Site_Principal Serveur_FTP
docker network connect Reseau_Site_Principal Serveur_DHCP
docker network connect Reseau_Site_Principal ClientSiteP

docker exec Serveur_DHCP //start.sh
docker exec Serveur_DNS dhclient eth1
docker exec Serveur_FTP dhclient eth1
docker exec Serveur_WEB dhclient eth1
docker exec Serveur_VOIP dhclient eth1

#Client
docker exec Client ip route add 120.0.56.0/23 via 192.168.1.2
#docker exec Client ip route add 192.168.1.0/24 via 192.168.1.1
docker exec Client ip route add 120.0.48.0/23 via 192.168.1.2
docker exec Client ip route add 120.0.50.0/23 via 192.168.1.2
docker exec Client ip route add 120.0.54.0/23 via 192.168.1.2

#BOX
docker exec BOX ip route add 120.0.48.0/23 via 120.0.56.2
docker exec BOX ip route add 120.0.50.0/23 via 120.0.56.2
docker exec BOX ip route add 120.0.54.0/23 via 120.0.56.2
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

#Routeur Particulier

docker exec Routeur_Particulier ip route add 120.0.50.0/23 via 120.0.48.4
docker exec Routeur_Particulier ip route add 192.168.1.0/24 via 120.0.56.3
docker exec Routeur_Particulier ip route add 120.0.54.0/23 via 120.0.48.4

#Routeur Entreprises

docker exec Routeur_Entreprises ip route add 120.0.54.0/23 via 120.0.50.4
docker exec Routeur_Entreprises ip route add 120.0.52.0/23 via 120.0.50.3

docker exec Routeur_Entreprises ip route add 120.0.56.0/23 via 120.0.48.3
docker exec Routeur_Entreprises ip route add 192.168.1.0/24 via 120.0.48.3

# Routeur Site Principale
docker exec Routeur_SiteP ip route add 120.0.48.0/23 via 120.0.50.2
docker exec Routeur_SiteP ip route add 120.0.52.0/23 via 120.0.50.3
docker exec Routeur_SiteP ip route add 120.0.56.0/23 via 120.0.50.2
docker exec Routeur_SiteP ip route add 192.168.1.0/24 via 120.0.50.2
docker exec Routeur_SiteP touch /var/lib/dhcp/dhcpd.leases
docker exec Routeur_SiteP dhcpd

#Serveur_DHCP
docker exec Serveur_DHCP touch /var/lib/dhcp/dhcpd.leases
docker exec Serveur_DHCP dhcpd
docker exec Serveur_DHCP ip route add 192.168.1.0/24 via 120.0.54.2
docker exec Serveur_DHCP ip route add 120.0.50.0/23 via 120.0.54.2
docker exec Serveur_DHCP ip route add 120.0.56.0/23 via 120.0.54.2
docker exec Serveur_DHCP ip route add 120.0.48.0/23 via 120.0.54.2

#Serveur_DNS
docker exec Serveur_DNS apt -y install dnsutils
docker exec Serveur_DNS service bind9 start
docker exec Serveur_DNS ip route add 192.168.1.0/24 via 120.0.54.2
docker exec Serveur_DNS ip route add 120.0.50.0/23 via 120.0.54.2
docker exec Serveur_DNS ip route add 120.0.56.0/23 via 120.0.54.2
docker exec Serveur_DNS ip route add 120.0.48.0/23 via 120.0.54.2

#Serveur_FTP
docker exec Serveur_FTP ip route add 192.168.1.0/24 via 120.0.54.2
docker exec Serveur_FTP ip route add 120.0.50.0/23 via 120.0.54.2
docker exec Serveur_FTP ip route add 120.0.56.0/23 via 120.0.54.2
docker exec Serveur_FTP ip route add 120.0.48.0/23 via 120.0.54.2

#Serveur_WEB
docker exec Serveur_WEB service apache2 start
docker exec Serveur_WEB ip route add 192.168.1.0/24 via 120.0.54.2
docker exec Serveur_WEB ip route add 120.0.50.0/23 via 120.0.54.2
docker exec Serveur_WEB ip route add 120.0.56.0/23 via 120.0.54.2
docker exec Serveur_WEB ip route add 120.0.48.0/23 via 120.0.54.2
