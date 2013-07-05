# bash profile

BASHRC="$DOTFILES/bashrc"

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

# exports
export HISTIGNORE HISTCONTROL PATH
