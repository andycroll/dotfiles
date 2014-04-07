# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt PROMPT_SUBST

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
  git branch 2> /dev/null | grep "*" | sed -e 's/* \(.*\)/[\1$(parse_git_dirty)]/g'
}
function precmd() {
  export PS1="%n:%{$fg[red]%}%~%{$fg[yellow]%}$(parse_git_branch)%{$reset_color%} $ "
}
