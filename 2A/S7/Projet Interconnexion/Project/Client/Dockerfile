FROM debian
RUN echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable-wireguard.list
RUN printf 'Package: *\nPin: release a=unstable\nPin-Priority: 150\n' > /etc/apt/preferences.d/limit-unstable
RUN apt-get update
RUN apt-get -y install iptables apt-utils iproute2 net-tools systemd telnet nano iputils-ping tcpdump inetutils-traceroute curl
RUN apt-get -f install
RUN apt-get -y install wget
RUN apt-get -y install ftp
#RUN apt install dnsutils
#RUN apt-get install -y --force-yes wireguard
#COPY  ./quagga /etc/quagga
COPY Client.sh /home/
COPY wg0.conf etc/wireguard/
RUN ["chmod", "+x", "/home/Client.sh"]
RUN mkdir /etc/scripts
ENV PATH "/etc/scripts:$PATH"
ENTRYPOINT  /bin/bash
####################
#ENTRYPOINT ["tail", "-f", "/dev/null"] 
###################