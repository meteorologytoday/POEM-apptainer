#!/bin/bash

POEM_version=origin/dev/apptainer-compile
LPJmL_version=c29e5bdfe6c5953443e5c047fadece8ad0b0d960


TARGET_ROOT=$1


if [ ! -d "$TARGET_ROOT" ]; then
    echo "Error: Input directory '$TARGET_ROOT' is not a directory."
fi





# Make POEM directory
cd $TARGET_ROOT

git clone https://gitlab.pik-potsdam.de/poem/poem.git
cd poem
git checkout $POEM_version

cd src/land_atlantes
git clone https://gitlab.pik-potsdam.de/lpjml/central_code_variants/lpjml_poem.git LPJmL
cd LPJmL
checkout $LPJmL_version


# Make standalone LPJmL
cd $TARGET_ROOT
git clone https://gitlab.pik-potsdam.de/lpjml/central_code_variants/lpjml_poem.git standalone_LPJmL
cd standalone_LPJmL
checkout $LPJmL_version


