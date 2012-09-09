#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Stolen from https://raw.github.com/michaeljsmalley/dotfiles/master/makesymlinks.sh
############################

########## Variables

dir=~/src/dotfiles                # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
home_files="vimrc gvimrc ackrc vim bundle irbrc gitconfig tmux.conf"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $home_files; do
  if [ -e $dir/home/$file ]; then
    if [ -e ~/.$file ]; then
      echo "Moving any existing dotfiles from ~ to $olddir"
      mv ~/.$file ~/dotfiles_old/
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/home/$file ~/.$file
  fi
done
