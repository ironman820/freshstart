#!/usr/bin/bash
set -euo pipefail

mydir=$PWD

if [[ ! -d $HOME/git ]]
then
   echo "Creating $HOME/git to store git files in and keep the home directory uncluttered."
   mkdir $HOME/git
fi

if [[ ! -x /usr/bin/git ]]
then
   echo "Installing git"
   sudo pacman -S --noconfirm git
fi

echo "Cloning paru..."
cd $HOME/git
git clone https://aur.archlinux.org/paru.git

echo "Building and installing Paru"
cd paru
makepkg -si --noconfirm

echo "Done"
cd $mydir
