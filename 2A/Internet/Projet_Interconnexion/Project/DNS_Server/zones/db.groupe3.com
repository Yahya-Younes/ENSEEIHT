$TTL 1D
@       IN      SOA     ns1.groupe3.com. admin.groupe3.com. (
                        2023011601 ; serial
                        1D         ; refresh
                        1H         ; retry
                        1W         ; expire
                        3H )       ; minimum

@       IN      NS      ns1.groupe3.com.
@       IN      NS      ns2.groupe3.com.

ns1     IN      A       192.0.2.1
ns2     IN      A       192.0.2.2

@       IN      MX      10 mail.groupe3.com.

www     IN      A       192.0.2.3
ftp     IN      CNAME   www
