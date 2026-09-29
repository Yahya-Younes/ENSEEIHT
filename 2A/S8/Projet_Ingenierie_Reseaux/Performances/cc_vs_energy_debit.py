import math
import networkx as nx
import matplotlib.pyplot as plt

############################################################################################################################################################
########### Comparaison du coefficient de clustering avec l'energie utilisé au sein des essaims au fil des itérations avec  l'algorithm de Girvain-Newman
############################################################################################################################################################

# Convertir le swarm en graphique NetworkX
G = swarm.swarm_to_nxgraph()

# Calculer le nombre d'itérations en fonction de la racine carrée du nombre de nœuds
NUM_ITERATIONS = math.sqrt(len(swarm.nodes))

# Listes pour stocker les données pour le tracé
clustering_coeffs = []
energies = []

# Itérer pour le nombre d'itérations spécifié
for i in range(int(NUM_ITERATIONS)):
    # Calculer le coefficient de regroupement pour le graphique
    clustering_coeff = nx.average_clustering(G)
    
    # Calculer l'énergie pour l'étape actuelle (vous pouvez modifier ce calcul en fonction de vos besoins spécifiques)
    energy = sum(degree for node, degree in G.degree()) ** 2
    
    # Stocker les valeurs du coefficient de regroupement et de l'énergie pour l'étape actuelle
    clustering_coeffs.append(clustering_coeff)
    energies.append(energy)
    
    # Calculer la centralité de l'intermédiarité des arêtes pour le graphique
    EBC_list = nx.edge_betweenness_centrality(G)
    
    # Convertir la centralité de l'intermédiarité des arêtes en une liste de paires (arête, centralité)
    edge_betweenness = EBC_list.items()
    
    # Trier la liste de centralité de l'intermédiarité des arêtes par ordre décroissant en fonction des valeurs de centralité
    edge_to_delete = sorted(edge_betweenness, key=lambda pair: -pair[1])[0][0]
    
    # Supprimer l'arête ayant la plus grande centralité de l'intermédiarité du graphique
    G.remove_edge(*edge_to_delete)
    
# Tracé du coefficient de regroupement et de l'énergie séparément
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 6))

# Tracé du coefficient de regroupement
ax1.plot(clustering_coeffs)
ax1.set_xlabel('Itération')
ax1.set_ylabel('Coefficient de regroupement')
ax1.set_title('Coefficient de regroupement au fil des itérations')

# Tracé de l'énergie
ax2.plot(energies)
ax2.plot(energies, color='orange')
ax2.set_xlabel('Itération')
ax2.set_ylabel('Énergie')
ax2.set_title('Énergie au fil des itérations')

plt.tight_layout()
plt.show()






############################################################################################################################################################
########### Comparaison du coefficient de clustering avec l'energie utilisé au sein des essaims au fil des itérations avec  l'algorithm de K-means
############################################################################################################################################################

import math
import networkx as nx
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from scipy.sparse import csr_matrix

# Convertir le swarm en graphique NetworkX
G = swarm.swarm_to_nxgraph()

# Convertir le graphique en matrice creuse
edge_mat = nx.to_scipy_sparse_array(G)

# Calculer le nombre d'itérations pour K-means
NUM_ITERATIONS = math.sqrt(len(swarm.nodes))

# Créer un objet K-means avec le nombre de clusters déterminé
kmeans = KMeans(n_clusters=int(NUM_ITERATIONS))

# Appliquer l'algorithme K-means sur la matrice creuse
kmeans.fit(edge_mat.toarray())

# Prédire les étiquettes des clusters pour chaque satellite
labels = kmeans.predict(edge_mat.toarray())

# Listes pour stocker les données pour le tracé
clustering_coeffs = []
energies = []

# Itérer pour le nombre d'itérations spécifié
for i in range(int(NUM_ITERATIONS)):
    # Calculer le coefficient de regroupement pour le graphique
    clustering_coeff = nx.average_clustering(G)
    
    # Calculer l'énergie pour l'étape actuelle (vous pouvez modifier ce calcul en fonction de vos besoins spécifiques)
    energy = sum(degree for node, degree in G.degree()) ** 2
    
    # Stocker les valeurs du coefficient de regroupement et de l'énergie pour l'étape actuelle
    clustering_coeffs.append(clustering_coeff)
    energies.append(energy)
    
    # Effectuer le clustering K-means
    kmeans.fit(edge_mat.toarray())
    labels = kmeans.predict(edge_mat.toarray())

# Tracé du coefficient de regroupement et de l'énergie côte à côte
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 6))

# Tracé du coefficient de regroupement
ax1.plot(clustering_coeffs)
ax1.set_xlabel('Itération')
ax1.set_ylabel('Coefficient de regroupement')
ax1.set_title('Coefficient de regroupement au fil des itérations')

# Tracé de l'énergie
ax2.plot(energies)
ax2.plot(energies, color='orange')
ax2.set_xlabel('Itération')
ax2.set_ylabel('Énergie')
ax2.set_title('Énergie au fil des itérations')

plt.tight_layout()
plt.show()



############################################################################################################################################################
########### Comparaison du coefficient de clustering avec l'energie utilisé au sein des essaims au fil des itérations avec  l'algorithm de DBSCAN
############################################################################################################################################################

import math
import networkx as nx
import matplotlib.pyplot as plt
from sklearn.cluster import DBSCAN
from scipy.sparse import csr_matrix

# Convert swarm to networkx graph
G = swarm.swarm_to_nxgraph()

# Convert the graph to a sparse matrix
edge_mat = nx.to_scipy_sparse_array(G)

# Calculate the number of iterations for DBSCAN
NUM_ITERATIONS = math.sqrt(len(swarm.nodes))

# Create a DBSCAN object with the specified parameters
dbscan = DBSCAN(eps=0.5, min_samples=5)

# Apply the DBSCAN algorithm on the sparse matrix
dbscan.fit(edge_mat.toarray())

# Predict the cluster labels for each satellite
labels = dbscan.labels_

# Lists to store the data for plotting
debts = []
energies = []

# Iterate for the specified number of iterations
for i in range(int(NUM_ITERATIONS)):
    # Calculate the debit for the current step (you can modify this calculation based on your specific requirements)
    debit = sum(degree for node, degree in G.degree())
    
    # Calculate the energy for the current step (you can modify this calculation based on your specific requirements)
    energy = sum(degree for node, degree in G.degree()) ** 2
    
    # Store the debit and energy values for the current step
    debts.append(debit)
    energies.append(energy)
    
    # Perform the DBSCAN clustering
    dbscan.fit(edge_mat.toarray())
    labels = dbscan.labels_

# Plotting the debit and energy values over iterations
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 6))

# Plotting the debit
ax1.plot(debts)
ax1.set_xlabel('Iteration')
ax1.set_ylabel('Debit')
ax1.set_title('Debit with DBSCAN')

# Plotting the energy
ax2.plot(energies, color='orange')
ax2.set_xlabel('Iteration')
ax2.set_ylabel('Energy')
ax2.set_title('Energy with DBSCAN')

plt.tight_layout()
plt.show()
