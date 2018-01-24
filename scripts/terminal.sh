#!/usr/bin/env bash

# A simple script that turns normal terminal into a drop-down terminal.
#
# I wrote it because XFCE terminal in drop-down mode was not detected as a
# normal window,  making it impossible to go back to it by cycling through
# the list of windows (Alt+Tab).
#
# Behavior:
# - if there is no terminal open yet, open it in fullscreen mode
# - if the terminal is open but not active, activate it
# - if the terminal is open and active, minimize it
#
# Requirements:
# - xdotool
# - wmctrl
# - exo-open (exo-utils)

function get_terminal_id()
{
	local terminal_id=-1
	while read process_id desktop_id class rest
	do
		if [ "$desktop_id" -eq "$1" ] && [[ "$class" == *"terminal"* ]]
		then
			terminal_id=$process_id
		fi
	done <<< "$(wmctrl -lx)"
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

terminal_id=`get_terminal_id $current_desktop`

if [ $terminal_id == -1 ]
then
	gnome-terminal
	while [ $terminal_id == -1 ]
	do
		terminal_id=`get_terminal_id $current_desktop`
	done
	wmctrl -ir $terminal_id -b add,maximized_vert,maximized_horz
else
	current_window_id=`xdotool getactivewindow`
	terminal_id_decimal=`printf "%d" $terminal_id`
	if [ $current_window_id == $terminal_id_decimal ]
	then
		xdotool windowminimize $terminal_id
	else
		wmctrl -ia $terminal_id
	fi
fi
