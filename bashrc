export PATH=$HOME/.local/bin:$PATH
export LESS='-R'

## SVN and SSH
export SSH_USER=otsubo
export SVN_SSH="ssh -l ${SSH_USER}"

google () {
  gnome-open "http://www.google.com?q=$@" &>/dev/null
}

alias sl=ls
alias ll='ls -l'
alias la="ls -la"
alias lsa="ls -la"

GITHUB_USERNAME=otsubo
EDITOR='emacs -nw'

# pycd
#source $(which pycd.sh)

alias git=hub
alias ga='git add'
alias gb='git branch'
alias grv='git remote -v'
alias gd='git diff'
alias gdca='git diff --cached'
alias gst='git status'
alias gc='git commit'
alias gc!='git commit --amend'
alias gco='git checkout'
alias ggpush='git push origin $(current_branch)'
alias ggpush!='git push origin $(current_branch) --force'
alias ggpull='git pull origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias gmpush='git push $GITHUB_USERNAME $(current_branch)'
alias gmpull='git pull $GITHUB_USERNAME $(current_branch)'
alias gbw='hub browse'
alias gpr='hub pull-request'
alias gpl='hub browse -- pulls'
alias gis='hub browse -- issues'
alias gcmsg='git commit -m'
alias gst='git status'
alias gsta='git stash'
alias gstp='git stash pop'
if which rlwrap &>/dev/null; then
  if [ "$EMACS" != "t" ]; then
    alias roseus='rlwrap roseus'
  fi
fi

alias G='grep'
alias C='xsel --input --clipboard'
alias lv='less'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'



#if [ "$DISPLAY" != "" ]; then
#  xmodmap $HOME/.Xmodmap
#fi

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

image_view () {
  rosrun image_view image_view image:=$1
}
alias rqt_reconfigure='rosrun rqt_reconfigure rqt_reconfigure'

#if which pycd.sh &>/dev/null; then
#  source `which pycd.sh`
#fi

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64"
export CUDA_HOME=/usr/local/cuda
export PATH=$PATH:${CUDA_HOME}/bin
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
