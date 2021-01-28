#!/usr/bin/bash
set -euo pipefail

mydir=$PWD

if [[ ! -d $HOME/git ]]
then
   print "Creating $HOME/git to store git files in and keep the home directory uncluttered."
   mkdir $HOME/git
fi

if [[ ! -x /usr/bin/git ]]
then
   print "Installing git"
   sudo pacman -S --noconfirm git
fi

print "Cloning paru..."
cd $HOME/git
git clone https://aur.archlinux.org/paru.git

print "Building and installing Paru"
cd paru
makepkg -si --noconfirm

print "Done"
cd $mydir
