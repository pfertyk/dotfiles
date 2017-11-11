#!/usr/bin/env bash


function get_terminal_id()
{
	local terminal_id=-1
	while read process_id desktop_id machine process_name
	do
		# TODO: use window class instead of process name
		if [ "$desktop_id" -eq "$current_desktop" ] && [[ "$process_name" == *"@$machine: "* ]]
		then
			terminal_id=$process_id
		fi
	done <<< "$(wmctrl -l)"
	echo $terminal_id
}


while read desktop_id desktop_status rest
do
	if [ "*" == "$desktop_status" ]
	then
		current_desktop=$desktop_id
		break
	fi
done <<< "$(wmctrl -d)"


terminal_id=`get_terminal_id`

if [ $terminal_id == -1 ]
then
	exo-open --launch TerminalEmulator
	while [ $terminal_id == -1 ]
	do
		terminal_id=`get_terminal_id`
	done
	wmctrl -ir $terminal_id -b add,fullscreen
else
	wmctrl -ia $terminal_id
fi
