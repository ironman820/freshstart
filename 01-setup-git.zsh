#!/bin/zsh -f
set -euo pipefail

echo "Setting default branch name to master globally"
git config --global init.defaultBranch master

echo "Setting default Global Name to my name"
git config --global user.name "Nicholas Eastman"

echo "Setting default Global Email address to my maintainer email"
git config --global user.email "29488820+ironman820@users.noreply.github.com"

echo "Done!"
