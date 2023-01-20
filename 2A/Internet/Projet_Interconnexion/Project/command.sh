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
docker run -tid -p 80 --name ClientSiteP --cap-add=NET_ADMIN image_clientsitep


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