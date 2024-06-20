# Définir le répertoire contenant les fichiers CSV
import csv
import os

# Définir le répertoire contenant les fichiers CSV
repertoire = './maxwell_particle/np_4/cfpdes.measures'
nb_pas = 360
# Initialiser une structure de données pour stocker les mesures
# {point: {'coords': (coord0, coord1), 'measurements': {step: mesure}}}
data = {}

# Lire chaque fichier CSV et assembler les données
for point in range(46):  # 45 points de mesure
    for step in range(nb_pas):  # 200 pas de temps
        chemin_fichier = os.path.join(repertoire, f'table.point{point}.{step}.csv')
        
        with open(chemin_fichier, mode='r') as file:
            reader = csv.DictReader(file)
            for row in reader:
                coord0 = float(row[f'Points_point{point}_coordinates_0'])
                coord1 = float(row[f'Points_point{point}_coordinates_1'])
                mesure = float(row[f'Points_point{point}_expr_L2e'])
                
                if point not in data:
                    data[point] = {'coords': (coord0, coord1), 'measurements': {}}
                
                data[point]['measurements'][step] = mesure

# Obtenir tous les pas de temps
pas_de_temps = range(nb_pas)

# Écrire les données dans un nouveau fichier CSV
chemin_sortie = 'resultat_assemble.csv'

with open(chemin_sortie, mode='w', newline='') as file:
    writer = csv.writer(file)
    
    # Écrire l'en-tête
    header = ['Point de mesure', 'coordonnée 0', 'coordonnée 1'] + [f'Step {step}' for step in pas_de_temps]
    writer.writerow(header)
    
    # Écrire les données
    for point, info in data.items():
        row = [point, info['coords'][0], info['coords'][1]] + [info['measurements'].get(step, '') for step in pas_de_temps]
        writer.writerow(row)

print(f"Les données ont été assemblées et écrites dans {chemin_sortie}")
