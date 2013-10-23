# Recreate branch
rc() {
  git fetch
  git checkout -b rc
  git branch -D $1
  git checkout $1
  git branch -D rc
}

alias gcim="g ci -m"
alias gst="g st"
alias gco="g co"
alias gau="git add -u && git status"
alias gam="git ci --amend"
alias gbr="git branch -a"

alias grs="git flow release start"
alias grf="git flow release finish"

alias gfs="git flow feature start"
alias gff="git flow feature finish"
