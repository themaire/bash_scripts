#! /bin/bash

echo "Montage de raspberrypi du disquenoir sur Synology - réseau local"
dossier="/mnt/disquenoir/raspberrypi/"
user="pi"

if [ ! -d $dossier ]
then
	sudo mkdir -p $dossier
	sudo chown $user $dossier
fi
#sudo mount -t cifs //192.168.0.12/raspberrypi /mnt/disquenoir/ -o username=nico,password=TgvTgmTgv10,netbiosname=disquenoir
sudo mount -t cifs //192.168.0.12/raspberrypi/ /mnt/disquenoir/raspberrypi/ -o username=nico,password=TgvTgmTgv10,netbiosname=disquenoir
