#!/bin/bash

# Timelapse sur le "Raspberry Pi 3.

# Exemples :

# Nuit
# projects/timelapse/tl.sh 30000 9999999 matrix auto 800 600 5 off 55 0 &

# 3 h
#
# projects/timelapse/tl.sh 10800000 9999999 matrix auto 800 600 5 off 55 0 &


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

raspistill --nopreview -w $5 -h $6 -q $7 -o /home/pi/Pictures/timelapse/pic3%04d.jpg -tl $1 -t $2 -th 0:0:0 -rot 180 -mm $3 -ex $4 -drc $8 -br $9 -ev 0 &