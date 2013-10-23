# .bashrc

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

# history tweak - append file (instead of overwrite)
shopt -s histappend

# History tweak - dump buffer after each command
if [[ -z $PROMPT_COMMAND ]]
then
  PROMPT_COMMAND='history -a'
else
  PROMPT_COMMAND="${PROMPT_COMMAND}; history -a"
fi

# kate: syntax bash;