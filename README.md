dotfiles
========

Some files I use to configure my shell environment.

setup
-----

1. Add the variable `DOTFILES` to your bash profile and set it to the path of your dotfiles git checkout. Export it so the other scripts can use it.

```
export DOTFILES="$HOME/Workspace/dotfiles"
```

2. Add a stanza to source the main profile.

```
PROFILE="$DOTFILES/profile"
if [[ -f $PROFILE ]]
then
  source $PROFILE
fi
```

3. Replace your `.bashrc` with a link to the one in the dotfiles repo.

```
$ ln -s $HOME/.bashrc $DOTFILES/bashrc