#!/bin/bash

# $1 ---> un chemin : /Volume/photo/201* va donner 2010, 2011, 2012, 2013, 2014 ...
# $2 ---> un motif : DSC_*.nef pour rechercher tous les nefs ou alors DSC_*.MOV pour les vidéos faites avec un boitier NIKON.

# Retourne une liste de taille totale 
#
# 2012  -  12,0298 Go
# 2013  -  12,9556 Go
# 2014  -  38,6016 Go
# 2015  -  4,79427 Go
# 2016  -  21,6445 Go
# 2017  -  0,725544 Go

for i in $1
	do echo $(echo ${i##*/}) ' - ' $(find $i -name $2 -type f -exec ls -l {} \; | awk '{sum += $5 / 1000000000} END {print sum" Go"}')
done

#> /Volumes/photo-1/stockageRushNikon.txt &
