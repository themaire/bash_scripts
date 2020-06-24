#!/bin/bash
# Jul 01 2016

# Know if the python script called 'harvest' is running.


nbPid=$(ps -aux | grep 'mjpg_streamer' | awk '{print $2}' | wc -l)
pid=$(ps -aux | grep 'mjpg_streamer' | awk '{print $2}' | tail -n 2 | head -n 1)


case "$1" in

	STOP) sudo kill -$1 $pid
	;;

	CONT) sudo kill -$1 $pid
	;;

	*)
	if [ $nbPid == 1 ]
		then
		echo "Le programme 'harvest' n'existe pas."
		exit 1
	elif [ $nbPid == 3 ]
		then
		echo "Le PID de harvest est le : $pid."
	fi
	
	echo "C'est trop bien GNU / Linux!"
	;;
esac

exit 0
