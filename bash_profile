export PATH=$HOME/.rbenv/bin:/usr/local/bin:$HOME/bin:$PATH

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\[\033[G\]\u:\[\033[31;40m\]\w\[\033[0;33m\]$(parse_git_branch)\[\e[0m\]$ '

# use sublime as an editor
export EDITOR=subl

# keep TONS of history
export HISTSIZE=4096

# irb automatically requires rubygems
RUBYOPT="rubygems"
export RUBYOPT

# make ruby faster
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### CHRUBY
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby 2
