FROM debian
RUN apt-get update
RUN apt-get -y install iptables apt-utils iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute 
RUN apt-get -f install
#COPY  ./quagga /etc/quagga
COPY Routeur_SiteS.sh /home/
RUN ["chmod", "+x", "/home/Routeur_SiteS.sh"]
RUN mkdir /etc/scripts
ENV PATH "/etc/scripts:$PATH"
ENTRYPOINT ./home/Routeur_SiteS.sh ; /bin/bash