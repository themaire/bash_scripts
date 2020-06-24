#! /bin/bash
# Permet de se syncroniser les Pi de la maison plus facilement vers le nas Synology.
echo "Tout va bien se passer."

case "$1" in

	charline) echo "Connexion au Raspberry Pi A+."
	rsync -h -v -r -P -t /home/pi/ "/mnt/disquenoir/raspberrypi/pi$1/" &
	;;

	bois) echo "Connexion au Raspberry Pi zero en bois."
	rsync -h -v -r -P -t /home/pi/ "/mnt/disquenoir/raspberrypi/pi$1/" &
	;;

	3) echo "Connexion au Raspberry Pi 3."
	rsync -h -v -r -P -t /home/pi/ "/mnt/disquenoir/raspberrypi/pi$1/" &
	;;

	w) echo "Connexion au Raspberry Pi Zero W."
	rsync -h -v -r -P -t /home/pi/ "/mnt/disquenoir/raspberrypi/pi$1/" &
	;;

	manon) echo "Connexion au Raspberry Pi Zero Bis."
	rsync -h -v -r -P -t /home/pi/ "/mnt/disquenoir/raspberrypi/pi$1/" &
	;;

	parents) echo "Connexion au Raspberry Pi A+ des parents."
	rsync -h -v -r -P -t /home/pi/ "/mnt/disquenoir/raspberrypi/pi$1/" &
	;;
	*) echo -e "!!!!!! \n You must enter a Raspberry Pi name. \n Usage :\n pi.sh a or 2 or zero"
	;;

esac

exit 0