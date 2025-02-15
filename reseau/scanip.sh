#! /bin/bash
# Ecrit par Nicolas ELIE le 20/12/2018 
# nicolas@familleelie.fr

## Description ##
# Permet de scanner une plage d'adresse IP en obtenant un tableau JSON (liste des adresses IP actives détectées 
# grâce à la commande 'ping'.

# @param:$1 La première ip de l'interval
# @param:$2 La dernière ip de l'interval
# @param:$3 Le nombre de tentatives de ping

## Variables ##
usage="USAGE : scanip.sh 50 52 3\n      scanip.sh 'début de plage' 'fin de plage' 'nombre d'essais'"
json="{"
strJson=""

idxTemps=13
idxReceved=5
## Programme ##
if [ $3 = "" ]
then
  echo "Vous avez oublié le nombre d'essais"
  echo -e $usage
fi

for ip in $(eval echo {$1..$2})
do
  # $test est cencé etre le nombre de paquets transmis avec succès lors du ping
  #test=$(ping -c "$3" "192.168.0.$ip" | grep "transmitted" | cut -d " " -f 4)

  statsPing=$(ping -c $3 "192.168.0.$ip")
  receved=$(echo $statsPing | cut -d "-" -f 7 | cut -d " " -f $idxReceved)

#  echo "Paquets reçus $receved/$3 pour l'ip : $ip."

  if [[ $receved = $3 ]]
  then
    temps=$(echo $statsPing | cut -d " " -f $idxTemps | cut -d "=" -f 2)
    status=1
    #echo "Testing $ip : Connectée"
    #echo $statsPing
  elif [[ $receved = 0 ]]
  then
    temps=0
    status=0
    #echo "Testing $ip : Hors ligne."
  elif [[ $receved < 100 ]]
  then
     status=2
     #echo "Testing $ip : Paquets manquants. loss = $loss"
  fi

  # Capturer et construire la donnée en JSON dans la variable $strJson
  strJson+=$(echo -e ",$ip:{\"status\":$status,\"temps\":$temps}")
done

strJson=$(echo $strJson | cut -c2-) # Ligne des données json sans la première virgule, carctere 0 de la chaine

json+="$strJson""}" # Fermeture du json

## Résultat ##
echo $json
