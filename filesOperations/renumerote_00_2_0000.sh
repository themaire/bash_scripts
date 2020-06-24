#! /bin/bash
# A utiliser quand on a des fichier du genre pic_95 et que l'on souhaite les transformer en pic_0095 par exemple.
# Bien faire attention à executer ce script dans le dossier où il y a les photos.
#

FILES=*.jpg

for i in $FILES
do
	# Détection du numéro à l'interieur du nom du fichier
	num=$(ls $i | cut -d "_" -f 2 | cut -d "." -f 1)
	
	# Définition du nouveau nom de fichier
	newName="timelapse_$(printf %04d $num).jpg"
	
	# Un peut de retour à l'écran pour voir où nous en sommes
	echo "Traitement du fichier numéro $num. \n"
	
	# Coeur du script, le déplacement (renommer) de $i en $newName 
	mv $i $newName
done

# Done!!!
echo "Traitement terminé. Appuyez sur ENTREE pour quitter"
read junk