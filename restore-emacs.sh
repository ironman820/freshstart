#!/usr/bin/env bash
set -euo pipefail


mydir=$PWD

if [[ ! -x /usr/bin/paru ]]
then
    echo "Installing AUR helper"
    $mydir/setup-aur-helper.sh
fi

if [[ ! -x /usr/bin/emacs ]]
then
    paru  -Sy --noconfirm emacs fd aspell aspell-en hlint cabal-install discount python-isort python-pipenv python-nose python-pytest shellcheck lisp
fi

if [[ ! -x $HOME/.emacs.d/bin/doom ]]
then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
fi

cp -r $mydir/.backups/.doom.d $HOME/

~/.emacs.d/bin/doom sync
~/.emacs.d/bin/doom doctor
