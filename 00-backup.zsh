#!/usr/bin/env zsh
set -euo pipefail

mydir=${0:a:h}

if [[ ! -d $mydir/.backups ]] then
   print "Creating backup directory at $mydir/.backups..."
   mkdir $mydir/.backups
fi

print "Backing up Doom Emacs config to $mydir/.backups/.doom.d/"
cp -r $HOME/.doom.d $mydir/.backups/

print "Committing changes to Git Repo:"
cd $mydir
git add .backups
curdate=$(date +"%Y-%m-%d %T")
git commit -m "Backup $curdate"
# git push origin master
