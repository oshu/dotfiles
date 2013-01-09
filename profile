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

# History tweak - dump buffer after each command
if [[ -z $PROMPT_COMMAND ]]
then
    PROMPT_COMMAND='history -a'
else
    PROMPT_COMMAND="${PROMPT_COMMAND}; history -a"
fi

# exports
export HISTIGNORE HISTCONTROL PROMPT_COMMAND PATH
