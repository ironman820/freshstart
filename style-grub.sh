#!/usr/bin/bash
set -euo pipefail

MYDIR=$PWD

if [[ ! -x /usr/bin/paru ]]
then
   echo "Installing AUR helper"
   $MYDIR/setup-aur-helper.sh
fi

paru -Sy --noconfirm grub2-theme-archlinux

sudo cp $MYDIR/.backups/root/etc/default/grub /etc/default/
sudo cp $MYDIR/.backups/root/etc/grub.d/40_custom /etc/grub.d/

sudo grub-mkconfig -o /boot/grub/grub.cfg
