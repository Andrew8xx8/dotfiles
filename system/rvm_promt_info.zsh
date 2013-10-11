# get the name of the ruby version
function rvm_prompt_info() {
  [ -f $HOME/.rvm/bin/rvm-prompt ] || return
  local rvm_prompt
  rvm_prompt=$($HOME/.rvm/bin/rvm-prompt 2>/dev/null)
  [[ "${rvm_prompt}x" == "x" ]] && return
  echo "${rvm_prompt}"
}
