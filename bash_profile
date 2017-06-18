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
  if [[ ! ${git_status}} =~ "working tree clean" ]]; then
    state="*"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo "[${branch}${state}]"
  fi
}

function set_prompt() {
  PS1="${LIGHT_GRAY}\u:${RED}\w${YELLOW}$(parse_git_branch)${LIGHT_GRAY}\$${COLOR_NONE} "
}

function update_terminal_cwd() {
  # Identify the directory using a "file:" scheme URL,
  # including the host name to disambiguate local vs.
  # remote connections. Percent-escape spaces.
  local SEARCH=' '
  local REPLACE='%20'
  local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
  printf '\e]7;%s\a' "$PWD_URL"
}

function prompt_func() {
  update_terminal_cwd
  set_prompt
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
if [ -e "$HOME/.aliases.local" ]; then
  source "$HOME/.aliases.local"
fi

eval "$(/Users/andy/.ht/bin/ht init -)"
