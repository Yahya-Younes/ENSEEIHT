FROM kathara/quagga
RUN apt-get update
RUN apt-get -y install iptables apt-utils iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute bind9
RUN apt-get -f install
#COPY ./quagga /etc/quagga
COPY named.conf /etc/bind
COPY named.conf.options /etc/bind
RUN mkdir /etc/bind/zones
COPY ./zones/groupe3.db /etc/bind/zones
COPY Serveur_DNS.sh /home/
RUN ["chmod", "+x", "/home/Serveur_DNS.sh"]
RUN mkdir /etc/scripts
ENV PATH "/etc/scripts:$PATH"
#ENTRYPOINT /etc/init.d/quagga start && /bin/bash
ENTRYPOINT  /home/Serveur_DNS.sh ; /bin/bash