# .bashrc

# check for and source global bashrc
if [[ -f /etc/bashrc ]]
then
    source /etc/bashrc
fi

# aliases
alias ls='ls -F'
alias ll='ls -lhF'
alias la='ls -lAhF'
alias df='df -h'

# history tweak - append file (instead of  overwrite)
shopt -s histappend

# git prompt functions
function parse_git_dirty {
[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# if git is installed, set up git prompt functions
my_uid=$( id -u )

if which git &>/dev/null && (( my_uid > 0 ))
then
    PS1='\u@\h \W\[\033[1;33m\]$(parse_git_branch)\[\033[0m\]$ '
else
    PS1='\u@\h \W \$ '
fi
