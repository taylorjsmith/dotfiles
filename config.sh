#!/bin/bash

###################################
# config.sh
# This script configures dotfiles
# Taylor J. Smith
###################################

# variables
dir=~/.dotfiles             # dotfiles directory
olddir=~/.dotfiles_old      # old dotfiles backup directory
files=".bash_aliases .bash_functions .bash_profile .bashrc .gitconfig .gitignore .vim .vimrc"

# create .dotfiles_old directory if it does not exist already
if [ ! -d $olddir ]; then
    echo "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir -p $olddir
fi

# unlink existing symlinks if they exist already
for file in $files; do
    if [ -L ~/$file ]; then
        echo "Unlinking existing symlink to $file"
        unlink ~/$file
    fi
done

# change to .dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# move existing dotfiles in ~ to .dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -f ~/$file ]; then
        echo "Moving $file from ~ to $olddir"
        mv ~/$file ~/$olddir
    fi
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/$file
done
