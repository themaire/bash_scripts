#! /bin/bash
#
# Bien faire attention à executer ce script dans le dossier où il y a les photos.
#

## Ne pas prendre en compte ## Ne pas oublier le parametre $1 qui correspond au chemin du dossier de travail SANS le slash de fin
#FILES="$1/*.jpg"

FILES=*.jpg
num=0

for i in $FILES
do
	# Construction du numéro des fichiers qui nous servira de compteur
	num0000=$(printf "%04d" "$num") #04 pad to length of 4

	# Définition du nouveau nom de fichier
	newName="$num0000.jpg"

	# Un peut de retour à l'écran pour voir où nous en sommes
	echo "Traitement du fichier numéro $num."

	# Coeur du script, le déplacement (renommer) de $i en $newName
	#mv -i -- "$i" "$1/$newName"
	mv $i $newName

	# Incrémentation
	let num=$num+1

done

# Done!!!
echo "Traitement terminé."
echo "$num fichiers ont été renommés."

echo "Appuyez sur ENTREE pour quitter"
read junk
