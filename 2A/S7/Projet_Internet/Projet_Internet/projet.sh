#!/bin/bash
#supprimer tous les images et les cont. et les reseaux
docker rm -vf $(docker ps -a -q)
docker rmi -f $(docker images -a -q)
docker network prune

#Build images

#
docker build User -t image_user
docker build User1 -t image_user1

docker build BOX -t image_box
docker build BOX1 -t image_box1

docker build Routeur_FAI_Acces -t image_routeur_fai_acces

docker build Routeur1 -t image_routeur1
docker build Routeur2 -t image_routeur2

docker build Routeur_FAI_Services -t image_routeur_fai_services

docker build Serveur_DNS -t image_serveur_dns
docker build Serveur_WEB -t image_serveur_web
docker build Serveur_FTP -t image_serveur_ftp

## Creation des sous-reseaux
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