#!/usr/bin/env bash
set -euo pipefail

mydir=$PWD

if [[ ! -x /usr/bin/paru ]]
then
    echo "Installing AUR helper"
    $mydir/setup-aur-helper.sh
fi

paru -Sy --noconfirm lightdm lightdm-gtk-greeter bunsen-themes-git

sudo cp $mydir/.backups/root/etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/
