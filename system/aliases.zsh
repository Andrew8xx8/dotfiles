alias g="git"
alias v="vim"
alias b="bundle"

# Most recently used commands
alias mruc="history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 \"% \" a;}' | grep -v "./" | column -c3 -s \" \" -t | sort -nr | nl |  head -n10"

alias tmux="TERM=screen-256color-bce tmux"
alias handgun="/Users/avk/projects/rjs/handgun/bin/run"
