#!/usr/bin/env bash

# install.sh - install dotfiles into your home directory
set -o nounset

DOTFILES="$1"
RC_FILES='
bashrc
screenrc 
'

function backup_file {
  local _FILE="$1"
  local _TIMESTAMP=$(date +'%F_%T')

  if [[ -f $HOME/$_FILE ]] && [[ ! -L $HOME/$_FILE ]]
  then
    printf -- '--> %s copied to %s\n' "$HOME/$_FILE" "$HOME/$_FILE-dotfile_backup_$_TIMESTAMP"
    mv "$HOME/$_FILE" "$HOME/$_FILE-dotfile_backup_$_TIMESTAMP"
  fi
}


function install_profile {
  
  if ! grep -s -q -e "DOTFILES=\"$DOTFILES\"" "$HOME/.profile"
  then
    backup_file "$HOME/.profile"
    backup_file "$HOME/.bash_profile"
    sed -e "s;DOTFILES=.*;DOTFILES=\"$DOTFILES\";" "$DOTFILES/myenv.sh" > "$HOME/.profile"
    printf -- '--> dotfiles profile installed\n'
  fi
}


function home_link {
  local _RC_FILE="$1"

  backup_file ".${_RC_FILE}"

  if [[ ! -f $HOME/.$_RC_FILE ]]
  then
    ln -s "$DOTFILES/$_RC_FILE" "$HOME/.$_RC_FILE"
  fi
}

# install bash profile
install_profile

# install rc files
for F in $RC_FILES
do
  home_link "$F"
done
