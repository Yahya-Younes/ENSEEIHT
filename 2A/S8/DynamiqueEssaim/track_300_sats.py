import pandas as pd
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


# Lire le fichier CSV
data = pd.read_csv('Traces.csv', header=None)

# Remodeler les données pour séparer les trajectoires des satellites
data = data.values.reshape(100, 3, -1)

# Créer un graphique en 3D
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# Tracer les trajectoires des satellites
for satellite_data in data:
    x = satellite_data[0, :]
    y = satellite_data[1, :]
    z = satellite_data[2, :]
    ax.plot(x, y, z)

# Définir les labels et le titre
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
ax.set_title('Trajectoires des 100 satellites')

# Afficher le graphique
plt.show()
