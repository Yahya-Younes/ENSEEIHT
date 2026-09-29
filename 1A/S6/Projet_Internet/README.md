# Projet Internet (1A S6)

Emulation of a small Internet with the **YANE** network emulator (network namespaces +
Docker): two customer LANs behind DHCP boxes, RIP routing between ISP routers (Quagga),
a DNS server (BIND, zone `monsupersite.db`) and Apache web servers.

- Topology: [`yane.yml`](yane.yml) – hosts `Client1/2`, `BOX1/2`, `R1/R2`,
  `Routeur_FAI_Acces`, `Routeur_FAI_services`, `Serveur_DNS`, `Serveur_Web`,
  `Serveur_Web_Client`, switches `Switch1–5`
- Per-host start-up scripts: `scripts/`
- Configuration files copied into each container: `files/<host>/etc/...`

```bash
./START    # build and start the emulated network
./STOP     # tear it down
```

Requires Docker images `apache_n7`, `dhcp_n7`, `quagga_n7` and bind images provided in the course.
