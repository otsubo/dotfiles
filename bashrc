export PATH=$HOME/.local/bin:$PATH

google () {
  gnome-open "http://google.com?q=$@"
}

alias sl=ls
alias ll='ls -l'
alias la="ls -la"
alias lsa="ls -la"

alias git=hub
alias ga='git add'
alias gd='git diff'
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'

alias C='xsel --input --clipboard'

current_branch () {
 local branch
 branch=$(git branch 2>/dev/null | grep '^\*' | sed 's/^\* //g')
 if [ "$branch" != "" ]; then
  echo "($branch)"
 fi
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(current_branch)\$ '
