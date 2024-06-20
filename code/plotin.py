import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import glob

csv_files = sorted(glob.glob('./maxwell_particle/np_8/cfpdes.measures/table.entree.*.csv'))

fig, ax = plt.subplots()

def animate(i):
    data = pd.read_csv(csv_files[i])
    
    x = data['Points_capteur_entree_coordinates_0']
    y = data['Points_capteur_entree_expr_L2e']
    
    ax.clear()
    
    ax.plot(x, y, marker='.')
    
    ax.set_xlabel('X')
    ax.set_ylabel('intensité')
    ax.set_title(f'Évolution de l intensité {i+1}')
    ax.set_xlim(-0.8, 0.8)
    ax.set_ylim(0, 40000)

ani = animation.FuncAnimation(fig, animate, frames=len(csv_files), repeat=False)

plt.show()
