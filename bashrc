export PATH=$HOME/.local/bin:$PATH
export LESS='-R'

google () {
  gnome-open "https://www.google.com/search?q=$@"
}

alias sl=ls
alias ll='ls -l'
alias la="ls -la"
alias lsa="ls -la"

GITHUB_USERNAME=otsubo
EDITOR='emacs -nw'

# pycd
source $(which pycd.sh)

alias git=hub
alias ga='git add'
alias gd='git diff'
alias gdca='git diff --cached'
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias ggpush='git push origin $(current_branch)'
alias ggpull='git pull origin $(current_branch)'
alias gmpush='git push $GITHUB_USERNAME $(current_branch)'
alias gmpull='git pull $GITHUB_USERNAME $(current_branch)'
alias gbw='hub browse'
alias gpr='hub pull-request'
alias gpl='hub browse -- pulls'
alias gis='hub browse -- issues'
alias gcmsg='git commit -m'

alias G='grep'
alias C='xsel --input --clipboard'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if [ "$DISPLAY" != "" ]; then
  xmodmap $HOME/.Xmodmap
fi

current_branch () {
  git branch 2>/dev/null | grep '^\*' | sed 's/^\* //g'
}

_ps_branch () {
 local branch=$(current_branch)
 if [ "$branch" != "" ]; then
  echo "($branch)"
 fi
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(_ps_branch)\$ '


# history search bindkey
_replace_by_history() {
  local l=$(HISTTIMEFORMAT= history | tac | sed -e 's/^\s*[0-9]\+\s\+//' | percol --query "$READLINE_LINE")
  READLINE_LINE="$l"
  READLINE_POINT=${#l}
}
bind -x '"\C-r": _replace_by_history'

_rostopic_list_percol() {
  local l=$(rostopic list | percol)
  READLINE_LINE="$READLINE_LINE$l"
  READLINE_POINT=${#l}
}
bind -x '"\C-o": _rostopic_list_percol'
