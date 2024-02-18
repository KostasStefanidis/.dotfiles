#!/usr/bin/sh
STOW_FOLDERS="zsh, starship"

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "Unstow: $folder"
    stow -D $folder
    echo "Unstow: $folder DONE"

    # add folder to .stow-local-ignore
    echo "$folder" >> .stow-local-ignore
done

echo "Unstow: whole directories starting with ."
stow -D .
echo "Unstow: DONE"

# remove added folders from .stow-local-ignore
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    sed -i "/$folder/d" .stow-local-ignore
done
