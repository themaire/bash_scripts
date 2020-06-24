#!/usr/bin/python3
# -*- coding: utf-8 -*-

# Script fait pour Matheo Mathieu

from gpiozero import Button
from psutil import process_iter, virtual_memory, disk_usage
from os import system
from time import sleep

#### Variables ####

button = Button(25, hold_time=3.0)
PROCNAME = 'led-image-viewer'

#### Fonctions #### 
def getCamProc(i):
	"""
	i est le PROCNAME.
	"""
	led = ''
	for proc in process_iter():
		if proc.name() == i:
			led = proc
	return led


def StatusCam(i):
	"""
	Connaitre le status du processus de la matrice de LEDs
	i est le PROCNAME.
	@return: le status sous forme de chaine.
	"""

	status = getCamProc(i).status()
	
	return status

def matrice(state, i):
	"""
	Allume ou éteint la matrice.
	state off ou on ou kill
	i est en fonction du nom du proc voulut (l'indice du tuple NAME).
	j est l'indice du proc voulut
	@param:state, On ou off pour allumer ou éteindre.
	"""

	if state == 'off':
		# Suspendre, met en pause le processus :
		getCamProc(i).suspend()
	elif state == 'on':
		# Reprends :
		getCamProc(i).resume()
	elif state == 'kill':
		# Tuer :
		getCamProc(i).kill()
	else:
		exit()

def testMatrice():
	if StatusCam(PROCNAME) == 'sleeping':
		message = "Le matrice fonctionne, donc on l'éteint."
		matrice('kill', PROCNAME)
	else:
		message = "La matrice est déja éteinte."
	return message

def reboot():
	os.system("sudo shutdown -r now")
  
def shutdown():
	os.system("sudo shutdown -h now")

#### Programme ####

button.when_released(testMatrice())

button.when_held(shutdown)
