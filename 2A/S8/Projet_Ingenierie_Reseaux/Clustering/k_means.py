from sklearn.cluster import KMeans
from scipy.sparse import csr_matrix
import matplotlib.pyplot as plt
import numpy as np


# Créer une liste vide
lista = []

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

# Afficher les étiquettes des clusters
print(labels)

# Afficher le nombre d'étiquettes
print(len(labels))

import matplotlib.pyplot as plt

# Compter le nombre de satellites dans chaque cluster
cluster_counts = [labels.tolist().count(i) for i in range(int(NUM_ITERATIONS))]

# Tracer les largeurs des clusters
plt.figure(figsize=(8, 6))
plt.bar(range(int(NUM_ITERATIONS)), cluster_counts)
plt.xlabel('Cluster')
plt.ylabel('Nombre de Satellites')
plt.title('Largeurs des Clusters')
plt.show()



G = swarm.swarm_to_nxgraph()
edge_mat = nx.to_scipy_sparse_array(G)

NUM_ITERATIONS = math.sqrt(len(swarm.nodes))
kmeans = KMeans(n_clusters=int(NUM_ITERATIONS))
kmeans.fit(edge_mat.toarray())
labels = kmeans.predict(edge_mat.toarray())

# Convert the sparse matrix to a dense matrix
edge_mat_dense = edge_mat.toarray()

# Plot the clusters
plt.scatter(edge_mat_dense[:, 0], edge_mat_dense[:, 1], c=labels, s=50, cmap='viridis')
centers = kmeans.cluster_centers_
plt.scatter(centers[:, 0], centers[:, 1], c='black', s=200, alpha=0.5)
plt.show()
