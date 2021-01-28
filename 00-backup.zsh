#!/usr/bin/env zsh
set -euo pipefail

mydir=${0:a:h}

if [[ ! -d $mydir/.backups ]] then
   print "Creating backup directory at $mydir/.backups..."
   mkdir $mydir/.backups
fi

print "Backing up Doom Emacs config to $mydir/.backups/.doom.d/"
cp -r $HOME/.doom.d $mydir/.backups/

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
