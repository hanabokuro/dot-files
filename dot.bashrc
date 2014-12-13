if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PS1='\h:\W \u \$ '

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

alias u=pushd
alias o=popd
alias s='[ $TERM != "screen" ] && screen -D -RR'

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

alias wt=window_title

export DOCKER_HOST=tcp://127.0.0.1:4243
#    export DOCKER_TLS_VERIFY=1
#    export DOCKER_CERT_PATH=/Users/shmorimo/.boot2docker/certs/boot2docker-vm

export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

