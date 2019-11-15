o() {
  tmux new-session -d -s $1 -c ~/p/$1
  tmux split-window -v -t $1 -c ~/p/$1
  tmux new-window -d -c ~/p/$1 -t 1
  tmux attach-session -t $1
}

compctl -/ -W ~/p o
