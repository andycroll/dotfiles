# include local
if [ -e ~/.zshrc.local ]
then
  exec ~/.zshrc.local
fi

bindkey '[C' forward-word
bindkey '[D' backward-word

# add brew to path
export PATH=./bin:/usr/local/sbin:/usr/local/bin:$PATH

export ZSH=~/.oh-my-zsh

export ZSH_THEME="mh"
plugins=(bundler
         chruby
         common-aliases
         copyfile
         extract
         gem
         git
         gitfast
         jsontools
         osx
         ruby)
source $ZSH/oh-my-zsh.sh

# use nova as an editor
export EDITOR=atom

# irb automatically requires rubygems
export RUBYOPT="rubygems"

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi
if [ -e "$HOME/.aliases.local" ]; then
  source "$HOME/.aliases.local"
fi

# compilation flags
export ARCHFLAGS="-arch x86_64"

# heroku autocomplete setup
# HEROKU_AC_ZSH_SETUP_PATH=/Users/andy/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
