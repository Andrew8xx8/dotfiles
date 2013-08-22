# Recreate branch
rc() {
  git fetch
  git checkout -b rc
  git branch -D $1
  git checkout $1
  git branch -D rc
}

alias gcim="g ci -m"
