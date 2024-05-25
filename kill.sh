#!/bin/bash

# script that provides a short way of killing a process

helpFunction() {
	local VALUE=${1,,}
	if [ "$VALUE" == "-h" ]; then
		echo "You need to specify name of a proccess"
	fi
}

killProcess() {
	local VALUE=${1,,}
	
	if [[ -n "$VALUE" ]] && [[ "$VALUE" != "-h" ]]; then
		PID=$(ps aux | grep $VALUE | grep -v grep | awk '{print $2}')

		if [ -n "$PID" ]; then
			echo "Killing process"
			kill $PID
		else 
			echo "No such processes"
		fi 
	fi

	helpFunction "$VALUE"
}
killProcess "$1"
