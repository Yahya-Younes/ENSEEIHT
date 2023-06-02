import pandas as pd
import matplotlib.pyplot as plt
import random as rd
from mpl_toolkits.mplot3d import Axes3D


# Choisir un track d'un satellite au hasard
sat_i = rd.randint(0,99)

# Lire le fichier CSV
data = pd.read_csv('track_'+str(sat_i)+'.csv', header=None)

# Transposer les données pour avoir les colonnes comme coordonnées et les lignes comme étapes de temps
data = data.T

# Extraire les coordonnées (X, Y, Z)
x = data.iloc[:, 0]
y = data.iloc[:, 1]
z = data.iloc[:, 2]

# Créer un graphique en 3D
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# Tracer les points
ax.plot(x, y, z, c='r')

# Définir les labels et le titre
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
ax.set_title('Trajectoire du satellite numéro ' + str(sat_i))

# Afficher le graphique
plt.show()

