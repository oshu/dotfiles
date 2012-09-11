# bash profile

# Source in bashrc
[[ -f "$HOME/git/oshu/dotfiles/bashrc" ]] && . "./$HOME/git/oshu/dotfiles/bashrc"

# Add sbin directories to path
PATH=$PATH:/sbin:/usr/sbin:$HOME/bin

# History tweak - stuff to ignore
HISTIGNORE="pwd:ls:ls -ltr:"

# History tweak - ignore duplicate entries
HISTCONTROL=ignoredups

# History tweak - dump buffer after each command
[[ -z "$PROMPT_COMMAND" ]] && PROMPT_COMMAND="history -a" || PROMPT_COMMAND="${PROMPT_COMMAND}; history -a"

# exports
export HISTIGNORE HISTCONTROL PROMPT_COMMAND PATH
