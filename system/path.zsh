export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "/usr/local/rvm/bin" ]] && export PATH=/usr/local/rvm/bin:$PATH

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH=/Users/8xx8/android-sdks/tools/:/Users/8xx8/android-sdks/platform-tools:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH=$PATH:/Users/avk/garmin/connectiq-sdk-mac-3.1.4-2019-09-17-f1e7e9687/bin

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
