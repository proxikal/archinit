#!/bin/bash
IFS=$'\r\n' GLOBIGNORE='*' command eval  'PKGS=($(cat packages))'
__hasYes=$(which yes)

# echo "cooper -S ${PKGS[@]}"
count=0
for pak in "${PKGS[@]}"
do
    if [ -f /usr/bin/$pak ];
    then
        # InstallPkgs[#InstallPkgs[@]]=${pak}
        unset PKGS[$count]
        # echo "$pak Is already installed"
    fi
    ((count=count+1))
done


echo "There Are: ${#PKGS[@]} Items in this array."
echo "Loading Packages..."
pacman -S ${PKGS[@]}
