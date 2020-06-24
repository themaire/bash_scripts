#! /bin/bash
# Permet de se connexter en ssh plus facilement.
echo "Tout va bien se passer."

case "$1" in

	charline) echo "Connexion au Raspberry Pi A+."
	ssh pi@charline.local
	;;

	bois) echo "Connexion au Raspberry Pi zero en bois."
	ssh pi@raspberrypibois.local
	;;

	3) echo "Connexion au Raspberry Pi 3."
	ssh pi@raspberrypi3.local
	;;

	w) echo "Connexion au Raspberry Pi Zero W."
	ssh pi@raspberrypizerow.local
	;;

	manon) echo "Connexion au Raspberry Pi Zero Bis."
	ssh pi@manon.local
	;;

	parents) echo "Connexion au Raspberry Pi A+ des parents."
	ssh pi@parents.local
	;;
	*) echo -e "!!!!!! \n You must enter a Raspberry Pi name. \n Usage :\n pi.sh a or 2 or zero"
	;;

esac

exit 0