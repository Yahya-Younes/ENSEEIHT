# Projet Ingénierie Réseaux – Satellite Swarm Network Science (2A S8)

Analysis of a swarm of 100 nano-satellites as a dynamic graph: how the topology evolves
over time, how to cluster the swarm, and the trade-off between energy and throughput.

| Folder | Content |
|---|---|
| `Data/` | Position traces of each satellite (`track_<i>.csv`, x/y/z over time) |
| `DynamiqueEssaim/` | Trajectory plots (1 and 300 satellites) and swarm characteristics: degree, cliques, connected components, inter-contact time |
| `Clustering/` | Swarm partitioning with K-means / Mini-batch K-means, DBSCAN and Girvan–Newman |
| `Performances/` | Clustering coefficient vs. energy and throughput over Girvan–Newman iterations |
| `Figures/` | Generated plots used in the report |
| `Rapport/` | Final report – [`Project_Network_Science.pdf`](Rapport/Project_Network_Science.pdf) |

`swarm_sim.py` is the shared simulation module (`Node` / `Swarm` classes, conversion to a
NetworkX graph); a copy sits next to the scripts that import it.

## Running

```bash
pip install numpy pandas matplotlib networkx scikit-learn
cd Clustering && python clustering.py
```

Several scripts read an aggregated `Traces.csv` (all satellites, 3 rows per satellite),
which is not included in the repository; it can be rebuilt by stacking the files in `Data/`.
