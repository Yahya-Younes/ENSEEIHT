import pandas as pd
import numpy as np
from sklearn.cluster import MiniBatchKMeans, DBSCAN
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt

# Read the CSV file
data = pd.read_csv('Traces.csv', header=None)

# Reshape the data to separate satellite tracks
data = data.values.reshape(100, 3, -1)

# Flatten the tracks into individual data points
flattened_data = data.reshape(-1, 3)

# Standardize the data
scaler = StandardScaler()
flattened_data = scaler.fit_transform(flattened_data)

# Apply Mini-Batch K-means clustering
mini_batch_kmeans = MiniBatchKMeans(n_clusters=5, random_state=42, n_init=3)
mini_batch_kmeans_labels = mini_batch_kmeans.fit_predict(flattened_data)

# Apply DBSCAN clustering
dbscan = DBSCAN(eps=0.3, min_samples=5)
dbscan_labels = dbscan.fit_predict(flattened_data)

# Plot the results
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 5))

# Mini-Batch K-means clustering plot
ax1.scatter(flattened_data[:, 0], flattened_data[:, 1], c=mini_batch_kmeans_labels, cmap='viridis')
ax1.set_title('Mini-Batch K-means Clustering')

# DBSCAN clustering plot
ax2.scatter(flattened_data[:, 0], flattened_data[:, 1], c=dbscan_labels, cmap='viridis')
ax2.set_title('DBSCAN Clustering')

plt.tight_layout()
plt.show()
