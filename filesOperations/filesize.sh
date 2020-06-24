#!/bin/bash

# Sert à connaitre la taille d'un fichier
#
# Usage:
# ./scripts/sizefile.sh chemin/dufichier/fichier.ext

echo $(ls -lh $1 | cut -d ' ' -f 5)
