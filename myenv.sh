#!/usr/bin/env bash

# Add something like this to your bash profile
DOTFILES=/path/to/git/checkout
PROFILE=$DOTFILES/profile

export DOTFILES

if [[ -f $PROFILE ]]
then
  source $PROFILE
fi

# add local stuff here
