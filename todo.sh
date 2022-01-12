#!/bin/bash
command=$1
case $command in
	-add) 
		echo "enter your task: " 
		read task
		if [ -z "$task" ]
		then
      			echo "task can not be empty"
		else
			echo $task >> ~/.todo
		fi ;;
	-remove) 
		echo "enter the task number:"
		read number
		if [[ ! $number =~ ^[0-9]+$ || $number -lt 1 ]]; then
			echo "wrong task number"
    		else
			if [[ -f ~/.todo ]]; then
				sed -i "${number}d" ~/.todo
			fi
		fi ;;
	-show)
		if [[ -f ~/.todo ]]; then
			cat -s -n ~/.todo
		else
			echo "no task inserted yet"
		fi ;;
	"") 
		echo "todo -add for add a task"
		echo "todo -remove for remove a task"
		echo "todo -show for see the tasks" ;;
esac