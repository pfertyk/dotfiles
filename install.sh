#!/bin/bash
dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc vim profile git-prompt.sh local/share/xfce4 config/xfce4/terminal"

echo "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir $olddir

echo "Changing to the $dir directory ..."
cd $dir

for file in $files; do
    echo "Creating symlink to $file in home directory."
    mv ~/.$file ~/dotfiles_old/
    ln -s $dir/$file ~/.$file
done

echo "Installing Vundle and other Vim plugins ..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

