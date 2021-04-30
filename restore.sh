#!/usr/bin/env bash
set -euo pipefail


mydir=$PWD

if [[ ! -x /usr/bin/paru ]]
then
    echo "Installing AUR helper"
    $mydir/setup-aur-helper.sh
fi

paru -Syu --needed $(grep --invert-match "glocom" $mydir/.backups/pkglst.txt)

git pull origin master

if [[ ! -x $HOME/.emacs.d/bin/doom ]]
then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
fi

echo "Restoring XMonad Config"
cp -rf $mydir/.backups/bin $HOME/
cp -rf $mydir/.backups/.xmonad $HOME/
cp -rf $mydir/.backups/.config $HOME/
cp -rf $mydir/.backups/.doom.d $HOME/
cp -rf $mydir/.backups/.putty $HOME/
echo "Restoring Application Launchers"
cp -rf $mydir/.backups/.local/share/applications $HOME/.local/share/

echo "Restoring GRUB config"
sudo cp $mydir/.backups/root/etc/default/grub /etc/default/
sudo cp $mydir/.backups/root/etc/grub.d/40_custom /etc/grub.d/

echo "Restoring LightDM settings"
sudo cp $mydir/.backups/root/etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/

echo "Restoring httpd config"
sudo cp $mydir/.backups/root/etc/httpd/conf/extra/httpd-vhosts.conf /etc/httpd/conf/extra/

cd $HOME

cd .xmonad
xmonad --recompile
ghc -dynamic xmonadctl.hs

cd ~/

~/.emacs.d/bin/doom sync
~/.emacs.d/bin/doom doctor
~/.emacs.d/bin/doom upgrade
