#!/usr/bin/bash
set -euo pipefail

MYDIR=$PWD

if [[ ! -x /usr/bin/paru ]]
then
   echo "Installing AUR helper"
   $MYDIR/setup-aur-helper.sh
fi

paru -Sy --noconfirm grub2-theme-archlinux

cp $MYDIR/.backups/root/etc/default/grub /etc/default/

grub-mkconfig -o /boot/grub/grub.cfg
