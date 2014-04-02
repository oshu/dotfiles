# bash profile

BASHRC="$DOTFILES/bashrc"

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

# exports
export HISTIGNORE HISTCONTROL

# screen
if is_ssh_session
then
  printf '\n'
  screen -ls
fi

# kate: syntax bash;
