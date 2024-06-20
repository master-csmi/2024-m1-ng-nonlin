import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.animation as animation

csv_files = './resultat_assemble.csv'

fig, ax = plt.subplots()

def animate(i):
    data = pd.read_csv(csv_files)
    
    x = data['Point de mesure']
    y = data[f'Step {i}']
    
    ax.clear()
    
    ax.plot(x, y,marker = ".")
    
    ax.set_xlabel('X')
    ax.set_ylabel('intensité')
    ax.set_title(f'Évolution de l intensité {i+1}')
    ax.set_xlim(0,45)
    ax.set_ylim(0, 45000)

ani = animation.FuncAnimation(fig, animate, frames=361, repeat=False)

plt.show()
