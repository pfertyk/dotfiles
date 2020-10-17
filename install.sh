#!/bin/bash
dir=$PWD
bck_dir="dotfiles_bck_$(date +%Y_%m_%d)"
files="
bashrc
git-prompt.sh
gitconfig
inputrc
profile
vim
vimrc
Xmodmap
zshrc
"

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

