#! /bin/bash
#
# Script depuis le DELL
#
# Bien faire attention à executer ce script dans le dossier où il y a les photos sans le slash de fin.
# !!! Ne pas oublier le parametre $1 qui correspond au chemin du dossier de travail dans tous les scripts utilisés ci-dessous.


PATH="/mnt/disquenoir/raspberrypi/scripts"
cd $PATH



#
# On renumerote les fihiers
#
echo "Renumerotation des fichiers"
echo "$(ls $1)"
"$PATH/renumerote.sh $1"



#
# On ajoute les annotations les fihiers
#
#echo "Ajout de la date et de l'heure en rouge sur les fichiers"
mogrify -pointsize 32 -fill red -annotate +15+25 %[exif:DateTimeOriginal] "$1/*.jpg"


#"time $PATH/timelapse/manu_avconv.sh $1"


echo -e "\nOpération terminée."
