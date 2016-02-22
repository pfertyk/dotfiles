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

xbindkeys &
