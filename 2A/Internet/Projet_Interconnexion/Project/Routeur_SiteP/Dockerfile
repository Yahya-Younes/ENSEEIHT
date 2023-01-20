FROM debian
RUN apt-get update
RUN apt-get -y install iptables apt-utils iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute isc-dhcp-server
RUN apt-get -f install
#COPY  ./quagga /etc/quagga
COPY Routeur_SiteP.sh Routeur_SiteP.sh
#COPY  ./dhcp/dhcpd.conf /etc/dhcp
RUN ["chmod", "+x", "/Routeur_SiteP.sh"]
RUN mkdir /etc/scripts

RUN apt-get -y install wget
RUN apt-get -y install ftp

RUN apt-get update && apt-get install -y isc-dhcp-client
RUN apt-get update && apt-get install -y dhcpcd5
RUN apt-get update && apt-get install -y isc-dhcp-server


#ENV PATH "/etc/scripts:$PATH"
#ENTRYPOINT /etc/init.d/quagga start && /bin/bash
ENTRYPOINT  /home/Routeur_SiteP.sh ; /bin/bash ;
#ENTRYPOINT ["tail", "-f", "/dev/null"]