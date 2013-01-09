#!/bin/bash

PROFILE=$DOTFILES/profile

if [[ -f $PROFILE ]]
then
  source $PROFILE
  exit
else
  exit 1
fi