# .bashrc

# check for and source global bashrc
if [[ -f /etc/bashrc ]]
then
    source /etc/bashrc
fi

# colors
none='\[\033[0m\]'
black='\[\033[30m\]'
red='\[\033[31m\]'
RED='\[\033[1;31m\]'
green='\[\033[32m\]'
yellow='\[\033[33m\]'
blue='\[\033[34m\]'
magenta='\[\033[35m\]'
cyan='\[\033[36m\]'
white='\[\033[37m\]'

# git prompt functions
function is_git_branch {
  if git branch &>/dev/null
  then
    return 0
  else
    return 1
  fi
}


function git_branch {
  git branch --no-color 2>/dev/null | cut -d' ' -f2
}


function git_ahead {
  git status 2>/dev/null | grep -q -i -e 'ahead'
}


function git_dirty {
  if is_git_branch
  then
    if git status 2>/dev/null | grep -q -i -e 'nothing to commit.*working directory clean'
    then
      return 1
    else
      return 0
    fi
  fi
  
  return 1
}


# the prompt
function draw_prompt {
  #printf '\n'
  printf '$(if (( $? == 0 )); then printf "%s"; else printf "%s"; fi)' $green $red
  printf '\h:%s' $none
  printf '%s\w%s' $white $none
  # Add git stuff if we have git
  if which git &>/dev/null
  then
    printf ' '
    printf '$(if is_git_branch; then printf "["; fi)'
    printf '$(if git_ahead; then printf "%s"; else printf "%s"; fi)' $magenta $yellow
    printf '$(git_branch)'
    printf '$(if git_dirty; then printf "*"; fi)'
    printf '%s' $none
    printf '$(if is_git_branch; then printf "]"; fi)'
  fi
  printf '\n'
  printf '%s\\u%s(\!)$ ' $white $none
}

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

# no special prompt for root
if (( $(id -u) > 0 ))
then
    PS1="$(draw_prompt)"
else
    PS1='\u@\h \W \n\$ '
fi
