#!/bin/bash

# Timelapse sur le "Raspberry Pi 3.

# Exemples :

# projects/timelapse/manu_avconv.sh 4 /mnt/disquenoir/raspberrypi/raspistill/20170522_tl

# Paramètres

# $1 le dossier des images à traiter

# C'est parti pour la video du timelapse
avconv -r 10 -i "$1/pic%04.jpg" -r 10 -vcodec libx264 -crf 20 -g 15 "$1/tl.mp4" &