# 2024-m1-maxwell
Repository for the ng-nonlin project
README PROJECT MAXWELL GONIN ALEXIS

Welcome to my M1 project master 


## **User guide:**

### **Requirements:**

1: Install docker : see https://docs.docker.com/engine/install/ubuntu/

2: Install the toolbox with docker: `docker pull ghcr.io/feelpp/feelpp:jammy`

### **run simulation:**
1: Copy maxwell.json , maxwell_particle.cfg, run.sh and your_mesh.geo files in your `$HOME/feel/` folder

2: Make sure that your_mesh.geo is designed as follow: `Physical Surface("Sreen")` for background and `Physical Surface("Particle")` for any object.

3: Open a terminal and launch the docker image: `docker run --rm -it -v $HOME/feel:/feel ghcr.io/feelpp/feelpp:jammy` and go into feel/ folder

4(bis):Execute run.sh scrip to run simulation or adapt it to your working station.

4: run the simulation with one core:`feelpp_toolbox_coefficientformpdes --config-file=maxwell_particle.cfg`

5: Use MPI parallelization : add the hostfile file in $HOME/feel, choose the number of core "X" in it and run the simulation with: `mpirun -np "X" feelpp_toolbox_coefficientformpdes --config-file=maxwell1.cfg --hostfile hostfile`

6: copy results from docker to your $HOME/feel/ folder : `cp -R ~/feelppdb/maxwell_particle /feel`

7: to visualize the simulation in paraview, open `$/feel/maxwell_particle/np_"X"/cfpdes.exports/Export.case`
