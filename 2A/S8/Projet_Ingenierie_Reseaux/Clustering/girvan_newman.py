import math
import networkx as nx
import matplotlib.pyplot as plt
import csv 
import numpy as np
import pandas as pd
from mpl_toolkits import mplot3d

from swarm_sim import *

########################################################
  # Extracting data                      
########################################################
PATH = 'track_'
satellites = {}

for i in range(0,100):
    df = pd.read_csv(PATH+str(i)+'.csv', sep=',', header=0)
    df['coords'] = ['x','y','z']
    satellites[i] = df.set_index('coords', drop=True)
    
DURATION = satellites[0].columns.tolist()
CHUNKS = 1800     # Number of timestamps to analyse
NB_NODES = 100


##########################################################
#   Converting to Swarm Objects
##########################################################

CONNECTION_RANGE = 30000
swarm_data = {}

for t in DURATION:
    swarm_data[int(t)] = Swarm(connection_range=CONNECTION_RANGE, nodes=[Node(id, node[str(t)].x, node[str(t)].y, node[str(t)].z) for id,node in satellites.items()])



###########################################################

###########################################################
scale = 310000
t = 0
swarm = swarm_data[t]

s = swarm.swarm_to_nxgraph()



##########################################################
# Girvan-Newman Algorithm to cluster the nano-sats
##########################################################

# Convertir le swarm en un graphe networkx
G = swarm.swarm_to_nxgraph()

# Calculer le nombre d'itérations en fonction de la racine carrée du nombre de nœuds
NUM_ITERATIONS = int(math.sqrt(len(swarm.nodes)))

# Initialiser le compteur d'itérations
i = 0

# Effectuer les itérations jusqu'à atteindre le nombre spécifié
while i < NUM_ITERATIONS:
    # Calculer la centralité d'intermédiarité des arêtes pour le graphe
    EBC_list = nx.edge_betweenness_centrality(G)
    
    # Convertir la centralité d'intermédiarité des arêtes en une liste de paires (arête, centralité)
    edge_betweenness = list(EBC_list.items())
    
    # Sélectionner l'arête ayant la plus grande centralité d'intermédiarité
    edge_to_delete = max(edge_betweenness, key=lambda pair: pair[1])[0]
    
    # Supprimer l'arête du graphe
    G.remove_edge(*edge_to_delete)
    
    # Dessiner le graphe mis à jour
    nx.draw(G, with_labels=True, node_color='g')
    
    # Définir le titre du graphique avec l'étape actuelle et l'arête supprimée
    plt.title(f'Étape {i}\nArête {edge_to_delete} Supprimée', fontsize=20)
    
    # Afficher le graphique
    plt.show()
    
    # Incrémenter le compteur d'itérations
    i += 1
