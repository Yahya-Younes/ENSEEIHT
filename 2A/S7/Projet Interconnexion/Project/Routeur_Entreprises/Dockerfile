FROM debian
RUN apt-get update
RUN apt-get -y install iptables apt-utils iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute
RUN apt-get -y install wget
RUN apt-get -y install ftp
RUN apt-get -f install

#COPY  ./quagga /etc/quagga
COPY Routeur_Entreprises.sh /home/
RUN ["chmod", "+x", "/home/Routeur_Entreprises.sh"]
RUN mkdir /etc/scripts
ENV PATH "/etc/scripts:$PATH"
#ENTRYPOINT /etc/init.d/quagga start && /bin/bash
ENTRYPOINT  /home/Routeur_Entreprises.sh ; /bin/bash
#ENTRYPOINT ["tail", "-f", "/dev/null"]