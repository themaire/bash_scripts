#!/bin/bash
# Jul 01 2016

# Know if the python script called 'harvest' is running.


nbPid=$(ps -aux | grep 'harvest.py' | awk '{print $2}' | wc -l)
pid=$(ps -aux | grep 'harvest.py' | awk '{print $2}' | head -n 1)

case "$1" in

	KILL) sudo kill $pid
        ;;

	STOP) sudo kill -$1 $pid
	;;

	CONT) sudo kill -$1 $pid
	;;

	*)

	if [ $nbPid == 1 ]
		then
		echo "Le programme 'harvest' n'existe pas."
		exit 1
	elif [ $nbPid == 2 ]
		then
		echo "Le PID de harvest est le : $pid."
	fi
esac

echo "C'est trop bien GNU / Linux!"

exit 0
