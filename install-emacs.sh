#!/usr/bin/env bash
set -euo pipefail


mydir=$PWD

if [[ ! -x /usr/bin/paru ]]
then
    echo "Installing AUR helper"
    $mydir/setup-aur-helper.sh
fi

paru -Sy --noconfirm emacs fd aspell aspell-en hlint cabal-install discount python-isort python-pipenv python-nose python-pytest shellcheck lisp
