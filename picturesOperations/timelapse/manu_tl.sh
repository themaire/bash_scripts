#!/bin/bash

# Timelapse sur le "Raspberry Pi 3.

# Exemples :

# Nuit
# projects/timelapse/manutl.sh 30000 9999999 matrix auto 800 600 5 off 55 0 &

# 9h de folie
# /home/pi/projects/timelapse/manutl.sh 8000 57600000 matrix auto 800 600 5 off 55 0 &

# 7200000ms = 2h



# Paramètres :
# $1 -tl 1000 temps entre photos milisecondes
# $2 -t 9999999 temps total time lapse
# $3 -mm spot metering average,spot,backlit,matrix
# $4 -ex auto exposition off,auto,night,nightpreview,backlight,spotlight,sports,snow,beach,verylong,fixedfps,antishake,fireworks
# $5 -w 640 width largeur
# $6 -h 480 hauteur
# $7 -q 9 qualité
# $8 -drc Dynamic Range Compression (DRC) off,low,med,high
# $9 -br brightness 0-100
# -th miniature en x, y, compression
# -ts Remplacer le numéro de la photo par le timestamp

path="/mnt/disquenoir/raspberrypi/raspistill/" # Répertoire de base

# DATE=`date +%Y-%m-%d:%H:%M:%S`
DATE=`date +%Y%m%d%H%M` # Date du jour pour nommer le nouveau dossier
folderDate="tl$DATE" # Nom du dossier de travail
fullPath="$path$folderDate" # Chemin complet où écrire les photos du timelapse

if [ ! -d "$path" ] # Si le dossier path n'existe pas (n'est tout simplement pas monté)
	then # Alors ...
		echo "Montage du NAS en cours ..."
		/home/pi/scripts/montage_disquenoir.sh # Je monte le NAS
	else
		echo "Tout va bien, NAS déja monté."
fi # Fin

if [ ! -d "$fullPath" ] # Si le dossier de la date actuelle et de la minute actuelle existe pas déjà
	then # Alors ...
	echo "Creation du dossier de travail $fullPath."
	mkdir $fullPath # Création du dossier
fi # Fin

echo "C'est parti pour le show ^^ ."
raspistill --nopreview -w $5 -h $6 -q $7 -o "$fullPath/pic%04d.jpg" -tl $1 -t $2 -th 0:0:0 -rot 180 -mm $3 -ex $4 -drc $8 -br $9 -ev 0 &

# sleep $waitAvconv
# C'est parti pour la video du timelapse
# avconv -r 10 -i "$fullPath/pic%04d.jpg" -r 10 -vcodec libx264 -crf 20 -g 15 "$fullPath/tl.mp4" &