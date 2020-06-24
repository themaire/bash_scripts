#! /bin/bash

echo "Montage du disquenoir sur le netbook - réseau local"
user="nico"
dossier="/mnt/disquenoir/raspberrypi/"

if [ ! -d $dossier ]
then
	sudo mkdir -p $dossier
	sudo chown $user  $dossier
fi

sudo mount -t cifs //192.168.0.12/ /mnt/disquenoir/ -o username=nico,password=TgvTgmTgv10,netbiosname=disquenoir
