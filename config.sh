#!/bin/bash

###################################
# config.sh
# This script configures dotfiles
# Taylor J. Smith
###################################

# variables
dir=~/.dotfiles			# dotfiles directory
olddir=~/.dotfiles_old		# old dotfiles backup directory
files=".bash_aliases .bash_profile .bashrc .gitconfig .gitignore .vimrc"

# create .dotfiles_old directory
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# change to .dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# move existing dotfiles in ~ to .dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving existing dotfiles from ~ to $olddir"
    mv ~/$file ~/.dotfiles_old/
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/$file
done
