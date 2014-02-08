# .bashrc

PROMPTRC="$DOTFILES/promptrc"

# check for and source global bashrc
if [[ -f /etc/bashrc ]]
then
  source /etc/bashrc
fi

# aliases
alias ls='ls -F --color'
alias ll='ls -lhF --color'
alias la='ls -lAhF --color'
alias df='df -h'
if which curl &>/dev/null
then
    alias cget='curl -O'
fi

# functions
function update_title {
    printf '\033]0;%s@%s\007' $USER $(hostname -s)
}

# history tweak - append file (instead of overwrite)
shopt -s histappend

# setup up the prompt command
if [[ -z $PROMPT_COMMAND ]]
then
  PROMPT_COMMAND='history -a; update_title'
else
  if ! [[ $PROMPT_COMMAND =~ "history -a" ]]
  then
    PROMPT_COMMAND="${PROMPT_COMMAND}; history -a"
  fi
  if ! [[ $PROMPT_COMMAND =~ "update_title" ]]
  then
    PROMPT_COMMAND="${PROMPT_COMMAND}; update_title"
  fi
fi

# set up the prompt
if (( $(id -u) > 0 )) && [[ -f $PROMPTRC ]]
then
  source "$PROMPTRC"
  PS1="$(draw_prompt)"
else
  PS1='\u@\h \W \n\$ '
fi

# kate: syntax bash;
