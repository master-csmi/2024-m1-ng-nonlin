rm -r ../home/feelpp/feelppdb/maxwell_particle
rm -r ./maxwell_particle
#mpirun -np 4 feelpp_toolbox_coefficientformpdes --config-file=maxwell_particle.cfg --hostfile hostfile
mpirun --hostfile hostfile feelpp_toolbox_coefficientformpdes --config-file=maxwell_particle.cfg
cp -R ~/feelppdb/maxwell_particle /feel