#!/usr/bin/bash
set -euo pipefail

echo "Setting default branch name to main globally (Github PC Update)"
git config --global init.defaultBranch main

echo "Setting default Global Name to my name"
git config --global user.name "Nicholas Eastman"

echo "Setting default Global Email address to my maintainer email"
git config --global user.email "29488820+ironman820@users.noreply.github.com"

echo "Done!"
