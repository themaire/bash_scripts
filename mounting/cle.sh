#!/bin/bash
echo "Montage de la clé usb /dev/sda1"
dossier="/home/pi/cle/"
if [ ! -d $dossier ]
then
	sudo mkdir -p $dossier
	sudo chown pi $dossier
fi

sudo mount /dev/sda1 /mnt/cle/
