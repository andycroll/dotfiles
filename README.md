# andycrol dotfiles

## Install

You need to have installed [rcm](https://github.com/thoughtbot/rcm)

```Shell
git clone git@github.com:andycroll/dotfiles.git
```

Then manage the dot files with:

```Shell
rcup -d dotfiles dotfiles-local -x README.md
```

This will create symlinks for all config files in your home directory. You can
safely run command multiple times to update.
