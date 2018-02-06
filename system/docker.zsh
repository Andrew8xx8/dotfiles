alias d="docker"
alias dc="docker-compose"
alias dw="docker-compose run web"
alias ds="docker-compose run --rm --service-ports web"
alias db="docker-compose build"

dcr() {
  docker-compose run --rm --service-ports $1 $2
}

dm() {
  docker-machine $1 default
}

dmr() {
  eval $(docker-machine env default)
}

dclean() {
  echo 'Remove stopped containers'
  docker rm $(docker ps -a -q)
  echo 'Remove untagged images'
  docker images | grep '^<none>' | tr -s ' ' | cut -d ' ' -f 3 | xargs docker rmi
}
