alias u=pushd
alias o=popd
alias s='[ $TERM != "screen" ] && screen -D -RR'

PATH=/usr/local/go/bin:$PATH
PATH="/opt/homebrew/bin:$PATH"

[ -f "/Users/shmorimo/.ghcup/env" ] && . "/Users/shmorimo/.ghcup/env" # ghcup-env