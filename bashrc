# .bashrc

PROMPTRC="$DOTFILES/promptrc"

# check for and source global bashrc
if [[ -f /etc/bashrc ]]
then
  source /etc/bashrc
fi

# aliases
alias ls='ls -F --color=auto'
alias ll='ls -lhF --color=auto'
alias la='ls -lAhF --color=auto'
alias df='df -h'
if which curl &>/dev/null
then
    alias cget='curl -O'
fi

# history tweak - append file (instead of overwrite)
shopt -s histappend

# history tweak - dump buffer after each command
if [[ -z $PROMPT_COMMAND ]]
then
  PROMPT_COMMAND='history -a'
else
  PROMPT_COMMAND="${PROMPT_COMMAND}; history -a"
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
