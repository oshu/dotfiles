#!/bin/bash

# Add something like this to your bash profile
DOTFILES=/path/to/git/checkout
PROFILE=$DOTFILES/profile

if [[ -f $PROFILE ]]
then
  source $PROFILE
fi
