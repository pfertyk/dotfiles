#!/bin/bash
dir=$PWD
bck_dir="dotfiles_bck_$(date +%Y_%m_%d)"
files="gitconfig bashrc vimrc vim profile git-prompt.sh 
local/share/xfce4 config/xfce4/terminal config/quicktile.cfg"

echo "Creating $bck_dir for backup of any existing dotfiles"
rm -rf ~/$bck_dir
mkdir ~/$bck_dir

for file in $files; do
    echo "Creating symlink to $file"
    mv ~/.$file ~/$bck_dir/
    ln -s $dir/$file ~/.$file
done

echo "Installing Vundle and other Vim plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

