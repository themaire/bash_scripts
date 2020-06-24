#!/usr/bin/env python
# -*- coding: utf-8 -*-

##### Modules #####
import socket
import os
from sense_hat import SenseHat
import time

sense = SenseHat()

green = [0, 100, 0]
blue = [0 ,0, 100]

gw = os.popen("ip -4 route show default").read().split()
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect((gw[2], 0))
ipaddr = s.getsockname()[0]
host = socket.gethostname()
print ("IP:", ipaddr," Host:", host)

#Host = host.capitalize()
#msg = str("IP: " + ipaddr + " " + Host)
#msg = str("IP: " + ipaddr)


def messageIP():
	sense.show_message("Bonjour", scroll_speed=0.03, text_colour=blue)
	#sense.show_message(msg, scroll_speed=0.03, text_colour=green)

for i in range(1):
	messageIP()

exit()
