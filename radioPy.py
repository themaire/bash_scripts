

##### Modules #####

import psutil
import subprocess
import time
import select


##### Variables #####

channel = 'http://radioscooplyon.ice.infomaniak.ch/radioscoop-lyon-128.mp3'
player = 'mplayer'
cmd = [player, '-slave', '-quiet', channel]

p = None

##### Functions #####

def play():
    global p
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stdin=subprocess.PIPE)

def readOutOriginal():

	import select
	
	while select.select([p.stdout], [], [], 0.05)[0]: # give mplayer time to answer...
		output = p.stdout.readline()
		print("output: {}".format(output.rstrip()))
		split_output = output.split(expect + '=', 1)
		if len(split_output) == 2 and split_output[0] == '': # we have found it
			value = split_output[1]
			return value.rstrip()

def readOutOriginal():

	import select
	
	while select.select([p.stdout], [], [], 0.05)[0]: # give mplayer time to answer...
		output = p.stdout.readline()
		print("output: {}".format(output.rstrip()))
		split_output = output.split(expect + '=', 1)
		if len(split_output) == 2 and split_output[0] == '': # we have found it
			value = split_output[1]
			return value.rstrip()

def read(expect='StreamTitle'):

	import select

	output = p.stdout.readline()
	print("output: {}".format(output.rstrip()))
	split_output = output.split(expect + '=', 1)
	if len(split_output) == 2 and split_output[0] == '': # we have found it
		value = split_output[1]
		return value.rstrip()
		
def defiler(expect='StreamTitle'):
	while select.select([p.stdout], [], [], 0.05)[0]:
		output = p.stdout.readline()
		
		split_output = output.split(expect + '=', 1)
		
		#print("split_output: {}".format(output.rstrip()))
		if len(split_output) == 2 and split_output[0] == 'ICY Info: ':
			value = split_output[1]
			return value.rstrip()

##### Program #####

play()

time.sleep(5)

while 1:
	print(defiler())
	
	time.sleep(5)