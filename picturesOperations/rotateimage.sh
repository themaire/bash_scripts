#!/bin/bash

# Exemple quand on a des fichiers épartillées dans plusieurs sous dossiers.
# find /dossier/ou/sont/les/images/ -name "DSC*.JPG" | while read file; do; convert $file -rotate $1 "$file"_rotated.JPG; done

cpt=0

for file in *.jpg; do
  convert $file -rotate $1 "${file%.JPG}"_rotated.JPG
  echo "$file tourné"
  cpt=$(( $cpt + 1 ))
done

echo "Script terminé. $cpt fichiers tournés."