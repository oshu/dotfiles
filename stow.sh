#!/usr/bin/env bash

# stow.sh - call stow to install/update the dotfiles

set -u

TARGET_DIR="$HOME"
STOW_DIR=stow
PACKAGES='bash screen vim tmux'
STOW=stow

for P in $PACKAGES
do
    $STOW --target="$TARGET_DIR" --dir="$STOW_DIR" $P
done

exit
