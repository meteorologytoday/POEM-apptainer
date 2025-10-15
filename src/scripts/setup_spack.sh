#!/bin/bash


echo "Installing spack for package management in HPC environment"
git clone --depth=2 https://github.com/spack/spack.git /spack



export SPACK_USER_CONFIG_PATH=/spack_config
. /spack/share/spack/setup-env.sh

spack env create POEM

spack env activate -p POEM

# The versions of intel-oneapi-compilers and
# intel-oneapi-mpi have to be consistent with
# HPC host.
comp=intel-oneapi-compilers@2023.2.0
compMPI=intel-oneapi-mpi@2021.10.0
opt="-j 8"

spack install $opt $comp
spack install $opt $compMPI                                    %$comp
spack install $opt zlib                                        %$comp
spack install $opt json-c                                      %$comp
spack install $opt expat                                       %$comp
spack install $opt udunits                                     %$comp

#spack install $opt netcdf-c +parallel-netcdf ^$compMPI         %$comp
#spack install $opt netcdf-fortran                              %$comp
