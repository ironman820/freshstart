#!/usr/bin/env zsh
set -euo pipefail

mydir=${0:a:h}

if [[ ! -d $mydir/.backups ]] then
   print "Creating backup directory at $mydir/.backups..."
   mkdir $mydir/.backups
fi

# Backup root files
if [[ ! -d $mydir/.backups/root ]] then
   print "Creating root backup folder"
   mkdir $mydir/.backups/root
fi

if [[ ! -d $mydir/.backups/root/etc/default ]] then
   mkdir -p $mydir/.backups/root/etc/default
   fi

if [[ ! -d $mydir/.backups/root/etc/grub.d ]] then
   mkdir -p $mydir/.backups/root/etc/grub.d
fi

if [[ ! -d $mydir/.backups/.xmonad ]] then
   mkdir -p $mydir/.backups/.xmonad
fi

if [[ ! -d $mydir/.backups/.config ]] then
   mkdir -p $mydir/.backups/.config
fi

if [[ ! -d $mydir/.backups/root/etc/lightdm ]] then
   mkdir -p $mydir/.backups/root/etc/lightdm
fi

print "Backing up XMonad Config"
cp -r $HOME/bin $mydir/.backups/
cp $HOME/.xmonad/xmonadctl.hs $mydir/.backups/.xmonad/
cp $HOME/.xmonad/xmonad.hs $mydir/.backups/.xmonad/
cp -r $HOME/.config/dunst $mydir/.backups/.config/
cp -r $HOME/.config/eww $mydir/.backups/.config/
cp -r $HOME/.config/kitty $mydir/.backups/.config/
cp $HOME/.config/picom.conf $mydir/.backups/.config/
cp -r $HOME/.config/tint2 $mydir/.backups/.config/

print "Backing up GRUB config"
cp /etc/default/grub $mydir/.backups/root/etc/default/
cp /etc/grub.d/40_custom $mydir/.backups/root/etc/grub.d/

print "Backing up LightDM settings"
cp /etc/lightdm/lightdm-gtk-greeter.conf $mydir/.backups/root/etc/lightdm/

print "Backing up Doom Emacs config"
cp -r $HOME/.doom.d $mydir/.backups/

paru -Qqe > $mydir/.backups/pkglst.txt

# This adds the backup to the local repo and commits it.
# I highly recommend keeping this functionality in place on your local machine so you have "backups" if needed
print "Committing changes to Git Repo:"
cd $mydir
git add .backups
curdate=$(date +"%Y-%m-%d %T")
git commit -m "Backup $curdate"

# This line pushes the changes back to Github.
# uncomment if you have forked my repo or added your own upstream.
# git push origin master
