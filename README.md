dotfiles
========

Some files I use to configure my shell environment.

setup
-----

1. Add the variable `DOTFILES` to your bash profile and set it to the path of your dotfiles git checkout. Export it so the other scripts can use it.

```bash
export DOTFILES="$HOME/Workspace/dotfiles"
```

2. Add a stanza to source the main profile.

```bash
PROFILE="$DOTFILES/profile"
if [[ -f $PROFILE ]]
then
  source $PROFILE
fi
```

3. Replace your `.bashrc` with a link to the one in the dotfiles repo.

```bash
$ ln -s $HOME/.bashrc $DOTFILES/bashrc
```

details
-------

* `profile`

  The main bash profile. Replaces `.profile` and `.bash_profile`.
  
  * Ensures `/sbin` and `/usr/sbin` are in the path.
  
  * Sets history to ignore common commands like `clear` and `ls`.
  
  * Sets history to ignore duplicate commands.
  
* `bashrc`

  Replaces `.bashrc` file to configure interactive sessions.

  * Sets history to append after every commands.
  
  * Sets up a fancy prompt unless you are root (details below).
  
  * Adds aliases for common commands.
  
* `promptrc`

  Sourced by `bashrc` to create the fancy prompt.
  
  * Creates a two line prompt.
  
  * Hostname turns red if last command failed.
  
  * Hostname is inversed for remote ssh sessions.
  
  * Shows branch name when currect directy is a git repo.
  
  * Git branch name turn magenta when repo is dirty, green when clean.
  
  * Command number is displayed for easy resue.
