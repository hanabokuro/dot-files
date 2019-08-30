if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PS1='\h:\W \u \$ '
export LC_ALL=C

for F in /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash \
         /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh \
         /usr/share/doc/git-1.7.1/contrib/completion/git-completion.bash \
         /usr/share/doc/tmux-1.6/examples/bash_completion_tmux.sh \
         `brew --prefix`/etc/bash_completion \
         ; do
  if [ -f $F ] ; then
    . $F
  fi
done

export PS1='[\u@\h \W$(__git_ps1)]\$ '

################
AGENT="$HOME/tmp/ssh-agent-$USER"
if [ -S "$SSH_AUTH_SOCK" ]; then
	case $SSH_AUTH_SOCK in
	/tmp/*/agent.[0-9]*)
		ln -snf "$SSH_AUTH_SOCK" $AGENT && export SSH_AUTH_SOCK=$AGENT
	esac
elif [ -S $AGENT ]; then
	export SSH_AUTH_SOCK=$AGENT
else
	echo "no ssh-agent"
fi
################

alias u=pushd
alias o=popd
# alias s='[ $TERM != "screen" ] && screen -D -RR'
alias s='[ $TERM != "screen" ] && (tmux -u attach -d || tmux -u new-session)'

dig() {
  TARGET=
  XOPT=

  for X in $@ ; do
    case "$X" in
      -* ) ;;
      @* ) ;;
      *  ) if [ "x$TARGET" == "x" ] ; then TARGET=$X ; fi ; break
    esac
  done

  if [[ "$TARGET" =~ "^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$" ]] ; then
    XOPT='-x'
  fi
  /usr/bin/dig $XOPT $@
}

title(){
    if [ "$1"x != "x" ] ; then
        echo "k"$1"\\"
    fi
}

alias t=title

window_title(){
    if [ "$1"x != "x" ] ; then
        echo "]2;"$1""
    fi
}

u2t(){
  if [ $(uname) == "Darwin" ] ; then
    date -r $1
  else
    date -d "@$1"
  fi
}

# cd $(git rev-parse --show-toplevel) ; export GOPATH=~/mygo ;  make
gittop(){
    git rev-parse --show-toplevel
}

function fury-panda() {
    local entry=$(gcloud --project fury-panda compute instances list --filter='status:RUNNING' | peco --query "$*")
    local name=$(echo $entry | awk '{print $1}')
    local zone=$(echo $entry | awk '{print $2}')
    gcloud --project fury-panda compute ssh --zone $zone $name
}

alias wt=window_title

export GOPATH=$HOME/mygo

# added by travis gem
[ -f /Users/shmorimo/.travis/travis.sh ] && source /Users/shmorimo/.travis/travis.sh

for D in /usr/local/opt/python/libexec/bin /usr/local/bin /usr/local/sbin /usr/local/go/bin $HOME/bin $HOME/.nodebrew/current/bin; do
    [ -d "$D" ] && PATH=$D:$PATH
done
