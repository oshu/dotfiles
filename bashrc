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
function parse_git_dirty {
git status 2>/dev/null | grep -q -i -e 'nothing to commit*working directory clean' || printf '*'
}

function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
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
	printf ' %s$(parse_git_branch)%s' $yellow $none
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

# no special prompt for root
if (( $(id -u) > 0 ))
then
    PS1="$(draw_prompt)"
else
    PS1='\u@\h \W \n\$ '
fi
