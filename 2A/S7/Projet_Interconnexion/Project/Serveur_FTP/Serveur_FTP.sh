# Set off to disable IPv6 support which is annoying on IPv4 only boxes.
UseIPv6                         off

# If set on you can experience a longer connection delay in many cases.
IdentLookups                    off

# Définit un utilisateur (enseeiht)
useradd enseeiht

# Définit un mdp utilisateur (enseeiht)
echo "enseeiht:n7" | chpasswd

# Créer un home enseeiht
mkdir /home/enseeiht

# Définir le propriétaire de /home/enseeiht
chown enseeiht /home/enseeiht
usermod --shell /bin/bash enseeiht

# Lancer FTP server
hostname FTP
echo "12.12.42.196 FTP" >> /etc/hosts

#Interdire l'ecriture 
chmod o-w /etc/proftpd/ etc/proftpd/modules.conf etc/proftpd/proftpd.conf 

# lancer le service proftpd
service proftpd start

# Tester le service
TMP="
Welcome enseeiht!
your FTP server works correctly.
Good job.
"
echo -e "$TMP" >> /home/enseeiht/msg.txt
