#!/bin/bash

script_dir=$(dirname $0)
output_root=$1
label=$2
suffix=$3


if [ -n "$suffix" ] ; then
    label_suffix=${label}_${suffix}
else
    label_suffix=${label}
fi

sandbox_path=$output_root/SANDBOX_${label_suffix}/
def_file=$script_dir/$label.def

echo "Def file        : $def_file"
echo "Sandbox location: $sandbox_path"

printf "Does it look good? (y/N): "
read ans

if [ "$ans" = "y" ] || [ "$ans" = "Y"] ; then
    apptainer build --sandbox $sandbox_path $def_file
fi

echo "Program exit."
