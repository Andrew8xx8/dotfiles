# Path to al VM's
hash -d zoo=~/projects/zoo/v

# Function to manage VM's
vm() {
  ~zoo/$1
  vagrant "$2"
  cd -
}

# Autocomplete for VM names
compctl -/ -W ~zoo vm
