# Recreate branch
rc() {
  git fetch
  git checkout -b rc
  git branch -D $1
  git checkout $1
  git branch -D rc
}

grf() {
  git flow release finish $1
  git push --tags
  git co develop
  git push develop
  git co master
  git push master
}

alias gci="g ci"
alias gcim="g ci -m"
alias gs="g st"
alias gc="g co"

alias gcd="g co develop"
alias gcm="g co master"
alias gcs="g co staging"

alias gau="git add -u && git status"
alias gam="git ci --amend"
alias gbr="git branch -a"

alias grs="git flow release start"

alias gfs="git flow feature start"
alias gff="git flow feature finish"

alias poh="git rebase --skip"
alias nah="git rebase --abort"
alias zbs="git rebase --continue"
alias ya-zdes-tzar="git push -f origin staging:staging"
alias tzar="git push -f origin "
