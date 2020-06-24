#! /bin/bash
#
# Bien faire attention à executer ce script dans le dossier où il y a les photos.
#

# On commence par renumeroter les photos
FILES="$1/*.jpg"
num=0

#
# On renumerote les fihiers
#
for i in $FILES
do
	# Construction du numéro des fichiers
	num0000=$(printf "%04d" "$num") #04 pad to length of 4

	# Définition du nouveau nom de fichier
	newName="$num0000.jpg"

	# Un peut de retour à l'écran pour voir où nous en sommes
	echo "Traitement du fichier numéro $num."

	# Coeur du script, le déplacement (renommer) de $i en $newName 
	mv -i -- "$i" "$1/$newName"

	# Incrémentation
	let num=$num+1

done
echo -e "\n$num fichiers ont été renommés."


#
# On ajoute les annotations les fihiers
#
mogrify -pointsize 32 -fill red -annotate +15+25 %[exif:DateTimeOriginal] $1/*.jpg
echo -e "\nAnnotation sur les fichier OK."

sleep 1

#
# On crée le film du timelapse
#
avconv -r 10 -i "$1/%04d.jpg" -r 10 -vcodec libx264 -crf 20 -g 15 "$1/tl.mp4"
echo -e "\nLa video du timelapse OK"
