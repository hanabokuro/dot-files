if [ -f $HOME/.bashrc ] ; then
  source $HOME/.bashrc
fi

if [ -d $HOME/.plenv/bin ] ; then
   export PATH="$HOME/.plenv/bin:$PATH"
   eval "$(plenv init -)"
fi

if [ -d $HOME/.rbenv/bin ] ; then
   export PATH="$HOME/.rbenv/bin:$PATH"
   eval "$(rbenv init -)"
fi

if [ -d $HOME/.pyenv/bin ] ; then
   export PYENV_ROOT="$HOME/.pyenv"
   export PATH="$PYENV_ROOT/bin:$PATH"
   eval "$(pyenv init -)"
fi

if [ -d $HOME/.anyenv/bin ] ; then
   export ANYENV_ROOT="/Users/shmorimo/.anyenv"
   export PATH=$PATH:"/Users/shmorimo/.anyenv/bin"
   eval "$(anyenv init -)"
fi
if brew --prefix homebrew/php/php56 >/dev/null 2>&1 ; then
   export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
fi
export PATH=$PATH:"/Users/shmorimo/mini3/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shmorimo/google-cloud-sdk/path.bash.inc' ]; then source '/Users/shmorimo/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shmorimo/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/shmorimo/google-cloud-sdk/completion.bash.inc'; fi
