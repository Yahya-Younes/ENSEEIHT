import csv 
import numpy as np
import pandas as pd
import networkx as nx
from itertools import combinations
import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d


from swarm_sim import *

#####################################################################
# Chargement des données des satellites à partir des fichiers CSV
#####################################################################

PATH = 'track_'
satellites = {}  # Dictionnaire pour stocker les données des satellites


for i in range(0, 100):
    df = pd.read_csv(PATH + str(i) + '.csv', sep=',', header=0)
    df['coords'] = ['x', 'y', 'z']
    satellites[i] = df.set_index('coords', drop=True)

DURATION = satellites[0].columns.tolist()
CHUNKS = 1800     # Nombre de timestamps à analyser
NB_NODES = 100

satellites[0].head()

CONNECTION_RANGE = 30000
swarm_data = {}  # Dictionnaire pour stocker les données des swarms


#####################################################################
# Création des objets Swarm à partir des données des satellites
#####################################################################

for t in DURATION:
    swarm_data[int(t)] = Swarm(connection_range=CONNECTION_RANGE, nodes=[Node(id, node[str(t)].x, node[str(t)].y, node[str(t)].z) for id, node in satellites.items()])

print(swarm_data[0])




######################################################################
# Les composantes connexes dans le graphe 
######################################################################

def plot_edges(swarm, n_color='red', e_color='green'):
    """
    Trace les arêtes d'un swarm en 3D.

    Args:
        swarm (Swarm): L'objet Swarm contenant les données des nœuds et des arêtes.
        n_color (str, optional): La couleur des nœuds. Par défaut, 'red'.
        e_color (str, optional): La couleur des arêtes. Par défaut, 'green'.
    """

    # Créer une nouvelle figure avec une projection en 3D
    fig = plt.figure(figsize=(8, 8))
    ax = plt.axes(projection='3d')

    # Extraire les coordonnées des nœuds
    x_data = [node.x for node in swarm.nodes]
    y_data = [node.y for node in swarm.nodes]
    z_data = [node.z for node in swarm.nodes]

    # Tracer les nœuds en utilisant les coordonnées et la couleur spécifiée
    ax.scatter(x_data, y_data, z_data, c=n_color, s=50)

    # Parcourir tous les nœuds du swarm
    for node in swarm.nodes:
        # Parcourir tous les voisins du nœud actuel
        for n in node.neighbors:
            # Vérifier si le voisin est également un nœud du swarm
            if n in swarm.nodes:
                # Tracer une arête entre le nœud actuel et son voisin en utilisant les coordonnées et la couleur spécifiée
                ax.plot([node.x, n.x], [node.y, n.y], [node.z, n.z], c=e_color)


t = 0
swarm = swarm_data[t]

s = swarm.swarm_to_nxgraph()
plot_edges(swarm)



#####################################################################
# Les cliques dans le graphe 
######################################################################

cliques = list(nx.find_cliques(s))

# Créer un graphe vide
graph = nx.Graph()

# Parcourir chaque clique
for i, clique in enumerate(cliques):
    # Ajouter les nœuds de la clique au graphe
    graph.add_nodes_from(clique)
    # Ajouter les arêtes à partir des nœuds de la clique
    graph.add_edges_from(combinations(clique, 2))

    # Déterminer les positions des nœuds
    pos = nx.spring_layout(graph)

    # Tracer les nœuds
    nx.draw_networkx_nodes(graph, pos, nodelist=clique, node_size=200, node_color='lightblue')

    # Tracer les arêtes
    nx.draw_networkx_edges(graph, pos, width=1.0, alpha=0.5, edge_color='gray')

    # Étiqueter les nœuds
    nx.draw_networkx_labels(graph, pos, font_size=8, font_color='black')

    # Masquer les axes
    plt.axis('off')

    # Afficher le graphe pour cette clique
    plt.title('Clique {}'.format(i+1))
    plt.show()

    # Effacer le contenu du graphe pour la prochaine clique
    graph.clear()


#############################################################################################
#  Afficher les changements des composantes connexes au fil du temps
############################################################################################# 

import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt

# Read the CSV file
data = pd.read_csv('Traces.csv', header=None)

# Define the threshold distance
threshold = 30000

# Create an empty graph
graph = nx.Graph()

# Get the number of satellites
num_satellites = data.shape[0] // 3

# Iterate over time steps (columns)
for column in data.columns:
    # Clear the graph at each time step
    graph.clear()

    # Iterate over satellites
    for satellite in range(num_satellites):
        # Get the coordinates for the current satellite at the current time step
        x, y, z = data.iloc[3 * satellite:3 * satellite + 3, column].values

        # Compare with other satellites
        for other_satellite in range(num_satellites):
            if satellite != other_satellite:
                # Get the coordinates for the other satellite at the current time step
                other_x, other_y, other_z = data.iloc[3 * other_satellite:3 * other_satellite + 3, column].values

                # Calculate the Euclidean distance between the two satellites
                distance = ((x - other_x) ** 2 + (y - other_y) ** 2 + (z - other_z) ** 2) ** 0.5

                # If the distance is below the threshold, add an edge between the satellites
                if distance < threshold:
                    graph.add_edge(satellite, other_satellite)

    # Get the connected components at the current time step
    connected_components = list(nx.connected_components(graph))

    # Print the connected components at the current time step
    print(f"Time Step {column}: {connected_components}")

    # Visualize the graph
    pos = nx.spring_layout(graph, seed=42)
    plt.figure(figsize=(8, 6))
    nx.draw_networkx(graph, pos=pos, with_labels=True, node_size=200, font_size=8)
    plt.title(f"Connected Components at Time Step {column}")
    plt.show()

