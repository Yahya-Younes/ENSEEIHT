# ENSEEIHT – Coursework

Labs (TP), tutorials (TD), projects and reports from my engineering studies at
[ENSEEIHT](https://www.enseeiht.fr/) (Toulouse INP, *Sciences du Numérique* department,
Telecommunications & Networks track), followed by the **MSc in Satellite Communications**
(3rd year).

Most material is in French; 3rd-year work is in English.

## Repository layout

```
.
├── 1A/                       # 1st year (Semesters 5 & 6) – fundamentals
│   ├── S5/
│   └── S6/
├── 2A/                       # 2nd year (Semesters 7 & 8) – telecom & networks
│   ├── S7/
│   └── S8/
└── 3A_MSc_SATCOM/            # 3rd year – MSc Satellite Communications
```

The larger projects have their own `README.md` (linked below) describing their goal, files and how to run them.

## Overview

### 1st year (1A)

| Semester | Course | Content | Language / tools |
|---|---|---|---|
| S5 | [Automatique](1A/S5/Automatique) | Control theory: state-space models, stability, state feedback; inverted pendulum & robot simulations | MATLAB, Simulink |
| S5 | [Langage_C](1A/S5/Langage_C) | C programming basics: types, pointers, loops, assertions | C |
| S5 | [Probabilites](1A/S5/Probabilites) | Probability labs: image statistics, Huffman coding, inertia matrices | MATLAB |
| S5 | [Traitement_du_Signal](1A/S5/Traitement_du_Signal) | Signal processing labs + two-user frequency-multiplexed transmission project | MATLAB |
| S6 | [Analyse_de_Donnees](1A/S6/Analyse_de_Donnees) | Data analysis: eigen-decomposition, maximum-likelihood classification | MATLAB |
| S6 | [Architecture_Ordinateurs](1A/S6/Architecture_Ordinateurs) | Mini-CRAPS processor design and test benches | SHDL |
| S6 | [Calcul_Scientifique](1A/S6/Calcul_Scientifique) | Gram-Schmidt orthogonalisation (classical vs. modified) | MATLAB |
| S6 | [Langage_C](1A/S6/Langage_C) | C: structures, modules, Makefiles, linked structures | C |
| S6 | [Projet_ADCS_Eigenfaces](1A/S6/Projet_ADCS_Eigenfaces) | Face recognition with eigenfaces; power / subspace iteration eigen-solvers | MATLAB |
| S6 | [Projet_Internet](1A/S6/Projet_Internet) | Emulated ISP network: DHCP boxes, RIP routers, DNS & web servers | YANE, Docker, Quagga, BIND |
| S6 | [Systemes_Exploitation_Centralises](1A/S6/Systemes_Exploitation_Centralises) | UNIX system programming: processes, signals, files, a mini shell | C, POSIX |
| S6 | [Telecommunications](1A/S6/Telecommunications) | Digital modulations, baseband & carrier transmission chains | MATLAB |

### 2nd year (2A)

| Semester | Course | Content | Language / tools |
|---|---|---|---|
| S7 | [Egalisation_Canal](2A/S7/Egalisation_Canal) | Time- and frequency-domain channel equalisation (ZF, MMSE) | MATLAB |
| S7 | [Intergiciels](2A/S7/Intergiciels) | Middleware: sockets, load balancer, Java RMI shared objects | Java |
| S7 | [OFDM](2A/S7/OFDM) | OFDM transmission chain, cyclic prefix, multipath channel | MATLAB |
| S7 | [Projet_Donnees_Reparties](2A/S7/Projet_Donnees_Reparties) | Distributed shared objects with read/write lock protocol (IRC demo) | Java RMI |
| S7 | [Projet_Interconnexion](2A/S7/Projet_Interconnexion) | Company/home network interconnection: routing, NAT/firewall, DHCP, DNS, web, FTP, VoIP, WireGuard VPN | Docker, iptables |
| S7 | [Projet_Telecommunications](2A/S7/Projet_Telecommunications) | Satellite link study: modem design, Rayleigh & Rice fading channels | MATLAB |
| S7 | [Reseaux_Telecom](2A/S7/Reseaux_Telecom) | Call routing & load-sharing simulation in a telephone network | Python |
| S8 | [Controle_et_Apprentissage](2A/S8/Controle_et_Apprentissage) | Reinforcement-learning tutorials | — |
| S8 | [Couche_Physique](2A/S8/Couche_Physique) | GSM physical layer: BCCH decoding report | — |
| S8 | [IDM](2A/S8/IDM) | Model-driven engineering: SimplePDL → Petri net, OCL, Xtext, Acceleo, LTL model-checking with Tina | Eclipse EMF, Java |
| S8 | [Projet_Ingenierie_Reseaux](2A/S8/Projet_Ingenierie_Reseaux) | Satellite-swarm network science: clustering, graph metrics, energy vs. throughput | Python, NetworkX, scikit-learn |
| S8 | [Simulation_Reseaux](2A/S8/Simulation_Reseaux) | Network simulation labs (TP1–TP3) and report | — |
| S8 | [Systemes_Exploitation](2A/S8/Systemes_Exploitation) | OS course material: micro-kernels, virtualisation, IoT OS, past exams | PDF |

### 3rd year – MSc Satellite Communications

Labs are kept as `.zip` archives – see [`3A_MSc_SATCOM/README.md`](3A_MSc_SATCOM/README.md) for what each contains.

| Course | Content | Language / tools |
|---|---|---|
| [Digital_Receivers_DPLL.zip](3A_MSc_SATCOM/Digital_Receivers_DPLL.zip) | Carrier-phase recovery with digital PLLs (QPSK / 8-PSK, DD & NDA detectors, S-curves, jitter) | MATLAB |
| [Modern_Channel_Coding.zip](3A_MSc_SATCOM/Modern_Channel_Coding.zip) | Repetition, parity-check, LDPC and turbo codes | MATLAB |
| [TP_6tisch.zip](3A_MSc_SATCOM/TP_6tisch.zip) | 6TiSCH / IEEE 802.15.4e network simulation (latency, join time, lifetime) | 6TiSCH simulator |
| [TP_Swarm_Simulator.zip](3A_MSc_SATCOM/TP_Swarm_Simulator.zip) | Nano-satellite swarm simulation | Python, Jupyter |
| [Down_Converter](3A_MSc_SATCOM/Down_Converter) | RF down-converter design | Word |
| [Spacecraft_Sizing](3A_MSc_SATCOM/Spacecraft_Sizing) | Spacecraft sizing report | PDF |
| [SHS_Project](3A_MSc_SATCOM/SHS_Project) | Fire-prediction software & services (business project) | PDF, PowerPoint |

## Tools

- **MATLAB / Simulink** – `.m`, `.slx`, `.mat` files. Run scripts from their own folder
  so relative `load(...)` calls find their data.
- **C** – compile with `gcc -Wall -o prog file.c` (or the provided `Makefile`).
- **Java** – `javac *.java` inside the project folder, then run the `main` class.
- **Python** – 3.10+, with `numpy`, `pandas`, `matplotlib`, `networkx`, `scikit-learn`.
- **Docker** – see the network projects' READMEs.

## Conventions

- Folder names are ASCII with `_` instead of spaces or accents, so paths work in any shell.
- Nothing was deleted during the reorganisation: files were only moved/renamed, and archives
  (`.zip`, `.tar`, `.tgz`) are kept as uploaded.
