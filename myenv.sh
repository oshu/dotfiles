#!/bin/bash

PROFILE=$DOTFILES/profile

if [[ -f $PROFILE ]]
then
  source $PROFILE
fi
