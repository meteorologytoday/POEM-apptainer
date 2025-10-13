

compiler=intel-oneapi-compilers


. /spack/share/spack/setup-env.sh
spack load $compiler   \
           intel-oneapi-mpi   %$compiler      \
           netcdf-c           %$compiler      \
           netcdf-fortran     %$compiler      \
           hdf5               %$compiler      \
           json-c             %$compiler      \
           expat              %$compiler      \
           udunits            %$compiler


export LPJ_INC="`nc-config --cflags`"
export LPJ_LIB="`nc-config --libs`"

pkg_info=(
    json-c  "include" "lib64" json-c
    expat   "include" "lib"   expat
    udunits "include" "lib"   udunits2
)


nparam=4
for (( i=0 ; i < $(( "${#pkg_info[@]}" / $nparam )) ; i++ )) ; do
    pkg="${pkg_info[$(( $nparam * $i + 0 ))]}"
    includedir="${pkg_info[$(( $nparam * $i + 1 ))]}"
    libdir="${pkg_info[$(( $nparam * $i + 2 ))]}"
    libname="${pkg_info[$(( $nparam * $i + 3 ))]}"

    pkg_root=$( spack location -i $pkg %$compiler )

    export LPJ_INC="-I$pkg_root/$includedir $LPJ_INC"
    export LPJ_LIB="-L$pkg_root/$libdir -l$libname $LPJ_LIB"
    export LD_LIBRARY_PATH="$pkg_root/$libdir:$LD_LIBRARY_PATH"
done

echo "LPJ_INC=$LPJ_INC"
echo "LPJ_LIB=$LPJ_LIB"



