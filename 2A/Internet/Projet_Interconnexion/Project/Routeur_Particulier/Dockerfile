FROM debian
RUN apt-get update
RUN apt-get -y install iptables apt-utils iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute
RUN apt-get -f install
#COPY  ./quagga /etc/quagga
COPY Routeur_Particulier.sh /home/
RUN ["chmod", "+x", "/home/Routeur_Particulier.sh"]
RUN mkdir /etc/scripts
ENV PATH "/etc/scripts:$PATH"
#ENTRYPOINT /etc/init.d/quagga start && /bin/bash
ENTRYPOINT  /home/Routeur_Particulier.sh ; /bin/bash
#ENTRYPOINT ["tail", "-f", "/dev/null"]
