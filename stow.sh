#!/usr/bin/sh
STOW_FOLDERS="zsh, starship"

## !! This script should be run from the dotfiles directory
## !! the --adopt flag will overwrite existing files in the target directory

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow: $folder"
    stow -D $folder
    stow --adopt --target=$HOME $folder
    echo "stow: $folder done"

    # add folder to .stow-local-ignore
    echo "$folder" >> .stow-local-ignore
done

echo "stow: whole directories starting with ."
stow -D .
stow --adopt --target=$HOME .
echo "Done"

# remove added folders from .stow-local-ignore
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    sed -i "/$folder/d" .stow-local-ignore
done
