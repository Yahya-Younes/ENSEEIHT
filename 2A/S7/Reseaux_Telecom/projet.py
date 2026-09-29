import random
import matplotlib.pyplot as plt

################################################
############## partage de charge ###############
################################################

# Paramètres de la simulation
num_calls = 1000
prob_blocking = 0.9
call_duration = 3 # en minutes

# Initialisation des compteurs
num_blocked_calls_load_sharing = 0

# Initialisation des capacités de liens
ca_ca_capacity = 10
ca_cts_capacity = 100
cts_cts_capacity = 1000

# Initialisation des compteurs de charge pour les liens
ca_ca_load = [0, 0, 0]
ca_cts_load = [0, 0, 0]
cts_cts_load = [0, 0, 0]

# Boucle de simulation
for i in range(num_calls):
    # Génération aléatoire d'une demande d'appel
    call_requested = random.random() < 0.5

    # Si la demande d'appel est générée, utilisation de la méthode de routage avec partage de charge
    if call_requested:
        # Génération aléatoire de l'utilisateur qui demande l'appel
        user = random.randint(1, 3)
        
        # Détermination du commutateur central (CA) et du centre de traitement des appels (CTS) à utiliser en fonction de l'utilisateur et de l'état de charge
        if user == 1:
            if ca_ca_load[0] + call_duration <= ca_ca_capacity and ca_cts_load[0] + call_duration <= ca_cts_capacity:
                ca_ca_load[0] += call_duration
                ca_cts_load[0] += call_duration
                cts = random.randint(1, 2)
                if cts == 1:
                    if cts_cts_load[0] + call_duration <= cts_cts_capacity:
                        cts_cts_load[0] += call_duration
                    else:
                        num_blocked_calls_load_sharing += 1
                else:
                    if cts_cts_load[1] + call_duration <= cts_cts_capacity:
                        cts_cts_load[1] += call_duration
                    else:
                        num_blocked_calls_load_sharing += 1
            else:
                num_blocked_calls_load_sharing += 1
        elif user == 2:
            if ca_ca_load[1] + call_duration <= ca_ca_capacity and ca_cts_load[1] + call_duration <= ca_cts_capacity:
                ca_ca_load[1] += call_duration
                ca_cts_load[1] += call_duration
                cts = random.randint(1, 2)
                if cts == 1:
                    if cts_cts_load[0] + call_duration <= cts_cts_capacity:
                        cts_cts_load[0] += call_duration
                    else:
                        num_blocked_calls_load_sharing += 1
                else:
                    if cts_cts_load[1] + call_duration <= cts_cts_capacity:
                        cts_cts_load[1] += call_duration
                    else:
                        num_blocked_calls_load_sharing += 1
            else:
                num_blocked_calls_load_sharing += 1
        else:
            if ca_ca_load[2] + call_duration <= ca_ca_capacity and ca_cts_load[2] + call_duration <= ca_cts_capacity:
                ca_ca_load[2] += call_duration
                ca_cts_load[2] += call_duration
                cts = random.randint(1, 2)
                if cts == 1:
                    if cts_cts_load[0] + call_duration <= cts_cts_capacity:
                        cts_cts_load[0] += call_duration
                    else:
                        num_blocked_calls_load_sharing += 1
                else:
                    if cts_cts_load[1] + call_duration <= cts_cts_capacity:
                        cts_cts_load[1] += call_duration
                    else:
                        num_blocked_calls_load_sharing += 1
            else:
                num_blocked_calls_load_sharing += 1

# Affichage des résultats de la simulation
print("Probabilité de blocage d'appel dans le cas de routage a partage de charge: {:.2f}%".format(num_blocked_calls_load_sharing/num_calls*100))

################################################
############## statique ###############
################################################

# Variables pour stocker l'état de charge des liens
ca_ca_load = [0, 0, 0]
ca_cts_load = [0, 0, 0]
cts_cts_load = [0, 0]

# Compteur pour stocker le nombre d'appels bloqués
num_blocked_calls_static = 0

# Affectation statique des utilisateurs aux CA
user_ca_assignment = [1, 2, 3]

# Boucle de simulation
for i in range(num_calls):
    user = random.randint(1, 3) # Utilisateur aléatoire
    ca_idx = user_ca_assignment[user-1] - 1
    if ca_ca_load[ca_idx] + call_duration > ca_ca_capacity or ca_cts_load[ca_idx] + call_duration > ca_cts_capacity:
        num_blocked_calls_static += 1
    else:
        ca_ca_load[ca_idx] += call_duration
        ca_cts_load[ca_idx] += call_duration
        
        cts_idx = random.randint(0, 1) # CTS aléatoire
        if cts_cts_load[cts_idx] + call_duration > cts_cts_capacity:
            num_blocked_calls_static += 1
        else:
            cts_cts_load[cts_idx] += call_duration
            
# Affichage des résultats de la simulation
print("Probabilité de blocage d'appel dans le cas de routage statique : {:.2f}%".format(num_blocked_calls_static/num_calls*100))


################################################
############## adaptative ###############
################################################

# Variables pour stocker l'état de charge des liens
ca_ca_load = [0, 0, 0]
ca_cts_load = [0, 0, 0]
cts_cts_load = [0, 0]

# Compteur pour stocker le nombre d'appels bloqués
num_blocked_calls_adaptive = 0

# Boucle de simulation
for i in range(num_calls):
    user = random.randint(1, 3) # Utilisateur aléatoire
    call_duration = random.randint(1, 5) # Durée d'appel aléatoire
    available_ca = [i for i in range(3) if ca_ca_load[i]+call_duration <= ca_ca_capacity and ca_cts_load[i]+call_duration <= ca_cts_capacity]
    if len(available_ca) == 0:
        num_blocked_calls_adaptive += 1
    else:
        ca_idx = random.choice(available_ca)
        ca_ca_load[ca_idx] += call_duration
        ca_cts_load[ca_idx] += call_duration
        
        available_cts = [i for i in range(2) if cts_cts_load[i]+call_duration <= cts_cts_capacity]
        if len(available_cts) == 0:
            num_blocked_calls_adaptive += 1
        else:
            cts_idx = random.choice(available_cts)
            cts_cts_load[cts_idx] += call_duration
            
# Affichage des résultats de la simulation
print("Probabilité de blocage d'appel dans le cas de routage adaptative : {:.2f}%".format(num_blocked_calls_adaptive/num_calls*100))


################################################
############## Simulation ###############
################################################

# Simulation du routage statique
prob_blocked_calls_static = num_blocked_calls_static / num_calls

# Simulation du routage avec partage de charge
prob_blocked_calls_load_sharing = num_blocked_calls_load_sharing / num_calls

# Simulation du routage adaptatif
prob_blocked_calls_adaptive = num_blocked_calls_adaptive / num_calls

# Tracer les courbes
adaptative = [0]*50000
statique = [0]*50000
partage = [0]*50000

for i in range(50000):
    statique[i] = num_blocked_calls_static/num_calls
    partage[i] = num_blocked_calls_load_sharing/num_calls
    adaptative[i] = num_blocked_calls_adaptive/num_calls
    


routing_methods = ['Static', 'Load Sharing', 'Adaptive']
prob_blocked_calls = [prob_blocked_calls_static, prob_blocked_calls_load_sharing, prob_blocked_calls_adaptive]
plt.bar(routing_methods, prob_blocked_calls)
plt.xlabel('Routing Method')
plt.ylabel('Probability of Blocked Calls')
plt.show()

x = [i for i in range(50000)]

# plotting the line 1 points 
plt.plot(x, statique, label = "Statique", color='red', linestyle='dotted', linewidth = 3,marker='o', markerfacecolor='red', markersize=1)

# line 2 points
plt.plot(x, partage, label = "Partage de charge", color='green', linestyle='dotted', linewidth = 3,marker='*', markerfacecolor='green', markersize=1)
  
plt.plot(x, adaptative, label = "Adaptative", color='blue', linestyle='dotted', linewidth = 3,marker='x', markerfacecolor='blue', markersize=1)
# naming the x axis
plt.xlabel('Nombres de simulation')
# naming the y axis
plt.ylabel('Probability of Blocked Calls')
# giving a title to my graph
plt.title('Courbes de probabilité de blocage des trois méthodes de routage')
  
# show a legend on the plot
plt.legend()
  
# function to show the plot
plt.show()