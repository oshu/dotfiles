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

if which git &>/dev/null
then
  alias gs='git status'
  alias gd='git diff'
  alias gl='git log'
  alias gc='git commit'
  alias ga='git add'
fi

if which screen &>/dev/null
then
  alias sr='screen -r'
fi

if which curl &>/dev/null
then
  alias cget='curl -L -O'
fi

# functions
function update_title {
  printf '\033]0;%s@%s\007' $USER $(hostname -s)
}


function path_fix {
  local _DIR="$1"

  if ! grep -q -E -e "\(^${_DIR}:|:${_DIR}[^/]?" <<< $PATH
  then
    PATH="${_DIR}:${PATH}"
  fi
}


# history tweak - append file (instead of overwrite)
shopt -s histappend

## fix up the path
for p in "$HOME/bin" /sbin /usr/sbin /usr/local/sbin /opt/local/bin /opt/local/libexec/gnubin
do
  if [[ -d $p ]]
  then
    path_fix "$p"
  fi
done

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
