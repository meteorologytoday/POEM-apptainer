#!/bin/bash

. /spack/share/spack/setup-env.sh
spack load intel-oneapi-compilers   \
           intel-oneapi-mpi         \
           netcdf-c                 \
           netcdf-fortran           \
           hdf5%oneapi              \
           json-c                   \
           expat                    \
           udunits


