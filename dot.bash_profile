if [ -f $HOME/.bashrc ] ; then
  source $HOME/.bashrc
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export ANYENV_ROOT="/Users/shmorimo/.anyenv"
export PATH=$PATH:"/Users/shmorimo/.anyenv/bin"
eval "$(anyenv init -)"
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH=$PATH:"/Users/shmorimo/mini3/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shmorimo/google-cloud-sdk/path.bash.inc' ]; then source '/Users/shmorimo/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shmorimo/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/shmorimo/google-cloud-sdk/completion.bash.inc'; fi
