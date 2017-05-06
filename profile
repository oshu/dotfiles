# bash profile

BASHRC="$HOME/.bashrc"

source "$DOTFILES/functions"

# Source in bashrc
if [[ -f $BASHRC ]]
then
  source "$BASHRC"
fi

# History tweak - stuff to ignore
HISTIGNORE='clear:ll:la:pwd:ls:ls -ltr:'

# History tweak - ignore duplicate entries
HISTCONTROL=ignoredups

# Default editor
EDITOR=vim

# exports
export HISTIGNORE HISTCONTROL EDITOR

# screen
if is_ssh_session
then
  printf '\n'
  screen -ls | sed -e '/^No Sockets found.*$/d'
fi

# kate: syntax bash;
