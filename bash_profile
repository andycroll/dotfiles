[[ -s ~/.bashrc ]] && source ~/.bashrc

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"

function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^On branch ([^${IFS}]*)"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    state="*"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo "[${branch}${state}]"
  fi
}

function prompt_func() {
  PS1="${LIGHT_GRAY}\u:${RED}\w${YELLOW}$(parse_git_branch)${LIGHT_GRAY}\$${COLOR_NONE} "
}
PROMPT_COMMAND=prompt_func

# use atom as an editor
export EDITOR=atom

# keep TONS of history
export HISTSIZE=4096

# irb automatically requires rubygems
RUBYOPT="rubygems"
export RUBYOPT

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

eval "$(/Users/andy/.ht/bin/ht init -)"
