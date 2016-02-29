# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export PATH="$PATH:~/.local/bin"
export LC_TIME="en_GB.UTF-8"

xmodmap -e "clear Lock"
xmodmap -e "keycode 0x42 = Mode_switch"
# xmodmap -e "keycode 0x87 = Super_R"
# xmodmap -e "keycode 0x7f = Mode_switch"
# xmodmap -e "keycode 0x76 = BackSpace"
xmodmap -e "keysym l = l L Right Right lstroke Lstroke"
xmodmap -e "keysym h = h H Left"
xmodmap -e "keysym j = j J Down"
xmodmap -e "keysym k = k K Up"

xmodmap -e "keysym 1 = 1 exclam F1"
xmodmap -e "keysym 2 = 2 at F2"
xmodmap -e "keysym 3 = 3 numbersign F3"
xmodmap -e "keysym 4 = 4 dollar F4"
xmodmap -e "keysym 5 = 5 percent F5"
xmodmap -e "keysym 6 = 6 asciicircum F6"
xmodmap -e "keysym 7 = 7 ampersand F7"
xmodmap -e "keysym 8 = 8 asterisk F8"
xmodmap -e "keysym 9 = 9 parenleft F9"
xmodmap -e "keysym 0 = 0 parenright F10"
xmodmap -e "keysym minus = minus underscore F11"
xmodmap -e "keysym equal = equal plus F12"

xbindkeys &
