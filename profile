# bash profile

BASHRC="$DOTFILES/bashrc"
PROMPTRC="$DOTFILES/promptrc"

# Source in bashrc
if [[ -f $BASHRC ]]
then
  source "$BASHRC"
fi

# Add sbin directories to path if not already there
if ! grep -q -e 'sbin' <<< $PATH
then
  PATH="$PATH:/sbin:/usr/sbin"
fi

# add $HOME/bin to path if not already there
if ! grep -q -e ":$HOME/bin" <<< $PATH
then
  PATH="$PATH:$HOME/bin"
fi

# History tweak - stuff to ignore
HISTIGNORE='clear:ll:la:pwd:ls:ls -ltr:'

# History tweak - ignore duplicate entries
HISTCONTROL=ignoredups

# set up the prompt
if (( $(id -u) > 0 )) && [[ -f $PROMPTRC ]]
then
  source "$PROMPTRC"
  PS1="$(draw_prompt)"
else
  PS1='\u@\h \W \n\$ '
fi

# exports
export HISTIGNORE HISTCONTROL PATH PS1

# kate: syntax bash;
